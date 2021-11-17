Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4017C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:15:20 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [194.59.204.23])
 by mx.groups.io with SMTP id smtpd.web08.8407.1637162116361933758
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=CN3grpn6;
 spf=pass (domain: extraklein.de, ip: 194.59.204.23,
 mailfrom: matthias@extraklein.de)
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4HvRLn0bFsz41WQ
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 16:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1637162113;
	bh=kR/w+hy45QOjnXg4aSXQ6P7EKIMzW4Ll4iA1PWfKlLI=;
	h=From:To:Cc:Subject:Date:From;
	b=CN3grpn6h2lWp0zLuYcGUxmB59pRB83QWspRa1l94kirChq93/MoHbMlRF7iHFkuA
	 wJ5NRRGHzbmQsZcOSOYTcPlnSKMOA4WCl/I8jQeceNsLK8FLtSd/9mitCCKOQLmJqK
	 C06XZdTVm7La6BFBbgxYT/jPmd6+homnHrM/4lx4ATXe90SOwRn/huvPIbg4M/xjDE
	 gK76g3qD2YSmpNeciiJ5ZzyQKWQ5IpFJfqiegJo5R+eITucc0flLzntX3dSujwcAww
	 gpWNuawilMZVPdy5OzA1sqmxKd9rcvw6VhrVW8qK6AK3uPTBAF3xHUgQs2GKEKeLW7
	 J+yXv+diugo4g==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4HvRLn0D5Kz7tpt
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 16:15:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4HvRLl583wz8shs
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 16:15:11 +0100 (CET)
Received: from localhost (ip-88-152-245-240.hsi03.unitymediagroup.de
 [88.152.245.240])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id C2A6C14028D;
	Wed, 17 Nov 2021 16:15:10 +0100 (CET)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 88.152.245.240)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] paho-mqtt-c: upgrade 1.3.8 -> 1.3.9
Date: Wed, 17 Nov 2021 16:15:08 +0100
Message-Id: <20211117151508.1340-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <163716211100.26091.14745020767890484703@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: fJ/KJdL+9wdrMRIqah4iWWyrp2zwrMKUO/8cnQ3VqchdTrvm2Ok=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 15:15:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93998

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 .../paho-mqtt-c/{paho-mqtt-c_1.3.8.bb =3D> paho-mqtt-c_1.3.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.8.bb =3D=
> paho-mqtt-c_1.3.9.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.8.b=
b b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.9.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.8.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.9.bb
index cce9f1d1b..a8541f0d0 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.8.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.9.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 SRC_URI =3D "git://github.com/eclipse/paho.mqtt.c;protocol=3Dhttp;branch=
=3Dmaster;protocol=3Dhttps"
=20
-SRCREV =3D "317fb008e1541838d1c29076d2bc5c3e4b6c4f53"
+SRCREV =3D "3b7ae6348bc917d42c04efa962e4868c09bbde9f"
=20
 DEPENDS =3D "openssl"
=20
--=20
2.30.2


