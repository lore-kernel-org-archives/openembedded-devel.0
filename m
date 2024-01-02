Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F63C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:12:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.24408.1704179571290043393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="144906661"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="144906661"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:12:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D973D66C3
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:12:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 67281F269C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:12:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EEC576BEF7
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:12:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 824981A0070;
	Tue,  2 Jan 2024 15:12:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] qpdf: upgrade 11.6.4 -> 11.7.0
Date: Tue,  2 Jan 2024 15:11:39 +0800
Message-Id: <1704179499-8251-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-0.346900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY32lF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUoij
	ekfInPTPn22EcSrQBnT3mnWKOM3JFrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveafSbrzwSjfwqtq
	5d3cxkNfuHe+DdtkdRl2n6nJDItYrK5A7KhbHOHNNE7OBlTbeeJYSDbnE1rr4/jCLBbhlg6DQsh
	NaTbQVlA2jJxkRW/mgBFIdxJIgJFPK+uO+faAFZU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108004

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://qpdf.readthedocs.io/en/stable/release-notes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_11.6.4.bb => qpdf_11.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_11.6.4.bb => qpdf_11.7.0.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_11.6.4.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.7.0.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_11.6.4.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_11.7.0.bb
index 2dd7b684e..92655e3c6 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_11.6.4.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.7.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main"
-SRCREV = "d8371889d070d2f88636434ebd8412708a63e54e"
+SRCREV = "986d2485784d57d7a84cc5af50e67bde827b0dc9"
 
 inherit cmake pkgconfig gettext
 
-- 
2.34.1


