Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E9DC021A6
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.46473.1739178129070096787
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LkkM/Sjf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178131; x=1770714131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Urc6CeBjAFlZmZrgRa16lJ9gvMtTiZOMr4sdG91HVV8=;
  b=LkkM/SjfbFMR/ijCyN0YGmF53r4Kxka+dFK9WaTjoTaBbfRq75f1j0Yb
   rn3vnWReQtDRCOO/4geT0Twd+/G2SmiofzrUU0ggX9Dx3KxI37Bk0eALK
   qJohQvzrXtDD/dnf7GUxvUOtF5zix3CyTqdeUTwGRgR9hC3qo9oX9sfQx
   NbsVgPUPiHhnXnR995kjO2vV/CMr3xjWmt5MW/e4l6msJo+7Fb8vQI4YF
   B8RVjzIDXqv/4utRvmFea7dqemJ7qV6Ecx49xzTzb8An/I6yhlmaHTQ4w
   uhwFDopKgtFPRJZujvIxNKIEOTIZNXiCeBlQoDS3aGL2VzNZcXRfuHg3m
   w==;
X-CSE-ConnectionGUID: e0fLf8ogQLmxrKIvrLXUXQ==
X-CSE-MsgGUID: 3Wid+scxQUKKAVPbyiLwUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="188641315"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="188641315"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:09 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E3F1D6AC1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 451F2D9695
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0BDF51A006C;
	Mon, 10 Feb 2025 17:02:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 59/66] python3-rlp: upgrade 4.0.1 -> 4.1.0
Date: Mon, 10 Feb 2025 17:01:28 +0800
Message-Id: <1739178095-26432-59-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115386

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Merge template, adding ''py313'' support and replacing ''bumpversion'' with ''bump-my-version''.
  ''rust-backend'' still only supported up to ''py312''.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-rlp_4.0.1.bb => python3-rlp_4.1.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rlp_4.0.1.bb => python3-rlp_4.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-rlp_4.0.1.bb b/meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-rlp_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb
index 46ca600ea2..cfd155b514 100644
--- a/meta-python/recipes-devtools/python/python3-rlp_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00854fa80a84236706b11f47f23e61e7"
 
-SRC_URI[sha256sum] = "bcefb11013dfadf8902642337923bd0c786dc8a27cb4c21da6e154e52869ecb1"
+SRC_URI[sha256sum] = "be07564270a96f3e225e2c107db263de96b5bc1f27722d2855bd3459a08e95a9"
 
 inherit pypi setuptools3
 
-- 
2.43.0


