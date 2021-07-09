Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.5321.1625794643333147466
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 18:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fIb4VEcD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625794641; i=@fujitsu.com;
	bh=bBvdbsjyG6d1kCQF9my/LjpzxmwPd19rBwYAR2ZauMk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fIb4VEcDH+FxnsGy/Pc/I31TTXKIafqVbP4emvX5KRAi1kVvHTqNbpBsoPv71Kg8r
	 B06us8Z8S+TXQjzxSgcLCSGEjgAgLDw3HmD3vETT0ycBOJuS+nJaVRQtlsQBbsMv9A
	 zT/QVweMZm34HFF05wrJN+QPaSSv1R1dLN9ilugFHckKsdFK5o0gBdu3XGGcArdTQU
	 NNWBuK+pwI7i/tRzY9GCNCGrAfKakxSEduypeyVGeJqhwdsYmcOnMmGao0SaJEEkt6
	 62f/HFDqyzTs3RdTe3xnJEdeWYctIyILJrw3276UamKaGbouqDg33isxmlxsMUZ7he
	 ffiUTxIAAPLsg==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 2E/4C-03155-058A7E06; Fri, 09 Jul 2021 01:37:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0Q1Y8Tz
  BYP0/NouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPTog1sBTMEK2bseMjSwLiMv4uRi0NIYBaT
  xIxff9ghnOOMEj3fP7N2MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC3hKrJj/HCzOIqAisWzZX
  DYQm1fAXWLJuc1MILaEgILElIfvmSHighInZz4Bq2cWkJA4+OIFM0SNosT2nWdYIOwKiRkztr
  FNYOSZhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tzXUNjc31Eqt0k/RSS3XLU4t
  LdA31EsuL9Yorc5NzUvTyUks2MQIDKaXgaOcOxl+vPugdYpTkYFIS5dWa8TxBiC8pP6UyI7E4
  I76oNCe1+BCjDAeHkgTvkSVAOcGi1PTUirTMHGBQw6QlOHiURHg5FwGleYsLEnOLM9MhUqcYF
  aXEeYOXASUEQBIZpXlwbbBIusQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFdnOdAUnsy8Er
  jpr4AWMwEtZjj8FGRxSSJCSqqBybdhmanxcjct/hfXI/uXcnIUTZ8+lb1c8Yzc0fSTTxcHr/k
  3w/Lx1DKtk4p9Fd0Tc7VuPvl/vcrNb8KN7xzbzmqvyzPaec79Q4dql12j8bXrDHeMyizky5f+
  unekLoTrajvLg4VlYpPeis458FPDaN5P51WR9VV9a+7y/ZIRcdKOPPh+m7vRpp4p2isDF10NX
  vjNope7Z9P6vww93wX8Fkodi5b0CWDcv/GywUpzGbZtjdq1Ffe4fz7yTLh76pTL1Whp+3v6as
  H2s3ptyizSiwL8d01a1sy3JSKm0ann/EHBvkSP+6dvNH/bd8NumW9A6uvlv9fwm0duYrsb7Sh
  99vKTtPQ7xzd4Td3w3cW2WImlOCPRUIu5qDgRABDrC7YfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-291.messagelabs.com!1625794639!87115!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 673 invoked from network); 9 Jul 2021 01:37:20 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 01:37:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691bJsg019095
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jul 2021 02:37:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:37:17 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] firewalld: upgrade 0.9.3 -> 0.9.4
Date: Fri, 9 Jul 2021 09:37:11 +0800
Message-ID: <1625794631-29529-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

This is a bug fix only release.

$ git shortlog --grep "^fix" v0.9.3..v0.9.4
Eric Garver (10):

fix(dbus): conf: setting deprecated properties should be ignored
fix(dbus): properties: IPv4 and IPv6 should be true if using nftables
fix(fw): when checking tables make sure to check the actual backend
fix(ipset): nftables: use interval flag for "ip" types
fix(rpm): applet: don't replace config modified by admin
fix(rpm): logrotate: don't replace config modified by admin
fix(ipv6_filter): match fwmark
fix(direct): rule order with multiple address with -s/-d
fix(nm): reload: only consider NM connections with a real interface
fix(policy): warn instead of error for overlapping ports
Fabrizio D'Angelo (1):

fix(ipset): fix hash:net,net functionality
Robert Richmond (1):

fix(ipset): entry delete with timeout
Ye Shu (1):

fix(applet): Show a basic tooltip instead of HTML

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../firewalld/{firewalld_0.9.3.bb => firewalld_0.9.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.9.3.bb => firewalld_0.9.4.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.3.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.9.3.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
index 9aad510b4e..b8025c7078 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.3.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://firewalld.init \
 "
-SRC_URI[sha256sum] = "5998894db976d77996ca0a6b700a2f4125b9f283465fb255da9bddfb1640cb27"
+SRC_URI[sha256sum] = "52c5e3d5b1e2efc0e86c22b2bc1f7fd80908cc2d8130157dc2a3517a59b0a760"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native nftables"
-- 
2.25.1

