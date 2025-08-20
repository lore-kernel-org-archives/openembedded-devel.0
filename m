Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B031ECA0FE1
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.15383.1755679203411207527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dIB/0AQT;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679206; x=1787215206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/389lpf2T67l3/2u/uJc+2+HXTOOSsor77jiLTp7Ai4=;
  b=dIB/0AQTgLnLILN8AINMgRpl8Nq8Bw7LOHhfcDRa6HtXxOWoG+RDmCeA
   PhKL220Vt/uFtbCCvYJy+RG5fmaqDt9bM8tXDWaVywOq9lgqjOWvr47Gt
   FObLL8EvV4QOUripW2AszenELzpLzlq8KIx840ty4KknbxL9XWwLFCTpV
   EPC0DQ8UGWLxnX8iwn8r10W/7quOiDGDUCs5Cf4FTwzrdCKfSMYy8gJb1
   2gTqssS0RlS8ySOmXRo8f7Pd6tQmKxwn8NtCfAmF8Xsw2nstB7vD6Y1PO
   JXB8WXDVWMqRSdVFSD01ww7cKzSQ/nckCwknEIGzKnTuz4WqVSLWxxxSD
   g==;
X-CSE-ConnectionGUID: jqFscASbTGSst99cGTsnOA==
X-CSE-MsgGUID: sYJv6+ZzTvGTG7JGoNXnLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="198519921"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="198519921"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:06 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E472A1002B8B
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 995088D65E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id A35021400BD4
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B9E8D1A000B;
	Wed, 20 Aug 2025 16:40:00 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/26] python3-cantools: upgrade 40.2.3 -> 40.5.0
Date: Wed, 20 Aug 2025 16:39:39 +0800
Message-ID: <20250820083945.802-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make Exceptions Picklable
- Add cantools.db DeprecationWarning
- Logreader: Parse more information and all CAN bus messsages + Bugfixes
- Use new python-can functions in monitor.py

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.2.3.bb => python3-cantools_40.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.2.3.bb => python3-cantools_40.5.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.2.3.bb b/meta-python/recipes-devtools/python/python3-cantools_40.5.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.2.3.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.5.0.bb
index 0e7a692200..5b8233b737 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "3c55cbd7d7d527a565b98123fbbb8f5df09132f74ceb722ff541fd80b5991424"
+SRC_URI[sha256sum] = "029706310d89e186631489d6d959608b7c6c4727eaba6eca48d49ab5bfa1b277"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


