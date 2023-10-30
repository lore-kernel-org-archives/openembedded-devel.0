Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA8BC4167D
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 18:34:23 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.157233.1698690860067843653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 11:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm3 header.b=ZMfrEBjL;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=sDRZXInZ;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.24, mailfrom: cvubrugier@fastmail.fm)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4D55632008FB;
	Mon, 30 Oct 2023 14:34:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 30 Oct 2023 14:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1698690858; x=1698777258; bh=/7BeJCU2WS
	VX6P2oKttKcowEzzxU+Xf/uEqpYmZpSck=; b=ZMfrEBjLRkv+W3O7WqIZ1Pg8og
	PnAoh1NW7v8VE8k3Q6fNj+o2FHcZ7eokaw75Qy6BEiIyr+GXImJfkzLzJtv5KGHL
	/3bD91DvIreiDw/s8ZJ6lQcUIHCAkCSAal3Qv+tSkaKLfuz2plSjl8CEMI2hvfkr
	6KOtZqZ8hJ1eEVlGGW8N2LAf9kAEVzBv8YYoPsdi5VLiAeZR7KBBjSRrpa2a+k1t
	jDvC35Np6kTg2Y9B1z0aP9W09fWQVjgb+3Rova1lXs5IvIxzekawG7ECdSQMVsWq
	w1AM/VCsGzwIeJQB9oMKadvh4ddY1rHeDioMCb/9n16xA1mTh8XJqTurA7Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698690858; x=1698777258; bh=/7BeJCU2WSVX6
	P2oKttKcowEzzxU+Xf/uEqpYmZpSck=; b=sDRZXInZfdyqZpuV2Kzm6vpyOq8Hw
	yNA6l2qfOwDNl3GUD/HPROYvHk3nLAbQFUWcZOHqM6SM44dYrtsAhi8UYXl5Q2UK
	033U6jh+Jqh0v5Sj6Bsc5a4FG2B1fMfPjk+bIWwRsrQQ7iD4FCIc8VCG4zVGiquX
	+tzV4bycpmRiXtLmOCBEI68/Gnn6Cx49qb9dZwF0fmEJxKWgqMQK+qBVhiOt0ILI
	NOjwBlRAu1dyS/sMyw5i7UunsMtZiTNC0rT67r1NT4vh7aJzDv3HWmuwpkHFQImA
	BxU/z1XOrkwr0lzhQbEGR/L+x/lAfKSZXvCw8E8xUKoojR9aNBAK74b9Q==
X-ME-Sender: <xms:Kvc_ZRDdBPUzVG_IfdDB_vzbhdmEfeRIBqcwTpL5ZXcQVZvb5U3sfQ>
    <xme:Kvc_ZfibZKRnyeEXWiz7ugGYP1LyeEw4ZesO8A8UPfLDYjQuMV5k_KiReuhSMYgS3
    idp4YBfjBAhRZ6Ddw>
X-ME-Received: <xmr:Kvc_ZcmQ9zKyVNYJt9d4sP2z3R0fHTvhSDxpEf8UtpO0c6f92-MOUOqj-6VXuvC-Ghou3tOQ7yslcE9BrZH5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddttddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeeiueeltdekge
    ekvdevleegfeehhfffieevieelvdejudfgiedvteejffeltdelheenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:Kvc_ZbynrCuDsbMnEk2rlOOBxktkRKtEmyW1NXU9ukLw-MStotvieg>
    <xmx:Kvc_ZWQXypwM8_2tKKdBjg9oHPAXb9bLY0KmEf4NyqYGZImFd0hsTQ>
    <xmx:Kvc_ZeZpJhxDHWRGgmaRHLXDRGexcp1R8oc1jfYbntapu8z9URgICw>
    <xmx:Kvc_Zf6dMEGxM8hE9x6S5o0kxehsilEoW1EvhirrI7joTlR5Ifmb_g>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Oct 2023 14:34:17 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-filesystems][PATCH] exfatprogs: upgrade 1.2.1 -> 1.2.2
Date: Mon, 30 Oct 2023 19:33:58 +0100
Message-ID: <20231030183358.154218-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 18:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105797

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../exfatprogs/{exfatprogs_1.2.1.bb => exfatprogs_1.2.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.2.1.bb => exfatprogs_1.2.2.bb} (91%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.1.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.2.bb
similarity index 91%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.1.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.2.bb
index 3767ec48f..0dd5d8f5e 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.1.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.2.bb
@@ -12,7 +12,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a6f3b1fb4bd37835c8f8cb421aac4eb75b880a51342b29850c4063973162227b"
+SRC_URI[sha256sum] = "61d517231f8ec177eeb5955fd6edb89748d3f88ba412c48bcb32741b430e359a"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
-- 
2.42.0


