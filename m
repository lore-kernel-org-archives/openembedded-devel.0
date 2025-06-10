Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F183EC61CE8
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:01 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.77955.1749526431400049978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SffrM0zX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526431; x=1781062431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Vfcq5Y0IEtAGsGN/d638EN7th5oCULFVK+YOluQOzs=;
  b=SffrM0zXKz70J7iFsJ8JHmprJ+/s/AfCKQ60Sd0W+/qB9KeRVkQ5lmKr
   OViIpTKtrY3S4bCAXfSQ0DF879orTnl7Ds8n/P+MCAgYlqSP6PQSk2Q8s
   EqDRuZqeewZb3+QbgGjDXE9PN96J4d83BtVKmjEF91K6ZTV9e6w2rOK2I
   46lhUlYcftjRflwnDnEqwpB3mdVQEVQ0JUBjcGnmwC9+ncEdwasqVpDUg
   N2hDiEYmLQJcwcnH1mCO5OOu3abaoo8mu3uvviaZcbAbWV3lqmeutSK+G
   vrkovKV2wrGxU0xDBuVDu+lCs09ZcJNcYzE89Wh/8ZNY8jm4juo2yGmIo
   Q==;
X-CSE-ConnectionGUID: 21Xy944MT1ezmbswfW40+w==
X-CSE-MsgGUID: V4mENOnTQzuThExXwNWzLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181121893"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181121893"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:49 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B19D2D8E64
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 599FABF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:46 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE9BE1A0071;
	Tue, 10 Jun 2025 11:33:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/64] python3-google-auth: upgrade 2.40.1 -> 2.40.3
Date: Tue, 10 Jun 2025 11:32:59 +0800
Message-ID: <20250610033330.924-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117828

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Auth fetch token from default endpoint
- Remove unnecessary call to mds service
- Retry 504 errors
- Remove sync response logs in AuthorizedSession
- Update test to consider new error message from cryptography

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.40.1.bb => python3-google-auth_2.40.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.40.1.bb => python3-google-auth_2.40.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.40.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.40.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.40.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.40.3.bb
index 04207c607b..b7498dcc99 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.40.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "58f0e8416a9814c1d86c9b7f6acf6816b51aba167b2c76821965271bac275540"
+SRC_URI[sha256sum] = "500c3a29adedeb36ea9cf24b8d10858e152f2412e3ca37829b3fa18e33d63b77"
 SRC_URI += " \
         file://run-ptest \
 "
-- 
2.43.0


