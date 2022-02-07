Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE34CC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 11:41:30 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.169])
 by mx.groups.io with SMTP id smtpd.web10.21122.1644234087403368947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 03:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=IkbGJ3PE;
 spf=pass (domain: extraklein.de, ip: 188.68.63.169,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4JskkD4rVwz8Zfj
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1644234084;
	bh=gjjQNK5IIWNDWQXgj86y6w52IeFSfwHkvwiNrvJNA/8=;
	h=From:To:Cc:Subject:Date:From;
	b=IkbGJ3PEZ/kGtZg5+WsmKGYECcROvWzk2Nr7Oe3IMJ/4sqwbWx+ilU2YQd+HDZrOZ
	 SaXVMUOZ3cMonxjdoeq4TQdJMeDEmDq/sxkQP/Q+sJv75HjMelvQUy1VbU4N+wXpIa
	 SElMGdzsYqJminUot8gGgir3FcIeVFuVkX+GyTr/gKMrbMp4NJuo5Z5eyws9EpjceB
	 uEC1mZdoLDPp19UmZDsIya91T9H/sBtWulEMxuugRUjFBAXtoR6vNN2FPcNw+URkJb
	 BnFQ2ojWmLX62F7haEZdcSS/XrKwnUT2bCNniLpBmc4kLd89Da53sBTmDvAMHhusb8
	 q/fu+8hFbDKAw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4JskkD4Rjvz8Zfg
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 11:41:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4JskkC6kDGz8shP
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 12:41:23 +0100 (CET)
Received: from localhost (ip-062-143-218-156.um16.pools.vodafone-ip.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 0109A1401B6;
	Mon,  7 Feb 2022 12:41:22 +0100 (CET)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 62.143.218.156)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH V3] gpsd-machine-conf: set precise BSD-2-Clause
 license
Date: Mon,  7 Feb 2022 12:41:14 +0100
Message-Id: <20220207114114.5580-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <164423408328.4151.3202706368120460669@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: DU1Gd+4zgQWRq/imrStINaIwzpjhHMk+Zko6mpUd5x4d4lpJg2U=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 11:41:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95240

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/m=
eta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index 8d74eb4a2..c15db0e6c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Machine specific gpsd config"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/BSD;=
md5=3D3775480a712fc46a69647678acb234cb"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/BSD-=
2-Clause;md5=3Dcb641bc04cda31daea161b1bc15da69f"
=20
 # empty by default
 # BSP layers can add stuff like meta-openmoko example:
--=20
2.30.2


