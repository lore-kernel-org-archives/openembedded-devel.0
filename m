Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861D1C5B555
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.6739.1747817996288026139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=of9o+W7z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817997; x=1779353997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DvNcO0Djc1xuVneRY4irsyIFfiQLTR9+GP8i19CUtlg=;
  b=of9o+W7zfBKhtOS9wZH7mVTBPPpwbmIVUxhMqR8wAq8mBoezQWmBoPwY
   JhjTldXJ19FxiJLJNw9y3mB4ia0stmVAhl1cV70TIPjk4elc8CK8H4ztM
   c6EjvTag0kV7Lwos5zIoNBd94tvLmeGAWqNjVWJN/3gU8pMDJwGuxB4hz
   YGabCtaD+dAc5CFOd542x2c6bBdMprvhSIDnJc99K3oAQg3uJ1sfNXcMF
   PanQw/WgObLPzu+sMkFcervjCumSDvChkVB4QEaJH/9Jl/k+wOcDiuG3X
   wcd8ykBbFlabORXa3/2aOgt1oq9XhKpQ/jVFNF8IFKcD+3p8LZoRhhcv/
   w==;
X-CSE-ConnectionGUID: 4/OByMLITDSaBowzxaFiwA==
X-CSE-MsgGUID: MxtGLyIpSzSlqgYmd08Tbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188157663"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188157663"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:56 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B5A07D4C24
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 73410D6E2F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 070CB1A0078;
	Wed, 21 May 2025 16:59:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/43] python3-gspread: upgrade 6.2.0 -> 6.2.1
Date: Wed, 21 May 2025 16:59:03 +0800
Message-Id: <1747817972-28874-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117538

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix public API auth snippet
- Clarify the first step: authentication
- Fix typo in community.rst
- rearrange flow to remove reference to creds
- switch safety for pip-audit
- Include the duplicate column names in error message

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_6.2.0.bb => python3-gspread_6.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_6.2.0.bb => python3-gspread_6.2.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.2.0.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.2.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_6.2.0.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.2.1.bb
index aa70c04760..950467ab19 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.2.0.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "bc3d02d1c39e0b40bfc8035b4fec407aa71a17f343fc81cc7e3f75bfa6555de6"
+SRC_URI[sha256sum] = "2c7c99f7c32ebea6ec0d36f2d5cbe8a2be5e8f2a48bde87ad1ea203eff32bd03"
 
 RDEPENDS:${PN} = " \
 	python3-google-auth \
-- 
2.43.0


