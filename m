Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557E2C369CF
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.14609.1744794150722222430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dz2nZJ43;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794153; x=1776330153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uFGCYlxFmhZdNwPDnYCBh0qF2BrggppmBZN6QEk94P8=;
  b=dz2nZJ434rvy/onFQCLQplnPHcXmcH7lMskMeQUnMPKS+CdEnCXw+k7v
   ETMPNdvdnW+mNMT47HW4Onnwi2JOoy0trpJhMXdODTlglkOs50ejsnVZL
   JaLkz1530vbh47FqWUbKT7E2v+3QyZ5QIBg7HGpIZt3cyQZ/ydc5fNzac
   IdJwBUtwQX5ibCpBHCTPFvcmWcoUVuptM/5/AUj0Iobtk8DIMGLYJmSHU
   B9plB8KK7lsdixs5Mt7Px1sQbFLP/gJljIxq5jHNyjjwhJGh63z3sgn1I
   aGi3XDCetpucHZL6J29qcmDpqU7ZKorKzk/8LSLlLl7fNUDqOzLaNzpAp
   A==;
X-CSE-ConnectionGUID: I+xW1vDeSk29WYLK/rsGyA==
X-CSE-MsgGUID: GEd1a98KSLmR1HYeGNjDBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="175523877"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="175523877"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:31 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 74049D5011
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 322D7D0619
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BAC231A00B1;
	Wed, 16 Apr 2025 17:02:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/31] python3-greenstalk: upgrade 2.0.2 -> 2.1.0
Date: Wed, 16 Apr 2025 17:02:01 +0800
Message-Id: <1744794136-908-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116885

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-greenstalk_2.0.2.bb => python3-greenstalk_2.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-greenstalk_2.0.2.bb => python3-greenstalk_2.1.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb b/meta-python/recipes-devtools/python/python3-greenstalk_2.1.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-greenstalk_2.1.0.bb
index 33eb62d5d9..5b87f39f12 100644
--- a/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-greenstalk_2.1.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/mayhewj/greenstalk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f"
 
-SRC_URI[sha256sum] = "3ebde5fc9ecf986f96f6779fd6d15a53f33d432c52a2e28012e100a99ee154a4"
+SRC_URI[sha256sum] = "a731ca15bc3b03dfffc438db08c96d0c4e8ce5f472403573e40a1939791c12a7"
 
 RDEPENDS:${PN} += "python3-io python3-core"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta python_hatchling
-- 
2.43.0


