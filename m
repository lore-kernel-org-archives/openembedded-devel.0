Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BA2C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 08:21:14 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [185.244.192.111])
 by mx.groups.io with SMTP id smtpd.web08.4750.1648628470306717595
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 01:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=QzQCwxmL;
 spf=pass (domain: extraklein.de, ip: 185.244.192.111,
 mailfrom: matthias@extraklein.de)
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4KSzsb3hzFz7vTW
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 10:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1648628467;
	bh=cGI/+FbnUIC6/MkiH7Jo1S9FXVhvpz94aqcimoJbmF8=;
	h=From:To:Cc:Subject:Date:From;
	b=QzQCwxmLODpsnwF04U+u4xViGta682MaZcIKBkhlyV99lb5o4hHYoJhuuxk40pHUu
	 Meu9F0EVRrvpQhy/FZJvx4ABNbMy3d5XSpM6FYXafJPRDiEQxvwhtED1BEqMEpsD+r
	 ocKhoCRkZ05l7iP4QoiN/5KCjbb/Okysj3DPY8+Ipcz2730sNtdTXKaIAI3y/jyPLZ
	 DwYPks1oRvqVLAdKdXA1IEBS87QhO/1ro/NZ6Uq3oJdssidwVVjDZzSBtsT4FiEBLS
	 oCM7rPTlKTR56BbX1vqNfFIeYYvInyNBW0YROu7jrXBWl3FqOHwQTJrIwZkuiymlUM
	 uhpMQxFJXiCjA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.53])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4KSzsb3Kh6z7v75
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 10:21:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4KSzsW2Fcyz8svy
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 10:21:02 +0200 (CEST)
Received: from localhost (ip-062-143-218-156.um16.pools.vodafone-ip.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 1A41614004A;
	Wed, 30 Mar 2022 10:21:02 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 62.143.218.156)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] paho-mqtt-c: upgrade 1.3.9 -> 1.3.10
Date: Wed, 30 Mar 2022 10:20:42 +0200
Message-Id: <20220330082042.1258-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <164862846231.1776.16861220849448590740@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: lVnYbwyDjmMxXljp52/Fs09at5sX/EZt54EyaecBSjPalbQ93Bs=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Mar 2022 08:21:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96265

Service release.
Issues resolved: https://github.com/eclipse/paho.mqtt.c/milestone/17?clos=
ed=3D1

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 .../paho-mqtt-c/{paho-mqtt-c_1.3.9.bb =3D> paho-mqtt-c_1.3.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.9.bb =3D=
> paho-mqtt-c_1.3.10.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.9.b=
b b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.10.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.9.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.10.bb
index a8541f0d0..374922e14 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.9.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.10.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 SRC_URI =3D "git://github.com/eclipse/paho.mqtt.c;protocol=3Dhttp;branch=
=3Dmaster;protocol=3Dhttps"
=20
-SRCREV =3D "3b7ae6348bc917d42c04efa962e4868c09bbde9f"
+SRCREV =3D "eff2da4875725509fc97641b118d6badf3e3a08f"
=20
 DEPENDS =3D "openssl"
=20
--=20
2.30.2


