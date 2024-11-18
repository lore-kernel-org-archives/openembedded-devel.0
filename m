Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483A5D44002
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.36714.1731922213916458164
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RKhtycrM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922213; x=1763458213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=486vpnV0HfQlIDMmIG3Ozyq0/thLRkEGHhcUIYcVWfE=;
  b=RKhtycrMxjRCDPW13raR4YnjBgHXb/SC1djqr31pDrFHbveNm6y11QNZ
   fiYKuEMbWEGQgy6yoz7FYKWKVRkCxCD9dPxKLo8lJIelFOY1PVzx0Hh9F
   7Un26MKcC8Zpwy8quczVX/O2+ke1Lbae67uHeE9rJOQdFV/AsksvOIWAC
   UFDopL2YXeG0mszzL1Jl8plizX+nTjuGkQuEWhd9EkEm5BpnUskxzU9zo
   JBEUM8tMKaaC3BbLQg+QOfPZh6LZZ48gFJNOHAnoBH06R/9cmtiHGUc1z
   hG0SZs/Pw3UbSX/irDqLTi8pr9VqzvxIz1GICxL+6G6WD/0jqmh/on/0D
   g==;
X-CSE-ConnectionGUID: wHjHIlIfS4i73E7uihlU0Q==
X-CSE-MsgGUID: CCd2/fLNRvuwNrz4iRY76g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="159663233"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="159663233"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DDE7D5079
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CC19C4A14
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A876BE368F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:08 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5869F1A000B;
	Mon, 18 Nov 2024 17:30:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/32] python3-apispec: upgrade 6.7.0 -> 6.7.1
Date: Mon, 18 Nov 2024 17:29:36 +0800
Message-Id: <1731922195-5266-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62S1TcphPpEFM4jZCMmPlg0/D7ce6Psh9qNvwWKaXjEEJdIjX
	10HEDx/Eq/9qG7AJcqeuJDioHFqbE4/AUFA6DXkfTorgtNZaBJS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113878

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix rendering of nullable nested fields in 3.0 spec

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apispec_6.7.0.bb => python3-apispec_6.7.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.7.0.bb => python3-apispec_6.7.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.7.0.bb b/meta-python/recipes-devtools/python/python3-apispec_6.7.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-apispec_6.7.0.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.7.1.bb
index 670c791db..bccbc4bbc 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.7.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "fa2cf1063bb227ed6f7f66b019f320d7dc0a7cb02acdf166a160e2381f4b2c39"
+SRC_URI[sha256sum] = "c01b8b6ff40ffedf55b79a67f9dd920e9b2fc3909aae116facf6c8372a08b933"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.34.1


