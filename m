Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web09.33464.1623056915905580823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 02:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C1dzMMCz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623056913; i=@fujitsu.com;
	bh=6jsCvt8qVBiKNumSW+ALU8zGjwKETRKv354QuYCiMYo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=C1dzMMCz8VqUau5FUHesmVG1+tQCMf8KVSmh5CpUTaz01DNQ0TJwucH8tm3V6eD+Q
	 nXqLn5SwKYh6hDTpCplP0MGDVBEiXbdwlVLhfo3DX3yLSts5/IiZo+xvu/x9Sfk7g7
	 Ud0Xr1R7I0zjlora6ONVMnhSS1hFh1d5hi0fuzQhkGCym1GDjLAgudz5eIyGfLvuCR
	 f1j7Ld/eTZbPKAIgmxEKUCI0Ymm9+7bAdvcFQceSJ+IgaCJc3eKnz/PvgwAcu6qd00
	 alrB79OWder1l1jjCXys5mpO6DlSd55TG/v/on1S4U8baK8ZYxr8M8AiIzmIWbQLwy
	 HA1kGejL2BkaQ==
Received: from [100.112.194.111] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 2C/1F-02276-112EDB06; Mon, 07 Jun 2021 09:08:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1RV8tDf
  B4OhjSYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePfyS8sBdM4KuZcWsvUwLiPvYuRi0NIYBaT
  xObPDUwQznFGieltc1m6GDk52AR0JDpedIPZIgL6Ektn72EGsYUFPCXufT7LDmKzCKhI/Dj5j
  g3E5hVwl3hy9AcriC0hoCAx5eF7Zoi4oMTJmU/A5jALSEgcfPGCGaJGUWL7zjMsEHaFxIwZ29
  gmMPLMQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaWQGxkppdYpZuol1qqW55aXKJ
  rqJdYXqxXXJmbnJOil5dasokRGEgpBQfqdjA+eP1B7xCjJAeTkijv9Vt7E4T4kvJTKjMSizPi
  i0pzUosPMcpwcChJ8Ko+AMoJFqWmp1akZeYAgxomLcHBoyTC23UfKM1bXJCYW5yZDpE6xagoJ
  c67F6RPACSRUZoH1waLpEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmvg0zhycwrgZv+Cm
  gxE9DiavtdIItLEhFSUg1MBb53bqxfFrdptu23E1dZm4KlDvRynHRae+3HoRLu/29801VeswX
  r1prdvnR9/Z7rou1qIaufKZlZ+60szHfhkHn1dMOua+0809/t3GPNsGZb+eqVGmJL+r+dTGc+
  dtttVb2n7rtLMimVIhfW2dZfN1PTZGFpL7jQpmBwqJrz0renr899jeFdf19yodQTmSrLPKtPv
  z9GCka8uuj9aGNE5NJvMybdS5nUu3/G5trgw9MfsVwtbxH8JDXbR33BgSob1T8hHumHLc5VHH
  lTlJ08p39//12+5tX9605H7Epx69dk1l+d2V+plpH0R0ta6vLT+lk//ALSf+/6rLeJ5Wr81tw
  Vd3yd7HrXXGt8uaT2ixJLcUaioRZzUXEiAF4KdEwfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-267.messagelabs.com!1623056913!270506!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3041 invoked from network); 7 Jun 2021 09:08:33 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-2.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jun 2021 09:08:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15798RFv031904
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jun 2021 10:08:33 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 7 Jun 2021 10:08:26 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 3.4.5 -> 3.4.6
Date: Mon, 7 Jun 2021 17:08:18 +0800
Message-ID: <1623056898-21720-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../wireshark/{wireshark_3.4.5.bb => wireshark_3.4.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.5.bb => wireshark_3.4.6.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
index 3100e4c2c..3062633bc 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "de1aafd100a1e1207c850d180e97dd91ab8da0f5eb6beec545f725cdb145d333"
+SRC_URI[sha256sum] = "12a678208f8cb009e6b9d96026e41a6ef03c7ad086b9e1029f42053b249b4628"
 
 PE = "1"
 
-- 
2.25.1

