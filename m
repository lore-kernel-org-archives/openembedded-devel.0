Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F83C021AE
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46455.1739178111260815299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oA0Ef2YL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178111; x=1770714111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ay0Mcs1QXtsjdx1Fx0Grs+aI47THQwIAX6krxIU8ZfE=;
  b=oA0Ef2YLQEHcrqD3eR7ZUuTy/BdmE5gjvkUUclNN1eJ8iaGe0t2myp+O
   TIUmuDXpxcnYkX4FinbfmTp3mCg4wny1zl9/zhYEit08tiMw+TH8eQ1py
   Mh2YAXtejFbKYTQtsW+skdIdhiaF+WFmkrLiB5isSy0qPeflzz8/J/Mvu
   mu5TtjS7wJqPzl7snYoqZ9HY19FNq6xpyygiIUwJATdbAoIgorlPjM1zW
   kopQdxFlvz6TJ227qlcXj2yvI0CkasOWbGGmmtxF3KC5UmnrBsRGNu+ex
   z5No0u2pWaG14370h9h26u6tOfEHY2Aks0UyEkLHUALP2CdzAcJ5xQ5Ko
   A==;
X-CSE-ConnectionGUID: ObVEqGBlSkWp+GTNVp+Zrg==
X-CSE-MsgGUID: Q3Iox3zhQy+H7xetZLpzGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189712424"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189712424"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:48 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C6EDFD4C6E
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A732BF499
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:46 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2D33B1A000B;
	Mon, 10 Feb 2025 17:01:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/66] flatbuffers: upgrade 24.12.23 -> 25.1.24
Date: Mon, 10 Feb 2025 17:00:34 +0800
Message-Id: <1739178095-26432-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115333

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* Mostly related to bazel build support.
* Min bazel supported is now 7 or higher, as WORKSPACE files are removed
* Minor C++ codegen fix removing extra semicolon
* Rust Full Reflection
* Mostly documentation updates hosted at https://flatbuffers.dev

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index 39639a05f1..e0b5a8c631 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "24.12.23"
-SRCREV = "a2cd1ea3b6d3fee220106b5fed3f7ce8da9eb757"
+PV = "25.1.24"
+SRCREV = "0312061985dbaaf6b068006383946ac6095f5b63"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.43.0


