Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31144C5B543
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6741.1747817999049967028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AvNYQAEp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818000; x=1779354000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lyZGg95iHvtW4v8Add+MaAIKymCY0h2woTnE7tnvEs4=;
  b=AvNYQAEp3QudUO6j6iy96mWIhqJ1pukXWX2gKGp+SKi5oP9EsjDJjavm
   2PKAddPut95F90Pmn7GUkTcjXtM5TadVXxTyla0/W30tA/kCQ3VrOwsPF
   ESzpVdX7VBadb8snjM9qYIWkeYwWp+SnKIfFclUOE93vN7++iiOzAPDVs
   fUIZhcRht3N+4WCrFiryA84+SCZHQkB00BguZ+E9dgbY1/5NK3hnqB6eZ
   gdjtiR5D8tIov0kpbDQXH0AYQgnrZgrOqiArqeoBI8QYBYviLdpk1Jb7X
   ctlV4DMv+s3SOO8zzkIrvkrWeSz4V3WFvg+CXY3fGdPdgya8qGt1Pa8T1
   Q==;
X-CSE-ConnectionGUID: rDM93Y/zTamp88V4DyXLFA==
X-CSE-MsgGUID: eHAtbmfVTjOMRmUNKrryaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="179669865"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="179669865"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E73ABE8FE6
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A5AD0D8B94
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 35F4D1A00A0;
	Wed, 21 May 2025 16:59:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/43] python3-psycopg: upgrade 3.2.6 -> 3.2.9
Date: Wed, 21 May 2025 16:59:11 +0800
Message-Id: <1747817972-28874-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117548

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.6.bb => python3-psycopg_3.2.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.6.bb => python3-psycopg_3.2.9.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.6.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.9.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.6.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.9.bb
index 036e737b36..9be72bc4fd 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.6.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.9.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "16fa094efa2698f260f2af74f3710f781e4a6f226efe9d1fd0c37f384639ed8a"
+SRC_URI[sha256sum] = "2fbb46fcd17bc81f993f28c47f1ebea38d66ae97cc2dbc3cad73b37cefbff700"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


