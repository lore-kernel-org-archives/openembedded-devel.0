Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42281C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 08:25:46 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.97])
 by mx.groups.io with SMTP id smtpd.web09.3023.1637223941980097846
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 00:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=OBf5UcJN;
 spf=pass (domain: extraklein.de, ip: 188.68.63.97,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4HvtCl11wqz4yWt
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 09:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1637223939;
	bh=21YFTsGfPg61397bRSjb0Vn+iSdgWES1aUFtLH3RH5s=;
	h=From:To:Cc:Subject:Date:From;
	b=OBf5UcJNcK+4gZco1izyQLsgtK+eAih8NKYq/dD8/sbnSnFTMdTeuSUX+Z2TwpF/H
	 PVF4PIRZboVU1ARduv/jLgbxe/hzOWU6fy0/va/PgiDYdgEDIFyGBuWC+t5eTHPYnx
	 HApYYIfQ90E5rVBupKSOldchxsJ+3lTbadK2Bq3k6uBRuBNK2qIyXLJRoMR4DHxEPs
	 AiA8rmSNy5xTgIThPmeu0uAEQFl9ySu7GDWoRTGISqPmF2sqjp7x1PRjDeU0ET79Ve
	 rZpwRwjcG9/YNRnlOrWh34qi7DEKqXHcXuP+iJBwT6PbV74W4ARWQ+M37gY7Xp42Ii
	 uPV7njqDlKaMQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4HvtCl0dCTz4yML
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 09:25:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4HvtCj5tq8z8tGF
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 09:25:37 +0100 (CET)
Received: from localhost (ip-88-152-245-240.hsi03.unitymediagroup.de
 [88.152.245.240])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id F2B0714039F;
	Thu, 18 Nov 2021 09:25:36 +0100 (CET)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 88.152.245.240)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] paho-mqtt-cpp: new package
Date: Thu, 18 Nov 2021 09:25:34 +0100
Message-Id: <20211118082534.1338-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <163722393719.21468.1814108317814343392@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: CwxIXu1Q7NLKv2/f+UEAcSRcECUzh3cxuSZ4wIQNPtH8FK+EbWc=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 08:25:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94018

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 .../paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-=
cpp_1.2.0.bb

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2=
.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
new file mode 100644
index 000000000..b5a6ac29c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "Paho MQTT - C++ libraries for the MQTT and MQTT-SN protocol=
s"
+DESCRIPTION =3D "Client implementation of open and standard messaging pr=
otocols for Machine-to-Machine (M2M) and Internet of Things (IoT)."
+HOMEPAGE =3D "http://www.eclipse.org/paho/"
+SECTION =3D "console/network"
+LICENSE =3D "EPL-1.0 | EDL-1.0"
+
+LIC_FILES_CHKSUM =3D " \
+    file://edl-v10;md5=3D3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
+    file://epl-v10;md5=3D659c8e92a40b6df1d9e3dccf5ae45a08 \
+    file://notice.html;md5=3Da00d6f9ab542be7babc2d8b80d5d2a4c \
+    file://about.html;md5=3Ddcde438d73cf42393da9d40fabc0c9bc \
+"
+
+SRC_URI =3D "git://github.com/eclipse/paho.mqtt.cpp;protocol=3Dhttp;bran=
ch=3Dmaster;protocol=3Dhttps"
+
+SRCREV =3D "33921c8b68b351828650c36816e7ecf936764379"
+
+DEPENDS =3D "openssl paho-mqtt-c"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE +=3D "-DPAHO_WITH_SSL=3DON"
--=20
2.30.2


