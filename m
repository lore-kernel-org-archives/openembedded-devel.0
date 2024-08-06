Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E814DC54746
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2893.1722934027249879067
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c+2mr8Sj;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934027; x=1754470027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+9gXU82v4gUT2my/fvmi22vmKqD+X8O/TBaLQSguAbY=;
  b=c+2mr8SjoC6Vmc4nAaQMjHlqH1WS9oYmsd/lUdlEaqCQEZKyJvnRIUZ2
   BnSumbKTk0gXF/hb1ZMirM+jze1jdoH2ToVcXwn8irS8ynNkhogLBNMQv
   4PiQvDBaQR92cPo9xk7fbjECRxfXIuqKbORQhsJmUsv8FPwqmCJu8rpDK
   KARGUmtuYTqtvS2vMQs1FmXsLAvcrgDlc+7njsZGTS3Bw0dzbtXHzeWaa
   LlzMiIDCOuYkg5rPsz76psjSc0PJd2STlKFLBgPoF5lvGU+SbzPZ0RT96
   s/p+wrZ/4YRUIUpkHz22LV3wXhCHjXA4owKB/j5soEKInt8ma7GfD5G+0
   w==;
X-CSE-ConnectionGUID: RVXCVNnHRZGDhpgsr7WAlg==
X-CSE-MsgGUID: KvrgAcvERzCoHfNQJFvRIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="158213958"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="158213958"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:05 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 135A0C68E4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F476CFBB4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E7D0B20050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B2A0A1A0002;
	Tue,  6 Aug 2024 16:47:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 56/60] qcbor: upgrade 1.4 -> 1.4.1
Date: Tue,  6 Aug 2024 16:46:30 +0800
Message-Id: <1722933994-32549-56-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2sSuJRtSU84o3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrfcebeDpQKys0pV/Hg06ZGdIerFLIvuCaADpVegtMcgOSsfTZiQHOSPS6n
	PRZPjvVM7LAkqkjPI7mcI72AxrwP18qNllPBLltx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111575

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/qcbor/{qcbor_1.4.bb => qcbor_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/qcbor/{qcbor_1.4.bb => qcbor_1.4.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.4.bb b/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/qcbor/qcbor_1.4.bb
rename to meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
index 91f8da465..b04d8df13 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_1.4.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=498c298542365dfcfe29948c72a5849b"
 
 SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master"
 
-SRCREV = "6837bbf14b70b169724ef895565abb03cf254a65"
+SRCREV = "4487f10e1bf258434fb8a39e4f59c29e31910ad0"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


