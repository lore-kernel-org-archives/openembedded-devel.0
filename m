Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12F7C83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.56129.1751879228940391649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VCZVNMtJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879229; x=1783415229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DfF0xFWQ+ws+phYBjst9klrLfd3pf8A4tL5TmHlYfJ0=;
  b=VCZVNMtJdZHoEB0oxIVzHr1DWmgJaqMkfvhTg1NzHJwV4qG8v+ygEmyC
   H6lhGkazoLzue29d1r5TzpqGAGXIZFulxFc14cFb1vBnbMBxeYYNP7TXM
   P/Cnf+LMJEoV6CptZGOQcoSP2BF5qVdNHZyXIYlP/8X0pfWkUSavQMcAF
   b7liWYKHO5KOQNDr1k4sALqDcFanV73Dqg6bpaSKj8qCPpYz7I2vSqqbL
   EPtey7289XLfuCKRXCbkhMvuHZ7OnO9NHq5xckwdqCg8TnuquMfgTTWOM
   IaBidNDKjaMtXrsT9P7pZ01D0tQcUtPUayUvKx9FQsfZrPNoLKxDfgrTw
   g==;
X-CSE-ConnectionGUID: 3hVS4B8QSbmAnyIeNKn4gA==
X-CSE-MsgGUID: e/2vQSRRS4aNOMRg2erWgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="205437821"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="205437821"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:07 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 1D22F8203D6
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:07 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTP id 978A1140038A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 00C9968A0AD
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:05 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3ADEB1A000B;
	Mon,  7 Jul 2025 17:07:04 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/35] cryptsetup: upgrade 2.7.5 -> 2.8.0
Date: Mon,  7 Jul 2025 17:06:23 +0800
Message-ID: <20250707090656.1216-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118248

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.7.5.bb => cryptsetup_2.8.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.5.bb => cryptsetup_2.8.0.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.0.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.0.bb
index 91ea446851..d69a9e0377 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.0.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d2be4395b8f503b0ebf4b2d81db90c35a97050a358ee21fe62a0dfb66e5d5522"
+SRC_URI[sha256sum] = "cc9e2d37c25a871cea37520b28d532207b0c1670fb10fc54d68071f63f5243a2"
 
 inherit autotools gettext pkgconfig
 
-- 
2.43.0


