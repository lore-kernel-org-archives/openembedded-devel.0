Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15F3C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 00:29:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.5021.1642379357245313691
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 16:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vtUaRoRn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642379355; i=@fujitsu.com;
	bh=J5za7AhDdeZzfnUG+S1EkidLW7mNNP1v98NKf8DBc34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vtUaRoRnAOi+2FD4BGfMFpgTNbuYqA8hduMcGSgJ9TkKcn2o6f43nJzIrgZhDE2wA
	 Rg6NxBIlh1HJR+ikEc4vuItNgQGiNiEwqxhOjpOXVY0NKKMrRPPGTiLO+mpCtcDBK3
	 //QLo6OwUbSZO42dJZDwdMhqLz2yPOyVPX/aMsvDrW4QtMEivqnqwrXeMmo70G4Fr+
	 PNHhMZhyk+6XfRgpyJuOl/JvblNLPJX8BufkN8e8bQXFalKBOlp4x87/2wT5CPLh39
	 PL/ujvHjVjI+OqNBBf2DTZFR1BilAWCklG6K3cvMTOVltrxAhup2Lns53nR4np3YH1
	 sThpE/wt8pKWg==
Received: from [100.115.34.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 9F/CA-28974-B58B4E16;
 Mon, 17 Jan 2022 00:29:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqBu140m
  iwcdeI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNw71K2gr18FfOeL2JrYFzK08XIxSEk8IRR
  ovXhVpYuRk4g5wKTxLzVqRCJE4wSLw9OYgRJsAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgIHFp1kcwm0VAVWJa4zmwobwCThJ/390G65UQUJCY8vA9WC+ngLNE6+orQDYH0DIniS
  Pr6iHKBSVOznzCAjFeQuLgixfMEK2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWicVZaZnlOQmZuboGhoY6BoamuoaW+oaGRjoJVbpJuqlluqWpxaX6BrpJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnFKsfqJHYxPV/7UO8QoycGkJMob8uVRohBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3tptTxKFBItS01Mr0jJzgBEFk5bg4FES4WXbDpTmLS5IzC3OTIdInWLU5biyaskiZi
  GWvPy8VClx3nUgRQIgRRmleXAjYNF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7wKQKTy
  ZeSVwm14BHcEEdMSqj49AjihJREhJNTBNiW2cGy4VtZnVclpCQ1BC4RqHG64n+J+fPT75bO92
  fo34BM8CGf/+28efTsx+d/O7q/QszgWh8eW+6bIXrLOat+7fmBSZlrIy/MfrTW9CMq+//BHeE
  x64YMOOmezrxBasWcf31kJKc9XZULnzf74anzsanfssUOxcMutqrhcF2/QYmI7c3LtLMj7/p+
  Gdde6tDx90fNq9T+Tu9mC/9uo0I9t575lO3BDftnme6PQ+y+1/HU8ybzczll9cs3TmbllnBzn
  v+dPamM2WvrvNM/1rqfHZv/o7GWdv7VDcWKmxyu2vTJ/Pz5zO0Kk3w5nSw4OrdE8H+MjHntDk
  frhGOVF/TmFJeEnZolVPP4lbT/NRYinOSDTUYi4qTgQAWURBo2kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1642379354!207787!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8482 invoked from network); 17 Jan 2022 00:29:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 00:29:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 75F4F100183
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:29:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 54DD0100195
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:29:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 00:29:11 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2021.6 -> 2022.1
Date: Mon, 17 Jan 2022 08:28:55 +0800
Message-ID: <1642379337-12144-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642379337-12144-1-git-send-email-wangmy@fujitsu.com>
References: <1642379337-12144-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 00:29:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94888

Changelog:
==========
   repo: Change locking for summary regeneration to be shared
   soup-uri: Fix clang-analyzer warning by dropping dead code
   tests: Fix clang-analyzer not seeing through `g_error()`
   Update FSF license notices to use URL instead of address
   lib: misc static analysis fixes
   lib/repo: assert that writable state and error agree
   lib/repo: do no return an arbitrary mode on failure
   lib/repo: do no return a NULL on failure
   tests: assert mandatory values are present
   main: add support for CLI extensions via external binaries
   tests/cli-extensions: tweak test logic
   lib: use ostree-content-writer header
   bsdiff: bump submodule, pick up fix for CVE-2014-9862
   lib/static-delta: throw a proper error on bspatch failure
   github: add dependabot config

Simon McVittie (1):
      rofiles-fuse: Build using FUSE 3 if possible, falling back to FUSE 2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2021.6.bb => ostree_2022.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2021.6.bb => ostree_2022.1.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb b/meta-oe/recipes-extended/ostree/ostree_2022.1.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2021.6.bb
rename to meta-oe/recipes-extended/ostree/ostree_2022.1.bb
index d2d5dc0aa..64f39b6e8 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.1.bb
@@ -21,7 +21,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "f1155c8d283c3c85d74d5e1050b0dcf8198f750a"
+SRCREV = "6c903ab0b66e0542685108e837a23a9e29845949"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1


