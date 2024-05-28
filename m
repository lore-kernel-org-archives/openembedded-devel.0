Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE346C25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.12859.1716860977979860549
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bdWfvtRx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860979; x=1748396979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hI9WDCe1TXzQqiVybuy6Ce49mM/JFi8yS8LaVau88aE=;
  b=bdWfvtRx+rn0R7WusSaztMR9NE2unhnGg2Zn7bQivuq/7dSY/PatO4GJ
   fwCqy24wCpujsBVP4s6VsIwHSY5+EY7Cv4eka2+yF3M+hR4ECPu+NgAy3
   Z+LxFrIsvkLFGYlmKCMk64Su32ZMBYtfRkpNe8Sc6sTXYBAA7F+q/KHuN
   ODk0/vmPgfSQG+h/0kSl+DB/vXrIITTSoD+k04YVNbau3vRqyhime8R49
   YsnCf270vGFIQeXOcqNoXYjrgTYFputdxyCikmk9CqcLubTb+qwF4yx5/
   ko8oss9Vm24U7ocXdi6jg3RfiyKvmQSkbMGFtoIuoCrHfGhfPc0h1xsmR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160525320"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160525320"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E5ACCCA1E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C97D5D73D8
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6207A41063
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 106C91A000A;
	Tue, 28 May 2024 09:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/40] python3-moteus: upgrade 0.3.68 -> 0.3.70
Date: Tue, 28 May 2024 09:47:59 +0800
Message-Id: <1716860901-863-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8Kre/9Cr64sAGksKl8QhGlCPkKiRpxYpj97vywPrz3yBJNR+lMZ208Ia6+lb
	VnNNmw6v9spstugFuwZWGnV2JPGL7FfwofOew+lx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110552

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.68.bb => python3-moteus_0.3.70.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.68.bb => python3-moteus_0.3.70.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.68.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.70.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.68.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.70.bb
index d99d30e63..7e77d8f7a 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.68.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.70.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a5c4259ecc20cbb5dea9352f8364300db45eab971fa7bddd1625da9b16d63248"
+SRC_URI[sha256sum] = "39e6e2689511c601dff62e502ca6c6ab91100f34b2ebbf52fcee241bf8bfed31"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.34.1


