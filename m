Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CF3C636FD
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.9965.1649931549497272903
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wqJDFOBJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649931547; i=@fujitsu.com;
	bh=jJH1+Q4nXNwHdEGSf/JhHFfr2d5NpArTPfYeNolmypQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wqJDFOBJOgYYMMwZ2ZSUjmmLNf0avJtvc6BHoXQTe03h3y/9pBmDJJ0He6Sqa1OBo
	 C9RkQhgMJSTHWNFiES/BMBUKkK8PyuT59IwFhCM/4GiJHy+vb4whGYEWZ5W4Mdtz44
	 sW8lwyqcdtwo4C8RXZVgn6aM/+vwTic4Dg/di1cr6+3c03CLve+HkJqyRDeNtGUmzU
	 077IDTjH5DdxBdrszCCW4dfRYID75AMixU1GZPG2BJbpsx2/tJGhjHl78xLLoYs0x5
	 YZG3bQboBd/I54FD9ovmHan6s5uc1a4Cw1qyOjGKrYXZYquwkctIOevdIz9zeqmLmv
	 yh7CK/xozKI6w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8ORqCv9NTz
  JYOdBJouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPKO/mCn2IVfW+rGxgfiXQxcnEICTxhlDh2
  eSYThHOBSeLo7dVsEM4eRomPBy8ydzFycrAJqElMv3WDFcQWEdCXWDp7D1icWUBF4sXvHvYuR
  g4OYQF3ic9LfUHCLAKqEnvm9LKB2LwCThKfOrYwgtgSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itEoqykzPKMlNzMzRNTQ
  w0DU0NNU1Ntc1tNRLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMyJRiVeEd
  jB0rf+odYpTkYFIS5dV8E54kxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3wSOgnGBRanpqRVpmD
  jA6YNISHDxKIrxr3gKleYsLEnOLM9MhUqcYdTn+fvq7l1mIJS8/L1VKnDfmE1CRAEhRRmke3A
  hYpF5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzL/wVoCk9mXgncpldARzABHfFtVSjIESW
  JCCmpBiZXq5WLSpn6pn73F/htYcx59cch5rBpOj/zr7sWqG05E+kp5qT0OvqdWuaJrg8bZZL1
  Z6i7/3zYWyPJlJDRHnzF74pFxKKyl3OlL1qd2lwme1tWgGm+0dZZW4r+G3XZHVrqkyBrxe+S0
  ZFRtuKswNTX7hPv6a5jruoM5HEwCwp8scfoy3qXC8YFAj/a2j4vVY5+8Xyh45197mct/hx+Jb
  yZy/fK5jiOD2kqjlbhS0radRRZwzObbQWqBQPurO1pkim8FiR7LzlysUcPu+SD1h3ct8o+/16
  mXuxY/vf+30f/pEzezDArfGG1r3J/LpP84ezNfVt2c6+XkGgR6Dl0lPmK1Y9t394X77JlkFkz
  Q4mlOCPRUIu5qDgRAFzDobpPAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1649931546!242534!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19091 invoked from network); 14 Apr 2022 10:19:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 10:19:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8DE7A1001A2
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 11:19:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6AA92100199
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 11:19:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 11:18:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] thingsboard-gateway: upgrade 2.8 -> 2.9
Date: Thu, 14 Apr 2022 18:18:50 +0800
Message-ID: <1649931533-20183-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96650

Changelog:
==========
Gateway:
-----------
Fixed reconnection Gateway to ThingsBoard bug
Added minPackSendDelayMS to config file
Fixed certificate loading
Fixed remote logging feature
Fix for RPC calls to connectors. Thanks @mjbernet3

MQTT Connector:
---------------
Added JSONPath parsing to RPC valueExpression config section
Added attributeRequests config section
Added retain flag for attributeUpdates, attributeRequests
Added opportunity to combine values in attributes, telemetry and serverSideRpc config sections

Modbus Connector:
------------------
Added configuration parameters:

retries - Count of retries if polling was failed (default 3)
retryOnError - Retry to get data if server returns an error (default true)
retryOnInvalid - Retry to get data if server returns invalid data (default true)

REST Connector:
-----------------
Added SSL Support
Added JSONPath parsing to RPC valueExpression config section
Added opportunity to combine values in attributes, telemetry and serverSideRpc config sections

BACNet Connector:
-----------------
General improvements

Request Connector:
-------------------
General improvements
Added JSONPath parsing to RPC valueExpression config section
Added opportunity to combine values in attributes, telemetry and serverSideRpc config sections

ODBC Connector:
----------------
Bugs fixed (adding timestamp to telemetry)

FTP Connector:
---------------
Added opportunity to combine values in attributes, telemetry config section for JSON files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{thingsboard-gateway_2.8.bb => thingsboard-gateway_2.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_2.8.bb => thingsboard-gateway_2.9.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.9.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.8.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.9.bb
index 6ff98abe5f..82d515dfef 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.8.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.9.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "35a8aa0268e61b15d689439927756934a28757dc77ad5f03ee6a9119edc37199"
+SRC_URI[sha256sum] = "3341188a386726a5feb87e5fa04edb999de69e38ee8b4ea5b7d59165729ba0be"
 
 inherit pypi setuptools3
 
-- 
2.25.1


