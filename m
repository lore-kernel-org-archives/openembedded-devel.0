Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5EFC05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 20:39:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.5385.1676839176009199599
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 12:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=sGS9kqj5;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A8114857E9;
	Sun, 19 Feb 2023 21:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1676839174;
	bh=d9H543YxXPvJPQy4TNg7cPQ1wjISNJ8TAim76sCKuk4=;
	h=From:To:Cc:Subject:Date:From;
	b=sGS9kqj5Lp+mKU++8e4A1XNy/ifbHocn3W27qzIMFe51Pu2UopEuKaaiTTcHatSVo
	 8RfhmudFdMY7ft0cObytCi6+qnbzqlpoMLbKqUFLqfAyqIS9rL58sp5Gc+YsczSI1A
	 ik5p2drlXzTC3Gd4mtbLAeS0CMK5vEpnNfs6XobVcdY3fSi0UNNslDN/UpBZnX5uU/
	 mcRaAjK/MHIZYiKEsdcTj4NNSuWjujEOk2vlgd3YT/7TSJQyG8JlSZ2Tiv1F5k7w1u
	 ITmJUfw0pNxwk9wgr4HNh/S955nzjfaBDmO08rgi3ZX906Y1YeLLjwxWx+uifmnWmf
	 SCTugrhtLCY/w==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Daniel Gomez <daniel@qtec.com>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Peter Kjellerstedt <pkj@axis.com>
Subject: [meta-oe][PATCH v2] v4l-utils: Update 1.23.0+fd544473 -> 1.23.0+9431e4b2
Date: Sun, 19 Feb 2023 21:39:21 +0100
Message-Id: <20230219203921.86725-1-marex@denx.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Feb 2023 20:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101155

Update V4L2 utils to latest git HEAD and drop patches now upstream:
575e0a9f ("media-info: Include missing <cstdint> for uintptr_t")
96022d88 ("configure.ac, Makefile.am: Support building without NLS")

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Gomez <daniel@qtec.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Peter Kjellerstedt <pkj@axis.com>
---
V2: Add +git{SRCPV} to PV
---
 ...nclude-missing-cstdint-for-uintptr_t.patch | 31 -------------
 ...efile.am-Support-building-without-NL.patch | 45 -------------------
 .../v4l2apps/v4l-utils_1.23.0.bb              |  6 +--
 3 files changed, 3 insertions(+), 79 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-me=
dia-info-Include-missing-cstdint-for-uintptr_t.patch
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-co=
nfigure.ac-Makefile.am-Support-building-without-NL.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-inf=
o-Include-missing-cstdint-for-uintptr_t.patch b/meta-oe/recipes-multimedi=
a/v4l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_=
t.patch
deleted file mode 100644
index 032bf00c7..000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Inclu=
de-missing-cstdint-for-uintptr_t.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1d9ce7cd799770981043f656373cbd1bf7558b9a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 26 Jan 2023 17:00:00 -0800
-Subject: [PATCH] media-info: Include missing <cstdint> for uintptr_t
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer
-transitively included [1]. Explicitly include it.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-media/20230127=
010741.3883339-1-raj.khem@gmail.com/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- utils/common/media-info.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
-index 53e132f5..1a25a4b6 100644
---- a/utils/common/media-info.cpp
-+++ b/utils/common/media-info.cpp
-@@ -3,6 +3,7 @@
-  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights=
 reserved.
-  */
-=20
-+#include <cstdint>
- #include <cstring>
- #include <fstream>
- #include <iostream>
---=20
-2.39.1
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure=
.ac-Makefile.am-Support-building-without-NL.patch b/meta-oe/recipes-multi=
media/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-w=
ithout-NL.patch
deleted file mode 100644
index 0548e4fba..000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Mak=
efile.am-Support-building-without-NL.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4fe9f6071cd24bcab157a9398adcca474f619f8d Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Sat, 15 Oct 2022 02:45:26 +0200
-Subject: [PATCH] configure.ac, Makefile.am: Support building without NLS
-
-Avoid entering the v4l-utils-po and libdvbv5-po directories if NLS
-support is disabled, as the generated Makefiles in those directories are
-empty then.
-
-Upstream-Status: Submitted [https://patchwork.linuxtv.org/project/linux-=
media/patch/20221015010541.688322-1-pkj@axis.com/]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- Makefile.am  | 6 +++++-
- configure.ac | 1 +
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7fb443ab..8e924af8 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,7 +2,11 @@ AUTOMAKE_OPTIONS =3D foreign
- ACLOCAL_AMFLAGS =3D -I m4
- AM_MAKEFLAGS =3D $(word 1, $(subst 1, -w, $(filter 1, $(V))) --no-print=
-directory)
-=20
--SUBDIRS =3D v4l-utils-po libdvbv5-po lib
-+SUBDIRS =3D lib
-+
-+if USE_NLS
-+SUBDIRS +=3D v4l-utils-po libdvbv5-po
-+endif
-=20
- if WITH_V4LUTILS
- SUBDIRS +=3D utils contrib
-diff --git a/configure.ac b/configure.ac
-index 05298981..7c78467f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -99,6 +99,7 @@ DX_INIT_DOXYGEN($PACKAGE_NAME, doxygen_libdvbv5.cfg)
- ALL_LINGUAS=3D""
- m4_ifdef(AM_GNU_GETTEXT_REQUIRE_VERSION,[AM_GNU_GETTEXT_REQUIRE_VERSION=
([0.19.8])],[AM_GNU_GETTEXT_VERSION([0.19.8])])
- AM_GNU_GETTEXT([external])
-+AM_CONDITIONAL([USE_NLS], [test "$USE_NLS" =3D "yes"])
-=20
- LIBDVBV5_DOMAIN=3D"libdvbv5"
- AC_DEFINE([LIBDVBV5_DOMAIN], "libdvbv5", [libdvbv5 domain])
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
index b42300f09..c23b6e3e7 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
@@ -31,11 +31,11 @@ SRC_URI =3D "\
     file://0002-original-patch-mediactl-pkgconfig.patch \
     file://0003-original-patch-export-mediactl-headers.patch \
     file://0004-Do-not-use-getsubopt.patch \
-    file://0005-configure.ac-Makefile.am-Support-building-without-NL.pat=
ch \
-    file://0001-media-info-Include-missing-cstdint-for-uintptr_t.patch \
 "
=20
-SRCREV =3D "fd544473800d02e90bc289434cc44e5aa8fadd0f"
+SRCREV =3D "9431e4b26b4842d1401e80ada9f14593dca3a94c"
+
+PV .=3D "+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
 B =3D "${S}"
--=20
2.39.1


