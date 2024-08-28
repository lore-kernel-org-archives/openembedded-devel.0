Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB99C54E65
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8723.1724833547871109374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PlO7buJN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833555; x=1756369555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aq0hC0biDOyu7Gi7nxW2gSn0N2P004Ne6OSc8keTVGc=;
  b=PlO7buJN0u+JO0oriVR4Xo+WwuPMk+I4ziFknFsR9pU4yquNF1XeDN6i
   dtwM+YnyVblC7ufpUTvJbuyE3E/xPQrM2wZZ/IZF4XgDIzhUnGaAYDBQd
   +loOuTcfTmahokSD16aayE+UE+yhkoWNhLkj2KKfdi+sZdC+JhtSkC5Go
   OmmJBwz5IjJjUhFRVCsSS2yEzCtptr7notklpOYsoh+A+u/c+feX6VwUY
   2T0L6dYxTC+3qbhErmoA65brM7pxt135QNEPyn1icUY5rJvoSzyHvyBPH
   9zuBltbBqrN+UbnIsP9aFdnXE2YFoUVSchiltQ7iGjQyQMhicqGL60oz0
   Q==;
X-CSE-ConnectionGUID: cidMmYePRpeukC/Azw2r3w==
X-CSE-MsgGUID: a20DPEtrSjagjt8jBrDPQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913208"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913208"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BAFAD5A46
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E250AD50FB
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 730D920079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1F9E51A0002;
	Wed, 28 Aug 2024 16:25:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/46] python3-py7zr: upgrade 0.21.1 -> 0.22.0
Date: Wed, 28 Aug 2024 16:25:09 +0800
Message-Id: <1724833525-2162-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--4.403400-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwrfoFYrvlA5MTF
	vmr6ouga5ZHdquAwKoH+LJ0LwPqg+y0+EsApCrRRVEXzW1tmr5DYUDvAr2Y/11oJuH6vaNCzUNz
	M39IykFiQ8jX9l2qhLb51pkQVwz+77VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5APn4
	RjXbQDeqcmUcf5zANO64sVlliWKx8fE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDm29d
	nWsx8QnkKBbkpDMdS6sCa3HOMNQhEbFwp+XtWFHvCez/oTutwRaC9jS7oPe+yTUmx+K/FgCDdHm
	aq7ocVyjW2M5X0umcoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112008

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Added
-----
* Add mode "x" for SevenZipFile
* Add SevenZipFile#namelist method

Fixed
-----
* Append mode on non-existent files
* Fix NUMBER encoding of integer when 8 bytes

Changed
-------
* Minimum required Python version to be Python 3.8
* Remove pyannotate from pyproject.toml

Document
--------
* Update user guide

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-py7zr_0.21.1.bb => python3-py7zr_0.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py7zr_0.21.1.bb => python3-py7zr_0.22.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_0.21.1.bb b/meta-python/recipes-devtools/python/python3-py7zr_0.22.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-py7zr_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-py7zr_0.22.0.bb
index 0dec16151..c5cf1e836 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_0.22.0.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "dede8ed8b7b32b3586ac476da3a482b69dd433229420bf0f62c495404b72c799"
+SRC_URI[sha256sum] = "c6c7aea5913535184003b73938490f9a4d8418598e533f9ca991d3b8e45a139e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


