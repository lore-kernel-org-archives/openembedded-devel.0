Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200B0CFC51B
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.50489.1728896164520041880
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lIOnwUVD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896165; x=1760432165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8Y7n6uYP4DooveNNfc7/Rv7NTKav9Jo160qG+WyXNRc=;
  b=lIOnwUVDig5ngLNbqwCYmJtQCgpfBosTXkCbvmJSZCn5p9eJ6l8fHQH6
   7MJNhsSDC0qsqEDHeoPhGj1/b8y6632DH3pV5knHmUzbs2yy6t5zqXzCr
   CQnppNXTIiLxoXk9aF4gYSavibp8SshW9YFKs2Rzi19CS3+CANlfOke+2
   69Ff5puaNVj3/ihcoBibav5+DOO+wM9J4qclfB8SOyLL3Stl0k4l0BxOD
   sGNxQ1JRUNpIrH0+tyE1XzUotMOcaW35U1Fn7RGx2ApdaQ0Gr4mP5lcGH
   DgL1jl5JibHmVI3okOqAg+G4COke7T/+oTtwMn9yzmCpjLLn+238vNURw
   w==;
X-CSE-ConnectionGUID: tMcU7igdR4mWcfuQimrA9A==
X-CSE-MsgGUID: tQPTfDdeQHad/xUv7lmJmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164671123"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164671123"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DBED6C68E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3622DCFBB0
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BEF8020071A2A
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B80C1A01ED;
	Mon, 14 Oct 2024 16:55:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/54] python3-cbor2: upgrade 5.6.4 -> 5.6.5
Date: Mon, 14 Oct 2024 16:54:40 +0800
Message-Id: <1728896115-2944-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--0.050600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRsZiTLIQu4YpJsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62Su88YEIcWdpYgHWYm2VNpIa027v+jiwo6oRjeGzWtVOZtC7
	0Bd3Uw49yT7eO8lFHzDCADwoT0Ek9UvIXCglEv2VxNqzWYrnX4S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112871

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Published binary wheels for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_5.6.4.bb => python3-cbor2_5.6.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.6.4.bb => python3-cbor2_5.6.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb
index 37c3ab647..6dd9f0cd1 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "1c533c50dde86bef1c6950602054a0ffa3c376e8b0e20c7b8f5b108793f6983e"
+SRC_URI[sha256sum] = "b682820677ee1dbba45f7da11898d2720f92e06be36acec290867d5ebf3d7e09"
 SRC_URI += " \
         file://run-ptest \
 "
-- 
2.34.1


