Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0320EC3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 20:34:07 +0000 (UTC)
Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
 by mx.groups.io with SMTP id smtpd.web11.51974.1747664146528557629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 07:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=FTaciAgc;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.18, mailfrom: jeroen@myspectrum.nl)
Received: from submission14.mail.transip.nl (unknown [10.103.8.165])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4b1KTr13B2zkQP0M;
	Mon, 19 May 2025 16:15:44 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission14.mail.transip.nl (Postfix) with ESMTPSA id 4b1KTp5f9Sz2mZN1M;
	Mon, 19 May 2025 16:15:42 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 593AF20292;
	Mon, 19 May 2025 14:15:41 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Mon, 19 May 2025 16:15:40 +0200
From: jeroen@myspectrum.nl
To: openembedded-devel@lists.openembedded.org
Cc: marc Kleine-Budde <mkl@pengutronix.de>,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [oe][meta-oe][PATCH 1/2] can-utils: correct the FiLES for can-utils-access
Date: Mon, 19 May 2025 16:15:24 +0200
Message-ID: <20250519141525.3708957-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission14.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1747664142; h=from:subject:to:cc:date:
 mime-version; bh=qASPPfXHfKe2YmTAvzl6ewpHriG93eAEfM+pZxMbNg4=;
 b=FTaciAgci+8n/VzXaO6epSchNEu4qqNjKm2zC/xVGKBNLcLV2tq2WbkRUs6Ju52Lk4FAGH
 4JtSBLK0ETi6+DTprNd+rVeajp7l1oj2fpLPOkjFWC6uPrDdB+HcXE5qISwXyfBashvD+i
 rS2ekmZWrGNRiGP7cJbzuE2rzMNfRHjr1C4XwUNfmOjdd6ocxdhMRrAkm2jMM1xtO6efkd
 n0lsrTqNzaWHl9IfyG5oLIG7La9EvZGc1Y1a3HtOAQqnTqtslSeBf1Yl7YmLFxPVMxG8Xb
 puG0Kz1cer8mvNQHK5JZKYMQIqYPSpxBHSgPc/XseQHMXH7iLz1HjklxRMEOgQ==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 20:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117479

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Remove socketcand and cannelloni from FILES, these are seperate
projects and not part of can-utils.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/me=
ta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index d4ee34167d..63c1e130ad 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -29,8 +29,6 @@ FILES:${PN}-access =3D " \
     ${bindir}/cangw \
     ${bindir}/canlogserver \
     ${bindir}/bcmserver \
-    ${bindir}/socketcand \
-    ${bindir}/cannelloni \
 "
=20
 FILES:${PN}-cantest =3D " \
--=20
2.43.0


