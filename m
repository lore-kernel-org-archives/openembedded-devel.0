Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6767C19F38
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2204.1740525898343880793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T/mUzkmA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525900; x=1772061900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eGUQ/fMea/xm9Dv5+IGgbIpSQ5Sec4+WSAGYVe4bNbU=;
  b=T/mUzkmAfmjcHOOntRMjkZbbvPsmqcjZni4O+Q7fUU6yu8EJcqWLZN4I
   oQm1dHJOGP8NKA0jPBRPXf1HW6/Uuw8b1Y9YmGZyRPjXVTCKEj+yhnKKQ
   0NAmi+9H/1r5wEq+FeJQv64W99PzAsOIe6m81QPp6M/fGICkhWXW2W6Ul
   m3rqusYSSGqnveOYUj070vLq9I2SQb0yKY3DR1ZiH8+CW0ekjeg52Liv/
   gBnr1JQyA2FX+NPsdjS2UhLbBlhbQG80ffAp3sdSX9V/adk8OC8wlqAfm
   3FJnzE5anSqAFq765N6IZWcJBFQZiV14/mYkKYyLLGnAMkWwywitRmYMG
   w==;
X-CSE-ConnectionGUID: aNWTYtyxQJKZu7es7/npHg==
X-CSE-MsgGUID: bze7q4ozR6q5ezD+iYsDFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170032173"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170032173"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 125BFE8528
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0571C8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 92DCD1A0073;
	Wed, 26 Feb 2025 07:24:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/51] ply: upgrade 2.3.0 -> 2.4.0
Date: Wed, 26 Feb 2025 07:24:14 +0800
Message-Id: <1740525881-21103-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115620

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- New architecture: mips
- New architecture: loongarch
- Output buffering can now be unconditionally disabled
- New provider: profile
- Incorrect stack management when accessing tracepoint data

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/ply/ply_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
index 7793971083..5a39456b2d 100644
--- a/meta-oe/recipes-devtools/ply/ply_git.bb
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS += "bison-native"
 
-PV = "2.3.0"
+PV = "2.4.0"
 
 SRC_URI = "git://github.com/iovisor/ply;branch=master;protocol=https"
-SRCREV = "864fac79116870df1ab7aa21e639578807e41e75"
+SRCREV = "282558cfa1c0f0e095354e3a6ec4486b524179dc"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


