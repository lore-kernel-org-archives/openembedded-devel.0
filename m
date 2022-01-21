Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D83C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 00:36:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.5263.1642725370428241870
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 16:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G1q1rDoo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642725367; i=@fujitsu.com;
	bh=aBsUSkW6bmb/Fh+heKeHHCwrVhIRV269Rr5oaQNIPe4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=G1q1rDooiqXBqBKnlvjXh/3aJt6Ucdu60xsyFAfSokFg6weE+lXcoT7dT56IL/6MN
	 oE97cloBau2o/mWhwl5mG2L3A79ZQ71UuWWjl2j0WuW03iWBVf6NxkId9FmAZf4f4s
	 TXoUZEknfCzWf4/7GsWrG+nUVHO1rprJe/T9AvZcnKUG6mV+Qq87AdEyn/FAe4a3ng
	 kDpORvEjtYsaYyUuOZOaR+j+ybm9iH/6Va87/Il/Ajf8Vkn5srYky/z3bkRZSjoUJC
	 rhilrChF3KBpBUFirxDQ0QBHQlVB8//QDoh8fzR+EE81GYgdP34PMuSBttFXPOMsg+
	 3sK8f2+sBhUMw==
Received: from [100.115.38.159] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id AE/FA-23453-7FFF9E16;
 Fri, 21 Jan 2022 00:36:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxRff7/5e
  JBvvmslhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBl/531mL/jFWXHz8QT2BsZGzi5GLg4hgZlM
  EqsWz2SFcE4wSpw+epCxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e9hBbGEBd4knz
  w8DxTk4WARUJa78cwMJ8wo4SXR2/2MCsSUEFCSmPHwP1sop4CyxdsJHFpByIaCa3R/sIcoFJU
  7OfMICMV1C4uCLF8wQrYoSsy83s0DYFRKzZrUxTWDkn4WkZRaSlgWMTKsYrZKKMtMzSnITM3N
  0DQ0MdA0NTXWNLXVNjfQSq3QT9VJLdctTi0t0gdzyYr3U4mK94src5JwUvbzUkk2MwIBMKVY3
  2cHYvfKn3iFGSQ4mJVHe4hUvE4X4kvJTKjMSizPii0pzUosPMcpwcChJ8N76C5QTLEpNT61Iy
  8wBRgdMWoKDR0mE9/UfoDRvcUFibnFmOkTqFKM9x5u1SxYxc7TduwskZy44uJqZ4377odXMQi
  x5+XmpUuK8jv+A2gRA2jJK8+CGwqL5EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3ocgU3g
  y80rgdr8COosJ6Kz+Z89AzipJREhJNTBZqKTd5z1c+P2cSqT26mk5JszNbc65L3UnrPRLTInd
  zLLONm4O1/IbOzMcctn8zm/axX9DICHTXMSnWXRGs7lb5+FjH90+Lz+5l2HpMstfqxNk2BcbX
  zB/sMNVafeiZf0SD1k/7TygsJB5u1Bh0ko+/8qFdev7v21eanXvqVm910EpVcPX/NO2beX/Hx
  vz9eLRMN8VzosSf4s1/7vwUkhNbfsDV3Gn+r3sCnOKT6l/u5ijHHTLZesXrm8ORxwn3N/6fYN
  9cafdwr272QvmWVYz/X9u7lkzv+9QqMGj1003XnP9m2U1Kcv54qnQAO9de3ukZooeaTv8Tla7
  Z/fE3V6qDq67j0xYY/C+9NH7Ups1SizFGYmGWsxFxYkA44IzhmEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1642725366!34471!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32514 invoked from network); 21 Jan 2022 00:36:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Jan 2022 00:36:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20L0a1ec009230
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 00:36:06 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 21 Jan 2022 00:36:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sdbus-c++-tools: upgrade 1.0.0 -> 1.1.0
Date: Fri, 21 Jan 2022 08:35:51 +0800
Message-ID: <1642725351-24004-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642725351-24004-1-git-send-email-wangmy@fujitsu.com>
References: <1642725351-24004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 00:36:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94962

Changelog:
=========
Fix timeout handling for asynchronous method calls
Add support for unregistering signal handler
Add support for chrono literals in sdbus-c++-xml2cpp generator
Additional little fixes and improvements in code, build system, and documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{sdbus-c++-tools_1.0.0.bb => sdbus-c++-tools_1.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_1.0.0.bb => sdbus-c++-tools_1.1.0.bb} (88%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.0.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.1.0.bb
similarity index 88%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.0.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.1.0.bb
index 35e940160..1064b85b3 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.1.0.bb
@@ -8,7 +8,7 @@ inherit cmake
 
 DEPENDS += "expat"
 
-SRCREV = "65782bbf435d91e5eb6af9ddab110df406a824a9"
+SRCREV = "bca8e81037766a0454740c40307eea32831c101f"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools"
 
 S = "${WORKDIR}/tools"
-- 
2.25.1


