Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C08AC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:41:12 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5050.1785303657480312500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 22:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pF098Ygs;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785303657; x=1816839657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tIb/7W3y94hxANwyRGsvEVPyQD1ezxNXI0GgCb0IZ5E=;
  b=pF098YgsYKSPwT7DSl/lRGF37Oijc49eOUoLeu2WZJx/tdw9B54S4G3+
   qbX7EkdsQc8RL18XXg3l1IhZ+gtWLZOVqCBPR7SONyQ3hUSwxEqaWTcbH
   ePkaFafXkGCD4n0d6RKb2uQUvM9ctT+rNSCpG/iwKZSUb4AqqKlqfKZSa
   C8X5uDERSebIn8QPEktoKYocG1zXDlnG9naxovisceufLwGoEkE3Lx99X
   /7R9jEj5HobnfMjTDbRqx0CNNpOv+mhpSvyHNddsXsOL9cHt0BvaKjzt0
   XeIU1Y6totmU2VUg91m7/Uxx96D5TFVXuK5gKUfvL4qN56x705ep+S0IT
   w==;
X-CSE-ConnectionGUID: GTYIoIRSRO+Us3Ji7GgZ+g==
X-CSE-MsgGUID: sMmhdJHPSvGwKu+7T38oRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="247117592"
X-IronPort-AV: E=Sophos;i="6.25,191,1779116400"; 
   d="scan'208";a="247117592"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 14:40:55 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 94ECC8200B6
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:40:55 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4F29FC07170
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:40:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 708851801111;
	Wed, 29 Jul 2026 05:40:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python-thrift: Use pep517-backend Fixes
Date: Wed, 29 Jul 2026 13:40:47 +0800
Message-ID: <20260729054047.1478-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260729054047.1478-1-wangmy@fujitsu.com>
References: <20260729054047.1478-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128541

From: Wang Mingyu <wangmy@fujitsu.com>

QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
index f59a38a4eb..5f2bdc6e53 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62
 
 SRC_URI[sha256sum] = "9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 # Use different filename to prevent conflicts with thrift itself
 PYPI_SRC_URI:append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
-- 
2.43.0


