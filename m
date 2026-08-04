Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFF9C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10157.1785820692715304975
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kJOFyCg0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820693; x=1817356693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pl6jB/FsdTRWgosXsDxmR6FeW9nr/mSznPQwq5QTEnk=;
  b=kJOFyCg0Wbaok24pGO3seCy1vBmqDP+41MwbONCKubniCTHAhdIqoau9
   rRz+U3q6Wtclpt2ohYJla/iDz5XHMmPyZNSGk268xXyhsBfOH2P0MiyGR
   IyU8Duk/QMDvgYTjUn1bts4JlN2OV3PfOQhs/jnsSRGnj5E5u7/X86vno
   bARyf+LyXNAqyila6WEGdpGICzA7QyfXOtz+RXGpaWRwRsCdS/uhqLHF5
   93DtunEM52l7H7e07I9U95B0hYuk/2r69uMYWNSlMNyNjyJVPQGfZiIgM
   knXmEWIPQ+PRFQroADzosoZQguTJb5SM4L/gH48feRQPatMuePVRPv5/I
   A==;
X-CSE-ConnectionGUID: 03qNODXhSC+Cw1RFNReU3g==
X-CSE-MsgGUID: XYroI9JdR02bCct/6C32iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249616226"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249616226"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 022FBC01AFF
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:11 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id ACE76C02F05
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id AF76C1800B32;
	Tue,  4 Aug 2026 05:18:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/28] python3-cbor2: upgrade 6.1.3 -> 6.1.4
Date: Tue,  4 Aug 2026 13:17:08 +0800
Message-ID: <20260804051726.1489-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128715

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_6.1.3.bb => python3-cbor2_6.1.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.1.3.bb => python3-cbor2_6.1.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.1.3.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.1.3.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
index 9e6d7630f8..d7f08c6cbc 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "8d70680acb55c04ea5b5ad86da094f9612b53d5a8a65d0f5b3aafc3ce917ecbb"
+SRC_URI[sha256sum] = "01ecc79a28f33d17331943ce508fc1e21f4b06553c73f874f4c77120d72b2ef9"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
-- 
2.43.0


