Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89493C071FD
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2760.1713318101038138639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tUeUvgdN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318102; x=1744854102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tzp6l/N4DeYRuAiiOImjMv0Fd5BV8nSS5VdC34p+Ad8=;
  b=tUeUvgdNiAkrvlMpU+i4R87UErvnhEVfhphpYn+/R4rDYPKCQyh42zXH
   qvjnBmfu4K1JT2Uepj9kbxpTPZCX7bAxQAyCqPSjC3Y4q7B9yVqa/v3M2
   kApx3lrl4GxSw5eu+SutECJqCPeOj3o3aLQNqZt2pYi+5miElnDbYqy1z
   QgmkdiTVfwVLcNU+JbEoyQc6pPXcVCl3VknTMWlVNm9z/PHKntc6VmD8y
   Oc0H6bNsvtoUZrqNUZiuGzzAL+VOW94GvpaK17gbIxs5ZJHtjEPnTbgU3
   hNK7ELcOe1D9xPh+WAMMDIwabnZn8AF/woFQwM2efIZzniIywgOpY3qPx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155233219"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155233219"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:41 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 962E7107D2E
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C7307D5B33
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 494912007473D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E9B921A0002;
	Wed, 17 Apr 2024 09:41:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/49] python3-sentry-sdk: upgrade 1.44.0 -> 1.45.0
Date: Wed, 17 Apr 2024 09:40:48 +0800
Message-Id: <1713318061-17128-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-0.491100-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfOfHrjLA9DhZp7V
	Ny7+UW/95dRKIQyvabZkCZrxljzwVA3mZXbns8PVnIGynr5ObIZN8rmPQRlvK79QpKTfxwYMW1Y
	EYEeDUunmd4nEotu0E9SKScPKC4kbse+7ZqGk+GUD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpitqAfZ9rgr9rlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs71Av
	BKEaDF7n/wqHC5loJQbJBCZRr9o98lvqqgrnk0d3efVjopRa7YxNvy+LyRJm31CBeP+d4LJjUTD
	/d+6hTiIavLLVuJaZIgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110021

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Allow to upsert monitors
-Add Django signals_denylist to filter signals that are attached to by signals_spans
-increment for metrics
-Add value, unit to before_emit_metric
-Remove experimental metric summary options
-New normalization rules for metric keys, names, units, tags
-Change data_category from statsd to metric_bucket
-Accessing __mro__ might throw a ValueError
-Suppress prompt spawned by subprocess when using pythonw
-Handle None in GraphQL query
-Do not send "quiet" Sanic exceptions to Sentry
-Implement metric_bucket rate limits
-Fix type hints for monitor decorator
-Remove deprecated typing imports in crons
-Make monitor_config a TypedDict
-Add devenv-requirements.txt and update env setup instructions
-Bump types-protobuf from 4.24.0.20240311 to 4.24.0.20240408
-Disable Codecov check run annotations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.44.0.bb => python3-sentry-sdk_1.45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.44.0.bb => python3-sentry-sdk_1.45.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.44.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.44.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.0.bb
index 1b371ef01..c3e53b518 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "f7125a9235795811962d52ff796dc032cd1d0dd98b59beaced8380371cd9c13c"
+SRC_URI[sha256sum] = "509aa9678c0512344ca886281766c2e538682f8acfa50fd8d405f8c417ad0625"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


