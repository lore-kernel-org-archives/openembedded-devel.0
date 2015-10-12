Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAD8D77077
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 06:34:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9C6YWZj004633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Oct 2015 23:34:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 11 Oct 2015 23:34:31 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Mon, 12 Oct 2015 14:26:31 +0800
Message-ID: <1444631191-4568-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1444631191-4568-1-git-send-email-kai.kang@windriver.com>
References: <1444631191-4568-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] efibootmgr: 0.6.0 -> 0.12
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
X-List-Received-Date: Mon, 12 Oct 2015 06:34:32 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade efibootmgr from 0.6.0 to 0.12.

* update HOMEPAGE
* drop obsolete patches that source files have been removed
* add dependency efivar
* update CFLAGS to fix print wrong version issue

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{efibootmgr_0.6.0.bb => efibootmgr_0.12.bb}    | 21 ++++++++--------
 .../efibootmgr/files/docbook-fixes.patch           | 28 ----------------------
 .../files/w-keep-existing-mbr-signature.patch      | 26 --------------------
 3 files changed, 11 insertions(+), 64 deletions(-)
 rename meta-oe/recipes-extended/efibootmgr/{efibootmgr_0.6.0.bb => efibootmgr_0.12.bb} (39%)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
similarity index 39%
rename from meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
rename to meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
index 501ff2a..03aaf13 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
@@ -1,26 +1,27 @@
 DESCRIPTION = "Linux user-space application to modify the EFI Boot Manager."
 SUMMARY = "EFI Boot Manager"
-HOMEPAGE = "http://linux.dell.com/efibootmgr/"
+HOMEPAGE = "https://github.com/rhinstaller/efibootmgr"
 SECTION = "base"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS = "pciutils zlib"
+DEPENDS = "pciutils zlib efivar"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "http://linux.dell.com/efibootmgr/permalink/efibootmgr-${PV}.tar.gz \
-    file://ldflags.patch \
-    file://docbook-fixes.patch \
-    file://w-keep-existing-mbr-signature.patch \
-"
+SRC_URI = "https://github.com/rhinstaller/efibootmgr/releases/download/${BP}/${BP}.tar.bz2 \
+           file://ldflags.patch \
+          "
 
-SRC_URI[md5sum] = "9e9a31d79e579644de83a14139b66d10"
-SRC_URI[sha256sum] = "5167488b92950e60028d1025942ce6bda04638c6fb5e110abb8c8f687844d155"
+SRC_URI[md5sum] = "6647f5cd807bc8484135ba74fcbcc39a"
+SRC_URI[sha256sum] = "a66f5850677e86255d93cb1cead04c3c48a823a2b864c579321f2a07f00256e6"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/lib -I${S}/src/include -fgnu89-inline'"
+EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cflags efivar` \
+                 -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR)\" '"
 
 do_install () {
     install -D -p -m0755 src/efibootmgr/efibootmgr ${D}/${sbindir}/efibootmgr
 }
+
+inherit pkgconfig
diff --git a/meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch b/meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
deleted file mode 100644
index f2dc83b..0000000
--- a/meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Import this patch from meta-linaro.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-diff --git a/src/man/man8/efibootmgr.8.docbook b/src/man/man8/efibootmgr.8.docbook
-index aef4444..eb8f266 100644
---- a/src/man/man8/efibootmgr.8.docbook
-+++ b/src/man/man8/efibootmgr.8.docbook
-@@ -302,7 +302,7 @@
-           <title>Displaying the current settings (must be root).</title>
-           
-           <para>
--            <computeroutput>
-+            <programlisting>
-   [root@localhost ~]# efibootmgr
-   BootCurrent: 0004
-   BootNext: 0003
-@@ -313,7 +313,7 @@
-   Boot0002* Hard Drive(Device:80)/HD(Part1,Sig00112233)   
-   Boot0003* PXE Boot: MAC(00D0B7C15D91)               
-   Boot0004* Linux
--            </computeroutput>
-+            </programlisting>
-           </para>
-           <para>This shows:</para>
-           <itemizedlist>
diff --git a/meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch b/meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch
deleted file mode 100644
index 58bd135..0000000
--- a/meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-Import this patch from meta-linaro.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-Description: Fix -w option to leave an existing unique MBR signature intact
- This makes the implementation match the documentation.
-Author: Colin Watson <cjwatson@ubuntu.com>
-Bug-Ubuntu: https://bugs.launchpad.net/bugs/1065261
-Forwarded: no
-Last-Update: 2013-02-01
-
-Index: b/src/lib/disk.c
-===================================================================
---- a/src/lib/disk.c
-+++ b/src/lib/disk.c
-@@ -352,7 +352,7 @@
- 		printf("******************************************************\n\n");
- 		
- 	}
--	else if (opts.write_signature) {
-+	else if (!mbr->unique_mbr_signature && opts.write_signature) {
- 		
- 		/* MBR Signatures must be unique for the 
- 		   EFI Boot Manager
-- 
2.6.1


