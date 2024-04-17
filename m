Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26DAC0650F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2720.1713318095004054633
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qn0znkh3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318096; x=1744854096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JsjdJ0GuXR3n4bTYMiIbTlzX23kwxo+dbnjqnbqk5I4=;
  b=qn0znkh3wKw6lVRQcNclVfqlcxCQ10QMJ128lOxQd8cWV25Mlmk3p9ig
   jXCk5YY7Scj/G1F9kvCTZD3Jw/itocwn78NjXykLNjrRNis2HO6hPWzA4
   VqCPB31pO9wR60ZV1bfw4PLhA4bgkT+zPCRwFNEB8bUEXc7ruqbvOLoCg
   6s25QpW/G6DJLgO7fjSxm3GpXzijNZvoryDsswH1PK6H9/hunv53mlqgv
   yD431IMuY9NzOPPp43KMFjctiHAA3y1E+Gc3aDQGx/C/W4pm6QTvt4sH8
   cPgtHSUJPkt+RqeDbbcLv//EvpisU7ZPdVlUuf/BCWGlj0KtwqFH1I6Pt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="157724933"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="157724933"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E3E92EB323
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FA29D5B33
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AAB2E6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 585F41A0002;
	Wed, 17 Apr 2024 09:41:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/49] python3-ipython: upgrade 8.22.2 -> 8.23.0
Date: Wed, 17 Apr 2024 09:40:37 +0800
Message-Id: <1713318061-17128-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--2.015600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvozDhGeQC9EqD0
	owL58i6K6jDWbBlAm2G9Yo+Q7OmurNGETJv1/WyOP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNcz0WJj3YeQ9UDznuN+czCjqgjDKl+M2S2kdyhx8Mu6McjmrTIfKXJIjtq7hrJ/NEkB87
	Cii8Yzd9r3BvittEX5Vz5qggUUeIg3c16/xWjPxU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110012

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix small typo: imput -> input
-Add a matplotlib optional target dependency
-Disable scheduled CI runs on forks
-add __repr__ to MagicsDisplay
-correct ci message

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.22.2.bb => python3-ipython_8.23.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.22.2.bb => python3-ipython_8.23.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.22.2.bb b/meta-python/recipes-devtools/python/python3-ipython_8.23.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.22.2.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.23.0.bb
index b8595fe9c..ebfd14722 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.22.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.23.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "2dcaad9049f9056f1fef63514f176c7d41f930daa78d05b82a176202818f2c14"
+SRC_URI[sha256sum] = "7468edaf4f6de3e1b912e57f66c241e6fd3c7099f2ec2136e239e142e800274d"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.34.1


