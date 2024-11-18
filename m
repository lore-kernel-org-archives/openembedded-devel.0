Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE6FD4401D
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.37268.1731922216162759929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KyghKFV9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922217; x=1763458217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=imGaiu0d8hQaS6wabtyaALohKG0oHO01XhCIYinTCdU=;
  b=KyghKFV952NLThWogjpUPRjoLN6qCXvNEE5HVQBjz1QA6nOfeIZxNFtf
   kiwMRoZJpn8uWX5fbTxyJnLJCE2nas+c0PapzSZMgwtnSGmv9seZHyz5b
   sLValcXj05EOeKTzC51OgGq13x2drE7e8q67ZGVWZvsX1Fm68VOVAXDvJ
   cds6e4rWoPEQxhcnj42X1gbTJLnXtkthqWHHU7gVR7c/j5p5b9mE6d+qm
   hWlSbaSRLTZTwVn63Z8vArkUXtSNqbxGWyLOSMl0ZrEcxilfdiUCbQ4Z4
   EemqL1Xm0kuftBw1kZz7L4ca1ITw4mJGEXgkvrejL2jZK3+sRCbFJuRmd
   A==;
X-CSE-ConnectionGUID: ZtMmj4gBRMunFTsSBEa4CQ==
X-CSE-MsgGUID: C4BZlqARR1i21zkt2IO+vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180782257"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180782257"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F327ED4C2B
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 89770BDC8F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 246362007CA85
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:09 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C90D71A000B;
	Mon, 18 Nov 2024 17:30:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/32] python3-cachecontrol: upgrade 0.14.0 -> 0.14.1
Date: Mon, 18 Nov 2024 17:29:37 +0800
Message-Id: <1731922195-5266-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--1.557200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeUxkLdkW7C5qv+8
	ilnQjTefuLAgY17YzsTjFke91ZPGTL1MabCtVw9LA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYbNAHTEG8T6WDIpcBQ49iRAmWvXEqQTm5gw1mV69cpTOGGD
	tbUGr1xSWC+UcQNla+gDLqnrRlXrZ8nn9tnqel2OJGF26G8SWybcMfqeX8eudLV8RrH3LDWWxt5
	pa8wamAZxKevNHKRT/85HeX0TiWA2QSNyoKi4II15J72HOdbIlr3CiQvssinYipdqO5p00tJDFZ
	Bh3Dx4PsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113884

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- github: bump signing step, use dependabot
- build(deps): bump the actions group with 1 update
- GitHub Action to spellcheck and lint Python code
- workflows/tests: patch macos runner version for 3.7
- build(deps): bump sigstore/gh-action-sigstore-python from 2.1.1 to 3.0.0 in the actions group
- drop Python 3.7, add 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-cachecontrol_0.14.0.bb => python3-cachecontrol_0.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.14.0.bb => python3-cachecontrol_0.14.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.0.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb
index 1e374529c..93f8c9f71 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=e2fd6ddcf506e08972d5ba4b93c0022e"
 
-SRC_URI[sha256sum] = "7db1195b41c81f8274a7bbd97c956f44e8348265a1bc7641c37dfebc39f0c938"
+SRC_URI[sha256sum] = "06ef916a1e4eb7dba9948cdfc9c76e749db2e02104a9a1277e8b642591a0f717"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


