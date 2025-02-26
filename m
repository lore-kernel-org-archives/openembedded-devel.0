Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0931CC1B0D9
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8936.1740585027532106146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07024150C
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B31CE3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 02/23] poke: enable out of tree builds
Date: Wed, 26 Feb 2025 15:49:59 +0000
Message-ID: <20250226155022.1989209-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115654

---
 meta-oe/recipes-devtools/poke/poke_4.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/poke/poke_4.2.bb b/meta-oe/recipes-=
devtools/poke/poke_4.2.bb
index eb840435c0..130eb32211 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.2.bb
+++ b/meta-oe/recipes-devtools/poke/poke_4.2.bb
@@ -13,8 +13,7 @@ DEPENDS =3D "flex-native bison-native bdwgc readline"
=20
 SRC_URI[sha256sum] =3D "8aaf36e61e367a53140ea40e2559e9ec512e779c42bee34e=
7ac24b34ba119bde"
=20
-# poke does not support using out-of-tree builds
-inherit autotools-brokensep gettext pkgconfig
+inherit autotools gettext pkgconfig
=20
 # The automatic m4 path detection gets confused, so force the right valu=
e from
 # the poke bootstrap script.
--=20
2.43.0


