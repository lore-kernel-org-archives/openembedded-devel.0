Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85CACAC5B4
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 10:39:50 +0000 (UTC)
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
 by mx.groups.io with SMTP id smtpd.web11.12264.1758618459442508655
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 02:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=sVZu/+yb;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.17, mailfrom: jeroen@myspectrum.nl)
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4cWDdh3kY7zTPNQw;
	Tue, 23 Sep 2025 11:07:36 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission10.mail.transip.nl (Postfix) with ESMTPSA id 4cWDdf5nRqz2nC0cd;
	Tue, 23 Sep 2025 11:07:34 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 3900E2007B;
	Tue, 23 Sep 2025 09:07:33 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Tue, 23 Sep 2025 11:07:32 +0200
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [meta-oe][PATCH] php: ignore CVE-2024-3566
Date: Tue, 23 Sep 2025 11:06:51 +0200
Message-ID: <20250923090651.2617482-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1758618454; h=from:subject:to:cc:date:
 mime-version; bh=1x0hXELFFkNFaBGXL1+mffhKZewnYiM6dPGKZfXdoEM=;
 b=sVZu/+ybxdMQHjB6TPcETkK3FkZIkCAeNGNK4bxXhYO3z1rFyXTfnDKyCGgOSCN3l83Bkk
 fFpfUq1YWg/SuI5Nus8V4iqCMNj0zCusjiaSo9BbOEJ8dW2FcHqCrijr1xZb4eJ0ZVx4F/
 qjoueT5yILjPk2ptCzCG9AHvIP8j9M9D6aX9TkqdTH9I3/XxFpJfZPoPKXYcehbk2Tccqx
 W/Q94AmZl5uoKh9dHMHw8NddO+AgzjIbUl4P0r6BmQItsMllkHMjaoOXFu42mqIKsgppMZ
 8fazLd5vAfnFJ7nZlm/asrTzGF47ziqtAgpUgP3nShcOkCi+P/IqdkVDckcnpg==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119662

From: Jeroen Hofstee <jhofstee@victronenergy.com>

CVE-2024-3566 only effects Microsoft Windows.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta-oe/recipes-devtools/php/php_8.4.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.12.bb b/meta-oe/recipes=
-devtools/php/php_8.4.12.bb
index fbab1b0dda..ecab93b822 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.12.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.12.bb
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


