Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0182C369C7
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:32 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.14423.1744794151467423540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WYHjdfI/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794151; x=1776330151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=m7ia1RxKR/pXEbJL6KzTNvwB9qIeWmoQuCJJNoqxNBg=;
  b=WYHjdfI/paxv8ETkmQVfvi7ZbFh/RPl6J+inUDMuIqSyv3B5A3vZjQiw
   6IvzthGjE/puNCVcKY10/DSsQDyNRbUNrQIqyfgho9DPv8kK8my0Szlgh
   nxc4OrdpvqKlAeX54IHb5f2fMtY133L1w/7FblfcfmRyNp3kCdW0DmLSz
   sfxrsg3XKWLyClk7/VB7K3GyvsGDqDfCJPRv6gbbwn5EGcKoL4qE0Gq4k
   3nP9VgUabO8aw8XEWx+pW1KIaADcXkMmbM+Qo+FNEVWuAbNudgdzK9f7k
   PwJw0HkkX/6WZtMwwlRsZOCjr2+Xz0W81G2ZLMWXQGgk6NVYs86GQzDFq
   A==;
X-CSE-ConnectionGUID: QOZDlJhIQNygpnGYD5tSeQ==
X-CSE-MsgGUID: U4Br9zBDQ2G9AOVmHHZk/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="183962639"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="183962639"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F254FD501D
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B277FD50F6
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 722961A0078;
	Wed, 16 Apr 2025 17:02:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/31] imlib2: upgrade 1.12.4 -> 1.12.5
Date: Wed, 16 Apr 2025 17:01:52 +0800
Message-Id: <1744794136-908-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116874

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 3bfd701d96..9c9bf10398 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-PV = "1.12.4"
-SRCREV = "fd4310864f820ca4db56fd663a504cdc4f840ffe"
+PV = "1.12.5"
+SRCREV = "df73df52ddf0e1ea40507f5ee8c6b794b328b3bc"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.43.0


