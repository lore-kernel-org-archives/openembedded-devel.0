Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B099ACA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:30 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.4684.1755766819926677313
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kMANei2N;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766821; x=1787302821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K+748TomMFhmlQI3o9H/6r3sZt/g9PQsPkOl81c8OY4=;
  b=kMANei2Nxx0sJKjOnAO6I+5xO0hpGOfQunMqpR8qEj9X4mWrs6kXTEvF
   WMsOqZsUEA1krzMtw2HWd7zzwB+Myp8r3LZpHerOw05L/AfNYJZjVlXLl
   P6+TNSW6/A6OchiStBKsYU7q+US6iDWVOAhykDyeNSfc6i1OkKZGXOHmH
   D5eVrWSLKTP3B2HpLpP+bZ25STOyf/DbIhkeMY/Y4+7NNBuSGckDo+w21
   wwg6kUSF8CVc603U4JyQ53McOqMquFq6kalaiJyUs0sLCwN7dSHJe7Ana
   A0VenCo4LiI8SSVoK0YpnQiFO70OiEcGCtKqcAjAOB3xOlar1Z4tVAbU9
   g==;
X-CSE-ConnectionGUID: zKh4jbcFT/mM1Hzpi3Ndgg==
X-CSE-MsgGUID: y/L24In7RKC4bKHQrzzxkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="209487512"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="209487512"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:19 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id B62498203FB
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:18 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6FD50180C067
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 50474180227E
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 93B311A0071;
	Thu, 21 Aug 2025 17:00:12 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/21] python3-zstandard: upgrade 0.23.0 -> 0.24.0
Date: Thu, 21 Aug 2025 16:59:54 +0800
Message-ID: <20250821085954.2056-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119071

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zstandard_0.23.0.bb => python3-zstandard_0.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-zstandard/{python3-zstandard_0.23.0.bb => python3-zstandard_0.24.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.23.0.bb b/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.24.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.23.0.bb
rename to meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.24.0.bb
index e44e04038c..c90680c9fb 100644
--- a/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.23.0.bb
+++ b/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.24.0.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "b2d8c62d08e7255f68f7a740bae85b3c9b8e5466baa9cbf7f57f1cde0ac6bc09"
+SRC_URI[sha256sum] = "fe3198b81c00032326342d973e526803f183f97aa9e9a98e3f897ebafe21178f"
 
 # Because the pyproject.toml is still in development and it contains invalid
 # requirements.
-- 
2.43.0


