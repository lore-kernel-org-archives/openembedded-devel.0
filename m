Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91382C071DB
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2723.1713318100076338578
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Njr6H6vv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318101; x=1744854101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DamGtY480h8bHLS5tEITbNbUD5OSt1cJbKSBHo4yV+A=;
  b=Njr6H6vviN3e07UiI+t3NRTBccAxidaFhva60lHn3O7PHrzWrLnuOWbT
   t3kLvbLLJh8AetxoQeQ4juzZ3rJJ0KIBq1aV0C3lbFHZ6qnR69/cO1Eyq
   pxzyQzVk8rRLWEzigki5JTqTDpdRM8J68tGKcUew0VkKaCeUDCCN+At0+
   nKXB7v/Ey+z6ZMCv/D6JkcybxjTv0D2YLg0hJkVGgPZyYvdTnbfeA12T4
   gsxZmGL7Jzlkrc7sHTC0caiQuYa78aCjOu3sB8sfqip+dyLMuDC9/HiVK
   4l/1FEa/6cw9jApVAuYc7mOOIzrHUkrpPsa34DzrVt1lyJZKTE/4bERLh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135163802"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135163802"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 876F9E9600
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BB39F1660B
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 26245200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C6E351A0002;
	Wed, 17 Apr 2024 09:41:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/49] python3-pdm: upgrade 2.13.2 -> 2.14.0
Date: Wed, 17 Apr 2024 09:40:42 +0800
Message-Id: <1713318061-17128-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--4.783500-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yUIIxwDaU5mrdwX/SSKrKHjyXa/7gO3s/Sia
	SqRpkfBtFeY82fCUULNCOTv5jGpNKyQb3EqxHhpp9DGkDtq4vAwEa8g1x8eqF8gVyTd/p+/Isj/
	AsNe7qLlAH5VjKzS9FBr4VwoL73En4B/bTlxoIr1T3j6uyvUYPFK6+0HOVoSo4zsIwTCr5hbQGF
	lKOB0iJHDiSYRD98CWT9TXGlMNyUnc+HB+YVvemCeaCBMY8cEnGYkyyELuGKSU8ftiyKjZrdMjj
	wb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0BQOqUsWgx5gIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZLBOTTvQn5zDu8uVxdghKSU0MlmC623y6Mn0aB
	sSE5Pu0FKv7AIl724jL5+VZSNYj+lZiiygZ3yuOReIgdxFxHwVwIA6iqEAQBLv5Eyr/YIrqsDhz
	tRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110016

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Revert the package cache introduced in 2.13. Don't cache the decompressed
 contents of wheels unless being told so.
-Fix inconsistent logging when pdm use a different python interpreter
-Fix PDM unable to find Python interpreters when PDM_IGNORE_ACTIVE_VENV is set
-Check verify_ssl when trusting each source.
-Fix name check for project itself in pdm outdated
-Fix a regression that proxy env vars are not respected.
-Fix an issue that venv provider can't be found when providers are explicitly
 configured.
-Fix a bug that [tool.pdm.options] are ignored if -c/--config CONFIG is given.
-Make --without respect groups in dev-dependencies
-Per-source configuration for ca-certs and client-cert.
-Remove all caches by removing individual cache types one by one.
-Use the default HTTP client when downloading the pythons, to use the
 certificates settings.
-Fix a race condition where pth files take effect when multiple packages are
 installed in parallel.
-Refuse to run recursive composite scripts.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.13.2.bb => python3-pdm_2.14.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.13.2.bb => python3-pdm_2.14.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.13.2.bb b/meta-python/recipes-devtools/python/python3-pdm_2.14.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.13.2.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.14.0.bb
index 387f14b0e..011ba5b3d 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.14.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "e282bf1caf0a083fc0fb5e89ad6f79d7c579ff52c7bb58ee8587ea3d5bb9e14a"
+SRC_URI[sha256sum] = "7ae6c4b5518085a703e0824ab10cbc3b7246b599ef07b8c4dcb2af1e42859190"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


