Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C08BCA0FE9
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4721.1755766810879754818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sMPWHFTm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766812; x=1787302812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4tCfQdl7i9LsR30wlLRFksnUi4AvGYlQT+jGNwBGDRU=;
  b=sMPWHFTmvjBNqFoKu8P8SMkH6tHl6QHps+YDeHSzGj9jRGOMRo37iJkU
   WyN5F1wd2qML0h7sbnmh6QQGLKJyym9HeGn9wdcDryJpj2gBeXS9utMPy
   GAl9tAXnDTBB8E6IbkdHykwFJoLNZ74kmBIFwhH97lt0KlcVJ6L+Yueaj
   Iw8QuDgidKj9BunamNfwAuLb6I4CByCUq2S4sYAHsUHsUn0MJBeHxzgUK
   kRPR9U5Wr1I/lRVj9+nRC+nHdi1AOOiU74fzFK/0rWHgQhrnVaeXqDwq4
   t4SpOgMiofFQbOFIqB1hEIQgiqGKpP5udBjYSEx1JkB3TIuB24KeMhwQr
   A==;
X-CSE-ConnectionGUID: lt+wLIMUT6a6L7V3gvZuDw==
X-CSE-MsgGUID: +P1aW6t7Qb69fOowDK/3/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210120519"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="210120519"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:11 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id DD5FCC00554
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:10 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9CB6E180C067
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 90D5F140769C
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 11DD41A0086;
	Thu, 21 Aug 2025 17:00:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/21] python3-inline-snapshot: upgrade 0.26.0 -> 0.27.2
Date: Thu, 21 Aug 2025 16:59:38 +0800
Message-ID: <20250821085954.2056-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119054

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added inline_snapshot.extra.Transformed and inline_snapshot.extra.transformation
  which can be used to transform values inside of snapshots.
- exposed @declare_unmanaged which allows you to create your own unmanaged types.
- Added explicit type hints to the outsource() function
- Improved documentation for inline_snapshot.testing.Example.
- inline-snapshot generates no longer triple quoted strings when it fixes cases

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.26.0.bb => python3-inline-snapshot_0.27.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.26.0.bb => python3-inline-snapshot_0.27.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.26.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.27.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.26.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.27.2.bb
index 3296210017..87446eb064 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.27.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "cfb66e4c11984eaa9d258c50a6e56fc57bc1e91d253acb4312968899e3f7ad54"
+SRC_URI[sha256sum] = "5ecc7ccfdcbf8d9273d3fa9fb55b829720680ef51bb1db12795fd1b0f4a3783c"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


