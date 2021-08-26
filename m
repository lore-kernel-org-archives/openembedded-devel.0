Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.25976.1629951461146164258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 21:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IDpbStFr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629951458; i=@fujitsu.com;
	bh=C4cuZ2DOyK3yluQHcIYPJlPET1zkbshaDWq3Qzy0eDg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IDpbStFrbIMlX16VG2VFk0TODz2jA9/mm2aJesMxsZALcCSMRBy8K/Ja7z+F1I1GM
	 tcUnis2Iy6T/hlNC8Fkot7WsSUxyGn/9mkbWl7cU/pUZEjF4segUXdn4ItS5W64en0
	 jibe+blEiKtCacmUf8zqc9bw3fornyL/Od8Im9B4m0BHwNdogHy7ea4MW8SpAP8rRh
	 +e8RvNVw5wjHoAZh9t3S7we3pRyUMhzVOPyaM068wocRxV0mKOBPPgKb1/hxB0+Tgl
	 P0K8taXXWfQgyOqBtTQGM14hP3QWka/+jeJBGqkwGlv5m6Ig2jppNTjDhanOu0xqa6
	 7Ls/87VId3Xpw==
Received: from [100.113.3.88] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 92/D6-25211-2E517216; Thu, 26 Aug 2021 04:17:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxRfehqHq
  iwd+rWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bElftZCzq5KibePcPawLiGs4uRk0NIYDaT
  xLz1ul2MXED2CUaJr/9uMYIk2ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhYIlFh1f
  QcbiM0ioCpxful6sHpeASeJPye2gs2REFCQmPLwPVAvBwengLPEmWN2EHudJNpa1rFAlAtKnJ
  z5hAVivITEwRcvmCFaFSVmX25mgbArJGbNamOawMg/C0nLLCQtCxiZVjFaJhVlpmeU5CZm5ug
  aGhjoGhoa6xrrGlqa6CVW6SbqpZbqJqfmlRQlAmX1EsuL9Yorc5NzUvTyUks2MQLDMaWQ+dAO
  xievP+gdYpTkYFIS5dUSUU8U4kvKT6nMSCzOiC8qzUktPsQow8GhJMGbKAiUEyxKTU+tSMvMA
  cYGTFqCg0dJhDcCpJW3uCAxtzgzHSJ1ilFRSpz3gTBQQgAkkVGaB9cGi8dLjLJSwryMDAwMQj
  wFqUW5mSWo8q8YxTkYlYR5C0HG82TmlcBNfwW0mAlocQGfKsjikkSElFQDU83iDyeS19iKez1
  QsEsp/MfMuU1OSndXrvvSkhennrQXc28VilI9ybBF+u6Vw+9Psso2P662byhb9yPV9PP7nrhH
  01+ubHj06hJn34d9S6uavszh/7HObJbm/cw/B+5ePulZw6VjlrjT2EXo+JmCZpdpf8NPVjh4J
  N6OPKC/5tm8f2unnlv99LtjnpCa7PsPjW/VvK6wfok+dXbD3PU1VbGNu2sWL215d6Ap9iVX+K
  6pEhERy1QcDeU+J769M0tx2V3Gt6tr9MQ+G5/PXNzYWO02M4/z5ItPfy7e36maPHu347vHCde
  K5W+u85Bz9F78tMBy1pXrp8LDz/4RzDl8tTXKNo7thOa2ybvuJcwO2V2uxFKckWioxVxUnAgA
  H9ZV80IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-232.messagelabs.com!1629951457!44866!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27042 invoked from network); 26 Aug 2021 04:17:37 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 04:17:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q4HWqn003263
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 05:17:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 05:17:32 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.32.8 -> 1.32.10
Date: Thu, 26 Aug 2021 12:17:12 +0800
Message-ID: <1629951432-62435-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629951432-62435-1-git-send-email-wangmy@fujitsu.com>
References: <1629951432-62435-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.32.8.bb => networkmanager_1.32.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.32.8.bb => networkmanager_1.32.10.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.10.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.8.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.10.bb
index 39225b904d..89f95548cd 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.8.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.10.bb
@@ -27,7 +27,7 @@ SRC_URI = " \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
 "
-SRC_URI[sha256sum] = "e7e42ad05ad7b9054fbe227930f40213f2e9d7af64dd2542e60318a0b1a76c75"
+SRC_URI[sha256sum] = "3e5ccc66805659e3f11a718e3a599f9726b79a01d6ff14814be6ad8bc5da8bb8"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1

