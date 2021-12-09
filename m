Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C1FC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 03:25:27 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by mx.groups.io with SMTP id smtpd.web11.6893.1639020325741190561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 19:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=xbvIg+5U;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.229, mailfrom: patrick@stwcx.xyz)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 87C4D580290;
	Wed,  8 Dec 2021 22:25:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 08 Dec 2021 22:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm3; bh=Xtq64rsjQ2POw
	L8rEL3XXaVVhVTsM8NdkKVvIgNUrHM=; b=xbvIg+5Uh6rJNt0yn5A7VeBOj1rDF
	0F4bptsyWcKXzq9pyTtpirZjgA3FR37epzGko7zJ5vldhV4RmYGizFF8nBqwlr8h
	9WIEakNgTihjLKpZZmGVmaQG7dNAVKsXSy5moRzpAsX/7850f58/Z2XoNB0B87iI
	O4X8wDW+W7eYIuo5+MkAfPbzu9ngc3eedogVO2ZCnIA8KbWIwlyuDcojObVS1Pr+
	d+93ibIye3uUb8S2AcAe/4C2x3cEFn1vXxr5ZbldibYOSwz4a9xS1nSC/AT02Ijw
	9WnZ/57FrsDzKoyWB2A9Ac1iwjo2u+yJt/Ao/Sfc6l+1AEjQIGH3lZFSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=Xtq64rsjQ2POwL8rEL3XXaVVhVTsM8NdkKVvIgNUrHM=; b=ApmHb2s9
	YK6kvIaiy5ZxtmKL0MY4Sw8R/wtUdF1WPGjlxNCJTVfumNyZ6NyemhSrJKUGbW6K
	ZkTPv1jAmEpHFdoFfOL017JHcfelZoGDP5j9p4gK0dT0ElJCsGFP+7WaccFhZWaH
	SgjVkbGBiiy9Tn7/oz6J5OTN5vqSdLsZdoR36JGn/X3EXwfEsc/fQSccB6Hg2TGv
	Y/ayYjpeQoTT4NtETYZnpE1X2HE9BnwUkIC0elkWLiAhaHCne6viyb9aU+AA9JAY
	bFk5nEpCCmUupPReCcPrroUtqyCT2a1c/+raVb6bOcjz2KRTmddxA8PSqWtdMfeA
	GPSfQQYPpxB+RQ==
X-ME-Sender: <xms:JHexYR-6BXfYyaTFuKOZ_-_TP6O0Zor2VGH-1RiA9Pg_Y8sA7ule7Q>
    <xme:JHexYVs1MpGvf4R5jy2Ex8OhU-Cb4H2bOQQImkvPY6kc6Ze86WEs195oytWhO47ae
    F0-AiXYNMy7N4zwR_s>
X-ME-Received: 
 <xmr:JHexYfDRlP9ZbEKBuArAXxVQ1SeHYgcPibELRl9gU-yIuNmznteEIPOpePAAnO0tCR_gz3T9EDbxtdDkDbJcYxaCgX3i-Q--9EbcYQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrjeelgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnegovehorghsthgrlh
    dqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgjfhgggfestdekredt
    redttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepveffveekueetiedufeeutdfg
    feeludehudegfedvtdehveffjeejkedtheeukedunecuffhomhgrihhnpehishhotghpph
    drohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:JHexYVdvHnVHmZcLmw890jyV_kNLdwTznNZ2kiKCcdw-ibdO2ohKZg>
    <xmx:JHexYWNWdYh3usbEKnCrYZg6ymn9EULrxR_63SO31J3ObwZfbzynZw>
    <xmx:JHexYXlWvYNMhELZUay1s4NQ6WEODp3-1fL9xWVpEU7u2c38z-BrlQ>
    <xmx:JHexYQU9kPDbv-BObmQZ5KRl2_S289FzRCyeR16ZAKbRhq9o_n9HlA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Dec 2021 22:25:24 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-oe][PATCH v2] unifex: add recipe
Date: Wed,  8 Dec 2021 21:25:20 -0600
Message-Id: <20211209032520.1273859-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211208171543.1234000-1-patrick@stwcx.xyz>
References: <20211208171543.1234000-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Dec 2021 03:25:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94258

libunifex is a library for enabling C++ "Unified Executors" in C++20,
based on current standards work being proposed for C++23 (P2300)[1].
This library provides C++20 support for async and co-routines.

1. https://isocpp.org/files/papers/P2300R3.html

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-oe/recipes-devtools/unifex/unifex_git.bb | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/unifex/unifex_git.bb

diff --git a/meta-oe/recipes-devtools/unifex/unifex_git.bb b/meta-oe/recipes-devtools/unifex/unifex_git.bb
new file mode 100644
index 000000000..85fe39b6d
--- /dev/null
+++ b/meta-oe/recipes-devtools/unifex/unifex_git.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "C++ Unified Executors library"
+HOMEPAGE = "https://github.com/facebookexperimental/libunifex"
+SECTION = "libs"
+LICENSE = "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5b86506074cb3cdc493b4f96b73b2909"
+
+SRC_URI = "git://github.com/facebookexperimental/libunifex.git;branch=main;protocol=https"
+SRCREV = "9df21c58d34ce8a1cd3b15c3a7347495e29417a0"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ??= "liburing"
+PACKAGECONFIG[liburing] = ",,liburing"
+
+EXTRA_OECMAKE += " \
+    -DBUILD_SHARED_LIBS=ON \
+    -DBUILD_TESTING=OFF \
+    -DCMAKE_CXX_STANDARD=20 \
+    -DUNIFEX_BUILD_EXAMPLES=OFF \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


