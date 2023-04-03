Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F00AC76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:02:24 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.66201.1680516143125791139
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vnTEN593;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516141; i=@fujitsu.com;
	bh=xhRFf0EpGeUGN0M+mwheKKQ9juSSnJm5awZ3iiWfIqo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vnTEN593MvGAUIjdDkV49qcucPzA+hkljNpmM/Rw5C5VKGFvYaFbhoV309hRirG8x
	 Y8cNC8mVvhNvsbFyjbqGLHD8EvgZuquE71cRf1mmulfF3URFjaWIn47TnZQCCatyAW
	 anXrT55bePJgrF3TbLPai1Q9a1o1Tp2VB/dkD+q61Z184Bo2ZCFxTmqlo+40Hy2Ofg
	 O0I2wnvBQhsEuMp1k77T0eqCDBk8Loxay5RzPIPHJg8c58VAXVgn+F3kctLQRPDxkq
	 STtOIWJPE7OPVjkqwbFyZwP0mCHK5qTjmrJPgtDF9MXYGHMVxGf3D7YciOuZawiuaM
	 D7XecSNq8wYvw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSVd3iVa
  KwdJV7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ahBQ/YCl4JVyzouM7YwLhHsIuRi0NI4Amj
  xOcn89kgnOtMEktn3mSHcHYzSnR9fcPYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAmMTXz//B6lmA4m86P4HV8Ao4SVy//BSsV0JAQWLKw/dgcU4BZ4l/1/YB2RxAy5wkXn
  4QhCgXlDg58wkLxHgJiYMvXjBDtCpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoVpxaVJZapGtorJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGLwpxaxxOxi/9/3VO8QoycGkJMorWK+VIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd
  94ioJxgUWp6akVaZg4wkmDSEhw8SiK8iguA0rzFBYm5xZnpEKlTjLocvY1X9zILseTl56VKif
  OeBpkhAFKUUZoHNwIW1ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOKLQaawpOZVwK36RX
  QEUxAR7RGaYAcUZKIkJJqYNqVt2mTet+uSVvqjN/sVFaoa5/15XWzueyywkZ1n7Y3fWkme+7c
  DUv57+GU/enG7PLJG+ZuEtPbk7F+zs7P39eaxIuuuWNhZPA769iDp/Fybi6BylGcn/W/eHJ4/
  al/fufteaENUp/kedcbzXkSME27X9BWVzPqjUDkV9v96rPWTX17giVDfIkvQ3N/Dk+D+S6uh3
  qPZmV8/PTk3W7hKSs/9gT3RcoFT12nJfC274kQ0+OmF6zlfcJlLkKCj7byzLoutb8sUyfzzTZ
  716+asvYr6szUJqw5sfTzTY8MxwqDLHHJ/R8knpTkpDH3xC14v/bfFrPMrsxp192mTjjyZre4
  1YXEG7Xl2eJbvihEhiqxFGckGmoxFxUnAgAEWt6TZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-591.messagelabs.com!1680516140!1459575!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20665 invoked from network); 3 Apr 2023 10:02:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:02:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B1FB11009B6
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:20 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A534E1009B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:20 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:02:19 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cassandra-driver: upgrade 3.25.0 -> 3.26.0
Date: Mon, 3 Apr 2023 18:01:46 +0800
Message-ID: <1680516108-30896-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516108-30896-1-git-send-email-wangmy@fujitsu.com>
References: <1680516108-30896-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101911

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Features
--------
    Add support for execution profiles in execute_concurrent (PR 1122)

Bug Fixes
----------
    Handle empty non-final result pages (PR 1110)
    Do not re-use stream IDs for in-flight requests (PR 1114)
    Asyncore race condition cause logging exception on shutdown (PYTHON-1266)

Others
---------
    Fix deprecation warning in query tracing (PR 1103)
    Remove mutable default values from some tests (PR 1116)
    Remove dependency on unittest2 (PYTHON-1289)
    Fix deprecation warnings for asyncio.coroutine annotation in asyncioreactor (PYTTHON-1290)
    Fix typos in source files (PR 1126)
    HostFilterPolicyInitTest fix for Python 3.11 (PR 1131)
    Fix for DontPrepareOnIgnoredHostsTest (PYTHON-1287)
    tests.integration.simulacron.test_connection failures (PYTHON-1304)
    tests.integration.standard.test_single_interface.py appears to be failing for C* 4.0 (PYTHON-1329)
    Authentication tests appear to be failing fraudulently (PYTHON-1328)
    PreparedStatementTests.test_fail_if_different_query_id_on_reprepare() failing unexpectedly (PTYHON-1327)
    Refactor deprecated unittest aliases for Python 3.11 compatibility (PR 1112)

Deprecations
------------
    This release removes support for Python 2.7.x as well as Python 3.5.x and 3.6.x

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ndra-driver_3.25.0.bb => python3-cassandra-driver_3.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.25.0.bb => python3-cassandra-driver_3.26.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.26.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.26.0.bb
index cf27f7f47..4c5c78105 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.26.0.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[sha256sum] = "8ad7d7c090eb1cac6110b3bfc1fd2d334ac62f415aac09350ebb8d241b7aa7ee"
+SRC_URI[sha256sum] = "425338478c14324704f6973451f3c54f7ffa65b49be045ad1de19628ab6e9492"
 
 inherit pypi setuptools3
 
-- 
2.34.1


