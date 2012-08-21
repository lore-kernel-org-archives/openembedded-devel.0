Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T3dxk-0004mi-Lo
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 04:13:00 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so8799196pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 19:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=lhi0CE37B0cra+uQZYLKiC520Oyyc3dSb7Slp17WHZU=;
	b=GxGUV2Hwclx23hglr56aJfRhC1wcH6nkl27HbNoW5bihsqFdTc/fNXweaPIAt6vkqs
	SLHSJBc77bFmRahReTGzeyzt99DxujQfYYFjPYiqxgMt5hN6oEcoPWk/cImrmR765f0I
	hBLiK5jpjA24cFyH93t3/mtfXDVH9ZtOuTAp1cUg8WYtsousSsZAiyszoTfetwh5g8/B
	TQJ47dFyAmWh6lC7Q19iQiQ88QyYRfC/X9K92sqRYha3govXma/i60T+MMJIswMVmEmc
	Y2+aABa9oRhEzLkWLCPU744y/S5SJqmF30H5BuA2yQMqCTHdR4XB3yg/GQZqwXpkmEKL
	o/lg==
Received: by 10.68.222.40 with SMTP id qj8mr39306999pbc.139.1345514459474;
	Mon, 20 Aug 2012 19:00:59 -0700 (PDT)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id gh9sm329808pbc.20.2012.08.20.19.00.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 19:00:58 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2012 11:54:26 +1000
Message-Id: <1345514067-16394-2-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1345514067-16394-1-git-send-email-marc@cpdesign.com.au>
References: <1345514067-16394-1-git-send-email-marc@cpdesign.com.au>
Subject: [Patch V2 1/2] qwt: fix link error when linking with ld-gold.
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
X-List-Received-Date: Tue, 21 Aug 2012 02:13:00 -0000

ld-gold doesn't implicitly link with librt, this fixes an unresolved
symbol error when compiling qwt examples.

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 .../qwt/files/qwt6-fix-linking-with-ld-gold.patch  |   34 ++++++++++++++++++++
 meta-oe/recipes-qt/qwt/qwt.inc                     |    4 +-
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qwt/files/qwt6-fix-linking-with-ld-gold.patch

diff --git a/meta-oe/recipes-qt/qwt/files/qwt6-fix-linking-with-ld-gold.patch b/meta-oe/recipes-qt/qwt/files/qwt6-fix-linking-with-ld-gold.patch
new file mode 100644
index 0000000..1fdd9cf
--- /dev/null
+++ b/meta-oe/recipes-qt/qwt/files/qwt6-fix-linking-with-ld-gold.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending
+
+diff -urpN qwt-6.0.1_orig/qwtbuild.pri qwt-6.0.1/qwtbuild.pri
+--- qwt-6.0.1_orig/qwtbuild.pri	2011-08-02 00:33:53.000000000 +1000
++++ qwt-6.0.1/qwtbuild.pri	2012-08-21 10:27:30.721990849 +1000
+@@ -67,3 +67,13 @@ unix {
+         error( "local build will conflict with $${QMAKE_LIBDIR_QT}/libqwt.*" )
+     }
+ }
++
++######################################################################
++# libs for building qwt
++######################################################################
++
++unix {
++    # Some linkers require explicit linking with librt (eg ld.gold)
++    LIBS += -lrt
++}
++
+diff -urpN qwt-6.0.1_orig/qwt.prf qwt-6.0.1/qwt.prf
+--- qwt-6.0.1_orig/qwt.prf	2011-08-02 00:33:51.000000000 +1000
++++ qwt-6.0.1/qwt.prf	2012-08-21 11:19:49.435240439 +1000
+@@ -9,6 +9,11 @@
+ 
+ include ( ./qwtconfig.pri )
+ 
++unix {
++
++	LIBS += -lrt
++}
++
+ contains(QWT_CONFIG, QwtDll) {
+ 
+     DEFINES *= QWT_DLL
diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index a299ac8..a9289f7 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -6,8 +6,8 @@ LICENSE = "QWTv1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
-	file://qwt6.patch \
-	"
+           file://qwt6.patch \
+           file://qwt6-fix-linking-with-ld-gold.patch"
 
 S = "${WORKDIR}/qwt-${PV}"
 
-- 
1.7.7



