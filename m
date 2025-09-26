Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF837CAC5BB
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 19:16:58 +0000 (UTC)
Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
 by mx.groups.io with SMTP id smtpd.web11.1439.1758926542054663371
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 15:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=gqv282sH;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.7, mailfrom: jeroen@myspectrum.nl)
Received: from submission12.mail.transip.nl (unknown [10.103.8.163])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4cYQZM4Nh9zQvw4G;
	Sat, 27 Sep 2025 00:42:19 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission12.mail.transip.nl (Postfix) with ESMTPSA id 4cYQZL1vRNz2nC247;
	Sat, 27 Sep 2025 00:42:18 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id B69662001F;
	Fri, 26 Sep 2025 22:42:16 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Sat, 27 Sep 2025 00:42:15 +0200
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] php: ignore CVE-2024-3566
Date: Sat, 27 Sep 2025 00:42:11 +0200
Message-ID: <20250926224211.2680985-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission12.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1758926538; h=from:subject:to:cc:date:
 mime-version; bh=T0SrPpJXWElGVJ2dH1XwkHtf+mSRyBrfBiGiK94SSvU=;
 b=gqv282sHaZFhT8XeRZ0bYOM+zR+tx2NXDXW3Fb/MaMFKVrk4vGas2lKKmQzY78OMVnVhHb
 NFg1yLFsLLIJbd53vXB4OwZffjoTX6m2UQ1aoAHcbqDM4EgMPljoQpaxvUanrLmOEwbyJM
 mcXX8Cjp1/Cxoj/p0buh4BjSIuPSPr/jZoxqR+SLpDyqCAOB7wtJ5GqE2MWi3mo9dvPPDZ
 19I7NdJ9xYL9WJ1I6X03OP0fsZ5ejhlbdZE1a0ViRJue0j55yJSltRjzWptH0jxLkkO190
 nE3lTMI960XVNXsM8HDLDq3ODKptOqo90cv6Sqx+IYQWhTqICu/mEUwSIT9auw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 19:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120001

From: Jeroen Hofstee <jhofstee@victronenergy.com>

CVE-2024-3566 only effects Microsoft Windows.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d68c56e1ed2adc8246a18424ed5d9ede5e8254a0)
Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta-oe/recipes-devtools/php/php_8.2.29.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.29.bb b/meta-oe/recipes=
-devtools/php/php_8.2.29.bb
index 2fb6e5749c..08cece1c17 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.29.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.29.bb
@@ -43,6 +43,7 @@ CVE_STATUS_PHP =3D " \
     CVE-2007-3205 \
     CVE-2007-4596 \
 "
+CVE_STATUS[CVE-2024-3566] =3D "not-applicable-platform: Issue only appli=
es on Windows"
=20
 inherit autotools pkgconfig python3native gettext multilib_header multil=
ib_script systemd
=20
--=20
2.43.0


