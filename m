Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF5CC5320E
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.2883.1722934017677000776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o4lK6GlI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BIE/gCo6rqb5IUXKK14pBf3VaurQyxiyPjL4cDZ3oIk=;
  b=o4lK6GlIbuw9jPGJAyAjvw8EWlw/PJDjaMNmM7ZVUUDff0Jq2/nDK/pP
   Kg74cqMwRkGaCh0AWkhvjkTr2JoiJ/cb2YK8Z1yMe7dafbziN1qKRakK6
   /K4FQ3rIlfY46sc8d1qVPZ2/+t6T/DtNxBv70R+Q0Nc5g3GTIBO4DVenY
   ylGnjr4mOW1L6X3FP5TiNNxNd57b/CEMTIfY+R7YhYTnb9JvCy4DJ4x9K
   QZKJw5/5xM2VQfAwDqQp7WoMzfYU1In0F3ad1dXHTrRJvHuXLwiLfX1tk
   WS+KCq7S6xDlZqvUEh4ZBSzjJ2UiCAvhvFDC6G+KUnhMioLdyODuc6IN3
   w==;
X-CSE-ConnectionGUID: /d1iksgiS7CMf4dRhHg8uw==
X-CSE-MsgGUID: XgKq2tnlQm+uBznAq1YFtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169165575"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169165575"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F1DADB3C1
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 82A7AF766
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18926401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B8AB21A0002;
	Tue,  6 Aug 2024 16:46:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/60] hostapd: upgrade 2.10 -> 2.11
Date: Tue,  6 Aug 2024 16:45:45 +0800
Message-Id: <1722933994-32549-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--5.176200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ8eC2pVr1wbwu/2mtLXcuW71Wx2uUbPLdy4VFP6muDhhV17CFfZYABLXk
	gVQ0v4ROYL1X4qntgDsw+fYpRV+8EJUz0P602LFdIcJTn2HkqsX0tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjOwBXM346/+yuaIjh5MCdPLatmA4DiERT9PNIZTQCTt8zPc8DzGHVfVbxA
	dVLlbcP
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111529

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hostapd/{hostapd_2.10.bb => hostapd_2.11.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.10.bb => hostapd_2.11.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
index 44683bf73..693afe6c5 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
@@ -2,7 +2,7 @@ SUMMARY = "User space daemon for extended IEEE 802.11 management"
 HOMEPAGE = "http://w1.fi/hostapd/"
 SECTION = "kernel/userland"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://hostapd/README;beginline=5;endline=47;md5=aa03b8bd6216d1a7ca01fd4b89863073"
+LIC_FILES_CHKSUM = "file://hostapd/README;beginline=5;endline=47;md5=8e2c69e491b28390f9de0df1f64ebd6d"
 
 DEPENDS = "libnl openssl"
 
@@ -14,7 +14,7 @@ SRC_URI = " \
 "
 
 
-SRC_URI[sha256sum] = "206e7c799b678572c2e3d12030238784bc4a9f82323b0156b4c9466f1498915d"
+SRC_URI[sha256sum] = "2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e330219fe7aed1747a"
 
 inherit update-rc.d systemd pkgconfig features_check
 
-- 
2.34.1


