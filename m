Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA83C3DA41
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:37 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.166874.1719305855888983452
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NCSaeZoq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305856; x=1750841856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vqQACGqyBQF5Cj24jiF1XyCNs1F0vtJUcG97HFTnMz4=;
  b=NCSaeZoqULHQxWD8a8HO6kNNinb81e6yS+uXl9/z/esI4bGo3UFathSK
   rTKIFdYlC4Uwsg4iYs55TTv1R0+oPittHpuH4Nwxf1e4ZLXWM1B2m8R5w
   ia3VDAt1dGFU8ihrlEZ4nqjH6kxfg0dx9O6JdVyk/1pTaLGJj1ZbhEQEw
   7d8+5eVnaDS/5ss+0C5Up8qGv4UFrGbIwTAt8WkJFd6RKDK+ERE8xRB97
   pJjKrSUJnyHgCQ3FB8/jr+07k33Xw8DsRXY3uGm3GYOBlH5wBPMJf75xT
   JPuMvfm9pAxOk9XFxeB6GXdtXF0DvyUMdWruWOXUvDEMVfgFiIhzRV0mm
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152254734"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152254734"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B66E2D8003
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BACFD772F
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9ABB04107B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 47F121A0002;
	Tue, 25 Jun 2024 16:57:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/57] python3-scikit-build: upgrade 0.17.6 -> 0.18.0
Date: Tue, 25 Jun 2024 16:56:23 +0800
Message-Id: <1719305790-11484-50-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-1.282900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mruiR977BIMuUd3hIj0tmc7dAY
	WUo4HSIkf1fUWcPP1EPuynJFAOcQhk4GO5MhEQotA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYldbqAzxizwIHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7hy2
	IypI31FtrwFNAeBkT/6m32IA659uUsRE6F2BJU8hcb0+oEWMY7WcuyesPxirpNTni9w+/SNI2DO
	2FP9srgb/UL5LKD+iiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111064

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Support MSVC 17.10
- CMake 3.5+ requirement
- Support CPython 3.13 with windows lib finding fix
- Don't die on PermissionError during chmod
- Remove usage of deprecated distutils in cmake files
- Use first available option for vswhere output

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-scikit-build_0.17.6.bb => python3-scikit-build_0.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build_0.17.6.bb => python3-scikit-build_0.18.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.18.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build_0.18.0.bb
index dde0941ef..2351b697d 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.18.0.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "scikit_build"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "b51a51a36b37c42650994b5047912f59b22e3210b23e321f287611f9ef6e5c9d"
+SRC_URI[sha256sum] = "71a13af467d1a38510c3494786e2edb73ead53ea922bde6e519dc5372aa65096"
 
 RDEPENDS:${PN} = " \
 	python3-distro \
-- 
2.34.1


