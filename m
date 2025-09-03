Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DCACA1016
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7942.1756890237538199410
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cx6Woq8s;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890237; x=1788426237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DXl9Qzx2P4bsRHw+O/Pkoy7SVjNU+fp5FvE+cKNuDbQ=;
  b=cx6Woq8snivof+gVsbXAqF6fWTNjgbrh0ZQ7EYmGJFdD+RmDbjtml+9j
   yIysnTjlLh+EMbNQ/aCoDk/vqUrl/EYaQkFiONOiNjA4o3PMrZl/QY26R
   q/i6oIhG1jiQmLqKz/+b+/uaYnohjurS85zit7UEsTfYnm31op4RbiM9y
   85UE6qnaG1gMvTrEkZZaVSZ114+xdoHqaoMM/Oo0xEjkzFLnGTnSVVwkw
   c5JTSCkSMT/bhQdB6BM4jZF6//CP7+zj85g8nv3kLECrg+6GkYkKYHU02
   FX4FiKqdDKWmjlJ291ggFrdVYL8XBBxfFLFsQQ+s75qHTwK00yimeioIy
   g==;
X-CSE-ConnectionGUID: oOhrVgOLSPqFUrhTYGGyZw==
X-CSE-MsgGUID: AZ3SL+QYSjeu0dBJ8TGXNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="198903379"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="198903379"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:56 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1A7F2100034B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:56 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C8AE7115071A
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:55 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id BC10C40CDD3
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD95D1A008A;
	Wed,  3 Sep 2025 17:03:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/56] python3-pymongo: upgrade 4.14.0 -> 4.14.1
Date: Wed,  3 Sep 2025 17:03:04 +0800
Message-ID: <20250903090317.2002-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119242

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.14.0.bb => python3-pymongo_4.14.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.14.0.bb => python3-pymongo_4.14.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.14.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.14.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.14.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.14.1.bb
index cc6b64ed38..197c31835f 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.14.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "15674e3fddce78cf134fc4e55f90abf1608a48430130cd35efdf3802fd47a1d1"
+SRC_URI[sha256sum] = "d78f5b0b569f4320e2485599d89b088aa6d750aad17cc98fd81a323b544ed3d0"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


