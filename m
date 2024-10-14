Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF94CCFC528
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.50496.1728896174505859974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A7ViwxO8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896177; x=1760432177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8j4XLb59j7bXdyJ0wGbfBfksSGfvoQbVHlw7DlMLzgs=;
  b=A7ViwxO8YWnaHhQ0+ybBd4edE9Dv90qwFjHXEKH03mgpZn6aKdUJBNDo
   eaY7QSYKXasSpUq6kMKh30XEwrLnY/bXH6YCGQm663wTqQ8n/6cjHmrg9
   eOH66VgcnGjdbgDCraxSafBy7GqvoEGh87eXSrtmm8P2ycOvxC8v7rG0u
   fUeZSjEEsA/ChjtAdRTFa4K/tB+cw3znbEYl7k/Frg1k8/G8hWtdfbNQ/
   NIpcBrzPnEhGfZYvs4HvsaGdv2UYx++ykHg03XoPBVW/tIrUmG3vpsVLY
   A5Mj8O5hDFS4MvJxBuQT7VEtdQPpiDPuJVbOyYIdgrGMaZlFZs4Qrrbfi
   Q==;
X-CSE-ConnectionGUID: IdChUl3oRY+XsqFlDvrjsA==
X-CSE-MsgGUID: XX3ZBhpaS8irFax3qBKBEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176693005"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176693005"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:15 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BBC99D9048
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 07A2BD3F00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 93B9E6B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 401291A000A;
	Mon, 14 Oct 2024 16:56:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/54] python3-types-psutil: upgrade 6.0.0.20240901 -> 6.0.0.20241011
Date: Mon, 14 Oct 2024 16:55:06 +0800
Message-Id: <1728896115-2944-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-2.316400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSb/oIJuUAIuGYkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SFpcjFlp2piapfmsptkP9ysTKxiSwPaJpJwYYSAoCx3Ueh4
	9ycFNaUY24jb3bJwdPaYZZg0yXrJllSIDkHD/CuHZrxfQg1f1RS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112893

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- update psutil.Process.parent() return type
- per psutil.Process.parent()'s docstring, it may return None.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...6.0.0.20240901.bb => python3-types-psutil_6.0.0.20241011.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_6.0.0.20240901.bb => python3-types-psutil_6.0.0.20241011.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240901.bb b/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20241011.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240901.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20241011.bb
index 331756e46..c04c14bf4 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240901.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20241011.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "437affa76670363db9ffecfa4f153cc6900bf8a7072b3420f3bc07a593f92226"
+SRC_URI[sha256sum] = "5f5c71d02f7a018249d457e080f85966a31a8200644c5459f63cf02be1d85c04"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


