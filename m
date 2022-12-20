Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272CCC3DA6E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:24:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.48929.1671539088351748237
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eIUbpwIQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671539086; i=@fujitsu.com;
	bh=11caZTzxwwhK2DbLY1IKk0vIVkMGINX2hOvOdxm4sck=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eIUbpwIQewc7eVbx4sKd3gC5Z6aDlFe91iv5pfXKCCRI9M1LhwCQqcMYrOs1kU8wv
	 RsSWTIzVYeU5l+TRtLvRthoCzhZdlMrjQ+qgZ6uosOUFeyDjZLg+7m2omwCBGaD/0S
	 BEKDJenMNekG5LDVDaWIkDHdOeWR84dfRyP9xPYSnDgRWRqbS9sn03DQ307BLs47M+
	 OwatEeQAa1bU6NLUXsIPp8Y1Icb6EtYXp/iKz25P5p/uHVobi1j/f4MhEiI3zktMMQ
	 nrzwIxT/mNXnab1t7wUIYG5ocG7va5sgffffXNFKuCMc2uTcFvl02HjCsM5dF6VlRm
	 Z3xXVRx0ymfBQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpNu3cmG
  ywcZDbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b3xP+MBV85K7Zs28TawDiJs4uRi0NI4CGj
  RPeC88wQzhUmiSszzrFBOHsYJT4+28nexcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgK+EjOvfWfpYuTgYBFQlXjcbQgS5hVwlFixfAJYq4SAgsSUh+/BWjkFnCQOPtoA1ioEVH
  Nvwzo2iHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYymxalFZalFusZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGhm1KsqryD8cvSP3qHGCU5mJREecPCFyYL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCdsQgoJ1iUmp5akZaZA4wjmLQEB4+SCO/7FUBp3uKCxNzizHSI1ClGXY6ZX9sOMAux5OXnpU
  qJ814GKRIAKcoozYMbAYvpS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeUWACUKIJzOvBG7
  TK6AjmICOOHRpLsgRJYkIKakGpsd3pr5T+bD59NL1Rl3Msbe0v5zRsm583V17OLZny4bLdlw+
  Cp+Es4R/ba9IfdlcbCDDLPFvye+4Pv9iPi7r4MVXt3Gd5nFpNF+wzyBSIb/VdJXdw52mPVar1
  ziaMh7dX7NJ8chnphlfZsqd1OrlycoU3eMWFHjCIXcVl5NqiZ78D6Hoz9/ft6xbd/9bZGuVFY
  vHzg8BySEZTHtbUnZP23M7bJPrXSvfulUxPh8YCg6tSbGZ2HhmlnShfpy25cNqb/Vfjt180xv
  7F0937lm7aNfzyctm2r7NtJ3lLSi4JuRa4fGVvOkL6h/7mT5QCzo639s2TEFzbTZzwSe2dvbY
  E8EJj0Li66bvfFq10Xq5EktxRqKhFnNRcSIAKzcADGQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1671539085!393883!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32416 invoked from network); 20 Dec 2022 12:24:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:24:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CB0741AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C02D31AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:24:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.7.0 -> 5.7.1
Date: Tue, 20 Dec 2022 20:24:01 +0800
Message-ID: <1671539043-7306-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671539043-7306-1-git-send-email-wangmy@fujitsu.com>
References: <1671539043-7306-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100151

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
fix: some descriptors raise AttributeError #812

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-traitlets_5.7.0.bb => python3-traitlets_5.7.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.7.0.bb => python3-traitlets_5.7.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.7.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.7.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.7.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.7.1.bb
index 9360b763e..c5b52a2ae 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.7.1.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
-SRC_URI[sha256sum] = "bd0fca5c890a09bf66b33cce67ca14156b080429bc39c7ef26b075a4bd4f9fc3"
+SRC_URI[sha256sum] = "fde8f62c05204ead43c2c1b9389cfc85befa7f54acb5da28529d671175bb4108"
 
 inherit pypi python_hatchling
 
-- 
2.25.1


