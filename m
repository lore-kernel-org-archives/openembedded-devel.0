Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02603EDE9A0
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.18592.1725959007143197041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HGtlsoXx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959016; x=1757495016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yKo+ZaUoNcOebjM3t+IWJMHefrpvyOYNxQ0W7yVbnLY=;
  b=HGtlsoXxPHkstez93zKXbLNl1/W5c8QXgwnsayaS6tqocw8BPV/WX0D4
   13SzIBskDkbD8KKyc/nqRhs2z311tdpFhPSxdi2R/HNi7HzBPe1kpBq0v
   y2Eelx6YXnqTIGgB26aAGcPsgbcUqOmj6ir8mKIDrFLiDo27L3dpdxbKj
   TZyg03BtGHOOOnz+hhWZ1cWpEGAKOk5l0ot2PycXWZ/BYttgA5Oxe9y2M
   qWiuE1QbeG9NYpNmm1OABLMaSgBZXoAD+JO2uvGNoqwIfNT08tKGZtf0o
   PxCzToymYuf4eoMUwd4Tfm0UZRda88LJGU7qIttzYsMQnpxjelCcedkRs
   w==;
X-CSE-ConnectionGUID: MuIS+rjLTHS9zsTK/V4DJQ==
X-CSE-MsgGUID: 3wLzA7EHQJG/b7DbwaUPQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152689883"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152689883"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 67279D8012
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id ACCA3D4C32
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 49DD3200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F29291A01E9;
	Tue, 10 Sep 2024 17:03:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/42] python3-virtualenv: upgrade 20.26.3 -> 20.26.4
Date: Tue, 10 Sep 2024 17:03:03 +0800
Message-Id: <1725958990-5719-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--1.291300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbytM+b8yxBqvA2Uz
	B7Xp5yOCUmd9UAGWwK0Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5wuk
	poJH+a2DaZfDFhUV7qZzSH97vz/KcTPfjLdppHRw2ZMrj1QZDh6xJI+xZ+L3l2S4eqAai7KBvjf
	noBm/Mjn9CPCA675JSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112221

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix whitespace around backticks in changelog
- Test latest Python 3.13
- Fix typo in Nushell activation script
- GitHub Actions: Replace deprecated macos-12 with macos-13
- Fix #2728: Activating venv create unwanted console output
- Upgrade bundled wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.26.3.bb => python3-virtualenv_20.26.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.26.3.bb => python3-virtualenv_20.26.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.26.4.bb
index 975bf11af..aadef0e94 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "4c43a2a236279d9ea36a0d76f98d84bd6ca94ac4e0f4a3b9d46d05e10fea542a"
+SRC_URI[sha256sum] = "c17f4e0f3e6036e9f26700446f85c76ab11df65ff6d8a9cbfad9f71aabfcf23c"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


