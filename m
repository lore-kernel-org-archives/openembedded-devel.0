Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAF0C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 14:59:25 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.11013.1699109957977575463
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 07:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout07.t-online.de (Postfix) with SMTP id ACD5052614
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Nov 2023 15:59:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.165]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzI7D-00YN730; Sat, 4 Nov 2023 15:59:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] tracker-miners: Upgrade 3.6.0 -> 3.6.2
Date: Sat,  4 Nov 2023 15:59:30 +0100
Message-ID: <20231104145932.128150-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699109951-58FF2ED2-5D502A20/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ec21fec-079c-49e4-8ac7-e07388f79c56
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 14:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106372

NEW in 3.6.2 - 2023-10-31
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  * Improvements to the seccomp jail, and fixes for spurious SIGSYS
    positives.
  * Use GDateTime to handle dates

Translations: ka

NEW in 3.6.1 - 2023-09-28
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  * Avoid the special thread in tracker-extract-3, and extend
    the seccomp jail to the full process.

Translations: eo

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{tracker-miners_3.6.0.bb =3D> tracker-miners_3.6.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.6.0.bb =3D> tr=
acker-miners_3.6.2.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.0.bb b/m=
eta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
index d89915502..a0a41d7f8 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
@@ -20,7 +20,7 @@ SRC_URI:append =3D " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch =
\
 "
-SRC_URI[archive.sha256sum] =3D "c2ed9f6b0410195863b84c7b5467c5bc1255e96d=
658741192b5e92568a3bebd0"
+SRC_URI[archive.sha256sum] =3D "0ad722f3d532c21d757cf488f942960679ea8f45=
7925efa97656ed4c9e9ba4ff"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.42.0


