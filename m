Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FD7C79FAA
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11199.1788687443379024558
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=KFSXR6qp;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout11.t-online.de (Postfix) with SMTP id 808011C437
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JO-22AhJl0; Sun, 6 Sep 2026 11:37:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 06/15] gnome-remote-desktop: upgrade 49.1 -> 50.2
Date: Sun,  6 Sep 2026 11:37:04 +0200
Message-ID: <20260906093713.797648-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687438-837FD956-FA536833/0/0 CLEAN NORMAL
X-TOI-MSGID: 7bf9a8a9-0386-46a0-b6fc-a5b61253e8cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=X8H4kOyx7PL/IiHVPDNYC++zXpuZN8+TBkfuGAje65A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KFSXR6qpN6Em3tIRkC3gIB0wdVz4PiHMHGvSwUJljQJjUkH4OhEDDYkxBP6m0MjeX
	 SUOJ7q7xvOuaEfdQiO5QAOlxZ8NjLiXU/Z8GhULMBFVKmHqusfqxXklDgQYQTaT6+q
	 2cgAEWomA1VDdDVTIBizpIa8YI+EbMd2ZuH0ew0P9FueSfIkMiZYRYllueha47UXcO
	 RXqJ3BwUL+uWsBpu0yE7khB6Latoe6nFP80qwZwEfwHldU7rpS6zuT9xEiw4nGcy5z
	 C18VBn5KYzYdQ8uqMh8sFD6qcye2oaIM42/OzKTwWY5baI+qdw2udhVHTP1T0YvBT1
	 sQwRRHiNhwk9Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129779

krb5 is a new hard dependency of the RDP backend.

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ome-remote-desktop_49.1.bb =3D> gnome-remote-desktop_50.2.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_49.1.bb =3D> gnome-remote-desktop_50.2.bb=
} (93%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_49.1.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_50.2=
.bb
similarity index 93%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_49.1.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_50.2.bb
index 2ffa9a800e..51076d004c 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_49.1.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_50.2.bb
@@ -8,7 +8,7 @@ inherit gnomebase pkgconfig gettext gsettings features_ch=
eck useradd
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
-SRC_URI[archive.sha256sum] =3D "7800f388301eeb8147b0be55e8fa7cbd7521066a=
48a06115cc0ead9f0cea188a"
+SRC_URI[archive.sha256sum] =3D "31df628f4113573f136ffc8dc001763aed633cd8=
5bed21e58bc61f8a17df091f"
=20
 DEPENDS =3D " \
     asciidoc-native \
@@ -17,6 +17,7 @@ DEPENDS =3D " \
     libepoxy \
     cairo \
     glib-2.0 \
+    krb5 \
     pipewire \
     polkit \
     libnotify \
--=20
2.55.0


