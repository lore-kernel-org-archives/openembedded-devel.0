Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EE5CA0EC1
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13438.1754296437615756567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MeGzocYq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296438; x=1785832438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s3Da0NmTPPHlNitKldr6DQGRd1DU7srX5p56lv+/ENI=;
  b=MeGzocYq8dYbmS1TfGPIyIU9mwED9VXFsP3HY9WVbHv/Jr8LvTpx0lk2
   pNi34VaHpe47uKJYJBF6sVnlCATexMH922MgCQgyiag+6KfIlCbWk09me
   V4JQAfIvC27y7+37/NPduCzpGe0ZKEhYGVK/kxjcwoHMoC2+fVh1vuPns
   e+PiFtEaZ2rDHOSa3Rsjbm3hkSxh2H0qxvgAVrGyd0QsrqKSjIOENU4JV
   Xsm6NuhH+6lMhJqAvdH/CMKYNWoGKlrsQ6EI8nUz6d1x1axZrx1iglAu5
   If68S055j7CKCZuM8CwhaDEjJtA11/o6ZLvHM8eS7hQzbubHT25wc4hql
   g==;
X-CSE-ConnectionGUID: Xvh9jQhPSP+LqeheJgsUCw==
X-CSE-MsgGUID: ltHuj+EkSt28e1wNWukgoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="187291964"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="187291964"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:56 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 0CEC71428
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:56 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6E8EDC012A1
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 795821A008D;
	Mon,  4 Aug 2025 16:33:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/18] python3-bitarray: upgrade 3.5.2 -> 3.6.0
Date: Mon,  4 Aug 2025 16:33:30 +0800
Message-ID: <20250804083340.1649-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118841

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- add 'util.random_k()'
- add 'util.sum_indices()'
- optimize 'util.xor_indices()'
- move development files from 'examples/' to 'devel/'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.5.2.bb => python3-bitarray_3.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.5.2.bb => python3-bitarray_3.6.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.5.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.6.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.6.0.bb
index 43ea07173c..83062317e8 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.6.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "08a86f85fd0534da3b753f072c7b0d392d4c0c9418fe2a358be378152cf6b085"
+SRC_URI[sha256sum] = "20febc849a1f858e6a57a7d47b323fe9e727c579ddd526d317ad8831748a66a8"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


