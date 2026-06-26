Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB211C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:13:57 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37270.1782486831876990279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=KETaPORH;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd93.aul.t-online.de (fwd93.aul.t-online.de [10.223.144.119])
	by mailout03.t-online.de (Postfix) with SMTP id E163CE598
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 17:13:48 +0200 (CEST)
Received: from fedora.fritz.box ([79.219.237.60]) by fwd93.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wd8FX-17Rfn70; Fri, 26 Jun 2026 17:13:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv3] flatpak: update 1.17.6 -> 1.18.0
Date: Fri, 26 Jun 2026 17:13:41 +0200
Message-ID: <20260626151341.154231-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1782486827-81FF9499-3AE00C24/0/0 CLEAN NORMAL
X-TOI-MSGID: 536c493b-3220-48ac-90b3-185f7ee744a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782486828; i=f_l_k@t-online.de;
	bh=MQtTviDIQN6JtnoWQ0Nas5oEbhTD890zvdk7Td2UZ1c=;
	h=From:To:Subject:Date;
	b=KETaPORHLjyoVZpg5pqWOjrXcPBrbKQiMdj9oGnD7+qW2od7rWFvXeWw1EYVsALyo
	 MBEhQhsims6fmtM2dr/2On84VLVUqZmpqr0ZDnbodpIlmBqLfd9/YGOkD9Fbgs/ibG
	 vnBdjkluVT7hGlI4PIuGpBUsdXYNKAJfn37sStdgMuVs99pKM1xHsJYRMRlqJojyN8
	 cwNUx/Jen+rl6IJHMJCqveGPuTNnEjvnRA/bTR2d83XISwbT67fZNLdWzhwGuaO8uF
	 UP5kWlO5zQcd8/hczM8X7GDmolLax0R3lUbopLrWt++v8bsUBBe4KKMCg2OUMAbPMy
	 pLzOjvQmWusTQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 15:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127802

Enhancements:

Improve error handling and printed output of flatpak-coredumpctl

Support the AMD vendor specific compute interface (/dev/kfd) via the DRI
device permission

Improve the output of flatpak update with failure causes

Improve startup time for fish shell integration

Translation updates: =E2=80=8Ezh_CN

Bug fixes:

Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is defined

Ignore system bus failures in parental controls check

Fix some return values and replace deprecated GTimeVal with
g_get_real_time()

Suppress an unused-result warning in the tests

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatpak/{flatpak_1.17.6.bb =3D> flatpak_1.18.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.6.bb =3D> flatpak_=
1.18.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.18.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
index 1512b7239f..879455f63c 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
@@ -8,7 +8,7 @@ SRC_URI =3D " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
-SRCREV =3D "9b21874f1a175a9b7c79175a221fa043e202ca73"
+SRCREV =3D "5de2b58bdafde88515d9d6b9189bd1cfd3b88c46"
=20
=20
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check useradd
--=20
2.54.0


