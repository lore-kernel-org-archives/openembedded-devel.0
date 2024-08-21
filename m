Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937A4C52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 08:34:12 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.15457.1724229248393161713
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 01:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout08.t-online.de (Postfix) with SMTP id 4663C21928
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 10:34:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.146]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sggmz-4FZeT40; Wed, 21 Aug 2024 10:33:57 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] flatpak: update 1.15.9 -> 1.15.10
Date: Wed, 21 Aug 2024 10:35:25 +0200
Message-ID: <20240821083525.26568-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821083525.26568-1-f_l_k@t-online.de>
References: <20240821083525.26568-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1724229237-877FD824-0C777E77/0/0 CLEAN NORMAL
X-TOI-MSGID: 2fdaa5d8-8728-4e9f-85bd-d20e62679a37
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 08:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111880

Dependencies:

    In distributions that compile Flatpak to use a separate bubblewrap (b=
wrap) executable, version 0.10.0 is required.
    This version adds a new feature which is required by the security fix=
 in this release.

Security fixes:

    Don't follow symbolic links when mounting persistent directories (--p=
ersist option). This prevents a sandbox escape where a malicious or compr=
omised app could edit the symlink to point to a directory that the app sh=
ould not have been allowed to read or write. (CVE-2024-42472, GHSA-7hgv-f=
2j8-xw87)

Documentation:

    Mark the 1.12.x and 1.10.x branches as end-of-life (#5352)

Other bug fixes:

    Fix several memory leaks (#5883, #5884)

Internal changes:

    Record a log file when running build-time tests with AddressSanitizer=
 (#5884)

    Add initial suppressions file for AddressSanitizer (#5884)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatpak/{flatpak_1.15.9.bb =3D> flatpak_1.15.10.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.15.9.bb =3D> flatpak_=
1.15.10.bb} (95%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.10.bb
similarity index 95%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.15.10.bb
index f8d211236..c9d04e926 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.10.bb
@@ -4,11 +4,11 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
 SRC_URI =3D " \
-    gitsm://github.com/flatpak/flatpak;protocol=3Dhttps;branch=3Dmain \
+    git://github.com/flatpak/flatpak;protocol=3Dhttps;branch=3Dmain \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
-SRCREV =3D "b026910d1c18900e9daf07c429f7e901eb1c3f20"
+SRCREV =3D "8b4f523c4f8287d57f1a84a3a8216efe200c5fbf"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.45.2


