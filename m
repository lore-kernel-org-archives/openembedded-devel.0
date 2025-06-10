Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6168FC7113D
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.77954.1749526430938462080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PpXcLK08;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526438; x=1781062438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fHRvAJQff6Bxes6qp/Qv8JWcceziZxa1tOA9pQlEesw=;
  b=PpXcLK08/hVAu/UvR5bHlBdGQ2KCyTq7eAYcZidIJoVfBZ5Ywj9Sushh
   ChFwn9bWt3SPSpgw7NMJd2eh/1Lz7IZW9DvLg5F2Of+nvzz5uSd7jK89F
   WWuerzKFtA4CZPXPqKWfJwwxBNwKnK0EfakII8zJ00ByztmdJ7MK/cA4I
   AukvK8NIlWKTvnXxTki+ZrgcYA6BaUH+/j2DqOpiYN74HX2FvU5pbDQ6z
   7mMpFW4oyOBR1k4snxkodZAyNynw7mvymPVUC16n5kvGZ37RuJOOxEa52
   UykVbW9M8kMvzbu2+WzlEaA+YwFi8cpDKPOGFtqhNLtgSih5Guh2uLJ65
   w==;
X-CSE-ConnectionGUID: mE/+4MycTSGgbq7EHWxm0A==
X-CSE-MsgGUID: PxMsZFSxQvmJ2r7fuPfeBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190206660"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190206660"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:57 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BEC6D5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 173C2D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:54 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 901EA1A009A;
	Tue, 10 Jun 2025 11:33:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/64] python3-tornado: upgrade 6.5 -> 6.5.1
Date: Tue, 10 Jun 2025 11:33:20 +0800
Message-ID: <20250610033330.924-54-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117846

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixed a bug in ''multipart/form-data'' parsing that could incorrectly reject
  filenames containing characters above U+00FF

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tornado_6.5.bb => python3-tornado_6.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.bb => python3-tornado_6.5.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.1.bb
index 65a1778457..c10589b2b9 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "c70c0a26d5b2d85440e4debd14a8d0b463a0cf35d92d3af05f5f1ffa8675c826"
+SRC_URI[sha256sum] = "84ceece391e8eb9b2b95578db65e920d2a61070260594819589609ba9bc6308c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


