Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D464ACA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 20:40:50 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3916.1790973645309724306
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 13:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=sKtQL4+L;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 70453C35
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Oct 2026 22:40:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.227.105]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xCk3b-2JxvX70; Fri, 2 Oct 2026 22:40:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/5] gnome-backgrounds: upgrade 51.0 -> 51.0.1
Date: Fri,  2 Oct 2026 22:40:18 +0200
Message-ID: <20261002204022.70439-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002204022.70439-1-f_l_k@t-online.de>
References: <20261002204022.70439-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790973639-C17F99F1-708E1610/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e4ec869-10cf-4fd9-bbb1-8e9cfdb4221e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790973642; i=f_l_k@t-online.de;
	bh=ENDXQEY85Q89JHB36P2buP3hS+nVK6tfvNs9s3VEFsQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=sKtQL4+LtcUZSl0RttHCCV4vcUpF4UORu2em387hFvoceOpHdPyrL8yP9KvvIkYo4
	 hfON2+2SuTCbuTFoAAgSKVPC/PNonbXIG7m5XtRP/hgrCMuaqSKwTL5QMJh/AXCv7o
	 XUCms3JRKQzRKzqJyfigWqBSyyNKI7ciJFcg50xrNQgAHZnSILno/42xZ1BPhV5BA0
	 +A5VLPtvlwEeK2mcob7qYoybQ6s7omxwXmWm3OGmd1IP6jKS+CiZG/+m1FG67sob15
	 RigJu8Y9HtgpVEwvWekgb5Jn2SlQUkav4IjegEkZEQMuGEAPz/jiHUiOKv1s+R5Zsm
	 Ca15mWw5uurUg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 20:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130610

The tarball is in the 51/ directory, so gnome_verdir is overridden to
use the major version only.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...gnome-backgrounds_51.0.bb =3D> gnome-backgrounds_51.0.1.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_51.=
0.bb =3D> gnome-backgrounds_51.0.1.bb} (66%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds=
_51.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_5=
1.0.1.bb
similarity index 66%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_=
51.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_51=
.0.1.bb
index 67e8a267ef..4e7567b378 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_51.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_51.0.1=
.bb
@@ -6,7 +6,10 @@ SECTION =3D "x11/gnome"
=20
 inherit gnomebase gettext allarch
=20
-SRC_URI[archive.sha256sum] =3D "5811d24118d78f41b66c616efb1094c20507cb54=
6e484dca4963fe738a4ba7db"
+def gnome_verdir(v):
+    return oe.utils.trim_version(v, 1)
+
+SRC_URI[archive.sha256sum] =3D "ec50534d7749be0e1503c5504f826c61d1460d2b=
41cb84518fa6b2f5547d1e1e"
=20
 FILES:${PN} +=3D " \
     ${datadir}/backgrounds \
--=20
2.55.0


