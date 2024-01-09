Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E22C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 17:50:02 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.23589.1704822594100058576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 09:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm2 header.b=lGJUBvgi;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=z7FF6nOq;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.27, mailfrom: cvubrugier@fastmail.fm)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E3AD85C02AF;
	Tue,  9 Jan 2024 12:49:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 09 Jan 2024 12:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1704822592; x=1704908992; bh=0OaRWWzAGBhMXfxHfyIGv
	Zvf171BZ38OUmTw/pX9+zQ=; b=lGJUBvgiQSAJoS5Gb3AL+y0ju+SixJSpyzF3A
	q/Lo7Kz/2ZYy2a4d+4oU/C2ynxTHMp6tx9JHye0It8Ow/iJkKaCjb1gLi17/krhQ
	gZHzVblM5AFT8nOvHvUJFWOMcQ/kV7HBhr5C7vWk1zs5ajiSIJlcgSFUMEygce8g
	B6n38I3WYGFmm38WxhX/vNul8sM9TaFIbkUo2tgMjuh7/fksQjrOWxE+LV9WNFYe
	ZDhR2JPpBo0g4b7eIKXCPUvCnxpthm51qI7glwALfH8DyF1AJFbzHIhKmNwBFLgh
	iaQLz6OxeY+0W8PtFhhFI23nA8IKB2Z3/8U1b5uQ+CdZayxlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704822592; x=1704908992; bh=0OaRWWzAGBhMXfxHfyIGvZvf171B
	Z38OUmTw/pX9+zQ=; b=z7FF6nOq/Oa81fLjutie+33NsyTEowjc0KLdYgUX0TDc
	BqmoJMpwvaQIDhO1NVa9qx7wxzgbmWT7GQTGeUtoMRLPNyi3vD0eEkZbC/yb0++P
	P6ulhfQ4VfxzT9kDNZpu8WvE0zaKuw1+WzoVDoMVYBkQh7y+M5pXjWKT9YOfOkc7
	TO0R6BHyWLunuVGQOvZ1/nWuFigBNGPyL8qMQMbC+KTpq05N/iljbAzXSOyTAMXY
	BeNNmsrmW4O1plxINZJHkVbj7w8AfPtghugA46oE6ztqsT6fGQ7rQbEYBGphNYGB
	MH1giaK3EbBscCBcn8jJnb/2RXMjCILdqYb9VeA5SQ==
X-ME-Sender: <xms:QIedZc-a9KDL47xv7dBIpJpZ4ieC2pb_hiQgW6tzE7AG6vAm7HYcFA>
    <xme:QIedZUsABswqUoKg46K546Scd_Z3IhVbs_yfHf-K6vURxVmvnljw8a6tp1Gln3MUT
    ZFugK8f6dm8llRo9w>
X-ME-Received: <xmr:QIedZSDaVYkG52Iccbq4_mInEAoE4iDsjjOK21DbH3mq9L3qTua4_x5vojNWgRSKOgaq4CF0rmVApUC7FeK4hIeY8SmjiqrcuSuA4vtTz3g9pgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdehledguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeeiueeltdekge
    ekvdevleegfeehhfffieevieelvdejudfgiedvteejffeltdelheenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:QIedZccL6rXTHMtyeROzu-FHwA8fWWVB7FtakU5GZ47sXzpSnxWzQw>
    <xmx:QIedZROS82QRzQIzrV4rTxdsLIWjXAhvqB3pzVmm6py6Ca_ks9GW8Q>
    <xmx:QIedZWngXHUUEYW12tDmGZDI8AdoLMM9k26RV1ahEMv7jfyLsjbaKA>
    <xmx:QIedZTUbeJUCEXad_griOH3JWJ89-bA4uDys2agy2QhEb7FGc2t5dA>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jan 2024 12:49:52 -0500 (EST)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH] nvme-cli: upgrade 2.6 -> 2.7.1
Date: Tue,  9 Jan 2024 18:49:42 +0100
Message-ID: <20240109174942.156730-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 17:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108204

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Keep nvme-cli in sync with libnvme which was upgraded from 1.6 to
1.7.1 by the following commit:

 * 7a6ca59ab libnvme: upgrade 1.6 -> 1.7.1

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../recipes-bsp/nvme-cli/{nvme-cli_2.6.bb => nvme-cli_2.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.6.bb => nvme-cli_2.7.1.bb} (95%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.6.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.7.1.bb
similarity index 95%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.6.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.7.1.bb
index 0d8923f34..d2b2536bc 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.6.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.7.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c libnvme"
-SRCREV = "bd2f882a49a14b0e21a94c928128b1979e4316fd"
+SRCREV = "dcdad6f5d70ffb2fa151f229db048180671eb1fe"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
 
-- 
2.43.0


