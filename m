Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E74C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 07:57:11 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4231.1784534225525142206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 00:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l/sx6TyW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784534226; x=1816070226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ETZjrx2oUopbOHcKIhnHDzmRNT2KDZEjcl1e/vfr4Nk=;
  b=l/sx6TyWPE7KNiNc0FbrVjPH+lFBD9oD9SpKTS1i9axc8yVCOga5GRon
   3joFvOrc4A3yMTWL6I2fWU7oHy3mZaOBHWVcI9NvH6HRZtlIuiEL5ItJ3
   r8QVI4WfOHY3/yWE/uhIIlkOslRAO5J+nSfmcoce0W2qDlfrmj8X4jt1T
   ZLtL44PL/rAm5f2lcm2iDzN2xUBoxLkW2Ec1u9og2fWlOb+XTSY66xgf/
   bXkhYFjI+nPF2fHSadromI6UBSdNFnid14VmNill6T51BBoWJVipm4mXa
   MS8TtlPd8SyXnumBGNa8YN3GOe8qQQ4gW6VTFEPSgq1BJM5Jn2sSl8TZx
   A==;
X-CSE-ConnectionGUID: P3wzoAF/Rm+NISDug/wzGA==
X-CSE-MsgGUID: sJreIiNRSaiY08TN7w222Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="247872940"
X-IronPort-AV: E=Sophos;i="6.25,174,1779116400"; 
   d="scan'208";a="247872940"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 16:57:04 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 73377C000BE
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 07:57:03 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2779FC0033A
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 07:57:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 49AF2404687;
	Mon, 20 Jul 2026 07:57:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tigervnc: Fix do_configure Error
Date: Mon, 20 Jul 2026 15:56:55 +0800
Message-ID: <20260720075655.2233-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260720075655.2233-1-wangmy@fujitsu.com>
References: <20260720075655.2233-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 07:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128276

From: Wang Mingyu <wangmy@fujitsu.com>

update version of xorg-xserver according to oe-core
WARNING: tigervnc-1.16.2-r0 do_configure: TigerVNC xorg-server version (21.1.23) is different from oe-core's xorg-xserver version (21.1.24)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
index bbe0f5c5af..c96ba2f40f 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
@@ -26,10 +26,10 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=master;protocol=https \
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "21.1.23"
+XORG_PV ?= "21.1.24"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.sha256sum] = "e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634"
+SRC_URI[xorg.sha256sum] = "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
-- 
2.43.0


