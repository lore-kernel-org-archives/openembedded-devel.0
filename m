Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8761B75972
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 08:02:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6N82vUc005025
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Jul 2015 01:02:57 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 23 Jul 2015 01:02:48 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jul 2015 16:00:53 +0800
Message-ID: <1437638453-11552-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] efibootmgr: add recipe
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
X-List-Received-Date: Thu, 23 Jul 2015 08:03:01 -0000
Content-Type: text/plain

Add efibootmgr recipe from layer meta-linaro and upgrade from 0.5.4 to
0.6.0. efibootmgr is a linux user-space application to modify the EFI Boot
Manager which is useful for us to manage boot on EFI boards.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../efibootmgr/efibootmgr_0.6.0.bb                 | 26 ++++++++++++++++++++
 .../efibootmgr/files/docbook-fixes.patch           | 28 ++++++++++++++++++++++
 .../efibootmgr/files/ldflags.patch                 | 17 +++++++++++++
 .../files/w-keep-existing-mbr-signature.patch      | 26 ++++++++++++++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
 create mode 100644 meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
 create mode 100644 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
 create mode 100644 meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
new file mode 100644
index 0000000..1870455
--- /dev/null
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Linux user-space application to modify the EFI Boot Manager."
+SUMMARY = "EFI Boot Manager"
+HOMEPAGE = "http://linux.dell.com/efibootmgr/"
+SECTION = "base"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+DEPENDS = "pciutils zlib"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+SRC_URI = "http://linux.dell.com/efibootmgr/permalink/efibootmgr-${PV}.tar.gz \
+    file://ldflags.patch \
+    file://docbook-fixes.patch \
+    file://w-keep-existing-mbr-signature.patch \
+"
+
+SRC_URI[md5sum] = "9e9a31d79e579644de83a14139b66d10"
+SRC_URI[sha256sum] = "5167488b92950e60028d1025942ce6bda04638c6fb5e110abb8c8f687844d155"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/lib -I${S}/src/include'"
+
+do_install () {
+    install -D -p -m0755 src/efibootmgr/efibootmgr ${D}/${sbindir}/efibootmgr
+}
diff --git a/meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch b/meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
new file mode 100644
index 0000000..f2dc83b
--- /dev/null
+++ b/meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+Import this patch from meta-linaro.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/src/man/man8/efibootmgr.8.docbook b/src/man/man8/efibootmgr.8.docbook
+index aef4444..eb8f266 100644
+--- a/src/man/man8/efibootmgr.8.docbook
++++ b/src/man/man8/efibootmgr.8.docbook
+@@ -302,7 +302,7 @@
+           <title>Displaying the current settings (must be root).</title>
+           
+           <para>
+-            <computeroutput>
++            <programlisting>
+   [root@localhost ~]# efibootmgr
+   BootCurrent: 0004
+   BootNext: 0003
+@@ -313,7 +313,7 @@
+   Boot0002* Hard Drive(Device:80)/HD(Part1,Sig00112233)   
+   Boot0003* PXE Boot: MAC(00D0B7C15D91)               
+   Boot0004* Linux
+-            </computeroutput>
++            </programlisting>
+           </para>
+           <para>This shows:</para>
+           <itemizedlist>
diff --git a/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch b/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
new file mode 100644
index 0000000..0d5594a
--- /dev/null
+++ b/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Import this patch from meta-linaro.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+--- efibootmgr-0.5.4.orig/Makefile
++++ efibootmgr-0.5.4/Makefile
+@@ -11,6 +11,8 @@
+   CFLAGS = $(EXTRA_CFLAGS) -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR).$(RELEASE_SUBLEVEL)$(RELEASE_EXTRALEVEL)\" \
+ 	    -Wall -g -D_FILE_OFFSET_BITS=64
+ 
++  LDFLAGS += -lz
++
+   MODULES := src
+ 
+   BINDIR := /usr/sbin
diff --git a/meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch b/meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch
new file mode 100644
index 0000000..58bd135
--- /dev/null
+++ b/meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+Import this patch from meta-linaro.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+Description: Fix -w option to leave an existing unique MBR signature intact
+ This makes the implementation match the documentation.
+Author: Colin Watson <cjwatson@ubuntu.com>
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/1065261
+Forwarded: no
+Last-Update: 2013-02-01
+
+Index: b/src/lib/disk.c
+===================================================================
+--- a/src/lib/disk.c
++++ b/src/lib/disk.c
+@@ -352,7 +352,7 @@
+ 		printf("******************************************************\n\n");
+ 		
+ 	}
+-	else if (opts.write_signature) {
++	else if (!mbr->unique_mbr_signature && opts.write_signature) {
+ 		
+ 		/* MBR Signatures must be unique for the 
+ 		   EFI Boot Manager
-- 
1.9.1


