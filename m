Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ADFEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 06:12:08 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.33737.1688969518389008403
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jul 2023 23:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id AFF8212DCA
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 08:11:55 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.146]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qIk7n-2V7maH0; Mon, 10 Jul 2023 08:11:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] spdlog: upgrade 1.11.0 -> 1.12.0
Date: Mon, 10 Jul 2023 08:11:41 +0200
Message-Id: <20230710061141.843532-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1688969515-2BFE5D37-396280BB/0/0 CLEAN NORMAL
X-TOI-MSGID: b1b19655-658a-483c-a8cd-6b1b761da5e7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 06:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103722

- remove unneeded patches

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ot-use-LFS64-functions-on-linux-musl.patch | 30 -------------
 .../spdlog/fix-build-for-master-fmt.patch     | 44 -------------------
 .../{spdlog_1.11.0.bb =3D> spdlog_1.12.0.bb}    |  7 +--
 3 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 meta-oe/recipes-support/spdlog/spdlog/0001-Do-not-use=
-LFS64-functions-on-linux-musl.patch
 delete mode 100644 meta-oe/recipes-support/spdlog/spdlog/fix-build-for-m=
aster-fmt.patch
 rename meta-oe/recipes-support/spdlog/{spdlog_1.11.0.bb =3D> spdlog_1.12=
.0.bb} (75%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog/0001-Do-not-use-LFS64-=
functions-on-linux-musl.patch b/meta-oe/recipes-support/spdlog/spdlog/000=
1-Do-not-use-LFS64-functions-on-linux-musl.patch
deleted file mode 100644
index b997389aa2..0000000000
--- a/meta-oe/recipes-support/spdlog/spdlog/0001-Do-not-use-LFS64-functio=
ns-on-linux-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ce7a593e74c8e0c2ece15c73e7614d4f13a19a53 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Dec 2022 13:04:08 -0800
-Subject: [PATCH] Do not use LFS64 functions on linux/musl
-
-On musl, off_t is 64bit always ( even on 32bit platforms ), therefore us=
ing
-LFS64 funcitons is not needed on such platforms. Moreover, musl has stop=
ped
-providing aliases for these functions [1] which means it wont compile on
-newer musl systems. Therefore only use it on 32bit glibc/linux platforms
-and exclude musl like cygwin or OSX
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D246f1c811448f37a44b=
41cd8df8d0ef9736d95f4
-
-Upstream-Status: Submitted [https://github.com/gabime/spdlog/pull/2589]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/spdlog/details/os.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
---- a/include/spdlog/details/os-inl.h
-+++ b/include/spdlog/details/os-inl.h
-@@ -237,7 +237,7 @@ SPDLOG_INLINE size_t filesize(FILE *f)
-     int fd =3D ::fileno(f);
- #    endif
- // 64 bits(but not in osx or cygwin, where fstat64 is deprecated)
--#    if (defined(__linux__) || defined(__sun) || defined(_AIX)) && (def=
ined(__LP64__) || defined(_LP64))
-+#    if ((defined(__linux__) && defined(__GLIBC__)) || defined(__sun) |=
| defined(_AIX)) && (defined(__LP64__) || defined(_LP64))
-     struct stat64 st;
-     if (::fstat64(fd, &st) =3D=3D 0)
-     {
diff --git a/meta-oe/recipes-support/spdlog/spdlog/fix-build-for-master-f=
mt.patch b/meta-oe/recipes-support/spdlog/spdlog/fix-build-for-master-fmt=
.patch
deleted file mode 100644
index c767db919f..0000000000
--- a/meta-oe/recipes-support/spdlog/spdlog/fix-build-for-master-fmt.patc=
h
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-[https://github.com/gabime/spdlog/commit/0ca574ae168820da0268b3ec7607ca7=
b33024d05]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
-
-From 0ca574ae168820da0268b3ec7607ca7b33024d05 Mon Sep 17 00:00:00 2001
-From: H1X4 <10332146+H1X4Dev@users.noreply.github.com>
-Date: Fri, 31 Mar 2023 20:39:32 +0300
-Subject: [PATCH] fix build for master fmt (non-bundled) (#2694)
-
-* fix build for master fmt (non-bundled)
-
-* update fmt_runtime_string macro
-
-* fix build of updated macro
----
- include/spdlog/common.h | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/include/spdlog/common.h b/include/spdlog/common.h
-index e69201a81..5f671c5c6 100644
---- a/include/spdlog/common.h
-+++ b/include/spdlog/common.h
-@@ -173,12 +173,19 @@ using format_string_t =3D fmt::format_string<Args.=
..>;
- template<class T>
- using remove_cvref_t =3D typename std::remove_cv<typename std::remove_r=
eference<T>::type>::type;
-=20
-+template <typename Char>
-+#if FMT_VERSION >=3D 90101
-+using fmt_runtime_string =3D fmt::runtime_format_string<Char>;
-+#else
-+using fmt_runtime_string =3D fmt::basic_runtime<Char>;
-+#endif
-+
- // clang doesn't like SFINAE disabled constructor in std::is_convertibl=
e<> so have to repeat the condition from basic_format_string here,
- // in addition, fmt::basic_runtime<Char> is only convertible to basic_f=
ormat_string<Char> but not basic_string_view<Char>
- template<class T, class Char =3D char>
- struct is_convertible_to_basic_format_string
-     : std::integral_constant<bool,
--          std::is_convertible<T, fmt::basic_string_view<Char>>::value |=
| std::is_same<remove_cvref_t<T>, fmt::basic_runtime<Char>>::value>
-+          std::is_convertible<T, fmt::basic_string_view<Char>>::value |=
| std::is_same<remove_cvref_t<T>, fmt_runtime_string<Char>>::value>
- {};
-=20
- #    if defined(SPDLOG_WCHAR_FILENAMES) || defined(SPDLOG_WCHAR_TO_UTF8=
_SUPPORT)
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb b/meta-oe/re=
cipes-support/spdlog/spdlog_1.12.0.bb
similarity index 75%
rename from meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.12.0.bb
index 2800be4784..c7d8ff8f3d 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.12.0.bb
@@ -3,11 +3,8 @@ HOMEPAGE =3D "https://github.com/gabime/spdlog/wiki"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/MIT;=
md5=3D0835ade698e0bcf8506ecda2f7b4f302"
=20
-SRCREV =3D "ad0e89cbfb4d0c1ce4d097e134eb7be67baebb36"
-SRC_URI =3D "git://github.com/gabime/spdlog.git;protocol=3Dhttps;branch=3D=
v1.x \
-           file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch \
-           file://fix-build-for-master-fmt.patch \
-           "
+SRCREV =3D "7e635fca68d014934b4af8a1cf874f63989352b7"
+SRC_URI =3D "git://github.com/gabime/spdlog.git;protocol=3Dhttps;branch=3D=
v1.x"
=20
 DEPENDS +=3D "fmt"
=20
--=20
2.39.3


