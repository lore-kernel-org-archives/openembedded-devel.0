Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CB0CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 07:39:36 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
 by mx.groups.io with SMTP id smtpd.web11.49569.1697787570742210579
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 00:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@extraklein.de header.s=key2 header.b=S7KJig3v;
 spf=pass (domain: extraklein.de, ip: 188.68.61.107, mailfrom: matthias@extraklein.de)
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4SBc0w2kjwz6y4L
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 09:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1697787568;
	bh=bJHcCWZVplU9lZWkBaiDdOAJOAVRS369xS/EYDkT3UQ=;
	h=From:To:Cc:Subject:Date:From;
	b=S7KJig3vGbyRiAW2OKJmzN0hmBp25lUINvmO/FTqgKPSWVXpjfOBCvXJYxXOiIXlv
	 YAz4TeLKoqQntzzdc6ZUmcTcdD6cIlGbw+afxBUHRAFRbhc9BOpmQ5oKow2keQKKZb
	 cgZUqMKRIZk6XY5JckkHUNAc7iGaDWEriYisLjCSKQoSQF/L0CzNPEJ+ex2/TeBhEm
	 ySTJcvgtaBjAGFpDB0A0oEzv24S0dDPQMHft4qxgddns1WAZv0EsWhwSnpscG/9wdQ
	 0NM5TUIEAIgZtvHZumKUxr8kl2zWcWNb8MEsHAdfJDINvVne0K5I8m0J7gBe7XInrd
	 IfzIjOZF3j0Ew==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4SBc0w20rrz6y43
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 09:39:28 +0200 (CEST)
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4SBc0w0W2Yz8sZh
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 09:39:27 +0200 (CEST)
Received: from localhost (ip-088-152-117-169.um26.pools.vodafone-ip.de [88.152.117.169])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 67CC4140060;
	Fri, 20 Oct 2023 09:39:23 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 88.152.117.169) smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] paho-mqtt-c: upgrade 1.3.12 -> 1.3.13
Date: Fri, 20 Oct 2023 09:38:50 +0200
Message-Id: <20231020073850.2630-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-PPP-Message-ID: <169778756367.4876.6639591768143288187@mx2fa3.netcup.net>
X-Rspamd-Queue-Id: 67CC4140060
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: +Q76/VSG/6dHOM+9o4G5hZo1tqjd8fI1qGuxp4rz9mBBGIrziU0=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 07:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105614

Service release.
Issues resolved:
https://github.com/eclipse/paho.mqtt.c/milestone/20?closed=3D1

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 .../{paho-mqtt-c_1.3.12.bb =3D> paho-mqtt-c_1.3.13.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.12.bb =3D=
> paho-mqtt-c_1.3.13.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.=
bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.13.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.b=
b
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.13.bb
index 4decb098c..6f229001f 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.13.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 SRC_URI =3D "git://github.com/eclipse/paho.mqtt.c;protocol=3Dhttps;branc=
h=3Dmaster"
=20
-SRCREV =3D "4157a27d39f1dd5b95750ecb6acd1481432785d8"
+SRCREV =3D "07a875788d8cc6f5833b12581d6e3e349b34d719"
=20
 DEPENDS =3D "openssl"
=20
--=20
2.39.2


