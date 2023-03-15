Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B031DC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:06:30 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.8927.1678889189408316544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=in6X+CQ/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889187; i=@fujitsu.com;
	bh=f1AKlZ7ekT+g0h9+vWaXG0uMzSpvcjwgLb1F78+ANSw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=in6X+CQ/gF4XWvG8jPfLzAwUo8E3WQn9LwzJ8ZIM7oJgCuJtL0cgnQyq+iLCo/TDZ
	 gHYykpZ1CsdQN4Wtxz4/6cZzA8mxOmQ5CbF9Yk9psZjAPpHiJVjTNUAoOccP6/Jkrb
	 GnEnmKxSlsO5KIhdUMQOLtZpRLf57WLL0UYwc1beuqIwGmLFLka16kY/GscTIXO4b/
	 XgkcVXm3WMBuT2Z6CO0q4QMw6rrBEViwkU1SDZ7FQyoHAHiHaGWmYpKAuYMos25m/M
	 nbB2rhUFYir7VAgwm0NrBFSHp529/f9YsdUzgyKgGIxHRv9J92nF1H7mE90Lfi6Smo
	 Sdak7+sfo+vNw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqPv4gmC
  KwY2fvBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a/r89ZCho5K04eO8/YwLiKo4uRi0NI4Amj
  xPM/PxkhnOtMEis/NzBBOHsYJX5cmg+U4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBbYv+JO2BxFgFVidtHPoPZvAJOEpd2ngSrkRBQkJjy8D1YnFPAWeLFydMsILYQUM2ixS
  2sEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA0N9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzelWNljB+PTvr96hxglOZiURHn/rBFIEeJLyk+pzEgszogvKs1JLT7EKMPBoSTB+
  ++MYIqQYFFqempFWmYOMJZg0hIcPEoivKnngdK8xQWJucWZ6RCpU4yKUuK8f0ESAiCJjNI8uD
  ZY/F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7DGQ7T2ZeCdz0V0CLmYAW884TAFlckoi
  Qkmpg2snJp3xHny8t8Ovkadz7PW+49DU7dMzhDCy9LPS3aH1SpKmevUDM3Ut3M2z3Wge6sz+p
  vCApfzV4smv7b7+vTlGqPZc1p5zdV7LtwJs5y20Pr0o4xmdiHmlvVjVdrCsl//sDxdfWLIdSb
  V5aF3q2LYvfrVg1r325YdvHFZPzVsxrLJuR81H/z4HJjEJfs12DJq9xFnNUEdDa/33esS+B25
  dqiS9kT1zisHVStyrDkZINM5cIsD/9kBtVu3OB+MG6+pDQc3cEp5aeOyaZk68XM+OzX7Qv652
  f2VuflH3d9vnctn9Kx6Tbzdu3SpdvSZWSFFy4Oan/Mces0oBF3PstArLrXjw6dTy1Kloxy/uh
  EktxRqKhFnNRcSIAMpJsN1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1678889187!377356!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29619 invoked from network); 15 Mar 2023 14:06:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:06:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E6AC11001A5
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:26 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DAB55100043
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:06:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gmqtt: upgrade 0.6.11 -> 0.6.12
Date: Wed, 15 Mar 2023 22:06:04 +0800
Message-ID: <1678889166-20681-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889166-20681-1-git-send-email-wangmy@fujitsu.com>
References: <1678889166-20681-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101545

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gmqtt_0.6.11.bb => python3-gmqtt_0.6.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.11.bb => python3-gmqtt_0.6.12.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.11.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.11.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb
index 0e6670b90..c06e94e7a 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.11.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "0be6d57841538abc3ae0a41131c6d53314e0705b74876a6f94bc903df1209fb6"
+SRC_URI[sha256sum] = "7df03792343089ae62dc7cd6f8be356861c4fc68768cefa22f3d8de5e7e5be48"
 
 inherit pypi setuptools3
 
-- 
2.34.1


