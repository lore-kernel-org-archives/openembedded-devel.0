Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE8BC54E7C
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8227.1710827214717322093
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sZd98CpD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827214; x=1742363214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=izp9LyY4fCS1jwskVC25jXC4v701BG/9o/xKd7/8Rvk=;
  b=sZd98CpDSjmwetjUUVP6zgOVPdaswLwLDeHQWRPY4e/duqNmBTn+MYyg
   ERJvDfgQPkggD2ShXYqiL1CvWMpY5rp5VE6cwlqil/JNxDA30MkCXveWZ
   ESvGRrL+0umoXEc3W/wR6FR6a7NEY+4/+o7Z9LWG9FV/dnOnTWf8xLmXx
   mHLn8+lDkm8gqRPzSuJYOHdw8l7CP/fW31mpRJt5Kc7FPSbQAAExDMdyc
   JJL89VYt7jWU/UluXSFe1hHZ6JBQFnTkCYJedSg/wqXRJ1E072CTJQ8nO
   jejkjC7ybGoSFS0iVv6O64STagEAgpgzD47LZAYSZWXtctcrvsvrOcS+r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152964740"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152964740"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 553BBD4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B1B3B4E22
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 24D9E2009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C45111A006B;
	Tue, 19 Mar 2024 13:46:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/50] python3-sentry-sdk: upgrade 1.40.6 -> 1.42.0
Date: Tue, 19 Mar 2024 13:45:31 +0800
Message-Id: <1710827139-30056-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--6.521900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mr/OuUJVcMZhs1a43ksVK2hSYo
	EGemaF5QpTkJunRe2VxlkXkKnE3zqms0SgWtnXgnMGAKZueP0mas4IQYg+G3CIAjsy+r+wvnP3D
	pqewyZiyERyhqOSXGDLblYix0V8kYgqwL3a6GRCYD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpitqAfZ9rgr9rlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7lvvW
	CmOVD15PdJRNzpF+ed91a+QAoc4N86zu1KQkH9xSwwcGKLTYEc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109459

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Discard open OpenTelemetry spans after 10 minutes
-Propagate sentry-trace and baggage headers to Huey tasks
-Added Event type
-Improve scrub_dict typing
-Dependencies: bump types-protobuf from 4.24.0.20240302 to 4.24.0.20240311
-Allow to configure merge target for releases
-Allow empty character in metric tags values
-Replace invalid tag values with an empty string instead of _
-Add documentation comment to scrub_list
-Fixed regex to parse version in lambda package file
-xfail broken AWS Lambda tests for now
-Removed print statements because it messes with the tests
-Bump types-protobuf from 4.24.0.20240129 to 4.24.0.20240302
-Bump checkouts/data-schemas from eb941c2 to ed078ed]
-New integration: OpenAI integration
-Add recursive scrubbing to EventScrubber
-Expose socket_options

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.40.6.bb => python3-sentry-sdk_1.42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.40.6.bb => python3-sentry-sdk_1.42.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.6.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.42.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.6.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.42.0.bb
index a348f337c..141343a27 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.6.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.42.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "f143f3fb4bb57c90abef6e2ad06b5f6f02b2ca13e4060ec5c0549c7a9ccce3fa"
+SRC_URI[sha256sum] = "4a8364b8f7edbf47f95f7163e48334c96100d9c098f0ae6606e2e18183c223e6"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


