Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AD2C88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:28 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18107.1789458264430173277
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=UBfW5bIB;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 5D60237E88
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npr-00ds620; Tue, 15 Sep 2026 09:44:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 23/31] msgraph: upgrade 0.3.4 -> 0.3.5
Date: Tue, 15 Sep 2026 09:43:39 +0200
Message-ID: <20260915074347.6003-23-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458251-47FFC9B9-2648AB8C/0/0 CLEAN NORMAL
X-TOI-MSGID: 639f132b-bb38-4d28-affd-f057ca06153f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=icV9B8ZCixUsueVqKTZu4wLt+x8KodqPGCzGgp+y4zo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UBfW5bIBd7QEDgFq1DEXlckx+6rB+FKT4ambpjwK1aDPawOelYOZiNdrgvwCCCQDr
	 0LBSuG4kvYkPgrBlBertB6OxUzUg4taWVK6t4GaUey6OP9QiwR8tQaYb9y5VC30KJj
	 5HEiL/Ei2KH7QoNNZQzCWOqaEnEFQE7nGmMBYxZZ30zK507BZEIf9cNZAzQ+FjNqiq
	 5vepqqzoywL7OMKxQvz/eHGqki04jVibX+KZgYQW61nCWd34YrUCgWnp+8vLgM2q8O
	 DBsHs82IY++LxHcWwnH7CfxPD2Bj3MSzxAO2bc4PAwXDIi6U2h3ELNnTymSo4FLNar
	 qDBPAj89TSZOQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130045

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../msgraph/{msgraph_0.3.4.bb =3D> msgraph_0.3.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/msgraph/{msgraph_0.3.4.bb =3D> msgraph_0=
.3.5.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.4.bb b/meta-gno=
me/recipes-gnome/msgraph/msgraph_0.3.5.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/msgraph/msgraph_0.3.4.bb
rename to meta-gnome/recipes-gnome/msgraph/msgraph_0.3.5.bb
index 1c2c3b9c41..539fcfec38 100644
--- a/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.4.bb
+++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec0=
61b899bce1d9ce9404"
 inherit gnomebase gobject-introspection gi-docgen features_check
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "0731ece6b02b32eeffbbbd98efdc77bc03ddd206=
51eeae3a4343f0879b04d6c7"
+SRC_URI[archive.sha256sum] =3D "e3dadbf638d0207040f6da6d852db516e463423d=
a710af6cbc35d00572f17d9b"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.55.0


