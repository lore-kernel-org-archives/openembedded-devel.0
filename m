Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0919F60767
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:29 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so452080pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BhFfpZttaqlegoID0HA9fHPQXcWgmzEidoh+NQWoNcc=;
	b=az7WD7XNrIM2e76hnyRtG3FUUzurmJMc46SL8fPJ7Gh54+kN7JfRXwd55drVR9GKdO
	MeeBQk8uwWlrbXcI6ExZMgVnlzzygG90e8+HdwiZM7tviSe9mxnOtnHflhTIxxD3H/KU
	HY3GPOylJdz+RHRCk/d19IMvtmOpQSJ2LX20MuRKbsp55K/2j3X3lJ+SP97jFjdihIcg
	mygRpK7xpAQEXaovFDrMh0n82wJVjmlYqscpxRofoz0zDRbD1NWbNEp45M1I/4l7cj3K
	R2COlJpmmRmLt5O/JiVhhsR8ay9o32NsJobykzZyAVTrNn1usaRlmr6AlCf5TODxmPML
	27Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BhFfpZttaqlegoID0HA9fHPQXcWgmzEidoh+NQWoNcc=;
	b=kDE2sUqviDxIJbDT1oh/WBaIvOepkO7mxLgLWyPqMxPoRzw/QxXX5t9EWDJv+hlCRa
	weqhaSjxKglJITWPQasqV1na2qPoZMl7VkhpKJPG8uCILvWwdM+YHY5CntJ/Wvpx6N7F
	6Xf88xURn2DcqXHrqlHNg458TlQaY2/16jgxXDKuVdE2DdYiy5Cf1ZAUje+1uJPMHFcw
	e6GFykIJI0SNICaZU+dZSHl5h3VvWhYh9Ejt7mvTr4rjy0GIpwrut5HbAo9rlcy0Zfxx
	da9BC2uTBFv71x9zCRJTJWgwnsjE8yFGZk/AI6FXv+T1zzcZ7DQR5ZcEqDa3okmmWAyd
	AcwQ==
X-Gm-Message-State: AKaTC03goyf2zV2C/uimWWoA1KCFMSApcBJQs7ZWUnwAcoreL23b4/6vnwf+X3F9T6+UuQ==
X-Received: by 10.84.218.7 with SMTP id q7mr4625954pli.18.1479892951495;
	Wed, 23 Nov 2016 01:22:31 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:39 -0800
Message-Id: <20161123092209.23699-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 19/49] xfsprogs: Upgrade 3.2.3 -> 4.8.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 09:22:30 -0000

Change-Id: I0015da261d540f99bfdebba703fef9403eebff7b
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-utils/xfsprogs/xfsprogs_3.2.3.bb       | 55 ----------------------
 .../recipes-utils/xfsprogs/xfsprogs_4.8.0.bb       | 52 ++++++++++++++++++++
 2 files changed, 52 insertions(+), 55 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
deleted file mode 100644
index 460a898..0000000
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "XFS Filesystem Utilities"
-HOMEPAGE = "http://oss.sgi.com/projects/xfs"
-SECTION = "base"
-LICENSE = "GPLv2 & LGPLv2.1"
-LICENSE_libhandle = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
-DEPENDS = "util-linux"
-
-SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
-    file://xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
-    file://remove-install-as-user.patch \
-    file://drop-configure-check-for-aio.patch \
-"
-
-SRC_URI[md5sum] = "9f383e36682709e62b12c125e5d8b895"
-SRC_URI[sha256sum] = "7a5124a880997939551b519610a2e54bd4cd0b0adfd563ce3f4de30827109ac9"
-
-inherit autotools-brokensep
-
-PACKAGES =+ "${PN}-fsck ${PN}-mkfs libhandle"
-
-RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs"
-
-FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
-FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
-FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
-
-EXTRA_OECONF = "--enable-gettext=no"
-do_configure () {
-    # Prevent Makefile from calling configure without arguments,
-    # when do_configure gets called for a second time.
-    rm -f include/builddefs include/platform_defs.h
-    # Recreate configure script.
-    rm -f configure
-    oe_runmake configure
-    # Configure.
-    export DEBUG="-DNDEBUG"
-    gnu-configize --force
-    oe_runconf
-}
-
-LIBTOOL = "${HOST_SYS}-libtool"
-EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
-TARGET_CC_ARCH += "${LDFLAGS}"
-PARALLEL_MAKE = ""
-
-do_install () {
-    export DIST_ROOT=${D}
-    oe_runmake install
-    # needed for xfsdump
-    oe_runmake install-dev
-}
-
-# http://errors.yoctoproject.org/Errors/Details/83236/
-PNBLACKLIST[xfsprogs] ?= "BROKEN: Needs upgrade to 4.5.0 version to be compatible with Kernel uapi changes from 4.5"
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
new file mode 100644
index 0000000..049a4be
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
@@ -0,0 +1,52 @@
+SUMMARY = "XFS Filesystem Utilities"
+HOMEPAGE = "http://oss.sgi.com/projects/xfs"
+SECTION = "base"
+LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE_libhandle = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
+DEPENDS = "util-linux"
+SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
+"
+SRC_URI[md5sum] = "4f047bc9a28b48a95c6db0ad5ce4dbcb"
+SRC_URI[sha256sum] = "82ce9cb3a55f4e208e8fe3471ff0aff0602b8300f3e50bdf05cc7e11549686f9"
+
+inherit autotools-brokensep
+
+PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
+
+
+RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
+
+FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
+FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
+FILES_${PN}-repair = "${base_sbindir}/xfs_repair"
+
+FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
+
+EXTRA_OECONF = "--enable-gettext=no \
+               INSTALL_USER=root \
+               INSTALL_GROUP=root \
+"
+
+EXTRA_AUTORECONF += "-I ${S}/m4 --exclude=autoheader"
+
+PACKAGECONFIG ??= "readline blkid"
+
+PACKAGECONFIG[readline] = "--enable-readline=yes,--enable-readline=no,readline"
+PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
+
+export DEBUG="-DNDEBUG"
+
+EXTRA_OEMAKE = "DIST_ROOT='${D}'"
+
+do_configure_prepend () {
+    # Prevent Makefile from calling configure without arguments,
+    # when do_configure gets called for a second time.
+    rm -f ${B}/include/builddefs ${B}/include/platform_defs.h ${B}/configure
+    # Recreate configure script.
+    oe_runmake configure
+}
+
+do_install_append() {
+        oe_runmake 'DESTDIR=${D}' install-dev
+}
-- 
2.10.2


