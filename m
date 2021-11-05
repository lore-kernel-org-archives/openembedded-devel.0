Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F771C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 09:30:47 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.3178.1636104646375539051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 02:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52016 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mivYW-0001pJ-Ay; Fri, 05 Nov 2021 11:30:41 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-natsort: Upgrade 7.1.1 -> 8.0.0
Date: Fri,  5 Nov 2021 11:30:35 +0200
Message-Id: <20211105093037.25071-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 09:30:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93830

Upgrade to release 8.0.0:

- Re-release 7.2.0 as 8.0.0 because introduction of type hints can
  break CI builds
- Type hints
- Explicit testing for Python 3.10

License-Update: Update license year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-natsort_7.1.1.bb => python3-natsort_8.0.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_7.1.1.bb => python3-natsort_8.0.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb b/meta-python/recipes-devtools/python/python3-natsort_8.0.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
rename to meta-python/recipes-devtools/python/python3-natsort_8.0.0.bb
index ee8d900964..7c2b7deb67 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_8.0.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Simple yet flexible natural sorting in Python."
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=58db8ac9e152dd9b700f4d39ff40a31a"
 
 PYPI_PACKAGE = "natsort"
-SRC_URI[sha256sum] = "00c603a42365830c4722a2eb7663a25919551217ec09a243d3399fa8dd4ac403"
+SRC_URI[sha256sum] = "a0a4fd71aee20a6d648da61e01180a63f7268e69983d0440bd3ad80ef1ba6981"
 
 inherit pypi setuptools3
 
-- 
2.17.1


