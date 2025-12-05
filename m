Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18326D2CE13
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 03:05:12 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62070.1764903907416234961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 19:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RPRW+tk9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764903908; x=1796439908;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tjrVVCStIMNYSJXbO1I1XgBK+eGjUMyCsWOCPXybDXQ=;
  b=RPRW+tk938/tAk8MbQ+RnMCa6/eC7255huX8ZJXmZmp5lXTKG+HqJCSX
   d9b639tfEac/oVO94rvVDxzqJasvdpctJq2ope8+MgoJLmI5AnIDGSpyz
   GE/nLhWMhsDMa+gAKedQ0OaFLY4oH8WZMKL2jnHaKj982vNBZ3mh+uUHg
   j8XKNU636cmr4gQEr+/SkILGfyF5/d6eFnJWzbCdBrkpcQ+m7TyQXEPFT
   bM8Aw0bQ/yYBPxY2t4ynaxcrhzNS+XUhsONE8D3kF01DlsVmZ0xi5fmG6
   60Vk+ewgaCVXAjJVrDN9rhFWVTLVpgHIPkNT8EGJiH6x1fa+97BvS1pj0
   Q==;
X-CSE-ConnectionGUID: zdZyL+GcTHeo1X/IL5h1Hw==
X-CSE-MsgGUID: PcWlVD7OTt+l5VnDQEiekA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="220937344"
X-IronPort-AV: E=Sophos;i="6.20,250,1758553200"; 
   d="scan'208";a="220937344"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 12:05:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B6EAF4071C1
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Dec 2025 03:05:05 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6B70D1809AE6
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Dec 2025 03:05:05 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 1F79C1001CCC
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Dec 2025 03:05:02 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/2] xdebug: upgrade 3.4.7 -> 3.5.0
Date: Fri,  5 Dec 2025 11:04:52 +0800
Message-ID: <20251205030452.16976-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 03:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122332

Change log:
https://xdebug.org/updates#x_3_5_0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-php/xdebug/{xdebug_3.4.7.bb => xdebug_3.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.4.7.bb => xdebug_3.5.0.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.5.0.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.5.0.bb
index a3947a8801..b07546d521 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.5.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24"
+SRC_URI[sha256sum] = "f6daf55a5c7adadb07dd2af25ff78b1cc9b1c58d6cc442a463eba015b678aabf"
 
 UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
-- 
2.43.0


