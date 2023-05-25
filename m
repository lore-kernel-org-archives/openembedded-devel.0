Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DFCC7EE33
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.6063.1684997792865584192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="96646706"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="96646706"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1895BD29E5
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 512D2276CA
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D80D82007CA80;
	Thu, 25 May 2023 15:56:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-terminal: upgrade 3.48.0 -> 3.48.1
Date: Thu, 25 May 2023 14:56:16 +0800
Message-Id: <1684997777-2061-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--1.332800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8shSHrTqtvqVQkCThXPqsqiub+3jd3k4Rfu63p3Evo7CYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSztBtTGcdU7nv9be
	i5lf9R4mtyZMKVTuehSkKfQgXRDFVQrAXS89NcbfwgSqcf/vPB2Af2Rb9ke5KFEZ5z3ZB4GPzf1
	4NSv0W4iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102815

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-terminal_3.48.0.bb => gnome-terminal_3.48.1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.48.0.bb => gnome-terminal_3.48.1.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
index 75e609d155..13b440dfec 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
@@ -20,9 +20,10 @@ DEPENDS = " \
     libpcre2 \
 "
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=https;nobranch=1"
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRCREV = "a85ecc959344ee2e0d345f7dd081dc781d95d364"
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=https;nobranch=1 \
+           file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+           "
+SRCREV = "1446ff0abc478bdd03c6665b718214d075729024"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ?= ""
-- 
2.34.1


