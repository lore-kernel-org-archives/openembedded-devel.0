Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FC8CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 09:12:41 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41275.1781169155957007296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 02:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=NKKVSOc0;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd95.aul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout04.t-online.de (Postfix) with SMTP id BE06978B
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 11:12:33 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXbSg-3oMdQ90; Thu, 11 Jun 2026 11:12:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] webkitgtk3: remove backported patch
Date: Thu, 11 Jun 2026 11:12:25 +0200
Message-ID: <20260611091225.440483-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781169151-68FF7564-904CF05C/0/0 CLEAN NORMAL
X-TOI-MSGID: 0166436e-ab2c-433b-9bd1-659163653224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781169153; i=f_l_k@t-online.de;
	bh=d8VyeAJHHH18j34/KCx/ET2LWQUc7ObxrkI46+4dtRI=;
	h=From:To:Subject:Date;
	b=NKKVSOc0xu5hTMarIqOmQdd7STgIcexoo4RVt5Ktrj1qu/3PvoziFiSlirAMnvSXw
	 XiRPydJUCfS0uKeMZFgKAND+9TCOpR/jSqjTVKc3fQxerU3+mkiHIDByLbhu6sEGFz
	 36VWNks0ieuXBF5dhDtz61hFZik/8WM/VggM6w19+DI1JFCgAgderb7LoNYyFZAwrg
	 mhWmYBL6GQj2+DRSrAVJ/5L2NN2jJd1/Qpf5ixzYVLrIev7aZgZoAR/Jl01Wi6Mzq3
	 dIl5dW1NPjbfD2vlwUQWPOIXfPNrU7C54+nip/lkTnJDY/raC6rhXbxDQt3s1w4qlj
	 x0erkTOZ0wEeQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 09:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127523

The missing include has been added:
https://github.com/WebKit/WebKit/blob/f540f4d1b1e10fd471a05a33dacf59e7917=
6b2fc/Source/WebCore/contentextensions/ContentExtensionActions.h#L33

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-on-RISCV-https-bugs.webkit.org-show.patch | 30 -------------------
 .../webkitgtk/webkitgtk3_2.52.4.bb            |  1 -
 2 files changed, 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix=
-build-errors-on-RISCV-https-bugs.webkit.org-show.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-=
errors-on-RISCV-https-bugs.webkit.org-show.patch b/meta-oe/recipes-suppor=
t/webkitgtk/webkitgtk3/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.o=
rg-show.patch
deleted file mode 100644
index 40a7133052..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-errors-=
on-RISCV-https-bugs.webkit.org-show.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 984538dcce7b184269efc1e1b0fb78e1cb932b5d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Mar 2025 01:21:22 -0700
-Subject: [PATCH] Fix build errors on RISCV
- https://bugs.webkit.org/show_bug.cgi?id=3D290163
-
-Reviewed by NOBODY (OOPS!).
-
-Include c++ header <system_error> for std::error_code.
-
-* Source/WebCore/contentextensions/ContentExtensionActions.h: Include sy=
stem_error
-
-Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42802]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WebCore/contentextensions/ContentExtensionActions.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/WebCore/contentextensions/ContentExtensionActions.h =
b/Source/WebCore/contentextensions/ContentExtensionActions.h
-index 0b75d2e1df78..61cb33c94ce8 100644
---- a/Source/WebCore/contentextensions/ContentExtensionActions.h
-+++ b/Source/WebCore/contentextensions/ContentExtensionActions.h
-@@ -28,6 +28,7 @@
- #if ENABLE(CONTENT_EXTENSIONS)
-=20
- #include "ContentExtensionStringSerialization.h"
-+#include <system_error>
- #include <wtf/JSONValues.h>
- #include <wtf/Hasher.h>
-=20
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
index c4c0ab4545..4486450595 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
@@ -18,7 +18,6 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitg=
tk-${PV}.tar.xz \
            file://reproducibility.patch \
            file://no-musttail-arm.patch \
            file://sys_futex.patch \
-           file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-s=
how.patch \
            file://fix-ftbfs-riscv64.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAY=
S_I.patch \
            "
--=20
2.54.0


