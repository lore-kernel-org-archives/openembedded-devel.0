Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29FCC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3448.1784112021685138766
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FbnULqVc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112024; x=1815648024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9MpXR+ypGxfv1SbAPLuB+VAwBMNjWOowP5L/MOLWEDY=;
  b=FbnULqVcZejpyPM4VG0GyzxByWYsK5atrb8pbSPFZoK1mn4SGRhr1pRe
   4Na5KT8UmrfhmlOuCZ/BrZxOgW83MVlPIC9LrUwLDbyeOpEEkyR2XsoKb
   QHuwPVtPll183xL6gNME7VUz4kc4NEyjn8zOx3qhlwc7/UuVn2VJg0gxv
   rVR8fm4pnjXxxKv3V3pPF0efZeRb2+wduait8HTje5l7mqHB9kzO49Ce3
   ljND7DkB+I6ZhbRdqGRoH5LOdDL1TWbCYx5nZIsVoR/0NAUsyuuW5DVJp
   H4OKEY4nwXURT5noRht7j7ydwX3YAwep+KB8wn0bPeb+1EkbJhqan2654
   Q==;
X-CSE-ConnectionGUID: TalVVE62TaiCt3+8c8xmpg==
X-CSE-MsgGUID: V4ZmfBcsRW27f+3Py8OkyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="250999051"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="250999051"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:22 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1BE5D2B88
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:20 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B8263102FBA8
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C1C971800B81;
	Wed, 15 Jul 2026 10:40:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/44] python3-thrift: upgrade 0.23.0 -> 0.24.0
Date: Wed, 15 Jul 2026 18:38:58 +0800
Message-ID: <20260715103914.2120-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128201

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-thrift_0.23.0.bb => python3-thrift_0.24.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-thrift/{python3-thrift_0.23.0.bb => python3-thrift_0.24.0.bb} (85%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.23.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
similarity index 85%
rename from meta-python/recipes-connectivity/python-thrift/python3-thrift_0.23.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
index aed56e00e7..f59a38a4eb 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.23.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
-SRC_URI[sha256sum] = "5f43448a92c36ed6a450048355d10e231a1787e4c28965f08fabac0eb978914c"
+SRC_URI[sha256sum] = "9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c"
 
 inherit pypi setuptools3
 
-- 
2.43.0


