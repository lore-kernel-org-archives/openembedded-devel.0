Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BBCC83F1B
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.56137.1751879237138472344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pKVLnKNG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879239; x=1783415239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DCtrf59B8xsoqDBR9lzeEgITygszaSD+vhZDJXhCO8I=;
  b=pKVLnKNGapE2LJRfrzqlB/vju5K+TsxqkwM5J9/m1TrSO83ewdzSbI1T
   zVrjcBC0sZ9VwGFHIL2NxmPfQzxK24xNfKNV+E5UyyqbEtXmbWoFtLd/8
   ScsEMvOaTTggm7Ivc3F+EAJXSVVreSL7yBTZqFMHd88PRUuQu5iRRlWtJ
   L98Fj3bj4wEZov2HUvvVpE8xRRJmxxRhpflhbwa5R0Xk79mZuv7hy0dnE
   y/M6PZ2r13v++sBPkQpBO0GIpRt+jh80e/uHaYas3+GnE+8TD8E7YvNaW
   72J1yvtIxcN4ad/NQsp7ll7CyyVtTg7TL3RrE7xhvbfvDXrEmfSAn1MgA
   A==;
X-CSE-ConnectionGUID: AOu/CcYoQP+1aq+jqRYotQ==
X-CSE-MsgGUID: +WQg4DiiRlKRIOMivBpwWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="206006881"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="206006881"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:18 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 2A9478203CE
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:19 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTP id 9F480C02465
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EB52825B93E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:16 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 291BC1A0074;
	Mon,  7 Jul 2025 17:07:16 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/35] python3-ipython: upgrade 9.3.0 -> 9.4.0
Date: Mon,  7 Jul 2025 17:06:43 +0800
Message-ID: <20250707090656.1216-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118270

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.3.0.bb => python3-ipython_9.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.3.0.bb => python3-ipython_9.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.3.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.3.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.4.0.bb
index 3fabbb1606..a174b969a4 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "79eb896f9f23f50ad16c3bc205f686f6e030ad246cc309c6279a242b14afe9d8"
+SRC_URI[sha256sum] = "c033c6d4e7914c3d9768aabe76bbe87ba1dc66a92a05db6bfa1125d81f2ee270"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


