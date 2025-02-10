Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F53DC021AB
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.46473.1739178129070096787
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OUHAPvWz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178130; x=1770714130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=un7A4esD9gkcepwuysP6ro8BZ2TpqsO5OaUSVZXgwIk=;
  b=OUHAPvWzOHs1RgLBV64jDeHfng3KG7d4VfnirmdiE6YXsGP+Bx3seKhJ
   2KarkMDLYqfcb4fn1O0m8cpBxBbRPEyWygzBg6r91Qqjcj93SnsgRHytG
   osBTG/XtzsqNFq1H1Bx4umLSdxRopfvmpKytOVrj/MQS5pOiDGJIW2NWj
   F0aMdTvCC75vBJJXsmdZwRM+M/nYjk5bbobxem4iIzy2lSx2Yv321SeQk
   tbZ/QiwYrcTlpJeJ8EQoHDe6Hn4wvRdrKqrbAqAiXchc74Fxcw/FlQTTJ
   wnu6yb94RGWYBx1e8l53c6x5erLuW0KPWlcfZfPS0yHTRqqiLcFB/XVVu
   Q==;
X-CSE-ConnectionGUID: 0QLxHS0QQR+i4SVfc1YTdQ==
X-CSE-MsgGUID: 9xGi5/NORZa3AqeHhjuuow==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="188641311"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="188641311"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:07 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 48693D6EA5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 10A3610361
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A8B941A000B;
	Mon, 10 Feb 2025 17:02:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/66] python3-pdm: upgrade 2.22.2 -> 2.22.3
Date: Mon, 10 Feb 2025 17:01:21 +0800
Message-Id: <1739178095-26432-52-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115382

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Don't validate local file requirements that are not used.
- Don't set "dependencies" as empty list for uv toml if there is no dependencies in the raw toml file.
- Add a dummy project name to the script environment pyproject.toml.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.22.2.bb => python3-pdm_2.22.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.22.2.bb => python3-pdm_2.22.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.22.2.bb b/meta-python/recipes-devtools/python/python3-pdm_2.22.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm_2.22.2.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.22.3.bb
index 53c0828bcb..0cf9b7d5c3 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.22.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.22.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "907dbaa1659f07c763902f8429c1573aa32b5ef2d99b3b123b5f1e38015c917b"
+SRC_URI[sha256sum] = "f409d37b44f6b9938e4eed0bd0ca8016d15cd4514337640d6f962a74d022b412"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


