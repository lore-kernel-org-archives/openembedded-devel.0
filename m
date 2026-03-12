Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B3D1049509
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:17 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18758.1773312790653252746
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jtcCN6at;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312796; x=1804848796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K/HMYij1He9oGWcs8NGxmEVYsFdItgr7aaO5x1FEy6M=;
  b=jtcCN6atqPXoMA1Uo0cZ5XGM8dYD5BsalkElJvEP10X6XjpO0TSBocSD
   f7mcfu4T6N4EORQbaHGY8j78wSVQLPK+VDikXJhC2doeLI8PDA2Kt72jK
   0qdfq8NsJ83kDPVeZB6daf8t9E+EY2E9ZRLkeQkAo+nw5JpAGkBPpDWt4
   mngtHbFCToaz+v169fm+lC/HI1YkTuKDGhkIETEuRUpPVoBGUzP58RAUR
   7WgJ/VwA5IHUBPyUuUw7yIEorlHbtn7sx0nSWj/XGafbk0hGqHYT/5JHB
   BhfVTaViT/EM+b7CqHmqod1+KEUGeTMDl1qXMhjIzTCy0NWyklik3Anz0
   g==;
X-CSE-ConnectionGUID: zuaa/RSeSkGSSmjlu1Akyg==
X-CSE-MsgGUID: 66WmnpeJRHaQhL6vJKQGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211989669"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211989669"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:15 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A6F83C0040B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:15 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5C7C71809C28
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6052D1801925;
	Thu, 12 Mar 2026 10:53:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/64] passwdqc: upgrade 2.0.3 -> 2.1.0
Date: Thu, 12 Mar 2026 18:51:39 +0800
Message-ID: <20260312105220.1856-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125123

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../passwdqc/{passwdqc_2.0.3.bb => passwdqc_2.1.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/passwdqc/{passwdqc_2.0.3.bb => passwdqc_2.1.0.bb} (96%)

diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb b/meta-oe/recipes-security/passwdqc/passwdqc_2.1.0.bb
similarity index 96%
rename from meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
rename to meta-oe/recipes-security/passwdqc/passwdqc_2.1.0.bb
index 2b9356f60e..fc2ca6c4c6 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
+++ b/meta-oe/recipes-security/passwdqc/passwdqc_2.1.0.bb
@@ -30,7 +30,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ac99c8678577a1c2f9f04cccee411d5d"
 SRC_URI = "https://download.openwall.net/pub/projects/${BPN}/${BP}.tar.gz \
            file://makefile-add-ldflags.patch \
           "
-SRC_URI[sha256sum] = "53b0f4bc49369f06195e9e13abb6cff352d5acb79e861004ec95973896488cf4"
+SRC_URI[sha256sum] = "52fa12271104e74126145c6224b22b4a8dd32cc47de04c1e9fb8f348340df4d2"
 
 # explicitly define LINUX_PAM in case DISTRO_FEATURES no pam
 # this package's pam_passwdqc.so needs pam
-- 
2.43.0


