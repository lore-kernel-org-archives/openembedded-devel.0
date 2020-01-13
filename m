Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5097FCAF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 17:02:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id d73so10554939wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 09:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AhwOGiVmfD6Vv/V9JH9D0SGEXFAUG1+4k9WvZgqSCWY=;
	b=SO3gxOM7ZEi/qbh04RydCv6V4rHxcHTMbddmxP2MQrPOMVt3e/aAluHLMzP1DjGt30
	cn5LTfI3ZH27N4YmJivXfe9zFIaN87du1FdkFH9VlYXIaOSJdDwHrgzW9Q/RPLvrIIeU
	spzYDLrn7tzdp6D/bAHQ6EzY7xmjzv4po9EqHt/aOmb2FA9ddNA6r9UxnPeZzGoOIM1d
	xuTYDUFGjpFZaWauAOd1cB9+CNDYn1kF2GgiSUly3J//w8TB2XBEJMIYIYAw25cfzPC+
	f1gACXFGcX0sYtO3he4vyPbbY+KvaSrxWvBDvK0e5VBaAnrOiYB79vt5UlKSsGDwHh3l
	9JMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AhwOGiVmfD6Vv/V9JH9D0SGEXFAUG1+4k9WvZgqSCWY=;
	b=XF+SA+zu5Q2q7xHArWIKitw80YY291np0G1Q/lrm7nHfPUtYqylS+EiFYzEH5CGqzn
	sTNs73OojPmmF1jx1gUPhuGPbrYQ8hKKxdxc2uRFZbdF98qg+N3SWHUTH3WYEfTnuqiv
	adf1eQXBVpvGV/+oPYRSRfr2NqC0Dg+MSmrs2G5qblnnQQ+vqY9l1hFGqRwNd9oeh3+l
	MIVvVPJdQ+m6HJSvypgJfueKGfaMKIDFwZ7QfGrZA6nv2z8S3bwdHt2RH48ZTGXBLUMM
	gofeHxuYDxP/AIsZ6HomHuusmI6fdn6YV+Yc1FU3DbSwW1umVz4nYie6oDd9I4qk05Gr
	uj9A==
X-Gm-Message-State: APjAAAUA3IDMZi+xwR60NYK0qwuP3moyZVTpCyQOgvPH8A4N3RFwRsbv
	8YPJectyoZNMxNqHxk9G8FVKclOE
X-Google-Smtp-Source: APXvYqyJI649QdfRygDGXyZ6xVHNx1vSIhVhLv91P9wGX0NTBAvqB9W4QXjXs0VIKViEyeujGXIe9w==
X-Received: by 2002:a05:600c:210e:: with SMTP id
	u14mr21306418wml.28.1578934934580; 
	Mon, 13 Jan 2020 09:02:14 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	k16sm16050396wru.0.2020.01.13.09.02.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 09:02:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 18:02:07 +0100
Message-Id: <20200113170209.95601-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] sysprof: add a recipe from oe-core
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
X-List-Received-Date: Mon, 13 Jan 2020 17:02:14 -0000

Latest version (3.34) of sysprof have a hard dependency on polkit,
which in turn requires mozjs, which pulls in a number of other
meta-oe packages including python2. This makes it difficult
to keep sysprof in oe-core, so for the time being it is moved to
meta-oe.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...thing-in-help-as-it-requires-itstool.patch | 27 ++++++++++++++++
 .../files/define-NT_GNU_BUILD_ID.patch        | 22 +++++++++++++
 .../recipes-kernel/sysprof/sysprof_3.32.0.bb  | 32 +++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 create mode 100644 meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
 create mode 100644 meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb

diff --git a/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
new file mode 100644
index 000000000..ade51cf86
--- /dev/null
+++ b/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
@@ -0,0 +1,27 @@
+From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 23 Aug 2017 18:38:26 +0300
+Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3986273..ae2f65e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -164,7 +164,6 @@ subdir('tools')
+ subdir('tests')
+ 
+ subdir('data')
+-subdir('help')
+ subdir('po')
+ 
+ meson.add_install_script('build-aux/meson/post_install.sh')
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
new file mode 100644
index 000000000..f75ddad43
--- /dev/null
+++ b/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
@@ -0,0 +1,22 @@
+On uclibc elf.h does not have GNU extentions but we need this define
+so we define it locally if its not getting it from elf.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: git/elfparser.h
+===================================================================
+--- git.orig/lib/util/elfparser.h	2011-07-16 18:57:41.000000000 -0700
++++ git/lib/util/elfparser.h	2011-07-16 20:28:54.733829895 -0700
+@@ -17,6 +17,10 @@
+  */
+ #include <glib.h>
+ 
++#ifndef NT_GNU_BUILD_ID
++#define NT_GNU_BUILD_ID 3
++#endif
++
+ typedef struct ElfSym ElfSym;
+ typedef struct ElfParser ElfParser;
+ 
diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb
new file mode 100644
index 000000000..b92933806
--- /dev/null
+++ b/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "System-wide Performance Profiler for Linux"
+HOMEPAGE = "http://www.sysprof.com"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase gettext systemd upstream-version-is-even gsettings
+
+DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
+
+SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
+SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
+SRC_URI += " \
+           file://define-NT_GNU_BUILD_ID.patch \
+           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
+           "
+
+PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
+PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
+
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
+
+FILES_${PN} += " \
+               ${datadir}/dbus-1/system-services \
+               ${datadir}/dbus-1/system.d \
+               ${datadir}/metainfo \
+               "
-- 
2.17.1


