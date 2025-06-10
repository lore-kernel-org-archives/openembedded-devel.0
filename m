Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D534BC71159
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.78430.1749526423382039445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MfRrsEjs;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526431; x=1781062431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JVt6xfe08Uh7HAWaoWogY5Q8sKDpqZ76kFDH5uhMWIw=;
  b=MfRrsEjsfd5/Om6AbtYtq+WsrjDqNEGRZh7GbMHqPJjlFrcgEvd7HEI+
   I6EV+57ucO619pclEJ/sSUIhgCDVy1Rf+GtVB7IN6uv9olEujnUMI/gep
   +3Te7LHC5s+6ZoAN2trEgeAHmpUo62l/DcK65xzhw3VKP6THT4UnkMq2b
   i25G8KrlHi9WB2oM7Y3IvcJgchcmQkUQmra5cR1f1Rl4zhKueoci40ktF
   LtxCqsYccmJ6yKuO9oGTWc4J3xdtGdfAYJOmvLH95Qe+uXuLG3/60or5i
   25u7ofH+B4XVO+e1wV7wvpfU1lo56Bobxt7QWuT6rVoDY1RreHtGamL6e
   A==;
X-CSE-ConnectionGUID: Sv41SW3hSDamGo7RlCMgag==
X-CSE-MsgGUID: lX73LKOuRxKJeGxJb25wIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="205286190"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="205286190"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 20503D5004
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6A41D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:46 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3CFB01A009A;
	Tue, 10 Jun 2025 11:33:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/64] python3-greenlet: upgrade 3.2.2 -> 3.2.3
Date: Tue, 10 Jun 2025 11:33:00 +0800
Message-ID: <20250610033330.924-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117824

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make greenlet build and run on Python 3.14 beta 2 on Windows amd64.
- Potentially fix build on NetBSD/sparc64.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.2.2.bb => python3-greenlet_3.2.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.2.2.bb => python3-greenlet_3.2.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.2.2.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.2.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.2.3.bb
index 995f91e1df..47ebd641df 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.2.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "ad053d34421a2debba45aa3cc39acf454acbcd025b3fc1a9f8a0dee237abd485"
+SRC_URI[sha256sum] = "8b0dd8ae4c0d6f5e54ee55ba935eeb3d735a9b58a8a1e5b5cbab64e01a39f365"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


