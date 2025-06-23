Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D586CC7EE33
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.13878.1750662720349057416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZQRINGAW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662720; x=1782198720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LBTznbiN7ZuiUjKQX/smADFrW6V098QqNL8/5TV4Mzo=;
  b=ZQRINGAWIA/czr/YNn6vtViS0me0LDfxL3qYwFxpiI37ZUsSHLlUAGEA
   i0yZjJyvZ1vQx7j0ZxKNh/bZ3TlFMkydhHexsRFBxj0C7snG990WxfCYX
   kxog22m2Lod5LvQDhrG/80gVe4eqn7nFfvIDPfQdOShHzDesKqU2LXuEd
   LjsA5aSpDkNRvsP30/e5PqG2dLwFQvLeyosHo9p+g41OsxumNbhc75nJ3
   S+7oSC+odm8HKTBZB/SHIZ1iaX7tv+V5cUF0S8qyO7wR81kMQFMHm3/EB
   3nJzEFWilSA8ru806G7gWkXRwu1l3+0eA4rnjIIxpDtpqrhwoyif49uKA
   Q==;
X-CSE-ConnectionGUID: lIukvJYQSOC2S//+g7oAEA==
X-CSE-MsgGUID: AFRzNi5fTvagCxUdozq/bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="182540723"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="182540723"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EBDCE495E
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E206FD6173
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:55 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 959441A0073;
	Mon, 23 Jun 2025 15:11:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/30] python3-tox: upgrade 4.26.0 -> 4.27.0
Date: Mon, 23 Jun 2025 15:11:34 +0800
Message-ID: <20250623071138.402-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118056

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Feat: include free_threaded flag in result-json
- Add security policy
- Fix dependency-group name normalization
- Log environment variables sorted by key while redacting values of unsafe ones

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.26.0.bb => python3-tox_4.27.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.26.0.bb => python3-tox_4.27.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.26.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.27.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.26.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.27.0.bb
index 7062a5fcee..4deacdb3d9 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.27.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "a83b3b67b0159fa58e44e646505079e35a43317a62d2ae94725e0586266faeca"
+SRC_URI[sha256sum] = "b97d5ecc0c0d5755bcc5348387fef793e1bfa68eb33746412f4c60881d7f5f57"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


