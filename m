Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9396C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 21:59:09 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web12.1441.1646690349115733950
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 13:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=swPtvS3G;
 spf=pass (domain: cold-front.org, ip: 64.147.123.21,
 mailfrom: jsbronder@cold-front.org)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 38C223200953
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 16:59:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 07 Mar 2022 16:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; bh=4AJsqkVfudDNE4y/NYgyHlyl37/NMD50jC9jYKzFmYw=; b=sw
	PtvS3GAA/vpsLFpyUY1jGR0CZULZ203qsvNkjNhFddTf1+uYKINgzbCM0lvWSUBT
	vjFB/f7UvE2+2+6b4dV/bdYUMadJleuPQegz+pP4qpu5TnfivJtilEEux09pLoWc
	+wlx/MQmgKWbT5WPTFQejodxzk+pAQ/S4uEHg+uRM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=4AJsqkVfudDNE4y/NYgyHlyl37/NM
	D50jC9jYKzFmYw=; b=TEjevAgN/lJdjastPbzbkltkNDy4Hg62682DIlQBBxTxW
	1SzOzO6NWBwG/Lawv2BLjbLTg6yMtrFS7EclR6GmtjFYPr3oweVaWU24TfJA2l9J
	n7jWHe0lF1LGxSyB0WaPH9t+Obh4w6RUeMjVyUAo0pg0noAxmEc0Ytg1BB1IzwI/
	TtgMQ+wBFXu4GHwfwWfwbUz+9yymiT6yKb1Zzx+3W2g6LoZfGnaJvAx5dlqwKOvv
	sRXmMviWHfBpX6vzTGZfMc/wRgTZwgiQ06cJJsnf2rniboj1sjy0f0crSvD9gL1r
	pVUvIiKUzNROvg38o+fBkrEDVEav6XHPid7sakKhw==
X-ME-Sender: <xms:K4AmYnP_Alo-SIhEa5VL_eJhnP22PgW3ul8yF2ra2_xfr8K-y5VW8A>
    <xme:K4AmYh8ywoQya6A7g8-r-ZU0TLupyYymAUNJXhTl7H0B0ngrIYR1NX65I73hfpe5D
    R3qXneztQg3n3qeQA>
X-ME-Received: 
 <xmr:K4AmYmSJqw0MObuYOgXrQ3-9-SaXQwROmyL-9ro14zHLkRtJiCzuZKD2bd8SIe74LPYrzsQOSu_acl3C2OGvJcVl_arxQVFaumDKDn2HglnD>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddugedgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepveeliedvfeefle
    fgkedvfffgteefkeegveffgfejteehffekjeeifeeivdektedunecuffhomhgrihhnpehg
    ihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:K4AmYrvDjJTicIWB9icYhwXmA7D4snSjJ9xoqdYi3doZGo1v2PrWrQ>
    <xmx:K4AmYvcccY4nV21r8vD0Q3OKr1kbfZFuuMxSQ7b7OIs3fpyKsgHt6Q>
    <xmx:K4AmYn3byax5pP5_2j_xSGX11Irb4PeyTBJ1stT0lg4Dm0oOmzSMZg>
    <xmx:K4AmYtrpaKkEaiondC3SoUJoQNFn7aGD5AYiyq9iGUZt-9psaKcWCg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Mon,
 7 Mar 2022 16:59:07 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-asyncinotify: add 2.0.2
Date: Mon,  7 Mar 2022 16:59:00 -0500
Message-Id: <20220307215900.30556-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 21:59:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95875

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-asyncinotify_2.0.2.bb          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asyncinotify_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.2.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.2.bb
new file mode 100644
index 0000000000..2bf9192481
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A simple optionally-async python inotify library, focused on simplicity of use and operation, and leveraging modern Python features"
+HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
+
+SRC_URI[sha256sum] = "867cc056d88fc07aa8b3d1dc5b9c3c911cdd6130a4df5f67beb1fdecfd37b164"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-asyncio \
+    python3-core  \
+    python3-ctypes \
+    python3-io \
+"
-- 
2.35.1


