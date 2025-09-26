Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F121CCAC5BE
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 19:16:58 +0000 (UTC)
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
 by mx.groups.io with SMTP id smtpd.web11.1210.1758925655040797628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 15:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=iEl+rn2h;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.11, mailfrom: jeroen@myspectrum.nl)
Received: from submission6.mail.transip.nl (unknown [10.103.8.157])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4cYQFJ5ZnMzTPPPk;
	Sat, 27 Sep 2025 00:27:32 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission6.mail.transip.nl (Postfix) with ESMTPSA id 4cYQFH55dRz2pRDk0;
	Sat, 27 Sep 2025 00:27:31 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id A62ED2007B;
	Fri, 26 Sep 2025 22:27:29 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Sat, 27 Sep 2025 00:27:28 +0200
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH] php: ignore CVE-2024-3566
Date: Sat, 27 Sep 2025 00:27:09 +0200
Message-ID: <20250926222709.2640846-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission6.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1758925651; h=from:subject:to:cc:date:
 mime-version; bh=mlwmWzEU35vkxs7ZS8Jkn//7VEJYbuJjJoOPEvRONJ8=;
 b=iEl+rn2hP7NLzUnDko9y/QczVnVnKEgjbgiIAEvkFbqBa5TzUuWTg7Jtcjs4WIayK76nOk
 pMFbFfgOrIKRwc7u7tM6VXhH7aolqMnRZZkLIDU0m/NUiaL/JxAqmsC5W1MHvvGWbW0hgJ
 2MqSmWYq0J9sK08DwN4dD65w+Y7/wGMJM+tnEcJ+XjvBHh8RrukLS1Kwzss9GRcm+R+zD4
 FV5CouDgXC7EwmnETUVgkISs7wXTcVcsxzuN74ezHu2WXXw9JRi+QLqs/ndnlTnROSk26X
 Emc17DxxIuot5TyduCml081ljdABxX61DiCoiZoY50dD5xkVNp6Y9pgzm7sqcg==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 19:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120000

From: Jeroen Hofstee <jhofstee@victronenergy.com>

CVE-2024-3566 only effects Microsoft Windows.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d68c56e1ed2adc8246a18424ed5d9ede5e8254a0)
Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta-oe/recipes-devtools/php/php_8.4.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.10.bb b/meta-oe/recipes=
-devtools/php/php_8.4.10.bb
index d74552d5e2..ed169742da 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.10.bb
@@ -39,6 +39,7 @@ CVE_STATUS_PHP =3D " \
     CVE-2007-4596 \
 "
 CVE_STATUS[CVE-2022-4900] =3D "cpe-incorrect: The current version (8.2.2=
0) is not affected."
+CVE_STATUS[CVE-2024-3566] =3D "not-applicable-platform: Issue only appli=
es on Windows"
=20
 inherit autotools pkgconfig python3native gettext multilib_header multil=
ib_script systemd
=20
--=20
2.43.0


