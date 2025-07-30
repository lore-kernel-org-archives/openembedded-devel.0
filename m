Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F74C87FDA
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.49272.1753918175972642258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q8z7r5c9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918176; x=1785454176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FaxSRflMFYKfV8PDJGCuIwj8I8VtXd2piTDv9a9bcAw=;
  b=q8z7r5c9ALG14f9fqVHdysCQuEuvEfoTD0awgzkUigR4GKMCwgyOxwW1
   MAAO3GniVQx7Yazo/79xeKZjwCaxN7Na/nkhe6390mi3mkg5C6L3zm0sh
   HR3DWHRNzeb/pZvnBaSqY4+WaBhPXJ1NS6fdp4nQY8ru7WOsHLIeVj6Ps
   Dfq/c4/UWjk3T/rOjBlsTzGkCSDQuIGrOOMD2eG9ILqUgB5JDIDUZSRM3
   ng/atxy7ek3NGmHKJ0Ot18uRRkJY9jwK0SY9FeD/eusqeRoM5dqJaQpEz
   b20v/DJo6AiLHUjPwcMgzf7qVIpY3WwZdoEYAkldmLoC+x1CNohpTOWd1
   w==;
X-CSE-ConnectionGUID: PVesyFsdSL+5bajheWqtUw==
X-CSE-MsgGUID: eHDVwYw3TTaSo0ghOhdF1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="207232697"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="207232697"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:34 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 70FD31C00085
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CC1F61C000C4
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF0661A0096;
	Thu, 31 Jul 2025 07:29:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/40] python3-virtualenv: upgrade 20.31.2 -> 20.32.0
Date: Thu, 31 Jul 2025 07:29:17 +0800
Message-ID: <20250730232923.522-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118808

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix the CI
- activate.fish: update fish major version check
- Fix: Ignore missing absolute paths for python discovery
- Discover uv-managed Python installations
- Add warning for incorrect usage of Nushell activation script
- Update index.rst, compatibility section added, other subheadings created

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.31.2.bb => python3-virtualenv_20.32.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.31.2.bb => python3-virtualenv_20.32.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.31.2.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.32.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.31.2.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.32.0.bb
index 6c3aa19266..72946161b1 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.31.2.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.32.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "e10c0a9d02835e592521be48b332b6caee6887f332c111aa79a09b9e79efc2af"
+SRC_URI[sha256sum] = "886bf75cadfdc964674e6e33eb74d787dff31ca314ceace03ca5810620f4ecf0"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


