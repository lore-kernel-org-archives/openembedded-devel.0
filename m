Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1ACCA0EFE
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.15255.1755679204336650566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EhCrT7RA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679207; x=1787215207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uJfBn12jZVy/+H1mzM9T1VaIirrWwWchi3+HRCic3oU=;
  b=EhCrT7RAvNbDuMF1o53xmrtEhkiANsORi/ccMqOMd2nuPrkaGSjNOeav
   64fKNcOFVG6ElwigWH0OjuZWv+4MCUtcC2HCWScnXd7SrGUyEs55hDA7V
   PLBNlikJNEKiflp/CgTs9fbsQJjw/wbXvhimWHZd2T2Vy3HQi7u4Rh5P2
   xLCXKDh0S+3CTy05BTA5n+9Vbmc4SJVL1NH3qMkNHUvne5a4Savf3elE+
   3d78We2i+mz7fgAf9JuBRoYsQQNjtLXOcGT2D8yDmK1RWmYSI6G98uOvT
   PM7XfUUP3h0ngWgeC7nibypSEnsUuAW0UA2mDAnL8SH+RtQRJDsC4Uhet
   A==;
X-CSE-ConnectionGUID: f0W828FoTFyGwkWFM1gqWg==
X-CSE-MsgGUID: DAuqfAPRTjKwnzWOSVTUbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="209365720"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="209365720"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:06 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 5E8301002B96
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:06 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0DDE28D65E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 11CAE1400BDC
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 267C31A0073;
	Wed, 20 Aug 2025 16:40:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/26] python3-cbor2: upgrade 5.6.5 -> 5.7.0
Date: Wed, 20 Aug 2025 16:39:40 +0800
Message-ID: <20250820083945.802-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119032

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added support for Python 3.14
- Dropped support for Python 3.8
- Added support for encoding indefinite containers
- Added complex number support (tag 43000)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_5.6.5.bb => python3-cbor2_5.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.6.5.bb => python3-cbor2_5.7.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.7.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.7.0.bb
index 834bad6865..4fe60c87c9 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.7.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "b682820677ee1dbba45f7da11898d2720f92e06be36acec290867d5ebf3d7e09"
+SRC_URI[sha256sum] = "3f6d843f4db4d0ec501c46453c22a4fbebb1abfb5b740e1bcab34c615cd7406b"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


