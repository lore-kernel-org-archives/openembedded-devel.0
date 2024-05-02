Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70B4C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6689.1714628980640459092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pyKeOg1F;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628982; x=1746164982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1iNsVOgXTru0+TgkVEByB6jZFB6pTLp0RBFzG4S44t8=;
  b=pyKeOg1FF0i5Vn0EzmVAk4MfgTJA9K0oZGTtueC2JiHZiSpqhsc0fLJg
   j3qDaux7LJo7OWCPXC0CVCcCB4K0++NQfBQ/4Dky4A/0s5bOr5Vc2pXhO
   /dvgjLLj7NWXbNU/MtOFqiOnDQ6OFqP/kPvzuiCy9rSmmGJj1u8663UpX
   DOD+4bZ89FhyDfVMbHF61h7rXFLsjd34QK6JphHjI5zHPO3elUFwSTsys
   9fn+SKjMutuDTFxTlkByPRk37inV6If2miykYRtAFC7Cw40sMtRvzmWJj
   h6NbHpNq9sKpyW+I51X3VLsHL7ovgT98gh3JhUYkv6VsNhsr9HnTDvMxs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="156670723"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="156670723"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 75381C2ABE
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BD92E11C58
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 57CCF223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:23 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 04FA91A0002;
	Thu,  2 May 2024 13:49:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/30] python3-freezegun: upgrade 1.4.0 -> 1.5.0
Date: Thu,  2 May 2024 10:48:07 -0400
Message-Id: <20240502144829.241208-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-4.758700-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrmZiw53dqSN+/XSsQNWtCeJw6
	tnDgS/8FyBgPwqdPunZAW774FQ9G+gw8Nmue9wz3A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY5gZGm/RVVHG5x7uAXGEprQFA6pSxaDHmAhn751acftuem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkgQt5LMhDa3JBPiJYyPKJmyPJLsiwSUMXhB9O
	oaKvrnBHD2IDEzVFhm5I85EQIg5nwq9lM8kAkFWU+R0cYYc0z9WACpRw+5uqMBgvHuudtHysNDy
	bdOqCWh6WkJecb4mO8MYFnUbyvVJ/YPqDH/SjOk=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110235

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* The default ignore list now contains the 'queue'-package
* Added a missing 'move_to'-function when calling 'freeze_time(tick=True)'
* Fixes a rounding error in 'time.time_ns()'
* Fixed a bug where the default ignore list could not be empty ('configure(default_ignore_list=[])')
* All 'tick()' methods now return the new datetime (instead of None)
* Type improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-freezegun_1.4.0.bb => python3-freezegun_1.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-freezegun_1.4.0.bb => python3-freezegun_1.5.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.4.0.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.5.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-freezegun_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-freezegun_1.5.0.bb
index 15c0bf06b..b9cbedbf7 100644
--- a/meta-python/recipes-devtools/python/python3-freezegun_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/spulec/freezegun"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=acf1d209bb6eddae4cbe6ffd6a0144fe"
 
-SRC_URI[sha256sum] = "10939b0ba0ff5adaecf3b06a5c2f73071d9678e507c5eaedb23c761d56ac774b"
+SRC_URI[sha256sum] = "200a64359b363aa3653d8aac289584078386c7c3da77339d257e46a01fb5c77c"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


