Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251A3C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 17:15:52 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by mx.groups.io with SMTP id smtpd.web11.16376.1638983750846943776
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 09:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=jtICZIia;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.224, mailfrom: patrick@stwcx.xyz)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 5EF135803DB;
	Wed,  8 Dec 2021 12:15:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 08 Dec 2021 12:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=3taK6/2RKW52RElSAfirO+Rb13
	JdAayat6LPYjBU+Mw=; b=jtICZIiabislqRhWy8VFV8wo5Gfj3hthWjKXSlYDAs
	AJ0EL/ID2D6wv57XMFYwbKXIxSfRK6TB47vA0AtO/bcG0eAjbi3W/HmLMCryAeqa
	8RlkFu8rHxEvCl2n4azwwxpYIZo/i+qUavN5ZlrGwndepNWBQGWHGXlshFnm0By+
	1vATklZIT8juDvmjh1dZRrusS+LDcCyVUqbRnv9YsGbWapcl6cfmPZ2Hh9/JWYNp
	uIGyOb0/+xm8dOpBUYxoIOCDrHBBOcsPt1x3+GFwAt1T+Cc5v2jhz4MiSUY88nnX
	Er88W/l2Be/ExlLH/irw84B4duGSU4VPC4hG+mL10XBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3taK6/2RKW52RElSA
	firO+Rb13JdAayat6LPYjBU+Mw=; b=k4RAxl72V/+ILK/naPgTM+5sH4jRpAk/M
	NCIZK+tXWYh80NSzEtf8Ev8R5gQeSL69zYHN8hDzt7kuEEkByaG3bPb9frxUYHqI
	IHLKhTxHF/yzCg96y5KsovXoDAC3DNKe8kNuPDiGHMGHmg4z8Iafdvxj5WV0WGm6
	VHNU+OPW8LAlnNXsGrvWn5+P12osVDZaSXIjfwfyaVnZqy7rQhiVv4o3vSIc9Zut
	iG4Xc2jfi+KbZDSFcsiRALBWD5Xr30FMJPHX0bML4XmBswzrMqsEXv7g5dMT1A8r
	Y3Mch6GqET+oQE8kjOdrshxDkzkZFZxLr+T/7NAqB3TqpmGrRhAtQ==
X-ME-Sender: <xms:ReiwYUrM-k6Y1H5gYOM6eyZnVDLRXL3ugR2rU412SZtIq6zSrGPFgg>
    <xme:ReiwYaqTgbyB2KYoUowsYrIG4UdwUACKT8neJSBzVCdBdNJvuNZ1jHeSbvrYSI0qr
    CSE8RUNwkSYNSZ8CKA>
X-ME-Received: 
 <xmr:ReiwYZPz7jETM27jJ0LfkkzTv0EnYwuqk4cQSfkvVlYuTyhM-Q4kEXMV33RA7e2IpICgY-jvDc-alYcGGxAqbCbzY48Hoqr5oyEXwg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnegovehorghsthgrlh
    dqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgggfestdekredtredt
    tdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptddvheekkeejtdekveelgfejueei
    fefgffehiefgjefgteevkeegveduvedttdefnecuffhomhgrihhnpehishhotghpphdroh
    hrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ReiwYb4z-zviwAq2oQ-SNhZtEWqA36sA125nUOb3rGMjgu82DGnYTg>
    <xmx:ReiwYT6A3e2jTuDDbafQf_ktKHgkMdhSbZ8L7Avya318DaB-CAeBSA>
    <xmx:ReiwYbjqlcYcFprLo_mLpo0iS-6pIfNhk8f2VJPCkWQTWN4WmsPjCw>
    <xmx:ReiwYQjQoYKJlWYOv97NMut28vTwxkzRH_woUnD8ApW9_gXQhp-lwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Dec 2021 12:15:48 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-oe][PATCH] unifex: add recipe
Date: Wed,  8 Dec 2021 11:15:43 -0600
Message-Id: <20211208171543.1234000-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 17:15:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94252

libunifex is a library for enabling C++ "Unified Executors" in C++20,
based on current standards work being proposed for C++23 (P2300)[1].
This library provides C++20 support for async and co-routines.

1. https://isocpp.org/files/papers/P2300R3.html

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-oe/recipes-devtools/unifex/unifex_git.bb | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/unifex/unifex_git.bb

diff --git a/meta-oe/recipes-devtools/unifex/unifex_git.bb b/meta-oe/recipes-devtools/unifex/unifex_git.bb
new file mode 100644
index 000000000..09b8c2254
--- /dev/null
+++ b/meta-oe/recipes-devtools/unifex/unifex_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "C++ Unified Executors library"
+HOMEPAGE = "https://github.com/facebookexperimental/libunifex"
+SECTION = "libs"
+LICENSE = "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5b86506074cb3cdc493b4f96b73b2909"
+
+SRC_URI = "git://github.com/facebookexperimental/libunifex.git;branch=main"
+SRCREV = "9df21c58d34ce8a1cd3b15c3a7347495e29417a0"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+DEPENDS = ""
+
+BBCLASSEXTEND = "native nativesdk"
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
-- 
2.32.0


