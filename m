Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBADDFCC9DC
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 08:22:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35471.1773130948281609794
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 01:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SEQN+T7o;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773130948; x=1804666948;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2BqvWGyk1zvMzRkd4h3NyCsQITvykJ+8LyV9+FGsPD4=;
  b=SEQN+T7oI79pc/LvDGm0zPcL0GB70jbxfqspEz2cp29GHArsWdEVwQ7e
   kuXhTJGTMFgJ2KApq93UulIfaRFTgES5eAuTV3K6B6vbc64ybBSiyTNkY
   wYIjaBeOxvqV1HIANLBHRUtuWtOPC+M1E78N7aeS5xX6K8BDvFHQdpwxJ
   vwbOQ8wrPO80fw2Q6IqSdnMXnGYRRdwkoMOCfc56holAb85mJOjoWjYni
   MtQQd3+JSQk4ljpMO/u1i6MfdNqIcb5ehOabdYdmFUDiPregdbB2kYUwv
   TU51kNFRxgZe/BSPNuyXS+w0407IHukj9Wt7RgZGuz4B3Gdbds6jeM247
   g==;
X-CSE-ConnectionGUID: j+EOjfHZTcWApF7TsrNGPQ==
X-CSE-MsgGUID: R+Mo+JaIS12+kyUoEqr1Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="232081615"
X-IronPort-AV: E=Sophos;i="6.23,111,1770562800"; 
   d="scan'208";a="232081615"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 17:22:26 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DAE711C00186
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 8A0F91000458
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:27 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 53D3310005A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:25 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-xmodem: upgrade 0.4.7 -> 0.5.0
Date: Tue, 10 Mar 2026 16:22:19 +0800
Message-ID: <20260310082221.871-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310082221.871-1-liuyd.fnst@fujitsu.com>
References: <20260310082221.871-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125020

bugfix: retry_limit was never actually triggered during the data transfer phase because errors never accumulated, and

enhancement: replace 3x getc() calls with a single recv() call, reducing timing and failed packets when using fast serial lines without flow control.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-xmodem_0.4.7.bb => python3-xmodem_0.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xmodem_0.4.7.bb => python3-xmodem_0.5.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb b/meta-python/recipes-devtools/python/python3-xmodem_0.5.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
rename to meta-python/recipes-devtools/python/python3-xmodem_0.5.0.bb
index e41afb56c0..55305c6cb9 100644
--- a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.5.0.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "XMODEM protocol implementation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90bc9522130d68de0dcbf33707bbf124"
 
-SRC_URI[sha256sum] = "2f1068aa8676f0d1d112498b5786c4f8ea4f89d8f25d07d3a0f293cd21db1c35"
+SRC_URI[sha256sum] = "a1a818f31c29412f1cab0cd69deccd7be77bc1feb516723af990d00161f6fb6a"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 do_install:append() {
     install -d ${D}${docdir}/${PN}
-- 
2.43.0


