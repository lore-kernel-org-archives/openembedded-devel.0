Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1DAC6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:09:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.9023.1678352951253692064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UWDU7+rl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678352949; i=@fujitsu.com;
	bh=EgK57oDqEZGgFzKXbsOsRa7GTe9TRpaz9Oelc5AgIM0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UWDU7+rlCL8f/Q4BzgoP+oUe5U4bGj7vLwOrNCnhy8dzxfoj2U+NCSdggMS2iztYy
	 nWEQxhy79HZcJoP7+IMdq4fRvDUN8WiHKsP/HCWGYe3GUaWNWUIw4hAcfBoSGOh1h4
	 zw3SZpk41QlGL8dpThKn6oM7rWS8Ys56x74V45bguss13KsdBnLwwCt+oUK1M+tAws
	 a+Ab4DAjjnlePdNAtjJxUwE/I86j0RCOY8zyC6nWJuoy1Bl5mynekIaYj7h5zn0Gw+
	 Abpnt5YHGxOUsACeuf6JIfDoRNbGcFRxGa8J80HDtxyVLPXK3BvT221n8IVCLCpOKj
	 A/tqYtfZyty+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSdd0EWe
  KQd8URouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPulquMBVt4KzZd1GxgnM7TxcjFISTwhFGi
  790BJgjnBpPEvD0d7BDOHkaJlWf7gBxODjYBKYkb9/+zgdgiAvoSS2fvYQaxmQVUJF787gGq4
  eAQFgiReNvgDmKyAIWXrnMFqeAVcJJourwWrFNCQEFiysP3YJ2cAs4S97e3sYLYQkA1B+59YI
  WoF5Q4OfMJC8R0CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2BkWsV
  oVpxaVJZapGukl1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5da
  sokRGLgpxcmfdjCu6/2rd4hRkoNJSZS3m40zRYgvKT+lMiOxOCO+qDQntfgQowwHh5IE79L5Q
  DnBotT01Iq0zBxgFMGkJTh4lER4+2cDpXmLCxJzizPTIVKnGBWlxHlLQfoEQBIZpXlwbbDIvc
  QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNd5DtAUnsy8Erjpr4AWMwEt3rWFA2RxSSJCSqq
  BacuP/ANLGG/IXvp2STjmk9h7TyUJA8/Fe5t6LSN9t3NyXRa/Kvlw5dPXV283/nw9+8/psL/L
  xVO1pyYFlLqtvvzSzkXL9npOgem+3evmTXpv/6JhT7uvwu8CYYFrn/yzV53lK46s6848vbQr3
  ezu/W+bYyRb+p+ZWXxNWXjrM+snbflTzHK3lmpxxr8WrrsXrRRXzrtmPsuGKfl11oEbpnMxdt
  90nnZy7SHfrJO/f5Tl7023KpPtyzhb/7S1e051wZ6/pxZ++7G8bHGuZ0lPkfD6+n9bbW42idY
  7pO8++j8+2NpJdFb3iSmzi6U3hHfnn3m4WWatzFN5l+LH5x5fyWObF5IUwpV8b+N0Q4uwaCWW
  4oxEQy3mouJEAJV4WkpXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1678352948!1046419!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7254 invoked from network); 9 Mar 2023 09:09:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:09:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 665D71000DB
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:09:08 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 59A521000D2
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:09:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:09:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 02/11] python3-argcomplete upgrade 2.0.0 -> 2.1.1
Date: Thu, 9 Mar 2023 17:08:34 +0800
Message-ID: <1678352916-32505-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678352916-32505-1-git-send-email-wangmy@fujitsu.com>
References: <1678352916-32505-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101448

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Documentation and test improvements
 Remove scripts for contrib-supported shells from global namespace
 setup.py: exclude test.* subpackages from find_packages (#406)
 Support PowerShell (#405)
 CI updates
 Revert "Support powershell (#392)"
 Fix interrupted release (v2.0.1)
 Fix interrupted release (v2.0.1)
 Fix interrupted release (v2.0.1)
 Support powershell (#392)
 Update importlib-metadata dependency to include versions 5.x (#389)
 Test and documentation improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_2.0.0.bb => python3-argcomplete_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_2.0.0.bb => python3-argcomplete_2.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_2.0.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_2.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_2.1.1.bb
index 4eab34f48..8e77d39cb 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_2.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "6372ad78c89d662035101418ae253668445b391755cfe94ea52f1b9d22425b20"
+SRC_URI[sha256sum] = "72e08340852d32544459c0c19aad1b48aa2c3a96de8c6e5742456b4f538ca52f"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


