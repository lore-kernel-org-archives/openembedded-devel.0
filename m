Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56369C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 07:55:46 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [185.244.194.184])
 by mx.groups.io with SMTP id smtpd.web08.7992.1664870139570572589
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 00:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=KY1/NN2e;
 spf=pass (domain: extraklein.de, ip: 185.244.194.184,
 mailfrom: matthias@extraklein.de)
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4MhVPP2Jbtz8tY5
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  4 Oct 2022 09:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1664870137;
	bh=eJav9PlbKYQtNxtQW1WdjWsRFoU7JOnpFjqYkEZuSQs=;
	h=From:To:Cc:Subject:Date:From;
	b=KY1/NN2eq8bjWsHrOtzs//ItCxeuPaBJZjTEqzEirqbe8nQAdyokc+0dz67t+K8Jp
	 yh2ekCbms2uqu/SbI0Od/EOhMVe9com+gKEYT3IwTicnu0WlfWXfuTP1R6In2w7DB7
	 0bmI4hefAVbceKLzsNHxgwUwd0VbaT94XCKFsHnjSMYC8CTuVdk7zVpKhXNRQQzDti
	 TPpwVte8kulmpK35IK5ZjQF+49ijGTMRpfU1V425Bi3/LXajzaoajUYJeoFOth2SiX
	 PfIekEMV42tgJSQikW75btYLLrdFGc5T1pLd2dpix0I4b0NmrJqThZfmTohOnjnj1l
	 9F3u6EEMkUnpA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4MhVPP1wfbz7xwP
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  4 Oct 2022 09:55:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4MhVPN4Jt0z8sZh
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  4 Oct 2022 09:55:36 +0200 (CEST)
Received: from localhost (ip-088-152-137-114.um26.pools.vodafone-ip.de
 [88.152.137.114])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id C0621140053;
	Tue,  4 Oct 2022 09:55:33 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 88.152.137.114)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] paho-mqtt-c: upgrade 1.3.10 -> 1.3.11
Date: Tue,  4 Oct 2022 09:54:53 +0200
Message-Id: <20221004075453.1441-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <166487013405.17395.2439787364472893475@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-Rspamd-Queue-Id: C0621140053
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: pe+OWDHlbibCaEEjhYonGoM3jjykXw2SquxiQ4Yu6a7w1LUnKWQ=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 07:55:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99056

Service release.
Issues resolved: https://github.com/eclipse/paho.mqtt.c/milestone/18?clos=
ed=3D1

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 .../{paho-mqtt-c_1.3.10.bb =3D> paho-mqtt-c_1.3.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.10.bb =3D=
> paho-mqtt-c_1.3.11.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.10.=
bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.10.b=
b
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb
index 374922e14..218672e26 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.10.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 SRC_URI =3D "git://github.com/eclipse/paho.mqtt.c;protocol=3Dhttp;branch=
=3Dmaster;protocol=3Dhttps"
=20
-SRCREV =3D "eff2da4875725509fc97641b118d6badf3e3a08f"
+SRCREV =3D "0995176412616ae8f1cba51c8d609fe4b69687ea"
=20
 DEPENDS =3D "openssl"
=20
--=20
2.30.2


