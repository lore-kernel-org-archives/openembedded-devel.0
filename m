Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7464CA0EED
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 01:26:07 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.3534.1756430767286866142
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Aug 2025 18:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id 0ECE4EF16
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 03:26:04 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.32]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1urnsR-1Me2Of0; Fri, 29 Aug 2025 03:26:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] snapper: update 0.11.2 -> 0.12.2
Date: Fri, 29 Aug 2025 03:25:54 +0200
Message-ID: <20250829012554.1905919-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1756430763-85FF8944-AEEF6A22/0/0 CLEAN NORMAL
X-TOI-MSGID: af3c3a33-d82c-4892-94a1-44b8937a788b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 01:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119133

- remove patches that were added upstream
- fix reproducibility issues

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...x-types.h-for-__u16-__u32-__u64-type.patch | 30 ---------------
 ...002-Use-statvfs-instead-of-statvfs64.patch | 37 -------------------
 .../{snapper_0.11.2.bb =3D> snapper_0.12.2.bb}  | 20 +++++-----
 3 files changed, 9 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-support/snapper/snapper/0001-Include-=
linux-types.h-for-__u16-__u32-__u64-type.patch
 delete mode 100644 meta-oe/recipes-support/snapper/snapper/0002-Use-stat=
vfs-instead-of-statvfs64.patch
 rename meta-oe/recipes-support/snapper/{snapper_0.11.2.bb =3D> snapper_0=
.12.2.bb} (74%)

diff --git a/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-t=
ypes.h-for-__u16-__u32-__u64-type.patch b/meta-oe/recipes-support/snapper=
/snapper/0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch
deleted file mode 100644
index ec8594629e..0000000000
--- a/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-=
for-__u16-__u32-__u64-type.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d103eaeae169708ca567f092182a89b79e5ab9db Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Oct 2024 07:52:33 -0700
-Subject: [PATCH 1/2] Include linux/types.h for __u16/__u32/__u64 type
-
-This header is included indirectly with glibc but when using musl
-it ends up with compilation failure
-
-BcachefsUtils.cc:85:20: error: use of undeclared identifier '__u32'
-   85 |             args.dirfd =3D (__u32) fddst;
-      |                           ^
-
-Upstream-Status: Submitted [https://github.com/openSUSE/snapper/pull/945=
]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- snapper/BcachefsUtils.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/snapper/BcachefsUtils.cc b/snapper/BcachefsUtils.cc
-index e9163ffb..1d328a78 100644
---- a/snapper/BcachefsUtils.cc
-+++ b/snapper/BcachefsUtils.cc
-@@ -24,6 +24,7 @@
-=20
- #include <cstring>
- #include <cerrno>
-+#include <linux/types.h>
- #include <sys/stat.h>
- #include <sys/ioctl.h>
-=20
diff --git a/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-ins=
tead-of-statvfs64.patch b/meta-oe/recipes-support/snapper/snapper/0002-Us=
e-statvfs-instead-of-statvfs64.patch
deleted file mode 100644
index b915fda257..0000000000
--- a/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of=
-statvfs64.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 0b39f4484553c796cb300fb4933ea314e91d913b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Oct 2024 07:55:23 -0700
-Subject: [PATCH 2/2] Use statvfs instead of statvfs64
-
-when using LFS64 these functions are same and also
-on 64bit systems they are same. musl is using 64bit off_t
-by default and does not define LFS64 variants of these functions
-and it ends up in build errors
-
-Taken from Alpine Linux: [https://gitlab.alpinelinux.org/alpine/aports/-=
/blob/master/testing/snapper/statvfs64.patch]
-
-Upstream-Status: Submitted [https://github.com/openSUSE/snapper/pull/945=
]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- snapper/FileUtils.cc | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/snapper/FileUtils.cc b/snapper/FileUtils.cc
-index d4034279..4c8578a1 100644
---- a/snapper/FileUtils.cc
-+++ b/snapper/FileUtils.cc
-@@ -387,9 +387,9 @@ namespace snapper
-     std::pair<unsigned long long, unsigned long long>
-     SDir::statvfs() const
-     {
--	struct statvfs64 fsbuf;
--	if (fstatvfs64(dirfd, &fsbuf) !=3D 0)
--	    SN_THROW(IOErrorException(sformat("statvfs64 failed path:%s errno:=
%d (%s)", base_path.c_str(),
-+	struct statvfs fsbuf;
-+	if (fstatvfs(dirfd, &fsbuf) !=3D 0)
-+	    SN_THROW(IOErrorException(sformat("statvfs failed path:%s errno:%d=
 (%s)", base_path.c_str(),
- 					      errno, stringerror(errno).c_str())));
-=20
- 	// f_bavail is used (not f_bfree) since df seems to do the
diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.12.2.bb
similarity index 74%
rename from meta-oe/recipes-support/snapper/snapper_0.11.2.bb
rename to meta-oe/recipes-support/snapper/snapper_0.12.2.bb
index 887615ef45..cdbe155d59 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.12.2.bb
@@ -8,13 +8,8 @@ DEPENDS =3D "acl boost btrfs-tools dbus e2fsprogs json-c=
 libxml2 lvm2 ncurses zlib
 # Build separation is slightly broken
 inherit autotools-brokensep pkgconfig gettext
=20
-SRC_URI =3D " \
-    git://github.com/openSUSE/snapper.git;protocol=3Dhttps;branch=3Dmast=
er \
-    file://0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch \
-    file://0002-Use-statvfs-instead-of-statvfs64.patch \
-"
-SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
-
+SRC_URI =3D "git://github.com/openSUSE/snapper.git;protocol=3Dhttps;bran=
ch=3Dmaster"
+SRCREV =3D "4f3d2b2fc58aefa976668cd25b8eac02ba0f85e7"
=20
 EXTRA_OECONF +=3D "--disable-zypp"
=20
@@ -24,10 +19,13 @@ PACKAGECONFIG[systemd] =3D "--enable-systemd,--disabl=
e-systemd"
 PACKAGECONFIG[api-documentation] =3D "--enable-doc,--disable-doc,libxslt=
-native docbook-xsl-stylesheets-native"
=20
 # Avoid HOSTTOOLS path in binaries
-export DIFFBIN =3D "${bindir}/diff"
-export RMBIN =3D "${bindir}/rm"
-export TOUCHBIN =3D "${bindir}/touch"
-export CPBIN =3D "${bindir}/cp"
+export DIFF_BIN =3D "${bindir}/diff"
+export RM_BIN =3D "${bindir}/rm"
+export RMDIR_BIN =3D "${bindir}/rmdir"
+export MKDIR_BIN =3D "${bindir}/mkdir"
+export TOUCH_BIN =3D "${bindir}/touch"
+export CP_BIN =3D "${bindir}/cp"
+export REALPATH_BIN =3D "${bindir}/realpath"
=20
 do_install:append() {
 	install -d ${D}${sysconfdir}/sysconfig
--=20
2.50.1


