Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E4BCF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:48 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.48955.1727682225133099223
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E8NMS/V1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682225; x=1759218225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aJcHoKB8AHxBVBRd1iHkekvS9x2IsslFspOYbVNw+AM=;
  b=E8NMS/V1nBwGGRL7MOWD3sGWa5I0h3zJX21M9NFBiv1VHklc+usTzd9/
   VgnFKYRGOFbnlZGAI6UWKk/CYH5bsnA/H4EcYGC64GM3vFaG9jcDQlDpS
   wUc9IHQI9pl0yeKRzXejg33pPVMSwxe59y9Bb/lx5hO+5gRj7pFaL1PQ5
   sa8fJvRKeryOJArtWiDspERgC1cvMa2qFQsPN9/+PaFxjC2fobf/kJcKi
   275xCVuTnd4roEXrXip0E1eYGj1ZNgSbX7fyUx7OE0hVBQ4ldnnU0oLR/
   DAnx5rKmAP54m7fws6oJsaOt9fLYQTGZcn9krMDnjkfGunfmE2VPS/ObO
   g==;
X-CSE-ConnectionGUID: 8J+sKZ2eTA2sPgXKrWTPzg==
X-CSE-MsgGUID: hRIE5SHYRnO3tYxihVX01A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175401345"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175401345"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:42 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C8811E8520
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C349CFB96
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C88A6B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 488751A000A;
	Mon, 30 Sep 2024 15:43:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/40] python3-dill: upgrade 0.3.8 -> 0.3.9
Date: Mon, 30 Sep 2024 15:42:44 +0800
Message-Id: <1727682185-12664-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-5.164800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/ozDhGeQC9EuaG
	g/Bit59t90lebHNn76bFxYsKdAAndhoA1Gr5jNkVgvmNrsT46HIEa8g1x8eqF7yPR5D4hQAdjaw
	RU44WVEPER33ZNI59CtZJUf1W3VWN7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YBX18z5X2O3vnAw
	8yp081LL2jand2PRF8BhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbuGrPnef/I+eshAJ
	GxELrSKhh+kJ7VqcF2YtXqxW+GESz/tqZjE3bi/+Jq+43mh5c5hLSXDv3erfbCKouqSb8isLEaW
	hCfK4rMTAZ/nLi0T9w==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112575

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- further skip BufferedRandomType if does not exist
- remove stray import of dbm in objects
- Add UnpicklingError import for dill.load_session() to fix #648
- Bump idna from 3.4 to 3.7 in /docs
- Bump jinja2 from 3.1.3 to 3.1.4 in /docs
- Bump requests from 2.31.0 to 2.32.0 in /docs
- Bump tornado from 6.3.3 to 6.4.1 in /docs
- update docs requirements to rtfd 10.27.0
- Bump certifi from 2024.2.2 to 2024.7.4 in /docs
- fix fencepost error when getting source inside decorator in interpreter (fixes #603)
- type check for Integral, bool by value
- diff USE_NUMPY imports numpy.ma
- adjust testing to account for frame.f_locals as a proxy in 3.13
- better handle import strings of numpy scalars
- handle a ThreadHandleType
- more extensive testing for dill.source
- add formal support for python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-dill_0.3.8.bb => python3-dill_0.3.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dill_0.3.8.bb => python3-dill_0.3.9.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.9.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
rename to meta-python/recipes-devtools/python/python3-dill_0.3.9.bb
index 3481ec06b..bc5a7e500 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/dill/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a41509b57cc475ed93f8cb1dbbfaeec1"
 
-SRC_URI[sha256sum] = "3ebe3c479ad625c4553aca177444d89b486b1d84982eeacded644afc0cf797ca"
+SRC_URI[sha256sum] = "81aa267dddf68cbfe8029c42ca9ec6a4ab3b22371d1c450abc54422577b4512c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


