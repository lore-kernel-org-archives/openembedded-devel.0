Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2A3C27C44
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.10755.1715677840109396209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sEtQAqU9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677842; x=1747213842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ul97CYqpe62/Rl5ThjWocL2GeJ54/r0ussTuK/jz8e8=;
  b=sEtQAqU9UcCexNdXhPVUJeC77fStv3AaL8ufiyL/KiNjWYV3E4zrgHyH
   0Wo3pkJ5T4Ywx5nYrvIxRs4b26NCRbnR3pelpsc0UmImcGCuq8W594Op+
   vLTs/1z1UyvMpD1aXL3d+LlP2D1CWF+ckRgy3X5a2kfT9eGLxqNlCg5+m
   8808UjZGxY3RWHEdZyLi6caUUqwVYGmDulih9w2UolW12idAa7kD6r+XJ
   IbQOenIBOo8cSF0eUbgemw7rX/w+d7py+uDKlvnu1b7ycG76eeK8eJp/Z
   LAzB9mP8onQSJhZboJVYpVXkxiEPofRQkjTTPr8GUAc45KC2fto2iOI72
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="146707035"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="146707035"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:41 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 74310E8521
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B2D68D3F26
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 458156BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E75201A000C;
	Tue, 14 May 2024 17:10:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/44] python3-types-psutil: upgrade 5.9.5.20240423 -> 5.9.5.20240511
Date: Tue, 14 May 2024 17:10:10 +0800
Message-Id: <1715677817-2223-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.745400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrcV3n4J/0zUNlioXfon9vxhUK
	FVP5dMig4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2ZjmdWmKHGLD4Yy
	coNpBJWB6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7KWi
	b1IgF86YSiaRbu3AnwG8VSjoXQuR0rAB0AAAJzbB2ilDmz1DHHb6vihrNsPY9UsWQmcX+GLBvWI
	NOkHd2vrQJjUtz95yWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110381

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- stubs: change psutil's Process.wait timeout argument to float

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...5.9.5.20240423.bb => python3-types-psutil_5.9.5.20240511.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_5.9.5.20240423.bb => python3-types-psutil_5.9.5.20240511.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240423.bb b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240511.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240423.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240511.bb
index 876f93a0f..c4475b755 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240423.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240511.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1b976cf86308316c5ac22cec688015b04273c84f8e691c3dfb0c12318f32a6f3"
+SRC_URI[sha256sum] = "2c0b22edab6c8775f4a8688e3f14cefda8793e26ddf99d61b654a0d600179087"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


