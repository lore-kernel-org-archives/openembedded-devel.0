Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B74C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 11:31:15 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [194.59.204.23])
 by mx.groups.io with SMTP id smtpd.web08.20893.1644233470890420117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 03:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=iPhuhvB3;
 spf=pass (domain: extraklein.de, ip: 194.59.204.23,
 mailfrom: matthias@extraklein.de)
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4JskVM4H2mz41DB
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 12:31:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1644233467;
	bh=0bpAILD+b9EuDmj6XKX3x1jkC/r50P2HzL4+lSMIj2A=;
	h=From:To:Cc:Subject:Date:From;
	b=iPhuhvB3lcKA4pFDYmfteJk3Sf8K2fYqPjWTGeaUufIRbNj0Q/u97GiXqHPP1UTMU
	 ePZhy+Ub3s9j6Fo6vHNAImNkzxjdGixNHxgPVoSmXiWcgdTnRz0BIUG6B1O+bmuWNj
	 LcUgSfFQZCEXgoo90eerz0UsMbpasv2xR+Sk/F02Sg9wu3t9TxRyQBj7iSB19QFtuT
	 db30ORQkB+N2tmLA3v0tRnd6TWzywFH/JEul6zY0lbtqh2DdWMDCIxIjYWnVlj3ECK
	 gilj6X+n/ppbxc0sXUXzwpUBAyaOg01WslNdDNvvHLXH9DRO/r1Ro7a2VEVQyvLa5A
	 APsqmdL2iWjNA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4JskVM3syRz7vMC
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 12:31:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4JskVM0Pgnz8sjr
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 12:31:06 +0100 (CET)
Received: from localhost (ip-062-143-218-156.um16.pools.vodafone-ip.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 2F5BB140143;
	Mon,  7 Feb 2022 12:31:06 +0100 (CET)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 62.143.218.156)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] gpsd-machine-conf: set precise BSD-2-Clause license
Date: Mon,  7 Feb 2022 12:31:02 +0100
Message-Id: <20220207113102.5309-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <164423346644.12987.11357634664963876504@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: nQ583n7dc1XsrzEtHpmzSqkmk2sjxWS55bk9emcHujuwHRtBqW0=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 11:31:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95238

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/m=
eta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index 8d74eb4a2..46e26767d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Machine specific gpsd config"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/BSD;=
md5=3D3775480a712fc46a69647678acb234cb"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/BSD-=
2-Clause;md5=3Dcb641bc04cda31daea161b1bc15da69f"
=20
 # empty by default
 # BSP layers can add stuff like meta-openmoko example:
--=20
2.30.2


