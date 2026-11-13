Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7438.1794562167125034521
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=g7oseQOc;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id B086010916
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZN-2DfB2U0; Fri, 13 Nov 2026 10:27:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 15/16] gtk-vnc: upgrade 1.5.0 -> 1.6.0
Date: Fri, 13 Nov 2026 10:27:30 +0100
Message-ID: <20261113092732.3895896-15-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562061-317F982B-4A995F8B/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e5c3a74-aace-43c2-9158-aedbd59ea969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=xUChy4s1/MpalQ0ZOOc7xaChY+RKSCfxdm6VsbUf12w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=g7oseQOc30omaeCfrLdNOpICfMwziDfv2w7O+bmbQwopV8g/YgwECoGl//hvSbFnZ
	 KHYgvpjm7aJueCjl0xQCUElw72NCk2DXxiP4Hjwq3gEcKyi6cqZ8gvaDQ9nr66mMRq
	 zHm3gx/K+Mcjdi+bQx/zuNYgHrIysjEp79BrSE7FNqPBojrSKAFlBpgTmxiQwNK/fT
	 dIVXj5s4VovGzm5SuWQhcZAJZxKvJt2pNWGbRMPLeEkoV/pqqLmpv7gT2AI3VHhjKK
	 io/WLVtWv61AphHrr0TD2jn5vPI7RBquKdXSEZmjyt0Ty/avodqwcWH13MSm7nuDK8
	 GYRzSuE2pq7+A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132245
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gtk-vnc/{gtk-vnc_1.5.0.bb =3D> gtk-vnc_1.6.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/gtk-vnc/{gtk-vnc_1.5.0.bb =3D> gt=
k-vnc_1.6.0.bb} (88%)

diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb b/m=
eta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.6.0.bb
similarity index 88%
rename from meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb
rename to meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.6.0.bb
index 0c095f8be3..c5bbf8464f 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.6.0.bb
@@ -27,4 +27,4 @@ inherit pkgconfig gnomebase gettext gobject-introspecti=
on vala features_check
=20
 PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
=20
-SRC_URI[archive.sha256sum] =3D "c0beb4747528ad931da43acc567c6a0190f7fc62=
4465571ed9ccece02c34dd23"
+SRC_URI[archive.sha256sum] =3D "0e1a1023f191a842e994e5d10053bbe0e76d5f5f=
b9ec2eb525e2f8fdea57347f"
--=20
2.56.0

