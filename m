Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D0BC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:17:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.65422.1679548618171179088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yUcO907z;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548615; i=@fujitsu.com;
	bh=uKupoNC6/S7pIq0OZ8cZJUZ1jbwtlcnsmISzSvMHFuk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yUcO907zcaJmrefg/dUOdkVxzNSxCRIfGP7dOf3n0a0sshfqXLxehZb514XJ95Eym
	 y2jPH4zjxYZxuzYjbQIfTkuIbPpNSFPRfZhD1ABvcRKiiWLXZOy/Oeje8KUI3vuOVA
	 d3fJg0cIlB4h68ju5ymCFliuKGwN2eFwri3hSlG5WjZIku1GTceT0Dax/VbZ5j4Z2c
	 69L9Wf8Iy/S9KPMCN8OmCfIAeosOL2G64R92ETM77blEdGsgro23wTrgjJ7HPgBqPs
	 pWg32PCImo0qaLFmvVd3M/CbfFk2spt09/N8lKB7FLhVwjR++Xrs8bzDjOya3QL2d8
	 ovbxKzc/tZyfA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxSffYA+k
  Ug/3n1S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz+Fb2MBXO5Ko48MWpg3MnZxcjJISTwhFHi
  /LSSLkYuIPs6k0TH6lMsEM4eRonD3/awg1SxCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPW
  I2wgJ/EqW//mUBsFgFViQdvbjN2MXJw8Ao4SSxv9wYJSwgoSEx5+B6slVdAUOLkzCcsEGMkJA
  6+eMEMUaMoMftyMwuEXSHROP0QE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjWXFqUVlqka6JXlJ
  RZnpGSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYCCmFCek7WBs
  7furd4hRkoNJSZRXIlQ6RYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr8AdoJxgUWp6akVaZg4wK
  mDSEhw8SiK8cw8CpXmLCxJzizPTIVKnGBWlxHmZ7gMlBEASGaV5cG2wSLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZhX5x7QFJ7MvBK46a+AFjMBLY6bIQGyuCQRISXVwNRaovBz3cP+SNf
  V6wpDGHIy/v788byivMtc8lrMIdvQxIlnL5dNPZc962jdTONInXJWXsNqixVnxbSe/PVI2dZy
  6+wxPU7mF27R/y3WHji5rCg0c03mMrHc4IhTS7kfyT6QX/xH1LbxZfvLDate+zXHr5/PuI3t7
  JILfEGJbXHWM0KqTIWSVKNuvzuVnLdhcetE7os2WvEh5dcWFU+bftd3uRvjfsGV92Zst/m6hU
  fGdMd2ntWHdkzZX6PyJL/sgX3b72fL1rwo2M7zv/PKjUkhbEpqWxdu/37t+CnzP73ss3x3vbl
  XssVK+9bKsqdJfhr/go7tuiKe992x/rBOnLN+6HXfK8svvvZgmmwSzKeqxFKckWioxVxUnAgA
  En4gSz8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-732.messagelabs.com!1679548614!667522!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10385 invoked from network); 23 Mar 2023 05:16:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:16:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0EF6B1000EE
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:16:54 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 018F91000E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:16:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:16:52 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.47.3 -> 0.47.4
Date: Thu, 23 Mar 2023 13:16:34 +0800
Message-ID: <1679548598-20478-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101662

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Correct duplicate record entries in windows wheels by updating poetry-core

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.47.3.bb => python3-zeroconf_0.47.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.47.3.bb => python3-zeroconf_0.47.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.47.3.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.47.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.47.3.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.47.4.bb
index b1dec03b0..dcbf8c32c 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.47.3.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.47.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "eb6ad7fdf3ef542c99416c4a5de60c6a4d16d82b336522e0ef6e7d2d2ddca603"
+SRC_URI[sha256sum] = "d535fcadd45a3e8f1d27502750965f8d664e66a4c17e27508ef7d8d1b027f90d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


