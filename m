Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T0UA8-0007ol-LM
	for openembedded-devel@lists.linuxtogo.org;
	Sun, 12 Aug 2012 11:08:44 +0200
Received: by pbcwy7 with SMTP id wy7so5224316pbc.6
	for <openembedded-devel@lists.linuxtogo.org>;
	Sun, 12 Aug 2012 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Gn5uoCjKbrZAgXw6dfcM5uRyr+ZyyjInFCy8O3/8Glg=;
	b=aTBu+9Mg1lEoz5mkWE6HYgx/q9E3utDljalk+wtTc0DJGH8BC5RdflDeZFEjU147yL
	E1twJmfFJIP3OhTBACWXpLYa18ZwlyweUP9KA8iUt01SKPXIFy9qg/nKVHUzpLivApjW
	9HhzANNgMvkTqcBjgYbxURJdFhoh2gq4Hnhu/O+KRV8VBv31aLF9hEnC6HyZGn/WIyUa
	w3hZhP1mQxH3ZQRLuHxzxC45XDgGHdMY+zpvqMaLvZR9nKb6W83fkm4tlAagj5ZOokjD
	HtSauiCnt2dsMSsemJ1qwvEJgpgNlI+jvDi/GWYuN8/rE5bzKLXZwFJMpYdak6a1mPtM
	feEg==
Received: by 10.68.234.7 with SMTP id ua7mr334570pbc.91.1344761811955;
	Sun, 12 Aug 2012 01:56:51 -0700 (PDT)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id pg9sm2986901pbb.26.2012.08.12.01.56.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Aug 2012 01:56:51 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.linuxtogo.org
Date: Sun, 12 Aug 2012 18:50:52 +1000
Message-Id: <1344761452-10965-1-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.7
Subject: [oe-core] qwt: fix link error when linking with ld-gold.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Aug 2012 09:08:44 -0000

ld-gold doesn't implicitly link with librt, this fixes an unresolved
symbol error when compiling qwt examples.

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 .../recipes-qt/qwt/files/fix-ld-gold-linking.patch |   14 ++++++++++++++
 meta-oe/recipes-qt/qwt/qwt.inc                     |    1 +
 2 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch

diff --git a/meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch b/meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch
new file mode 100644
index 0000000..a00aba4
--- /dev/null
+++ b/meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch
@@ -0,0 +1,14 @@
+- fix link of unresolved symbols: clock_getres and clock_gettime
+---
+diff --git a/src/src.pro b/src/src.pro
+index beb7125..ebf8ea6 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -94,6 +102,7 @@ SOURCES += \
+     qwt_symbol.cpp \
+     qwt_system_clock.cpp
+ 
++linux*:LIBS += -lrt
+  
+ contains(QWT_CONFIG, QwtPlot) {
+  
diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index a299ac8..94231b4 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
 	file://qwt6.patch \
+        file://fix-ld-gold-linking.patch \
 	"
 
 S = "${WORKDIR}/qwt-${PV}"
-- 
1.7.7



