Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6A8C54E78
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:47 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8217.1710827195728056563
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M8ZYgvCI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827199; x=1742363199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OxCXAURDdipa6Gm8IMWLdD62WaCdgqASqjmShIJIyEU=;
  b=M8ZYgvCI4B++pW1DHucI6s0aXm1cJlDwEFX52Zpl2Y/gWBRzxwtJajSF
   nwuq6C8oIR1BDP/+2kMxO3AvomMVSPqNhKuHkWUvrTBQcJtMchGdcs586
   TY3Ka5T7m0E+NfDTGuwxIE9B+jbS9zxN+diL7OwR9AIPxNRMNTw2vY1pJ
   QXRjsIjykQ0NNRTCEK0ak5C0kPDhK8wb1+bRWcYpJFcJ+BPFMhq4aLLOB
   t2Kl/X74Pt84G5HA7Gdggft3/KRnbOxGbP7eafIjkemqPuF/kkZXl39Ad
   Ko7EHn9N46R/p8KCCbjjbPloCSBHFr22QsCLf8bWOnl2dtoo0NKWhivbE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152144849"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152144849"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15D4927A8AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 55AD3D5E88
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA588228817
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 832371A006D;
	Tue, 19 Mar 2024 13:46:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/50] python3-eth-rlp: upgrade 1.0.1 -> 2.0.0
Date: Tue, 19 Mar 2024 13:45:15 +0800
Message-Id: <1710827139-30056-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--4.338600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr/1vXbkGjWeWDKIMJb+j2aHv3
	EJJrdBuxLJoLOSH2KMYScHHX0rLXBO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtrobicK1A1gsqdY4Pv0x4t0DsGpGcUJN3fAcisJok8hqpDUlZ5bw+59MnE
	2puqhe6uwrs8xetJ1E3RHRB1KwfPk/GUbc0ev1JHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109441

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Bump hexbytes dependency to >=1.0.0
-Add Python 3.12 support
-Add windows-wheel CI job for py312, set both py311 and py312 to use latest patch version
-Add py.typed file, move misplaced newsfragment, correct py version pins for typing-extensions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-rlp_1.0.1.bb => python3-eth-rlp_2.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-rlp_1.0.1.bb => python3-eth-rlp_2.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb b/meta-python/recipes-devtools/python/python3-eth-rlp_2.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-rlp_2.0.0.bb
index 7ee20b9b2..5e03625d1 100644
--- a/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-rlp_2.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "d61dbda892ee1220f28fb3663c08f6383c305db9f1f5624dc585c9cd05115027"
+SRC_URI[sha256sum] = "70116ec32abd2569fc4ba5f2af80080d896b0dc53a86d582fe1ffa66ecfee308"
 
 inherit pypi setuptools3
 
-- 
2.34.1


