Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268A2C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 12:45:40 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.9841.1721133936685736595
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 05:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 6A04231D46
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 14:45:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.141]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sThYg-1sFYuX0; Tue, 16 Jul 2024 14:45:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nss: update 3.101 > 3.102
Date: Tue, 16 Jul 2024 14:46:38 +0200
Message-ID: <20240716124638.91446-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1721133930-1FFFCD4A-B5A305A2/0/0 CLEAN NORMAL
X-TOI-MSGID: 30239fad-e51f-43e2-8161-e45b9728a717
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 12:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111373

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/nss/{nss_3.101.bb =3D> nss_3.102.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.101.bb =3D> nss_3.102.bb} (99%=
)

diff --git a/meta-oe/recipes-support/nss/nss_3.101.bb b/meta-oe/recipes-s=
upport/nss/nss_3.102.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.101.bb
rename to meta-oe/recipes-support/nss/nss_3.102.bb
index 5a01efb7e..550507e02 100644
--- a/meta-oe/recipes-support/nss/nss_3.101.bb
+++ b/meta-oe/recipes-support/nss/nss_3.102.bb
@@ -33,7 +33,7 @@ SRC_URI =3D "http://ftp.mozilla.org/pub/security/nss/re=
leases/${VERSION_DIR}/src/$
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-c=
ryp.patch \
            "
-SRC_URI[sha256sum] =3D "859748f0b4b7bb51e7e600ae5a88ef4d71f93e6964b1beed=
2727784dd9ed85e7"
+SRC_URI[sha256sum] =3D "c29b03f24856db18a34fbcde737fcca6407c27b5f3f60bab=
a5111460e6cb307b"
=20
 UPSTREAM_CHECK_URI =3D "https://developer.mozilla.org/en-US/docs/Mozilla=
/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX =3D "NSS_(?P<pver>.+)_release_notes"
--=20
2.45.1


