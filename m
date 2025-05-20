Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3A0C54E90
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.16490.1747731316776524975
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nMGKBOvD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731317; x=1779267317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RSRvHn/ojJILMwsMhvSbUceH4qTD44exx0Dmx6wIEvc=;
  b=nMGKBOvD0nfF23WGk1S62QjHhpB4x3RWWbEf9jW6/8KY22xflsGjjLUf
   V++KB2wS1nx/P9CZQNWwahR8i+MlGmZpGw0ygtYKrg/T6Dq9Nvf+9spuV
   9GpReQg+XCgkIqPC/m0vWi5BsZ9UYVV6d+y4ZqS0LdVhAEtjJyTafQMG7
   ZQaiVQA/Q1YgY22R3ceeBuL+3wcAn6gcyMcndTX7PLranEJMzzoPAGtoi
   YUsJo7T7p78EEi2cIzfYIcVk3pn9PKX717aNPcOTby52dKc3wzWekdRAZ
   WuTCvqf2jSYCgxRzUsQXVgrRRcdDebIBWVQGavOEA6ux+e0aM/Iv5UXsq
   Q==;
X-CSE-ConnectionGUID: 6QRRK4L3TGKYxDvaxBn4zQ==
X-CSE-MsgGUID: rzH+aq4IR8qvvvYdE8+7og==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="199238449"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="199238449"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:14 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E40A0D4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6D62D7293
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3BF541A0078;
	Tue, 20 May 2025 16:55:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/27] libdevmapper: upgrade 2.03.31 -> 2.03.32
Date: Tue, 20 May 2025 16:54:39 +0800
Message-Id: <1747731299-20448-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117491

From: Wang Mingyu <wangmy@fujitsu.com>

0001-implement-libc-specific-reopen_stream.patch
refreshed for 2.03.32

Changelog:
==========
* Add support for using regex in selection criteria for string lists.
* Accept thin pool data LV as cachable LV.
* Accept '--autobackup' option in pvresize.
* Allow using zram block devices (likely for testing).
* Lvconvert vdopool conversion propperly validates acceptable LVs.
* Fix lvresize when resizing COW snapshots already covering origin.
* Fix lvmdbusd read of executed lvm commands output.
* Fix construction of DM UUID for cachevol '_cdata' and '_cmeta' devices.
* Ignore PV claims from old metadata when then PV belongs to a new VG.
* Fix integrity metadata rounding.
* Fix string list selection when using '[<item> || <item> ...]'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-implement-libc-specific-reopen_stream.patch   | 10 +++++-----
 meta-oe/recipes-support/lvm2/lvm2.inc                  |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
index 087a0501e0..1f6b89f2b6 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
@@ -1,4 +1,4 @@
-From cfa37411fa2ebe8ade94742ee00f86d0e386a651 Mon Sep 17 00:00:00 2001
+From 65a04547541894b3ec56bd70510b164810cd64b3 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 25 Oct 2016 11:49:40 +0000
 Subject: [PATCH] implement libc specific reopen_stream
@@ -45,10 +45,10 @@ index 90905e629..ed69662d0 100644
  void init_log_fn(lvm2_log_fn_t log_fn)
  {
 diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
-index 4af6adc83..fbab70988 100644
+index 22ae1e3bb..b0928bc04 100644
 --- a/tools/lvmcmdline.c
 +++ b/tools/lvmcmdline.c
-@@ -3395,7 +3395,7 @@ static int _check_standard_fds(void)
+@@ -3407,7 +3407,7 @@ static int _check_standard_fds(void)
  	int err = is_valid_fd(STDERR_FILENO);
  
  	if (!is_valid_fd(STDIN_FILENO) &&
@@ -57,7 +57,7 @@ index 4af6adc83..fbab70988 100644
  		if (err)
  			perror("stdin stream open");
  		else
-@@ -3405,7 +3405,7 @@ static int _check_standard_fds(void)
+@@ -3417,7 +3417,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDOUT_FILENO) &&
@@ -66,7 +66,7 @@ index 4af6adc83..fbab70988 100644
  		if (err)
  			perror("stdout stream open");
  		/* else no stdout */
-@@ -3413,7 +3413,7 @@ static int _check_standard_fds(void)
+@@ -3425,7 +3425,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDERR_FILENO) &&
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index bff075d400..7a87baf5c3 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,9 +18,9 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "3a6e221c569eb253fa38a772b15e53b5de65b5d1"
+SRCREV = "8817523c5682a7fd83770d3f58a99c436f7e73f7"
 S = "${WORKDIR}/git"
-PV = "2.03.31"
+PV = "2.03.32"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0


