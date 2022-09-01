Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF69ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 10:17:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.10325.1662027451256536444
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 03:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=T0S2s455;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662027447; i=@fujitsu.com;
	bh=36dcFh93z9q1ARtcnu0zswW/nPBsMxhL8wf4Msq1Buc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=T0S2s4551v9M9fAKZADb+LS05VOqeMwmIb7y91ZdSuAsqmcFW2ZlFDSQULyl/th4T
	 tAxa4IXlOFZU8AodKrS7ZdRQulI2JhYh7V8gayyinMN7HYqVF95/mUNCWAH6U4v+Bd
	 QWjfwSUZmVmX4GY9nUukzAmtki/suwQ45EoTThDb3kQkzZEmpPF6/WEXT7YoLV7IhS
	 wpPGBKeTM3o+7YRPGYU69JXJf4rkJF5deI8WnSv5MN4yCZwfGQwYDqjaFP7cfR7o4S
	 xOdDdv1tWjKBI5W4dvk3rXONTqc4REo56iP9LGHAVfISL0IMtlkUXHZaFyt5dCmVWd
	 T+79Fx0PJpS0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSXdbm0C
  ywc0NmhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0ZbzwTmgoucFZdO/2BvYHzN0cXIxSEk8IRR
  4vTPDywQzg0miflz2xghnAOMEiee7QTKcHKwCehKvPixGMwWEdCXWDp7D3MXIweHsICvxOHj5
  iBhFgEVieVHz4GV8Ap4SNz8dZkZxJYQUJCY8vA9M0RcUOLkzCdgNcwCEhIHX7wAGyMhoCgxe7
  o8RHmlROuHXywQtprE1XObmCcw8s1C0j0LSfcCRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa6QNL
  IWC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzD0UooZqncw/u/9qXeIUZKD
  SUmUt19HIFmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK9eE1BOsCg1PbUiLTMHGAcwaQkOHiUR3
  r0tQGne4oLE3OLMdIjUKUZFKXHetSAJAZBERmkeXBss9i4xykoJ8zIyMDAI8RSkFuVmlqDKv2
  IU52BUEuatAJnCk5lXAjf9FdBiJqDF02fygywuSURISTUwLfqU/+hzTalT94FLHx/03P/0zN3
  xteSsveFCulbnZ1x4mGgj0285Zf+DR5Pro0zeVKiJvSirnXe6teq5/vqNa/+EKG1/feEuy7eG
  k7z39rnMiG93TPuefmX/7RXiwrO7guzCvl/XNUhJE/TIFHl35jinq23S8lmrbtivfsqjvL0p8
  KHum+4H3qGza76aev0RncDJ9HG66pH5Z/gUnFYUHL1o13Jv1UUpphlqv0tV9EN+/61YoS7zq7
  9xU2GEgWZB7LSw/IgNK88V7fJ56CeweIF25vTPK2c7z1vCXcIywX4+07R/784/drecMtVxy9S
  ER+K9Nl3fGC9d5p5/L0qsQa2QWWPeH+PJ36/cvapwN0eJpTgj0VCLuag4EQBS483pOAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1662027446!631881!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32440 invoked from network); 1 Sep 2022 10:17:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Sep 2022 10:17:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 488771000CC
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  1 Sep 2022 11:17:26 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3CC66100078
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  1 Sep 2022 11:17:26 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 1 Sep 2022 11:17:25 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.12.2 -> 2.12.4
Date: Thu, 1 Sep 2022 18:17:16 +0800
Message-ID: <1662027436-13119-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 10:17:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98581

Changelog:
==========
Fixed a crash involving non-standard type comments such as # type: # any comment.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-astroid_2.12.2.bb => python3-astroid_2.12.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.2.bb => python3-astroid_2.12.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.12.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.12.4.bb
index ae2a4109ef..784818c027 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.12.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "4675ef501edbbb143b3d9bb4c81d5f6338f08f960beed2ce41a03dc4cd20d777"
+SRC_URI[sha256sum] = "39fa822c82dc112f5072a208ddf01c58184043aa90e3e469786fa0520c71aaa7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


