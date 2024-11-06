Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8283FD29F8A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:33:04 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.40153.1730874774528984690
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VVWV7ZxA;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874774; x=1762410774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FDUjHf6Hkmc/3PDxplaMlNrDpUfyxynwtsDUiKDGA0k=;
  b=VVWV7ZxARb0OLclVc5KVCMWZOrXIc1NsKKA+fEQV4v+DdJeA5xoAREBJ
   xZIinNwpGoHruogPQ0mFDk9y1f/1qPjmavPwG1mQPHC9Uv2ehjHWl2U0e
   uMKTaELgxhd4wOR2RcL8t81H7xdcGOt8HVR7E5NT4SlmtPBuFQsClGikn
   rJ+aRPPcY+gIX731yCgW9PhEJZAxKBEESVtahyfRwWuMcvqSWFuXbGRK8
   Bqwycgm5/z1CqqAOPtpCp5LVr179CjJQvZXbizNxuX1Li1EJQ3/QGwPDn
   U79qWPW1wV1sZmveboaoqqO92nbDIYFAHge7N1fsXbFYm0mnsskajfY9G
   A==;
X-CSE-ConnectionGUID: 084Ug5V/RzmQjqh18tDK+g==
X-CSE-MsgGUID: AznkZKwkSguNuGm1ElZ3cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158275697"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158275697"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:32:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5963BD64A6
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 96CD0BF3FF
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B9B36B5E7
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CBD0A1A000A;
	Wed,  6 Nov 2024 14:32:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/46] python3-whitenoise: upgrade 6.7.0 -> 6.8.2
Date: Wed,  6 Nov 2024 14:30:55 +0800
Message-Id: <1730874660-2364-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--2.825600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyud41voTK+t/GsW
	ZV9YMDBbj/bvtfhhXEuZRUYsM1FLyLgxNyA1EkeRuce7gFxhKa1UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmibAGOCaWkxjueAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDgfbmnKc4mBHf4iFjMM9OdiYe2qNcwDN5w7uWICNUaJbZtkn7dJGa/KWjHgOMwF4EsLCy
	6kK7IemIcIqHMsMsJ36AZDo2xtzq4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113726

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix compression speed gains for the thread pool when running Django's collectstatic.
- Raise any errors from threads in the whitenoise.compress command.
- Drop Django 3.2 to 4.1 support.
- Drop Python 3.8 support.
- Support Python 3.13.
- Fix a bug introduced in version 6.0.0 where Range requests could lead to
  database connection errors in other requests.
- Use Django's FORCE_SCRIPT_NAME setting correctly.
- Compress files using a thread pool.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-whitenoise_6.7.0.bb => python3-whitenoise_6.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-whitenoise_6.7.0.bb => python3-whitenoise_6.8.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.7.0.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.8.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-whitenoise_6.7.0.bb
rename to meta-python/recipes-devtools/python/python3-whitenoise_6.8.2.bb
index 48d5a925c..baf0a4cc1 100644
--- a/meta-python/recipes-devtools/python/python3-whitenoise_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.8.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aba4901cc64e401cea5a267eac2a2e1e"
 
 PYPI_PACKAGE = "whitenoise"
 
-SRC_URI[sha256sum] = "58c7a6cd811e275a6c91af22e96e87da0b1109e9a53bb7464116ef4c963bf636"
+SRC_URI[sha256sum] = "486bd7267a375fa9650b136daaec156ac572971acc8bf99add90817a530dd1d4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


