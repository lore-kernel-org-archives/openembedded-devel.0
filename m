Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB55EB64DD
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 21:10:01 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.901.1690319396444495440
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 14:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm3 header.b=DtpBshIM;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=UTFYUs5A;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.25, mailfrom: cvubrugier@fastmail.fm)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id AF56D5C00AE;
	Tue, 25 Jul 2023 17:09:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 25 Jul 2023 17:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1690319395; x=1690405795; bh=Uk3gmYNcZd
	dHKvVu9GQWi9kv0ahKGmJ32Rphv3084KU=; b=DtpBshIMtdRg3w6NzpB9H9MVaR
	99e5HQPip86waOVZ2xfj2ncGKhmp6Fk2jeEEHr/mkK0H0/JjXYkJBEAQymqIjUTb
	StT+BgDLgLQG+i9AMUqyVxcOxRZeGovCcKq9BQDextrS7GWD9c9YZEZoFGVmWidB
	/zwRfT4J07eCY/Nrgn1Uu/a/UVKR2CaBku4LGalLlK4lObm8aQ6tSDUhrXoW/sNE
	gIdYO4BC+Oggt7xtgofczQ9PD4DRH+pO+5xd9t0zWoCCvkqjBIvmYxAwceyUz5Np
	7kemD+5vfGM+mPqEgEQcPdecPYpNCe/r2HPLYVoNmqiRbOw1S6/V71R3cOsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690319395; x=1690405795; bh=Uk3gmYNcZddHK
	vVu9GQWi9kv0ahKGmJ32Rphv3084KU=; b=UTFYUs5ACy8uo7cgI7AtljW/iHz9S
	73dOnGBny51dhajG8JEja28c2ucbK7ZALaDU/C5k0NV8BiWx+zchN4D4LssnjXmm
	v4xONrXew0QxlBojAp2EkJ6TNUmY7feEGzrhCwCCnL+Ngzja8l1J4TviZFWqxh0W
	YADb21e+mzpntcx+JLzLvXQocWCrGJt6V9oYmO6iCIpmypZ/5iXhF1uA7XwCO/Ws
	RAImFqyoF/JvndwXMh0WyHCEdfMtk+ZwncXw4xIzxDLaOKs3gA6fQD5I3pXEyEwE
	OVBBcEj676/Aey/s4sKIqG0m1R6LGxGGUNnRKHWefsyALelYja9Yd1njg==
X-ME-Sender: <xms:IzrAZC0BZcPCDzt2rGa4R_6h0WCocsiRE5jlAQ0Hfe2gUyNeLiF76A>
    <xme:IzrAZFEKglTAvlHnoaLjgxpoBszCML5lyDcfytdTdaDRmns4LFDVP29lHvONZQfDu
    UyuT8HxHeIsmnmxrg>
X-ME-Received: <xmr:IzrAZK6Cr4gfGCBpIGKaDWzj0yZgJME31gSzJLVj7Dk_a8tFJp20XT37Dp6dh6nHbKNBGKCd0GjHflhzxZTlRENpv1BD8rYOGumMvI9w4_khCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedriedtgdduheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptghvuhgsrhhu
    ghhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepieeuledtkeegke
    dvveelgeefhefhffeiveeiledvjedugfeivdetjeffledtleehnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:IzrAZD1kboOiNKNQ4wLEAHXrxa1vA_4HUsZClAxIkZ-8vYfEpAv8hw>
    <xmx:IzrAZFFAj65PH2E6KEjA9p93R0cdHzr5b5h3XGWjxVhHo6whxg08yw>
    <xmx:IzrAZM_EWRCgoBjzXJCp_g6ye68r5_T_FX1RSlDV3epajFw1GSotNQ>
    <xmx:IzrAZIMHPb6VpJIepMfE9_oiJIm-Cz6697obhYXHDMme4D9IzZxnBQ>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jul 2023 17:09:54 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH 1/2] libnvme: add recipe
Date: Tue, 25 Jul 2023 23:09:24 +0200
Message-Id: <20230725210925.158485-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 21:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104026

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../recipes-support/libnvme/libnvme_1.5.bb    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/libnvme/libnvme_1.5.bb

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb b/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
new file mode 100644
index 0000000000..607b055d81
--- /dev/null
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
@@ -0,0 +1,20 @@
+SUMMARY = "libnvme development C library"
+DESCRIPTION = "\
+libnvme provides type definitions for NVMe specification structures, \
+enumerations, and bit fields, helper functions to construct, dispatch, \
+and decode commands and payloads, and utilities to connect, scan, and \
+manage nvme devices on a Linux system."
+HOMEPAGE = "https://github.com/linux-nvme/${BPN}"
+SECTION = "libs"
+LICENSE = "LGPL-2.1-only & CC0-1.0 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
+                    file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
+DEPENDS = "json-c"
+SRCREV = "4fea83db8328ea788ea8f1001e8ce1cb80ef5fae"
+
+SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
-- 
2.40.1


