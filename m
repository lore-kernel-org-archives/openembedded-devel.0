Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82B9C38150
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.13622.1719816260296809629
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OzK8oWFc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816261; x=1751352261;
  h=from:to:cc:subject:date:message-id;
  bh=Z1o5JlcS+AMAusKq0+mBGBiFTWUyzi2D57ye+YugdUw=;
  b=OzK8oWFcNfMBXgft0wj3dEqC//8gqETDV5JhfjPNKknrjTUHwQRrICFB
   LKVrDXzgUkLEkSP84VHxQUlPdqcdMplVE5DxwCYZrpZmvSArWl4GcC4G/
   DOnzrxhbzJgTBfTvWQtQEiK+1gXdQveBxMlhXjQlE59hEKgixst3W4c5h
   fjtx8rY/cIHS0Wqebnr28zFyfHqt+3+eg0+/fgvMhBG9C39FwP3c4pYIk
   duYjbpSv35/4pRapEwc1N1tS/onBPW3Knwc7HQqwibAiOszCjDcTXAHNG
   RPab06wFIY/Jpqh8sJV0+FpaIFYqgThRsG+00PAXt6JNabuvsvVA5tuM5
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165542284"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165542284"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:13 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C1A0CC14C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B1663D8B01
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CF6A6B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CB9771A000A;
	Mon,  1 Jul 2024 14:44:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/25] ctags: upgrade 6.1.20240623.0 -> 6.1.20240630.0
Date: Mon,  1 Jul 2024 14:43:38 +0800
Message-Id: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8Krb6GRY8VW+7VH9w6UdDlOtVrrQaSkBTsHq3T/HtGjyE9quoPFyznrmrTHL
	ZfOgm01VCBjthBtCPE1SVjjsC4HLvBWncqW0nDRB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111176

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240623.0.bb => ctags_6.1.20240630.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240623.0.bb => ctags_6.1.20240630.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240623.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240630.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240623.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240630.0.bb
index 8883a9bcd..0416593c2 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240623.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240630.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "8976ec3d2c48ec862593910388ae3e55f0e20a3f"
+SRCREV = "050dcb938a8be98874f0a6f0afa9dd8cccb6527a"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


