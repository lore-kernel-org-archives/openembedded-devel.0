Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2Z-0006OF-R0
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:19 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=UhiW8CQ/r7K3a+vS43oQr1/ZbPQ7L39K54hnDSbe2FM=;
	b=udFgkOGPfxEr1Yx5ZjBAWczbWePs6H1oqOAmSqaksdjbGNMEAYTf+LMc0zXXAg+N6d
	kU5TkIHIx7d9fV6Dw1BlU4lo6DZ48aQ9XWOAuRrA7823Lb1o5XYHBOEL+eNIibvu8HDu
	zglGbcSPFJ8vQBai4XUZH0AqR+VbB/E/GJ784=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AXa+KzhECUALNe4eaDzmK3hxiADZR5iwTKzRApaEOTJ1KjCFqPCzp8qpRqryzQjOXN
	sSmiWyx/WdVNEOGQS/55xuUTWMQfs+cYsTzRTSse4uYoDVLBTYB3LJjqMYLWNhYL/F1j
	VUoPV7YpivuC8nWgDVykv5HnbuhQ2Z94GRu6M=
Received: by 10.210.10.8 with SMTP id 8mr85790ebj.87.1242207577094;
	Wed, 13 May 2009 02:39:37 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 10sm1684125eyd.12.2009.05.13.02.39.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:36 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:48 +0200
Message-Id: <1242207556-15601-10-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 09/37] libdisplaymigration: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:20 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 .../libdisplaymigration/files/makefile-fix.patch   |   11 +++++++++++
 .../libdisplaymigration_0.28.bb                    |    2 ++
 .../libdisplaymigration_0.99.bb                    |    2 ++
 3 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libdisplaymigration/files/makefile-fix.patch

diff --git a/recipes/libdisplaymigration/files/makefile-fix.patch b/recipes/libdisplaymigration/files/makefile-fix.patch
new file mode 100644
index 0000000..5a79ab2
--- /dev/null
+++ b/recipes/libdisplaymigration/files/makefile-fix.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile	2005-02-28 20:32:13.000000000 +0100
++++ libdisplaymigration-0.99/Makefile	2009-05-01 14:26:17.000000000 +0200
+@@ -36,7 +36,7 @@
+ 
+ install-program: $(SONAME)
+ 	install -d $(DESTDIR)$(PREFIX)/lib
+-	install -s $(SONAME) $(DESTDIR)$(PREFIX)/lib/$(SONAME)
++	install $(SONAME) $(DESTDIR)$(PREFIX)/lib/$(SONAME)
+ 
+ install-devel:
+ 	for i in $(HEADERS); do install -m 644 -D $$i $(DESTDIR)$(PREFIX)/include/$$i; done
diff --git a/recipes/libdisplaymigration/libdisplaymigration_0.28.bb b/recipes/libdisplaymigration/libdisplaymigration_0.28.bb
index e92cf57..8f85dff 100644
--- a/recipes/libdisplaymigration/libdisplaymigration_0.28.bb
+++ b/recipes/libdisplaymigration/libdisplaymigration_0.28.bb
@@ -7,6 +7,8 @@ PR = "r1"
 
 inherit pkgconfig gpe
 
+SRC_URI += "file://makefile-fix.patch;patch=1"
+
 headers = "displaymigration.h auth.h crypt.h"
 
 do_install() {
diff --git a/recipes/libdisplaymigration/libdisplaymigration_0.99.bb b/recipes/libdisplaymigration/libdisplaymigration_0.99.bb
index 0563ba3..033005d 100644
--- a/recipes/libdisplaymigration/libdisplaymigration_0.99.bb
+++ b/recipes/libdisplaymigration/libdisplaymigration_0.99.bb
@@ -7,6 +7,8 @@ PR = "r0"
 
 inherit pkgconfig gpe
 
+SRC_URI += "file://makefile-fix.patch;patch=1"
+
 headers = "displaymigration.h auth.h crypt.h"
 
 do_install() {
-- 
1.6.1



