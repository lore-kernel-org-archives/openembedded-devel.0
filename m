Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C73DCD548A
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:38:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2323.1695109122912432301
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="111494839"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="111494839"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:38:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 910A6DE6B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:38:29 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C7449D947F
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:38:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id DB179884FE;
	Tue, 19 Sep 2023 16:38:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lazy: upgrade 1.5 -> 1.6
Date: Tue, 19 Sep 2023 15:37:27 +0800
Message-Id: <1695109047-7386-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10--0.726500-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrRWnXH60ddk/ozDhGeQC9EojG
	wx10ej9iIA5dVG5xmK9T/DDqldWu2+5QzDUzCIOKKsurITpSv+PTuFXG66lrqsVee1/EDsmYvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgORMWQrKBhcbteXjSBMYnmnW9n
	uzdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUszohm
	Wq9w4034l6+Y3fKEGik7KPKLmKfaVxqPLAIuFI8kONYyrPKhPTXOufzCq3okyfdbDxx5bYA5+Rg
	VVUf5xKOfiG0rncaSogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104973

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Implement lazy.__set_name__() which helps in cases like foo=lazy(_foo).
 Update tox.ini for latest tox.
 Add GitHub CI workflow.
 Add .readthedocs.yaml file.
 Pin sphinx and sphinx-rtd-theme versions in docs extra.
 Add mypy extra which installs mypy.
 Fix stray characters in keywords.

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lazy_1.5.bb => python3-lazy_1.6.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy_1.5.bb => python3-lazy_1.6.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy_1.5.bb b/meta-python/recipes-devtools/python/python3-lazy_1.6.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-lazy_1.5.bb
rename to meta-python/recipes-devtools/python/python3-lazy_1.6.bb
index cdff28c295..97517f89a6 100644
--- a/meta-python/recipes-devtools/python/python3-lazy_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy_1.6.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Lazy attributes are computed attributes that are evaluated only once, the first time they are used."
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=84689cccb68e3c397d0856e8ad5a73b2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7df3865e8640604acfa474235d2db76b"
 
-SRC_URI[sha256sum] = "cb3d8612aa895a48afe8f08860573ba8ef5ee4fdbe1b3cd606c5f50a16152186"
+SRC_URI[sha256sum] = "7127324ec709e8324f08cb4611c1abe01776bda53bb9ce68dc5dfa46ca0ed3e9"
 
 inherit pypi setuptools3
-- 
2.34.1


