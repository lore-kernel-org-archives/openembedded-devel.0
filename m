Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCD4C36008
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4162.1741683327332887572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OqXq3I6G;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683332; x=1773219332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HeA+rfqMeiU3OG5zsXPqDzm7U3uwJwbqYMrVNH9vtyU=;
  b=OqXq3I6GAMu37nl51q+vqJ8ZHzvG4d/n3WJw8OAseLGTYi6xwzv2lL+Z
   /E9qAuSjr0Ua0S/Lkv9U+8tkpbqFItc0FLLG6KUlAlIswAOLpA8gNO3aA
   XlP3dLZBPX9dbJWOAsNef5rz0DcPHZU+k1fATLqwiL4yGMBWjuYY/M5Qw
   Nti/E/5Jm6LvVRXgU1IuPfSiQ9EByBSO27MV9J6++irnMztR2PiYwR780
   AWTBi7xsmYRy4rg615+UZUtK8MoW1xM0ley55gVG/50+kb3RApr8Vjksd
   6X1jvpFIllaXj4y3+I6z1leLJ5mjB5sl6QaWH4dnocDmUSWIo/D18vQ95
   A==;
X-CSE-ConnectionGUID: zxQcoxVvSaOn7bvEY39cuQ==
X-CSE-MsgGUID: ARalUpbgQ6q1VPTgs1O/RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192660319"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192660319"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AEB0E8528
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E51F8D50B5
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 39DBC1A0071;
	Tue, 11 Mar 2025 16:55:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/36] python3-bitarray: upgrade 3.1.0 -> 3.1.1
Date: Tue, 11 Mar 2025 16:54:49 +0800
Message-Id: <1741683310-8681-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* updated 'pythoncapi_compat.h' for pypy3.11 support
* use '__builtin_parityll()' when available in 'util.parity()'
* add 'parity_64()' to header
* simplify some tests
* add LFSR example

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.1.0.bb => python3-bitarray_3.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.1.0.bb => python3-bitarray_3.1.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.1.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.1.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.1.1.bb
index 4e82364827..c07c52af89 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "71757171a45eac58782861c49137ba3bed0da489155311857f69f4e9baf81fa4"
+SRC_URI[sha256sum] = "a3c1d74ac2c969bac33169286fe601f8a6f4ca0e8f26dbaa22ad61fbf8fcf259"
 
 inherit setuptools3 pypi
 
-- 
2.43.0


