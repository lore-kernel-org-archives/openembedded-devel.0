Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C252873E3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 03:11:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H3BfIl018555
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:11:42 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 16 Jul 2015 20:11:41 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jul 2015 11:10:01 +0800
Message-ID: <1437102603-25983-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
References: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 2/4] liblockfile: add patch of version 1.09-6 from debian
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jul 2015 03:11:41 -0000
Content-Type: text/plain

Add patch of liblockfile 1.09-6 from debian. And fix error which install
so file to manual directory.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../liblockfile-fix-install-so-to-man-dir.patch      | 20 ++++++++++++++++++++
 .../recipes-extended/liblockfile/liblockfile_1.09.bb |  5 +++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-install-so-to-man-dir.patch

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-install-so-to-man-dir.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-install-so-to-man-dir.patch
new file mode 100644
index 0000000..27f760c
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-install-so-to-man-dir.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Inappropriate [no upstream]
+
+The extend so file is rename from nfslock.so.$(VER) to nfslock.so.$(NVER). That
+causes file nfslock.so.0.1 is installed into manual directory. Fix it.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index a589fb8..46a57e8 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -68,7 +68,7 @@ install_common:
+ 		install -d $(ROOT)$(bindir)
+ 		install -m 755 $(INSTGRP) dotlockfile $(ROOT)$(bindir)
+ 		install -d $(ROOT)$(mandir)/man1 $(ROOT)$(mandir)/man3
+-		install -m 644 *.1 $(ROOT)$(mandir)/man1
++		install -m 644 dotlockfile.1 $(ROOT)$(mandir)/man1
+ 		install -m 644 *.3 $(ROOT)$(mandir)/man3
+ 
+ install_nfslib:	nfslib
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
index 38e1915..e5655b5 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -4,15 +4,20 @@ LICENSE = "LGPLv2+ & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ac284a60d48eaa4bc811cddc377fa341"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.09.orig.tar.gz \
+    ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.09-6.debian.tar.bz2;name=1.09-6 \
     file://install.patch \
     file://configure.patch \
     file://ldflags.patch \
     file://liblockfile-fix-nfslib-and-soname.patch \
+    file://liblockfile-fix-install-so-to-man-dir.patch \
 "
 
 SRC_URI[md5sum] = "2aa269e4405ee8235ff17d1b357c6ae8"
 SRC_URI[sha256sum] = "16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f"
 
+SRC_URI[1.09-6.md5sum] = "a2811807e63a526c07b0f60626e329a2"
+SRC_URI[1.09-6.sha256sum] = "d45eacb7c637c16d03c777c55989d98da494ae9584a0783fe6dbf0db60fa290f"
+
 inherit autotools-brokensep
 
 # set default mailgroup to mail
-- 
1.9.1


