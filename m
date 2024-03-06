Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BBFC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:43:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.7744.1709714631555259371
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g+bAGv0U;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714631; x=1741250631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6E7wFrnNo5ZNzOb8orIp2tNlrbbhHq7hkbtePNN6ZQg=;
  b=g+bAGv0UFWDrcYB1/wxPAjgieLyX1G7I/1VW9ArOaWUP6iWJ2qZB6F6C
   TdCDCdgkckBUSAhfuVd93ZfHSu/SQJEmG2MiG0LlrnXVAad9ZMaCd1WA4
   +iZzAvcfwUid9SF/4BtRsVOVVYLWwxH0HQrbS6p037KLQUq6my1hHHGqJ
   g0IdUchuZ5Bj4Rs15hcxyAb24LhtpQ3KboBzCbfHt/eWBkRRK7yuhrCMI
   D+A3rkiWTgae+sdWnLOEDYNPSN0M9dF5dQWO/81hgujqpacIdWvmYdCiM
   VdblqI+ArHqdtxW4XoQulkyN+OviSrV7WTWRafln88cB3l1n6gblYjLNg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151681837"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151681837"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:43:48 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0676CE8CDF
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4433DEA0AF
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D057041182
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 799AD1A006D;
	Wed,  6 Mar 2024 16:43:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/26] ctags: upgrade 6.1.20240114.0 -> 6.1.20240225.0
Date: Wed,  6 Mar 2024 16:43:06 +0800
Message-Id: <1709714608-19296-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKQmrz+mv9VfSqVHyy2jdcfoH2BkE1F/SHF2D
	1I2csIrW2d+7ZQbT0SbmHykhk+NpugolrfHEkRl5gxg9Y4+a0HekUwhbb9JVb+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109144

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240114.0.bb => ctags_6.1.20240225.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240114.0.bb => ctags_6.1.20240225.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240114.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240225.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240114.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240225.0.bb
index 6fab92015..e092800d5 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240114.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240225.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "be3439eb01caeadbf52a8ec4d00cb6cf16a61225"
+SRCREV = "5d8c5927aa7dd7c14b2ffd9da3193126ff81cb4b"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


