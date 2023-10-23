Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1274C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:38:09 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.116363.1698050280278448974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="124889148"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="124889148"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:37:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B9729D29E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:37:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DA606D4F42
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:37:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BF7734786;
	Mon, 23 Oct 2023 17:37:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dbus-fast: upgrade 1.85.0 -> 2.12.0
Date: Mon, 23 Oct 2023 16:37:41 +0800
Message-Id: <1698050261-25299-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-4.043000-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yUIIxwDaU5mr0bdjqKOoG3fcflby/TtXpAjr
	OX3xwpMp5uMU7oGSbz9K5jOVFoDq4juZPz8QQL7+qhcdnP91eXE5py1dA2ffkgKJcjtscVQFdYf
	AggaprvGBRkfiXk7+w9w7iL/iqNMttQ3xjOnW+18gaafg6U60IxniLo7qSg5v/mtU6zZvDhHmho
	PwYrefbbz7YlEWlkm232WlCsUoQuVg/HvJ1232MgvBTB90+he+zxauQOoKfWv//os1Fav+xm4j6
	HJSTgstcTvlRO3FNjuzARj4K/dXaEWNbZfbxvwGA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqfo
	MGP+CwQi+t+0AiFaYgB/8cibO8IY4gdubnRQFgxvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1CNrEiOs8+5H26rnSkFdTi7o5LnvqHi4A0Azp+DOtfgewQSkK0uk6wBgPhu
	Qgk9X63T3uhJlx72imzwikCC7vTZGTxkEb3kYNmW1z9vWl8eZTyZ1y9sjWHZLqPOO5dObQxMzMg
	JrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105658

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Feature
--------
Update for final cpython release (#263) (460a072)
Speed up unpacking arrays (#257) (5c8bfe5)
Speed up constructing Variant objects (#256) (0d7a665)
Speed up unmarshalling message body (#255) (5aed075)
Speed up unmarshalling Variants (#254) (dd74a84)
Speed up readers in the unmarshall path (#253) (f9b61b8)
Speed up first connection when using asyncio (#251) (0b6ba93)
Speed up unmarshaller (#250) (e4cae13)
Add cython typing for ServiceInterface.name (#248) (98c7e75)
Speed up connect and disconnect (#247) (8f39ba3)
Speed up unmarshalling by skipping unused unix_fds header (#246) (5f5a150)
Reduce overhead to reset between messages (#245) (da30b04)
Don't import backends by default (#243) (091d421)
Breaking
don't import backends by default (#243) (091d421)
Small speed up to the unmarshaller (#238) (b8d0e9b)
Build cpython 3.12 wheels (#234) (b38aa58)
Improve performance of processing incoming messages (#228) (ce61aea)
Reduce overhead to dispatch method handlers (#227) (b222552)
Speed up to processing bluez passive data (#221) (8e7432d)
Remove async_timeout dependency (#218) (7826897)
Speed up Message creation and callbacks (#217) (04d6451)
Optimize passive bluez message unmarshaller (#216) (e0e87ec)
Initial cpython 3.12 support (#207) (c755193)
Improve performance of reading from the socket during unmarshall (#200) (e5d355f)

Fix
-------------
Handling of None messages from notify callback (#236) (14f52f2)
Clean up address parsing and tests (#244) (370791d)
Handle multiple flag bits when unmarshalling (#241) (6f6f5f8)
Rebuild wheels with cython 3.0.2 (#235) (e8901a8)
Avoid cythonizing SendReply (#232) (d12266d)
Subpath bad matching (#202) (5d6f90b)
Messages could be sent out of order if they had to queue (#225) (4051cf2)
Avoid checking if a message expects a reply twice (#223) (823e85f)
Revert changes to _expects_reply from speed up to processing bluez passive data (#222) (dfa9053)
Spelling of dbus_fast.auth.AuthAnnonymous to dbus_fast.auth.AuthAnonymous (#220) (6c2412f)
More cython3 optional fixes (#219) (5b6cbc5)
Exception handler failure when exception is not DBusError (#215) (d771bcf)
Result typing in ServiceInterface._handle_signal (#214) (5bda04b)
Avoid double buffering when using asyncio reader without negotiate_unix_fd (#213) (c933be7)
Relax typing on _fn_result_to_body to allow Any (#212) (2f5fc38)
Typing on _fn_result_to_body was incorrect which was caused an exception with cython3 (#210) (c40c7bc)
Cython3 compat (#208) (43b3d48)
Reduce size of wheels by excluding generated .c files (#262) (dca4599)
Marshall multi-byte strings correctly (#261) (4de31a3)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_1.85.0.bb => python3-dbus-fast_2.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_1.85.0.bb => python3-dbus-fast_2.12.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_1.85.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.12.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_1.85.0.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.12.0.bb
index 6e1b599351..05502e223b 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_1.85.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "af346e87e34fa52c7ae82d117303cbfe089cd5391b5a1cc0e51f67066ef426f5"
+SRC_URI[sha256sum] = "849478e11d251fa4ebb99ce5bfee332cb6383c63ef0bc97bae23cef4e0badf9c"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


