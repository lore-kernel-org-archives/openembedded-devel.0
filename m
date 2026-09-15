Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7C4C982CB
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18081.1789458273713370824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=vDkWTnwA;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 0B40A1C3C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npq-00ds5q0; Tue, 15 Sep 2026 09:44:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 11/31] gnome-desktop: upgrade 44.5 -> 51.0
Date: Tue, 15 Sep 2026 09:43:27 +0200
Message-ID: <20260915074347.6003-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458250-F9FF89B9-4724DC38/0/0 CLEAN NORMAL
X-TOI-MSGID: 79b26bee-0240-4b30-9f72-36fbb13ff7f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=GApoYzebXm/TCv/Eqic5JmFt+k4qO9xuRH/VBsngx00=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=vDkWTnwA29BzKxfjsTyfdzphbPtDzf9jna6FbF1jTGd5nD7HLr/c3v9Un/h7Vtf5A
	 ryhh3/tO0n1D56Pd4IjBzV9v+ANgfi9owIsGgjuKx/JD6akxuS1kcndj8GFjY6lZeP
	 ssVrWhaVwr76QCGrPyI86pM1Q6WMey49uyrpzH4iYW48xdLRw+kMNfgRd6tvAX/TIs
	 7/K4k9ZTjIoLiLS4HMaKruMFtOkrhQHHq92kZZQEzc8wvO+yLWWIHX3sfjoWdG9kan
	 zJ4q3G7NyV/d2R/6oOMXvaNK9aE9T+MeCFSZock76GYxp7veKP23ZlF2gc2heeRZ9G
	 PAficToFVICNQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130056

The legacy gtk+3 library is still available behind the legacy_library
option, so the gtk3 users in this layer keep working.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-desktop_44.5.bb =3D> gnome-desktop_51.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.5.bb =3D=
> gnome-desktop_51.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.5.bb=
 b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_51.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.5.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_51.0.bb
index 2f084ea7f6..c7f98f1875 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_51.0.bb
@@ -14,7 +14,7 @@ GIR_MESON_OPTION =3D ""
=20
 SRC_URI +=3D "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long=
.patch \
             file://0001-meson-Add-riscv32-to-seccomp-unsupported-list.pa=
tch"
-SRC_URI[archive.sha256sum] =3D "20e0995a6e3a03e8c1026c5a27bc3f45e69ffcc3=
92ad743dcab6107a541d232f"
+SRC_URI[archive.sha256sum] =3D "9ebeb9f1769d3c310caeadd921ab34c8f264b929=
37740518b3bc859a579a6912"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/gnome-desktop/-/t=
ags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.55.0


