Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B97C4708D
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:39:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.37740.1670830750914092399
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PHDrrUDk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830749; i=@fujitsu.com;
	bh=Xow2TzUg/30JS+CgxoFGoJ5y9lxHWlWHkJIx7IAOO9g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PHDrrUDkWk4lSiWetRvjAKqkMYB/rrda1tXmSspgm61ndbOHNVba4oCldrooGv0aW
	 tglNzuH9g1zGSFnvaKv9wnv22V8X2duVfMwY0xiXrw4d/VuskD63pusthiOcz6GkQ0
	 cuMNw6s5LrsHcJNyGbu0dwQIr6JNQXNH1o4dwRRD2Xu5r3l3JhSSeOofwXjbMQjJc3
	 53UMm7S4mlDe7lbkWJc7T198A4MBlgu5p2j5qNedCs4jJ6jjnJ4N8o/SiVArG0iDlQ
	 veQNiMUJ0iPbwCVkok7KgntIJfZO6iDi7RKxwXEVM1gCkx4OATUuUopzoAkBiaGx07
	 8HC4XyqkX1PEg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWXfOrWn
  JBhvfKVpcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBm7VzSxFnzlrji2rZG9gfEdVxcjF4eQwENG
  idfth5ggnMtMEmtOz2OBcPYwSkzsnMraxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  exdjBwcwgJBEq/O1YKEWQRUJdqvzGEHsXkFHCVmb2lmBLElBBQkpjx8D9bKKeAk8bD5F1iNEF
  DN95lNLBD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYzYtTi8pSi3QNDfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQLDN6U45eIOxifL/ugdYpTkYFIS5a28Mi1ZiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgTvwZtAOcGi1PTUirTMHGAswaQlOHiURHhVgPEkxFtckJhbnJkOkTrFqMsx82vbAWYhlr
  z8vFQpcV5hkBkCIEUZpXlwI2BxfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC8vyCqezLw
  SuE2vgI5gAjoi6uVUkCNKEhFSUg1MfEKhm/IrgtesYZ6/vMae68X/pZrmG6ZL2/gwLX5gObXt
  f+WSWsacpwfW2PhtLTZ5lrNE13x3OqvT1YXdDJNrme9L/V+v/5un1PBa8j5pF2V3LguBz3wt6
  ZqT3oa1/dq4jtNUjoPPsO/h1FUlF42v6v9sad84Nz/+WqpCqzuTUOm5WdVbvx1sDC9cfGPCg0
  1OTAEvXVeIW3eHRd+PTtj0sfGETvn0uvf/779fYJNVN2H7ZZP+rP0tUzfKBYp3MOQrVqV99ZG
  Rkz/9vjVR+t3NgBD5mF0p4dev3PHN6PvkFZ0hX8rA51cze/c+f5fV92e//7qNW6Pm4frtrX8W
  xqjO1+eZzvT5eHG+175dPolKLMUZiYZazEXFiQD5DBreZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1670830748!223569!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27048 invoked from network); 12 Dec 2022 07:39:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:39:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 04E18142
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id ECD8D73
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:39:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 13.0.1 -> 13.0.2
Date: Mon, 12 Dec 2022 15:38:34 +0800
Message-ID: <1670830717-3138-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830717-3138-1-git-send-email-wangmy@fujitsu.com>
References: <1670830717-3138-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100051

From: Wang Mingyu <wangmy@fujitsu.com>

Changelogg:
============
 Adding support for reported unknown devices (#680)
 Add Chromecast Ultra and Chromecast HD to the recognised devices (#679)
 Fix error with select when python process exceeds 1024 open file descriptors (#676)
 Include URL and UUID in Home Assistant controller messages (#613)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_13.0.1.bb => python3-pychromecast_13.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_13.0.1.bb => python3-pychromecast_13.0.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_13.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_13.0.2.bb
index 59f1bfdfc..fb63b3dde 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "203aaf037afbaca12763a3a911929dd25b0a8a7b1ee00d010d3439bd31a98252"
+SRC_URI[sha256sum] = "1b520e477492cd8fe022e4d041e676056d5fffbb6c05b2f4509801a06bc67bec"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


