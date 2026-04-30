Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4FFCD13DF
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17468.1777546255145746602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JA5HrDEy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546256; x=1809082256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ijOzf/gJORZ9SK2Fk4qYMgjyyWPYmZa9D8FAjTK8ViQ=;
  b=JA5HrDEynLKMzDO2RZUoj8/mUa7XbASBJ+o0p4L0pLhLD3zzoj/bNN3G
   7YrV2L7/45hWUhHwv/2hOtrv6WkEjFN+fKEfzVOl2vAnQ+Wn5SpNQBjWZ
   7FSSVdXHKkPOI4h3JT7LbYXymlEdIgF8ztLrBJOHo5AM6RnrAbIEo+p23
   RwcIgBvkxnaV5eXMUNJPAo/K7rEEyznOHv90CI0jXS5wivrE/NG/TlAUF
   1PUUMkypWz4H90eFujaPkmGm8MqbdfVp2dtNPPZyKKgac0wduCH9u7vtD
   h9CsHqs2jF1SHLsMpvowsl8NqSniuMrlpNnyTyFUsEMGa/FArBXBv7+we
   g==;
X-CSE-ConnectionGUID: IKtxLJZETGq45Tp6jkJniA==
X-CSE-MsgGUID: tVVq/sfHSKeZFcxAcTISMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552751"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552751"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:55 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 36C36C00091
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:55 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E4A28C0075C
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8B036180113C;
	Thu, 30 Apr 2026 10:50:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/64] python3-xxhash: upgrade 3.6.0 -> 3.7.0
Date: Thu, 30 Apr 2026 18:49:13 +0800
Message-ID: <20260430104924.1106-54-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126724

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Drop support for Python 3.7
- Build armv7l manylinux/musllinux wheels
- Build riscv64 manylinux/musllinux wheels
- Build android and ios wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-xxhash_3.6.0.bb => python3-xxhash_3.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.6.0.bb => python3-xxhash_3.7.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.7.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.7.0.bb
index c62595c4d1..57755cce74 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=82f3295151c5e61043a4a201c031a5ee"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "f0162a78b13a0d7617b2845b90c763339d1f1d82bb04a4b07f4ab535cc5e05d6"
+SRC_URI[sha256sum] = "6cc4eefbb542a5d6ffd6d70ea9c502957c925e800f998c5630ecc809d6702bae"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.43.0


