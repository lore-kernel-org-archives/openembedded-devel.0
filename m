Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C26C48260
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 07:01:38 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.36498.1708326094812108805
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Feb 2024 23:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id 883E922645
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 08:01:32 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.44]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rbxeZ-1b5vjm0; Mon, 19 Feb 2024 08:01:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gedit: update 46.1 -> 46.2
Date: Mon, 19 Feb 2024 08:01:40 +0100
Message-ID: <20240219070140.149267-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219070140.149267-1-f_l_k@t-online.de>
References: <20240219070140.149267-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1708326087-57FA8986-729D12C1/0/0 CLEAN NORMAL
X-TOI-MSGID: ac5856d4-a2ab-4c2d-b293-d9fd29fe11bf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 07:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108844

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =3D> gedit_46.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =3D> gedit_46.2.bb}=
 (92%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
index c0221b9a7..c073eb9b9 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
@@ -23,7 +23,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-=
introspection gtk-doc get
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "a1a6e37f041765dff7227a1f5578b6f49faaf016=
b1e17e869caf5bfb94c6aa4e"
+SRC_URI[archive.sha256sum] =3D "c0866412bad147ebace2d282ffcbb5a0e9a304b2=
0fd55640bee21c81e6d501ef"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.43.0


