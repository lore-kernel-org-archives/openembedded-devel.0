Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3DEC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:01 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.78445.1749526440278069450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CLqGHVMH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526440; x=1781062440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3XmM6fGm5LQEVzj4d+wYn3EVdikNFzZGJM4NQsimQVA=;
  b=CLqGHVMHXm3WwKYnstgyq4JT5dLGqEI0E+fLbFfMSJJOGRJRClcKzfft
   lfpBQnI56x+5QaSjAfmaIt3HwtHXTn7dkz0Raa4uE14Jyyo302GEEi86Y
   s7g2GuWudRC0qlWhivIzTyQMfSzDpQb6JFH9PhQ108kZ8EVqcMoYmLS6f
   Kmmc8WKHAOibTXrNMuX0FN7P5wuKbFBlYTAx3WIYe/LaHsL/4z46DnMxj
   3+Co/Mp+ToW8KAyYzx1sSesoeVYrZNGqFfx24s9IZXBL4STHGvV4N+ws7
   M1lHKY02UASthHLJ0wvA3lQBjJLNBS56e6C5tjGxtzO6bOCJWoBvL3OR2
   A==;
X-CSE-ConnectionGUID: kqM8zWcARDCRkAN7l228oA==
X-CSE-MsgGUID: cc3NH1ilTRyCmU27T3mZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181715004"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181715004"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C90E2152EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A390BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:54 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ECEC81A0071;
	Tue, 10 Jun 2025 11:33:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 55/64] python3-typeguard: upgrade 4.4.2 -> 4.4.3
Date: Tue, 10 Jun 2025 11:33:21 +0800
Message-ID: <20250610033330.924-55-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117854

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed @typechecked unable to find the target function or method if it or the
  containing class had PEP 695 type parameters on them
- Fixed handling of union types on Python 3.14
- Fixed __type_params__ getting lost when a function is instrumented

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_4.4.2.bb => python3-typeguard_4.4.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.4.2.bb => python3-typeguard_4.4.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.4.2.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.4.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.4.3.bb
index 4d208cb8c5..42aa7f228b 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.4.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "a6f1065813e32ef365bc3b3f503af8a96f9dd4e0033a02c28c4a4983de8c6c49"
+SRC_URI[sha256sum] = "be72b9c85f322c20459b29060c5c099cd733d5886c4ee14297795e62b0c0d59b"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


