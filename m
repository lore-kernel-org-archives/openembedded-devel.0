Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ECECD6E46
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16964.1779875370657045630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PDH11W+u;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875372; x=1811411372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OlTqYdMyHjNhWDgVSFCwBLf5IivwBRn8zI/EoTzhKfY=;
  b=PDH11W+uTUS+ddwoMA+q5PZhsimdc6ECLlGHcJ1ynRYlrrNIOj9OTYj8
   LKI6k59M7FB5kAykbsBf3lmTkvRQYkYLt9CYCAGW4DUxwXJnka7CybmNo
   vp7OCT/TQpeK1uCZu1SZwVxUGZRyLY3AbBDvEC57td7Smu+xDJHttly5x
   Ad1wujV2eCXIdiQIoKBgygm/i44ppEOnADuJal0NrwbdyzcPwLWVUH34u
   g3M4wkFeGLty1FFOXxm99VE4+O3qBh7fSiofiGLigxOTrKnBOpr5zSMY7
   UDYrKV5bKKptugRWI83iAMo8iaBjCpXtkG+hhexTm1X0YVpCAxX2S5OQ9
   g==;
X-CSE-ConnectionGUID: FcnZCj9TR/iiAVaKq6odgQ==
X-CSE-MsgGUID: DNT6kmIcQESazkoD0m+0kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="242050138"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="242050138"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:30 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D5FA7C006D0
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:28 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8BE9AC38B3D
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 895C782A2CC;
	Wed, 27 May 2026 09:49:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/56] python3-sqlalchemy: upgrade 2.0.49 -> 2.0.50
Date: Wed, 27 May 2026 17:47:52 +0800
Message-ID: <20260527094805.2039-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127250

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.49.bb => python3-sqlalchemy_2.0.50.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.49.bb => python3-sqlalchemy_2.0.50.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.49.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.49.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
index ecc9099e30..aa14e1570b 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.49.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=53a9111717b305b0fae0d704a24925c3"
 
-SRC_URI[sha256sum] = "d15950a57a210e36dd4cec1aac22787e2a4d57ba9318233e2ef8b2daf9ff2d5f"
+SRC_URI[sha256sum] = "af5607d11ef90fd6a5c0549fe0045dce1663d427426bcfb506dcb5346a85a3b9"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


