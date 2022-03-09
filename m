Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB94DC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 07:30:28 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.3169.1646811027848054019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 23:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pUiAhpjv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646811025; i=@fujitsu.com;
	bh=wj5YJllFVCfkp+LrdIMwi1Oppqj4/wn+nHsgeSYVy4A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pUiAhpjvuFN+bLseoiBDfXNdwVRETdmU1WFcysqYKth9reOdvoTZZZHih2/ALC2AH
	 zdPOMIOk4BAoOq6Ixr/YHUeQskOodhZswgJM67Gp/E8JYKTTVSu8d4qiEBJEwotSzp
	 0m1S5/mlteRY8NC5QoUFkvcOTIs7I1s3k8qHBcHdVzW/dJ0fUpD4qZ8N7y5uqocJzQ
	 V3QIGZh3LZlCUgcns9nja/s/WyGupnBomoIs6hIRRsuXkeiuzBM4kC+jMwff8ZRVZq
	 kExzVRlIDVqTEbgBOr30SPL7jGCAsbEL/dOT62UKcKHZ8eXpEl5jZl2jxajqC02VwQ
	 fT9EPF1Xpi3fQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqDshXCP
  JYO9WA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePGidOMBZu4Kr71fWVrYLzO2cXIxSEk8IRR
  4vyJTewQzgUmibl7WlkhnBOMEtvbmxi7GDk52ATUJR7ffA1miwjoSyydvYcZxGYWUJXovriGH
  cQWFoiWuHdzNlgNi4CKxPVT18FsXgF3ie33H4HZEgIKElMevgfr5RTwkHj1cQobiC0EVHP53Q
  OoekGJkzOfsEDMl5A4+OIFM0SvksSJFR+ZIOwKideHL0HF1SSuntvEPIFRcBaS9llI2hcwMq1
  itEsqykzPKMlNzMzRNTQw0DU0NNU1B1JmZnqJVbqJeqmlusmpeSVFiUBpvcTyYr3U4mK94src
  5JwUvbzUkk2MwHBOKXZbtoNxX99PvUOMkhxMSqK8MsEaSUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeIvCgHKCRanpqRVpmTnA2IJJS3DwKInw1oUCpXmLCxJzizPTIVKnGBWlxHnPgswUAElklO
  bBtcHi+RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4tkCk8mXklcNNfAS1mAlpsZ6QGsrg
  kESEl1cB0bnVDDP9aDyOVK8vK3uq8fWlb+aFMQoblv27iIVeljl1yxxbyL4oz+aodrWQvzTNH
  PmhKm0/kIcV5LD4HriyX3GVtZbkqpOr8golXGlZcfNVjVbgs4s7kiPbFiQonOtVK5795dPPvc
  s8Zxzm/CXRcUpq27/GdC2l3z26eUboiJX7Ji6dPMhS3yV6r35d0/Zv6gWUx89rddScH7m1tPt
  pqWDdjgcfixayH612X9BUqyLb/ePXKRiFRVPtZwM1V1mvLNpt+Unv4g2PXN4Z64f61R89VR5f
  OnKE8W7Dt2+JNP95uvlaoEabz7n7OpymJ/Ed/yv56e7fPc2eqRdhjQRbRNf9q29UsDzN0hTGX
  sZ7IUmIpzkg01GIuKk4EAL0tD+piAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-532.messagelabs.com!1646811024!21655!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22781 invoked from network); 9 Mar 2022 07:30:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 07:30:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4162A10019B
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 07:30:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 34DE7100195
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 07:30:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 07:30:16 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 4/5] [oe] [meta-python] [PATCH] python3-pywbemtools: upgrade
 0.9.1 -> 1.0.0
Date: Wed, 9 Mar 2022 15:30:29 +0800
Message-ID: <1646811030-14487-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646811030-14487-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1646811030-14487-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 07:30:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95895

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog see https://pywbemtools.readthedocs.io/en/stable/changes.html

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-pywbemtools_0.9.1.bb => python3-pywbemtools_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.9.1.bb => python3-pywbemtools_1.0.0.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.1.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
index c51f860fd5..3a9f0ad6fd 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.1.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "cbe2fe67620e73a81807940a75aeed8570205e2213d6f8de4db15fbc06fe8804"
+SRC_URI[sha256sum] = "0af7e067e0c0ba32cc19c2c2dc67875c591b806c4b49480ebe46e37bfb399684"
 
 inherit pypi setuptools3
 
-- 
2.25.1


