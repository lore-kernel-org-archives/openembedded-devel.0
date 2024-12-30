Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369D6E7719E
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.58738.1735543845169649572
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dRyiuDn5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543845; x=1767079845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8QXg6gW6SVXHuF05VuxIjjzzf2huKxeBZ9dT1kAu3Bw=;
  b=dRyiuDn5xTH+K/x0ZDP7TmXkHFslvRLOi3lgMFHRW7REQbZijTL98wYN
   U7NKauGjCsS9ctCq4SfdkU1qcAqt7Qxh/eTqdr5JRC+4cGAm1l7eEnY90
   WRhL1qPXEw71Oxs0vRIvuUbZDMXo9nmg8HOih4t5Pk6BUee4nwpZz7DuR
   CMtPWZ1rn+/6o31CwnRlYOIdAo2xvkikvp28WpXiScf/wAtLGivZalCYV
   swsRGKMM1kHKAP9tPy/Vzh4Fl6wHRTJ/Kvdl5LXpR+LejksjUsshp8jpt
   QE0mwfKSVBKoyYxLcNQcZZDodneWL0BDK1/YpeItD0xRV/WsU2X421WC9
   Q==;
X-CSE-ConnectionGUID: mG5ROQMaRION3xcNHjylfA==
X-CSE-MsgGUID: RBM8FjQnQOePjHfYSmi1BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185304163"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185304163"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EAF51D6EAD
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B8F8ED5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 510B370BE2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:40 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF9D61A0003;
	Mon, 30 Dec 2024 15:30:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/18] flatbuffers: upgrade 24.3.25 -> 24.12.23
Date: Mon, 30 Dec 2024 15:30:21 +0800
Message-Id: <1735543836-2512-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10--0.375300-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yfx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkH4q
	tYI9sRE/4K9FmervsqVb77L3FdFT4zcpdZ3fQiLdFEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq2Yy15VKYUPR+vx3Qga6xoQ8d12UKLwSLe0TinOLSsLktY3LS8gpWOgvLyMNTcLQDK949
	vdgWtVg/T8ETEibJNxziesrQRExO0dJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhFTP3QRDAbYw
	Clu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114583

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index 8f6c4c68f1..39639a05f1 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "24.3.25"
-SRCREV = "595bf0007ab1929570c7671f091313c8fc20644e"
+PV = "24.12.23"
+SRCREV = "a2cd1ea3b6d3fee220106b5fed3f7ce8da9eb757"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.43.0


