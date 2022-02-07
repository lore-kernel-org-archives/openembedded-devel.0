Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE1CC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 13:52:09 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.102])
 by mx.groups.io with SMTP id smtpd.web11.22112.1644241925320621723
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 05:52:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=Qk+mGW4W;
 spf=pass (domain: extraklein.de, ip: 188.68.61.102,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4Jsncy4McQz80mk
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 14:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1644241922;
	bh=9W0dxLJHZfYuaV0O9VdR47uVfh01VXVzQ8Nxu8WZrXk=;
	h=From:To:Cc:Subject:Date:From;
	b=Qk+mGW4WOMmilu7wIpAFuC4JSw1MUVv6TpKc59DqftL0t7vHb5xK3CbGCudVof+c5
	 uibpxQsIwbhF7cl/76bFTK3BJwC6wru1c/HP33vLYiJwaoKsC0iO2f5t073Hqm0QnX
	 BaueWbem9ffUrmkYnk70LXpXdXUTVPZkvwMVZdKK4Gwowbf80V3NgkchD3AknDbhWd
	 R/fHcAF4qNLu8P1MfIQJtN8/nl0P64SKTCye/G3JTaauWDaXNQ0X0K2xuhaNi3GbGr
	 KpF4XYFyh7COTi+HaYeMQyoGtMM0f+4h65bowZVDA9nQ7MM8KiwHDqpnh8s0C8SjKE
	 UXRhOrgVFkPOg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4Jsncy40bcz80lq
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 14:52:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4Jsncx2S5lz8sgW
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 14:52:01 +0100 (CET)
Received: from localhost (ip-062-143-218-156.um16.pools.vodafone-ip.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 61FA11401AE;
	Mon,  7 Feb 2022 14:52:00 +0100 (CET)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 62.143.218.156)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH V4] gpsd-machine-conf: set precise BSD-3-Clause
 license
Date: Mon,  7 Feb 2022 14:51:47 +0100
Message-Id: <20220207135147.7984-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <164424192065.21882.332299627882657370@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: HQfGsHA7vKlIc3I319pXsb/eEW7cRQD5ZDPB72jMmtBZ/dOtpMc=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 13:52:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95242

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/m=
eta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index 8d74eb4a2..9c1db3a6b 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Machine specific gpsd config"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/BSD;=
md5=3D3775480a712fc46a69647678acb234cb"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/BSD-=
3-Clause;md5=3D550794465ba0ec5312d6919e203a55f9"
=20
 # empty by default
 # BSP layers can add stuff like meta-openmoko example:
--=20
2.30.2


