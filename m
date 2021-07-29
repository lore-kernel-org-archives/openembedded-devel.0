Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.6314.1627542727586910211
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Fq8AJHrw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627542724; i=@fujitsu.com;
	bh=JFA5iLJolKGUgZOB+DNRDu9zjbnry8FB/UtIQ66Uzac=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Fq8AJHrwZ93B9mvcJD4k6q6Fhlyb1/AFLzFnmSp/AxkF6fQaDvxyd632faV8FeDRW
	 +BeMZU5LJtWIcOUVDGupPKJO9a0B2jAjaLVSmsFZ3nuiZHYQttWnAY34IsfuWLJheU
	 tH+aKED5QJvDHvh33Ry0MxYtzt18wUT5F6K1poESFp1IRq7nesIUvQzxSHvMGw/QwF
	 Ycrim+Tu8cixw3pB8ItqLepleZsbgYu/yqxRIjZRcpMYzoxKlZGdhoP7VyWCe3JIUf
	 10KlxL+cU8utRYwmiPBdsme0VOCP3w207FWd6XeCfSoXzPD+GWeiroP5oZrVU5r08E
	 yOJH2SeNdwKqA==
Received: from [100.113.7.80] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 07/5F-03281-4C452016; Thu, 29 Jul 2021 07:12:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRfdwCFO
  iQcsZDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPXvA3MBa1cFS9uLGNpYFzO2cXIxSEkMJtJ
  YsX+m0wQzglGiZ0/Z7B1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSwQILGlf
  RYTiM0ioCpxfuU6sDivgJPE9eY7YHEJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMEDWKErMvN7
  NA2BUSs2a1MU1g5J2FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0NDHQNDY11TXUNTY31Eqt0k/R
  SS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgSGWUsg6cwfjp9cf9A4xSnIwKYny/rJjShTi
  S8pPqcxILM6ILyrNSS0+xCjDwaEkwXsmGCgnWJSanlqRlpkDDHeYtAQHj5IIr1AAUJq3uCAxt
  zgzHSJ1ilFRSpxXFKRPACSRUZoH1waLsUuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkfBQ
  FN4cnMK4Gb/gpoMRPQ4toSRpDFJYkIKakGJj4thRmX+E++X6wQV5wqekvc0p9Jz77wf9rUbbx
  9/BNa/l3b6iv4rKP1xu1D8kekXPhPTos6r2ow06ay67O4z17BJR4zlv2ttLLVqV33qH5KkMaa
  26/eGpZuN58+K9d9Tbtp6GSHA0+WsyW1PM+zPZgrwtX0ZGLs30rdx3Uxme2/IyUvpJrsn3TE3
  nDBAmu2UM79q07qqG15kHZyRZ7kpr2CL5j9F738I3bopZpujtpVEb26V83Bd65/3P81N/qAxv
  ysglOn7p45KGu9WzrO4X7m3O/xa7bVqLSsiV5tkDCzX+vGtOXP1tT+Zoi4+kazscVS2HtZYtu
  ZicfDDtttcYxrCat9tVqcLYXnv3hkhxJLcUaioRZzUXEiAIb6/9UsAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-245.messagelabs.com!1627542723!140994!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13598 invoked from network); 29 Jul 2021 07:12:03 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:12:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T7C2dU032122
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 08:12:02 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:12:00 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.32.2 -> 1.32.4
Date: Thu, 29 Jul 2021 15:11:49 +0800
Message-ID: <1627542709-24908-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.32.2.bb => networkmanager_1.32.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.32.2.bb => networkmanager_1.32.4.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb
index a01e53009b..9c1e368642 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb
@@ -27,7 +27,7 @@ SRC_URI = " \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
 "
-SRC_URI[sha256sum] = "701d511067f757d0f92f412c98cdb49a74a6ba69448aabb1beadacbc171e3873"
+SRC_URI[sha256sum] = "29acbd41c78b7ef87ff88fec5360d1eaf8b5b6fcb90555d7391abc5e36923158"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1

