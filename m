Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE50C54E7B
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8165.1710827215294182528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jEdwm0uI;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827215; x=1742363215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XXGw3L+beWbnc7fJQXY7pwTPoGYIlPfPPRx0NWaxEnw=;
  b=jEdwm0uIl9fFbJeiRXZBZcqEhoOrsp4ToxmD3fAlyGkYWcFiJVzHCOfv
   mLPmnbmOXG9zCz8cBjhKOdXxoA3nv/PAXJ3RG6v4PsNImEJS5+EKenuO1
   cg7t1mBjYhL7YXqbnDzllp16uJtOS9i2c+aiqlLEq/EY1hRaevw4tw/nk
   +paNenlCbDBWxLCEj5modAFIWnSHnA+sR2BChNie9z7vWIQcFxMF7sewX
   xEK0Q+8NFeB2BdWE66lyEwDLz1+38gizJ3GH3OcLwIJ73Sfz9VIvSXK4u
   JGOyzXkJYo8TVfPOGBw9Fnu0aJ5k5nNUlzvuEdBTHmA9oz7nLVVFE789b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="131999437"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="131999437"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:52 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E697FF2646
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C552D6152
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A183621BD45
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B4EC1A006B;
	Tue, 19 Mar 2024 13:46:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/50] python3-tox: upgrade 4.13.0 -> 4.14.1
Date: Tue, 19 Mar 2024 13:45:32 +0800
Message-Id: <1710827139-30056-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.883600-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvhA4WtAM986bpN
	d80PBsg9fTUh2S+cIw3lEUN5eQRo47MU/Bpk3KRDfOaYwP8dcX7BF2OdN6oAAZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3vVbHa5Rs8txCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0gGlEJORGTlJ+gtHj7OwNO36CZXLlV1mSbtLZ
	AOSLZXUw6vPrgQndDLGeCiqA8bBy1Xbroie+91aE9SUDThiYEW2nBOGa2/2opgbXH66ldh+WDpd
	brWpP98jaJP5nvPK6vIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109460

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix crash with fresh subprocess, if the build backend is setuptools
 automatically enable fresh subprocesses for build backend calls
-Support enabling fresh subprocess for packaging build backends via fresh_subprocess
-Allow plugins attaching additional information to --version via
 tox_append_version_info method in the plugin module

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.13.0.bb => python3-tox_4.14.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.13.0.bb => python3-tox_4.14.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.13.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.14.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.13.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.14.1.bb
index dd352e484..10eab8db8 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.14.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "dd789a554c16c4b532924ba393c92fc8991323c4b3d466712bfecc8c9b9f24f7"
+SRC_URI[sha256sum] = "f0ad758c3bbf7e237059c929d3595479363c3cdd5a06ac3e49d1dd020ffbee45"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


