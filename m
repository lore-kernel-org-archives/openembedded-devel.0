Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C90C25B41
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:55:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.116541.1698051301878686905
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137297738"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137297738"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:54:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 77D90CA1E4
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:54:57 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BAD9BF3DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:54:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 64BFB2FC6FD2;
	Mon, 23 Oct 2023 17:54:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.24.3 -> 4.24.4
Date: Mon, 23 Oct 2023 16:54:13 +0800
Message-Id: <1698051253-26112-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-2.662300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy6avPqv3X7/XOwpfLMeBwRu061diBteN1+0/hFD53Gidssb
	EkSX6c0l7KpXcvEKP/OmX5Ik+Zo+G5UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrcLVFzwq6fJy7zbBtEP+ciIdtWoXpon/8EbtTFtvjD50vQNuuzxOQdbq4XnLXRAI2Xtn2
	UUB5lmCoc5vlrFqfAVInNzC6TpnGh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105678

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.24.3.bb => python3-protobuf_4.24.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.24.3.bb => python3-protobuf_4.24.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.24.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.24.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb
index b78ae6a1b0..4b530c3b1d 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 SRC_URI += "file://0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch"
-SRC_URI[sha256sum] = "12e9ad2ec079b833176d2921be2cb24281fa591f0b119b208b788adc48c2561d"
+SRC_URI[sha256sum] = "5a70731910cd9104762161719c3d883c960151eea077134458503723b60e3667"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


