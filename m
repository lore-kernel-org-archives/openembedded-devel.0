Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB22C5B559
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.6739.1747817996288026139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OfzLt9Py;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817996; x=1779353996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zBqbwoCe6yY3Eor2XZl+Sg8DjpW0YvNdZ1h9uM2xjIc=;
  b=OfzLt9Py5MT8N8pSfcxiOfaoNlx2tiIr6ByD7S6tutw7qih0hWmoRGka
   Q3ddyvM/EndjHQ43pisE0/kDRIbg905AsMj+gh7MChges7tMaPZ9Juinx
   P7d65jVE53WRZuE3Kg4E/bdPf8TOBUZG+9FA1DcfKC4MNtc6DOLe/bZVl
   gguwe+hHpZN5nExq3fh0Pf80T1+xODpei+TsaUxwcfpcOvaqCxvsJ1i8B
   G5JhGdgHEKV9FLY30TOsOj86+CWXkoyXmSgu7k7CIjlThkncBwfR0+5Nn
   VN6iEyYjmiMG0FDkszgyzWqyTsPGLIfmRee3/cUkBdlpHatkaE3kG8lx8
   g==;
X-CSE-ConnectionGUID: xdLv2o31RnWhMaREWdhp4g==
X-CSE-MsgGUID: SvhgHl99QEC1JAHaYH39NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188157656"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188157656"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:54 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CCA32C68A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D61CCFA50
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CF511A00A0;
	Wed, 21 May 2025 16:59:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/43] python3-cantools: upgrade 40.2.1 -> 40.2.2
Date: Wed, 21 May 2025 16:58:56 +0800
Message-Id: <1747817972-28874-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117535

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix ruff complaints
- add extra_args for interface specific configuration arguments
- Fix frame collisions between extended and standard frames

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.2.1.bb => python3-cantools_40.2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.2.1.bb => python3-cantools_40.2.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.2.1.bb b/meta-python/recipes-devtools/python/python3-cantools_40.2.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.2.2.bb
index 51f97bdd25..cca44af5dc 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "dd3bedf69b0dc450a227099d00a913a8bb8febe4a84415eeb55eb6992265c3e0"
+SRC_URI[sha256sum] = "6dae46caa8a200bdbf988bc32f0e3fbcb1db384eb097ece7ca73c079e5eed81c"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


