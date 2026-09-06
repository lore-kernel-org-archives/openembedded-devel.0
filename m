Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D65C79FA9
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11205.1788687444055757052
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=a/CUtTJP;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout05.t-online.de (Postfix) with SMTP id 9106B5B4
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JP-22AhJp0; Sun, 6 Sep 2026 11:37:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 10/15] gnome-photos: depend on gexiv2-0.14
Date: Sun,  6 Sep 2026 11:37:08 +0200
Message-ID: <20260906093713.797648-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687439-64FF6956-486D68EF/0/0 CLEAN NORMAL
X-TOI-MSGID: d95c9203-8774-40aa-93f5-027d0a62cc07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=pWeaCOnonmMAfIepPp4weKVtqCgkV17x+ynFSjUOg3Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=a/CUtTJP/i0RwYB0GioS30LNTQ3jSaan6czPcZOMFSJhcmMp2LN3vYvY6f5k5e5GC
	 kE63+jIReNEbXv4GULFjb9o+CZFZ47wAwRu8ogtgzHLAPCR2nfUzcA1wD44CmsPfQs
	 zjL4f9tp/LrYlM6y5m+QXaMYO97cmnoXaoz26kiXC4PZhR7GScmMvWRgfpHyJhTHJk
	 DAAWYOAX/M88efqTD/Ev5TNY8cFwPDvrpE1CxOdjmrLRsavpy/L4cAjieNkBxEJBZs
	 lAiPyypGGmycLiwRlSCrTP1LzYgsnzJyF0gMU6rB2E3+Sux25+5B1RQm/zA0kv4CkN
	 ntz+eInpLFWeA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129789

gnome-photos looks for the unversioned gexiv2 pkg-config module, which
only the 0.14 series provides.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb b=
/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
index 81c3c65a48..0ca761aabb 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
@@ -13,7 +13,7 @@ DEPENDS =3D " \
     dbus \
     gegl \
     geocode-glib \
-    gexiv2 \
+    gexiv2-0.14 \
     gnome-online-accounts \
     gsettings-desktop-schemas \
     itstool-native \
--=20
2.55.0


