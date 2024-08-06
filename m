Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE8FC531DE
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2880.1722934012727295909
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MTQ2s7ce;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934022; x=1754470022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9P0GHD2mpq12ykRh2mFz8wUQFh90cfMX1H6PZ3QJd/E=;
  b=MTQ2s7ceVZolvNTtTZX43oPxINIDp6Zy+55sLxEl0lKqH3AlKOnja9Gv
   +xA0PGIdm28E1WbPjhz7lJ/yKqZGCXZSAwHfuMbArUx8MtXIT3pkW8Zax
   Irca23qk7o9Xod/JAtE/sYmph3QuuHkaJ/zoKf888+frRqFSJLBk5FjXw
   dXl11HAnpNAzkh5Bwkfk5FNLI2vWLkxO74FsgbanclqC+JLFADUMcdZGx
   4J55RuWWmHsVW7/TyaD/OOSKGazXOAgdttKFXHrujU50PyxTlD7qIlZuG
   IJH2sftnKK0nJc5+QFYXGlVxwTWDfAKtKOf7/89tAo/4tNJIWZJw9iDWr
   A==;
X-CSE-ConnectionGUID: DRYPg3y4RFeoBBAE3YuYAg==
X-CSE-MsgGUID: RGWlY24qR7iy97WLItluQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169882456"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169882456"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 56446D4F58
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B241103D0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31091401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D339D1A000E;
	Tue,  6 Aug 2024 16:46:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/60] python3-astroid: upgrade 3.2.3 -> 3.2.4
Date: Tue,  6 Aug 2024 16:46:08 +0800
Message-Id: <1722933994-32549-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrXIPVctHWIjCS24w+WCM/7Cm6BR0tB32DY66OgosPvlxqOtXmmxfiM1LyR
	wdG6Mgss6q2PqeJlIe8G1O9yMYfLeVH3OTSvUDLx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111552

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.2.3.bb => python3-astroid_3.2.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.2.3.bb => python3-astroid_3.2.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.2.3.bb b/meta-python/recipes-devtools/python/python3-astroid_3.2.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.2.4.bb
index 92c64e042..056b37279 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.2.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "7099b5a60985529d8d46858befa103b82d0d05a5a5e8b816b5303ed96075e1d9"
+SRC_URI[sha256sum] = "0e14202810b30da1b735827f78f5157be2bbd4a7a59b7707ca0bfc2fb4c0063a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


