Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75C8C678DB
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:05:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6933.1677927941800754284
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DooTOfoZ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927939; i=@fujitsu.com;
	bh=bfYU0eTRRHnq14LHb1485m3sCR0e1I4ofJYaLWQhbAg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DooTOfoZjHjhUSlMbmv6NUUXjLAQgeJM6XWsWhZ5OKBDjr15DfwAa7qqNsriME74Q
	 IvmVb2Cnj0gb4nYzuEkMRJ17SR4Rc7zOHyMVJrwXBu0YeKucgmFFrsCW4cnzXZ7EfY
	 Vn2QbQzGxZo9EtnKEcPNPYVs9uUjdHLW/c6ApUHh7GWvw/87G7mtkwKmM0ITFr6tSE
	 WAL0Mzr5qErw1GeIq/BfH3EMFyLlIKip5GpAfls2yE/TOb2gCDSp8IyoKmWulz3XA1
	 71W+3B/Q6iSfU5Q4n3lB8VoNhxfg/+3EQJ0xY0IB3N9oeP0YnV0LB9HFAfutmQG4ZK
	 aFWXZse+aDt3Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWZdJjTn
  FYO0KaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP1faOCfu6KTdt72RoYu7m6GDk5hAQeMkoc
  n+fQxcgFZF9hktgxZzc7hLOHUaJ5YQsTSBWbgJTEjfv/2UBsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAj4Spzf/BKtnAYpPOX8bqIaDg1fASaJxdyVIWEJAQWLKw/dgrZwCzhJbljxngzjCSWLxmY
  UsIDavgKDEyZlPWCDGS0gcfPGCGaJXUWL25WYWCLtSovXDLyhbTeLquU3MExgFZyFpn4WkfQE
  j0ypGs+LUorLUIl0jvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwMBNKU7+tINxXe9fvUOMkhxMSqK8k1gZUoT4kvJTKjMSizPii0pzUosPMcpwcChJ8
  MqoMqcICRalpqdWpGXmAKMIJi3BwaMkwrtFBCjNW1yQmFucmQ6ROsWoKCXOK6AMlBAASWSU5s
  G1wSL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3i0qQFN4MvNK4Ka/AlrMBLRY4zQDyOK
  SRISUVAPToWvav8pbff8+Dl3Bpc1XL7javMTpz8Sf2xR8YkQVV8xi2PAp6sctqU/TyqZP+cBx
  sNron2vvwl9GxYvT+2fNr4q8mbfEb1amnRZv6sfvfqINi2zfxNR6TUoVUZDrM8gOn1Bmbf/Ac
  9OpoEqtjTuzwnsFWNQcZ22w/ejw7k+pt370kU137rT9WMpQsO2JaJyS5FtnF+t7Oy1Xcs5Kv+
  adcai2sInHcfvnjafv2sWru3t33hFft239x5DmwjdL+XkWBRv5vG4/0hAScDmXWdVr8T/3t7v
  z15yLLpGfYxa4LDjp56SIWbWHYkWXfzo7Y7/uD4fm82/MZe2SDNfMyL26sfzUbc3+4I5VSQ4S
  r74psRRnJBpqMRcVJwIAmTrZPVcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-745.messagelabs.com!1677927938!584772!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20355 invoked from network); 4 Mar 2023 11:05:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:05:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D15B1142
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:37 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C569C7B
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:05:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.2.0 -> 7.2.1
Date: Sat, 4 Mar 2023 19:05:17 +0800
Message-ID: <1677927919-22891-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677927919-22891-1-git-send-email-wangmy@fujitsu.com>
References: <1677927919-22891-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101363

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Fix: the PyPI page had broken links to documentation pages, but no longer does, closing issue 1566.
 Fix: public members of the coverage module are now properly indicated so that mypy will find them, fixing issue 1564.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.2.0.bb => python3-coverage_7.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.2.0.bb => python3-coverage_7.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.2.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.2.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.2.1.bb
index c51f9ca55..5c57967bc 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "9cc9c41aa5af16d845b53287051340c363dd03b7ef408e45eec3af52be77810d"
+SRC_URI[sha256sum] = "c77f2a9093ccf329dd523a9b2b3c854c20d2a3d968b6def3b820272ca6732242"
 
 inherit pypi setuptools3
 
-- 
2.34.1


