Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D6F10A3D78
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46433.1774526283721514317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b9wCDWoB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526290; x=1806062290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0OzW2dsjXMSQmmBIGvB5990Vn3MvwaLyoeUailW4NQw=;
  b=b9wCDWoBEjijcDvBQ/TkToIBtrt5/ihyoPkLZZzImWe7mG4mzGTkMskm
   TDcxtjK3jMEoiCDXuFO1AdpnohyJ6aT/AAalwJsdCv10Bk/cwwDekPm9f
   uMGCCaRTO4THVDdMZWLE2KiyutRiZ47spGTnq2L5I+mkaO7tbaAkUL9iR
   7gCE3bTpOMUpmNzC0T500iPAbVhKyyZPAMzokcZuugueZTypL1LHRCKta
   jJChaxqkhwj1OBP+pLB3ORanH30kkWn6ZXxIA5cHsli/z04zQiXdQmhje
   IU7ynz/chhVD3WZ4dxrc6m9uVQ+3KLVEm5gozHaLiVFgcJt/qri2+3JZT
   g==;
X-CSE-ConnectionGUID: RMDN9aRGSmuBLZNpf11d5A==
X-CSE-MsgGUID: uQuGDgdPQl6mwekLLEZxHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="235420923"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="235420923"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:10 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6BA777330
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 16D0CC00D6D
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8D76B1807148;
	Thu, 26 Mar 2026 11:58:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 56/63] python3-virtualenv: upgrade 20.36.1 -> 21.2.0
Date: Thu, 26 Mar 2026 19:56:26 +0800
Message-ID: <20260326115634.1199-56-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125711

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-virtualenv_20.36.1.bb => python3-virtualenv_21.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.36.1.bb => python3-virtualenv_21.2.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.36.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.36.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.2.0.bb
index d5fad314fd..dda29c549d 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "8befb5c81842c641f8ee658481e42641c68b5eab3521d8e092d18320902466ba"
+SRC_URI[sha256sum] = "1720dc3a62ef5b443092e3f499228599045d7fea4c79199770499df8becf9098"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


