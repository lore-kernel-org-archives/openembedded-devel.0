Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D87C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:46:43 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
 by mx.groups.io with SMTP id smtpd.web10.17809.1671626800265645926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de header.s=key2 header.b=ds2NROzF;
 spf=pass (domain: extraklein.de, ip: 188.68.61.103, mailfrom: matthias@extraklein.de)
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4NcY9B0kRvz7yQG
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 13:46:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1671626798;
	bh=F/OdIXtqhIKzGCuoZePKHS3YiTUFmGW7BWC3403W9cc=;
	h=From:To:Cc:Subject:Date:From;
	b=ds2NROzFLv+V7zUAvXVHrvpUVOXoBLfjmhZlLe6HK04V82bVV1yeA/XZgxHPKNZ+3
	 jtVdNjSepOKUdBFYWyU2tN5iYiv4gdEz6S8CzeMjjqRsDejnA6O2/ptFNBufD8kPYW
	 Uz1FZMbiWoEAGoEUy61fDMK5VzxDaEE8cMlTOZu/HK1dzKwkOXY206EgJGFPrXyRso
	 kH01TZAl7lFjC0yXMtGaLfkUsRnd5AveOUme59FNut1JqQRFXTcS7W0oMRcQU+NFBu
	 aA6j7OAihQe9UJuvGuS2ayuG4PhVUdYBKt4gVb5o9wUV6t3jdFkpqFUitU65hN7CSb
	 dp+aBKJsUkkqg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4NcY9B0LNGz7yQH
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 13:46:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4NcY913KC2z8tbq
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 13:46:29 +0100 (CET)
Received: from localhost (ip-088-152-117-169.um26.pools.vodafone-ip.de [88.152.117.169])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id CA5EF14004C;
	Wed, 21 Dec 2022 13:46:18 +0100 (CET)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 88.152.117.169) smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] paho-mqtt-c: upgrade 1.3.11 -> 1.3.12
Date: Wed, 21 Dec 2022 13:46:05 +0100
Message-Id: <20221221124605.7792-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <167162677907.2582.3663121278526442407@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-Rspamd-Queue-Id: CA5EF14004C
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-5.50)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ASN(0.00)[asn:3209, ipnet:88.152.0.0/16, country:DE];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[]
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: fDeW2vutbt3EtkDkLNweQN0WfVC+ViHHIgvphIKMS81Sg67964k=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 12:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100180

Service release.
Issues resolved: https://github.com/eclipse/paho.mqtt.c/milestone/19?clos=
ed=3D1

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 .../{paho-mqtt-c_1.3.11.bb =3D> paho-mqtt-c_1.3.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.11.bb =3D=
> paho-mqtt-c_1.3.12.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.=
bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.b=
b
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
index 218672e26..d006ae763 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 SRC_URI =3D "git://github.com/eclipse/paho.mqtt.c;protocol=3Dhttp;branch=
=3Dmaster;protocol=3Dhttps"
=20
-SRCREV =3D "0995176412616ae8f1cba51c8d609fe4b69687ea"
+SRCREV =3D "4157a27d39f1dd5b95750ecb6acd1481432785d8"
=20
 DEPENDS =3D "openssl"
=20
--=20
2.30.2


