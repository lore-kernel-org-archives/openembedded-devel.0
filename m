Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73161C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 17:45:23 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.47398.1707932718245620831
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 09:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm1 header.b=rkaxCCyX;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=gd2+k1EA;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.25, mailfrom: cvubrugier@fastmail.fm)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 7B4EE5C0099;
	Wed, 14 Feb 2024 12:45:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 14 Feb 2024 12:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1707932717; x=
	1708019117; bh=UiMpD+2ev/v7200TsHJZ/NT/G2SR0WmVAbCHWbbEx8g=; b=r
	kaxCCyXTSltIbmsR2SjHQrfv1MlM7RQl1wp813AlrIYiw/jdUuhYOitDjhys87Gf
	xB5uJVjRC2sBH6l5I5NrDcc1+cuvk7sMkMGXLcqL0QrMfdj8/yqPtSR5cA+80ZT/
	I5KAbUwqUlHUy0V0dA0OL1EAlejLXWYM4E/RXfKSmDg9oW1nopzi1oERse3zAPhE
	NAT2uDY92IyDU12ortezW9wY2WyZ91vaXnvFgLlZwQZvmRfcvY/G3vBVYch4X32T
	8aYxQuLtgkQYwtZyOV+ber4E05N3IrJJSuZYhz0Hm+VUKjn0U4h3/uEZzLLm86Ak
	1TMel9fU9fVTLiwumFFYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1707932717; x=
	1708019117; bh=UiMpD+2ev/v7200TsHJZ/NT/G2SR0WmVAbCHWbbEx8g=; b=g
	d2+k1EAInLhm+nURPy1DH46wwjPvblagQyfJDknoK9BhpZm85V/8OhiBtLVcyP3r
	RfMwjixgSkxsQCUgZDF/ESJye1tcYxw1nXRSdSj4nZ/TrtA1NeqojNCV88x63cd4
	sdVRageKrw/MPxMcDSqeDLmsn5h5/xZF/3ACBeSfTW0RRXXHeXAYCxToirAKCOIC
	A4PrA5PpUnljOBIImFG0jnQVFrRwXABCVv1AswB+pXcs5BsosWdUo7vSK0YkNXUn
	5+/lY0zqWX5qCLMwSGP6xPDrBs4/uGvFS/VPuMCb52g4SNXsztmN2V8isaJemGdx
	Sqh4HF1B1v9KCldA0qEfA==
X-ME-Sender: <xms:LfzMZfV57QC3iC_ewdZoTkG_tAWs3J2J7Hxg8xwQcXu8vGaiDvKffA>
    <xme:LfzMZXkngez4vjpqeui-p9gc5O-ORb5AcZBVFJ9bQoNkp5WEnnKUlQsdXWBX8vuJy
    eP_5803SgJGjXftLw>
X-ME-Received: <xmr:LfzMZbbcYAVMFHIqJIr57E5osfGxQ5fVnzYhXC0p-hRV_5R42nXVdxj_F9SuDxITfEoB0J4WoINzz9Idq2sxlRNv2Ep0orH6ylYMSgPQbF3qFS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptghvuhgs
    rhhughhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepjefhhfeike
    ejgeevtdfgueeihfduveegtedutdeuudehfeefheeiffetgfejuedvnecuffhomhgrihhn
    pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:LfzMZaXpNOFh9rIqNT_AxDXa0tcErIFs_jRChrpaufBSn3GYB7sqxw>
    <xmx:LfzMZZl90SOzemZk-ZzpZNxJKJEKVR-E8HEGnBOQ4Me7CDDUcIGBSA>
    <xmx:LfzMZXeM_G58y8azPupW7IjVhdpFx-KKctxSvo4GjzI4NRPmc9JLIg>
    <xmx:LfzMZZukH0Cqf4p9VCrPtH2oO1pgjL17tJy_efPLQFKJ9vafdYeT-w>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Feb 2024 12:45:16 -0500 (EST)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH 2/2] nvme-cli: upgrade 2.7.1 -> 2.8
Date: Wed, 14 Feb 2024 18:44:53 +0100
Message-ID: <20240214174453.59408-2-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214174453.59408-1-cvubrugier@fastmail.fm>
References: <20240214174453.59408-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 17:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108746

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../recipes-bsp/nvme-cli/{nvme-cli_2.7.1.bb => nvme-cli_2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.7.1.bb => nvme-cli_2.8.bb} (95%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.7.1.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb
similarity index 95%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.7.1.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb
index d2b2536bc..81b30c283 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.7.1.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c libnvme"
-SRCREV = "dcdad6f5d70ffb2fa151f229db048180671eb1fe"
+SRCREV = "43b716b982da3df1cf8c4658f7c31b0fe28d377b"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
 
-- 
2.39.2


