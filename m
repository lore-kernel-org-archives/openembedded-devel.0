Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787D9C54736
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2880.1722934012727295909
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DwX/EBjO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934020; x=1754470020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GHh1P+lHe63dkBxPIUV1HBnAV9obhm9wseHZAzW7XZk=;
  b=DwX/EBjOU5AMue9wUJCGPoHcMESd69zBkTapOJxKZsJNgQ/kkoUI/x8p
   WO2s7hHc1iBt+DKHVFG7KxpVEhPFCKRmXUI4h/YdXBetOmvJ5DpLkFmzq
   etoOF9Q3qekaamG58lo2UKePxV/8pmByaAKtfrWyoFwmG8U+HsJqmvYXu
   xyVCqUa4cNxAj6s3pB0g411vZXX48XKMS+v6fTjihHbvzm0CoAGoCz8DQ
   KYjuVg8FnVOpbsIZe2GaZKbBunsWmOiJT7mZVob8jr7FAbfb3/i2FEgJp
   WQWHDrFnqRcu6yagmkXH0fRJJZ0zOSBnqV02lF7ymIqR9SBgCMKTusjkE
   Q==;
X-CSE-ConnectionGUID: 3t1w2fo1SCqlL5pkzuBsNw==
X-CSE-MsgGUID: G0OKrE99TomnMjH4X/I0jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169882447"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169882447"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E9D3C68E9
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6832DCFBB4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EDB40401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9BBF21A000C;
	Tue,  6 Aug 2024 16:46:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/60] msgpack-cpp: upgrade 6.1.0 -> 6.1.1
Date: Tue,  6 Aug 2024 16:45:58 +0800
Message-Id: <1722933994-32549-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--1.880000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy/ZZrSv3M8S0OwpfLMeBwRv4qCLIu0mtIHXHQq6zBeSUJ+m
	KA5rZIpiESVL06fzYO9wU8VHXGipCHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6/U5
	3ew960i7oAkEoAQfIFgMZ3r69aGOJVO4haGHxs019pLGPDjBCPPeP4gSHUpukZyzYDFP8saHi1c
	Zr0LFQMqkw4pbSqLd6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111539

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../msgpack/{msgpack-cpp_6.1.0.bb => msgpack-cpp_6.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-cpp_6.1.0.bb => msgpack-cpp_6.1.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.0.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
index dc866d6d0..ccbaf9cea 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                    "
 
 SRC_URI = "https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/msgpack-cxx-${PV}.tar.gz"
-SRC_URI[sha256sum] = "23ede7e93c8efee343ad8c6514c28f3708207e5106af3b3e4969b3a9ed7039e7"
+SRC_URI[sha256sum] = "5fd555742e37bbd58d166199e669f01f743c7b3c6177191dd7b31fb0c37fa191"
 
 UPSTREAM_CHECK_URI = "https://github.com/msgpack/msgpack-c/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


