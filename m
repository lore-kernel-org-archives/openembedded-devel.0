Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ADDC3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.13842.1719816263085280666
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XcapnbDk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816263; x=1751352263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6pc395LyQmHY/IOnVB8uLdZz6JoyaQpf//ZmEjr7vWM=;
  b=XcapnbDk5cQYKM6UECvV7uoF91k2dtTXMbYY4ZFmr1kZbJM3Byn906+A
   YZcwSDXvGFdm6emLQhcRYTMXi6cCMt8hQ/kO2CArw7FcBerPUfSD1UAIM
   0r+UVjqqN+wFwnXxkkI/OGiCudO5wKf4EiI8KuKZoY5iEdQtBGSNzJwHq
   sgIztpdLwFEtsHgigLLp2FshxX2v+nEs7y0ZUIf4YwiaiwHHdl+Gg258q
   CTpCIDuVEdNFitU4jZqJiwGcocAHYnSVZv/jUyYXWQD+cS+x/ng5yQjj4
   gsd5eAuHkYb38ZVhDPTwyyNMw78uxKZjLi9lCI/kgIWzJkw8H0Eh5mFxW
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144926093"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144926093"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:21 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C90DECA1E1
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 094A6D52BD
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CE516B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 44E3D1A000A;
	Mon,  1 Jul 2024 14:44:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/25] python3-imageio: upgrade 2.34.1 -> 2.34.2
Date: Mon,  1 Jul 2024 14:43:53 +0800
Message-Id: <1719816242-11839-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--2.564600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxM+b8yxBqvA1YM
	JR3dIrh216yuU//D1D8Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w797S
	3CnpisXSAwFQ3WIgpJ7SNvsSj5PhMH/bIr+aMc8ZDWARlqnyEFlo6pDxxxA+I9Nm+XqsaMog2Ix
	uxNTZan1CkOoJUnfiiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111185

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add support for numpy 2.0
- Update actions/checkout and actions/setup-python
- Start testing pypy-3.10 and update pypy test runners
- Fix duration description in pillow legacy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.34.1.bb => python3-imageio_2.34.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.34.1.bb => python3-imageio_2.34.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.34.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.34.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.34.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.34.2.bb
index 45772ef8e..5fd08f3bd 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.34.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.34.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "f13eb76e4922f936ac4a7fec77ce8a783e63b93543d4ea3e40793a6cabd9ac7d"
+SRC_URI[sha256sum] = "5c0c0ee8faa018a1c42f649b90395dd4d3bb6187c09053a0cd6f1fdd51bbff5e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


