Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.2536.1623982305832581132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ToAXTbn+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982303; i=@fujitsu.com;
	bh=U17Ej2DXwcMBhg2jJNEj384jRQQKK3E9b1d3ObNWpXk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ToAXTbn+HbArNpjlCOsOp8Ub3Llg2luJbx820XB1BThAVgLfd8JttJ/r/PvcnD1/P
	 24HLiJP1dVjWecVqivjA4iAmsllAoFn+aXuUaan/8HNsa3LzkrdfhUe2yxTTWx7clD
	 QXII1FQeb6nvo63Jp7TYgxbRv5H5CBCH58R5Hv67xWhMvM3QkbfNC3ECPqSWXgKs3z
	 FrBEK1O+lihD0gR5qGY4UWu6O2eanzthjrYZtpS7SYu9pRb3HfqkxLyzOGrRKwG5mV
	 F/XbHaBY6UG6Cz5xkdpfewT+2KhDtXjtEFKsgXagyJXoKXn+gq5oYvs0siHd5RTNUJ
	 anJ3DckRnwy2g==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 84/A8-11194-FD00CC06; Fri, 18 Jun 2021 02:11:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYonuP4Uy
  CwdP3xhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a2p42sBQv5Kmbd7GRuYNzH08XIxSEkMJtJ
  YuOJP0wQzglGiZt/NrJ3MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC3hL/L2xhBHEZhFQlTgzb
  z2YzSvgJtFy/AOYLSGgIDHl4XtmiLigxMmZT8DmMAtISBx88YIZokZRYvvOMywQdoXEjBnb2C
  Yw8sxC0jILScsCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhsa6hrqmhnqJVbqJeqmlusmpeSVFiUB
  JvcTyYr3iytzknBS9vNSSTYzAQEopZDTewXjw9Qe9Q4ySHExKorxWL08nCPEl5adUZiQWZ8QX
  leakFh9ilOHgUJLgVfkPlBMsSk1PrUjLzAEGNUxagoNHSYSX6S9Qmre4IDG3ODMdInWKUVFKn
  LcNpE8AJJFRmgfXBoukS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeSVApvBk5pXATX8FtJ
  gJaHGb0CmQxSWJCCmpBqa63Zvv8bDtWXxcPPpXzYqrrJu+hZ96fcL44AT19NNbRQXv1nvYt4v
  xLvj19vpyp4dO//ZWlPzV8P6iNld1zw1ev96iD52bhRyk7NMfXir5pebim2TU39sTmfk/7aTm
  +shFJR3J3OEnPKym+3kJdatcmvy01eBBaeeeqx+yFoakLtRTEIy2VC1XzNAUa904S5XrQ1GJ9
  asHy9J2WlwT/ZjwrTVpzsUvMmqx2rlHjTJLYu1klkoGh2zxPfk/pnjDvXfNEziWtfSKxqq8fb
  /twtvuby1aOpZbCt+7eFRvWV7KW2EyJz12ut0sjxRtL9NdD4JCPuk1brrWy96ksd7QenKghNl
  OJ5mlJv33HNIilFiKMxINtZiLihMBaIF6Nh8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-228.messagelabs.com!1623982302!95854!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7744 invoked from network); 18 Jun 2021 02:11:42 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:11:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2Bf1a004288
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:11:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:11:40 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] mosquitto: upgrade 2.0.10 -> 2.0.11
Date: Fri, 18 Jun 2021 22:11:33 +0800
Message-ID: <1624025493-7195-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: notice.html does not exist in this version, use NOTICE.md to
check.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../mosquitto/{mosquitto_2.0.10.bb => mosquitto_2.0.11.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.10.bb => mosquitto_2.0.11.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
index b815ac3b49..9f1c024bbd 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
@@ -10,7 +10,7 @@ LICENSE = "EPL-2.0 | EDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca9a8f366c6babf593e374d0d7d58749 \
                     file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
                     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
-                    file://notice.html;md5=541f8f37af492858dab8d2c1b69ede69 \
+                    file://NOTICE.md;md5=a7a91b4754c6f7995020d1b49bc829c6 \
 "
 DEPENDS = "uthash cjson dlt-daemon"
 
@@ -19,8 +19,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[md5sum] = "3d1c327d8c5881f56983bee1e3c8f068"
-SRC_URI[sha256sum] = "0188f7b21b91d6d80e992b8d6116ba851468b3bd154030e8a003ed28fb6f4a44"
+SRC_URI[md5sum] = "638d801e6aac611b41de76d030951612"
+SRC_URI[sha256sum] = "7b36a7198bce85cf31b132f5c6ee36dcf5dadf86fb768501eb1e11ce95d4f78a"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.25.1

