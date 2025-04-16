Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDDBC369C4
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.14427.1744794157274341254
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VN86nL11;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794158; x=1776330158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bapMnUM+azyvxAEv+7V43j079DECwDTgy6gNP0wtteA=;
  b=VN86nL11pfw6U1o6i9ZANB7Kc1x/AOLE9/FwIbjmhe0SwVIviTbPpbX1
   +ZAAzfX6WZIQKZUBTs32jLGv47SMUUTewHlf4r9cgUjbhaDXHxm5F/Mxw
   LCJvpoYW7Q5IVJYGOM/JW+XBeTiLAwWVsR876baT1uAyJ744AvTFsUq1q
   ZTaa37B0ojpvy59FANysO1wdM4AV/q5ja6F+C+36r+CBPVRyCz8lRUVou
   1O0N62AbgCjgZglIiGT2hoBnjWIR+8Bxvkw1A5htV1hmOhngGK0+3wZ/U
   GAHI5gVvOTbR7W+DQvoCSjt7DiqQJYOB/yA3F7OB9C90ro0UK1fHLMS3y
   Q==;
X-CSE-ConnectionGUID: 42mFnEv7QjC/76yrAvzVzw==
X-CSE-MsgGUID: kUYucFzcQ4epJmGncxXnlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="195806413"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="195806413"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:35 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CE195E8521
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E6E915A5A
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2461B1A0078;
	Wed, 16 Apr 2025 17:02:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 29/31] qpdf: upgrade 12.0.0 -> 12.1.0
Date: Wed, 16 Apr 2025 17:02:14 +0800
Message-Id: <1744794136-908-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116894

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_12.0.0.bb => qpdf_12.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_12.0.0.bb => qpdf_12.1.0.bb} (92%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.0.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.1.0.bb
similarity index 92%
rename from meta-oe/recipes-printing/qpdf/qpdf_12.0.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_12.1.0.bb
index 538faafb5c..8a64ed70a7 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_12.0.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.1.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
-SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main"
-SRCREV = "f84bf9778d141f2392c810eed340ade1eda5e421"
+SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "51fa3b523837afb18d9a86560bb2fb9979db1b95"
 
 inherit cmake pkgconfig gettext
 
-- 
2.43.0


