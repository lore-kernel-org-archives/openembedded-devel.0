Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1040C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:01:43 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.3000.1647295302906559405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=wiBjj1RS;
 spf=pass (domain: cold-front.org, ip: 64.147.123.21,
 mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 3FFD03200F3B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 18:01:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 14 Mar 2022 18:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; bh=rup2KIGPu50NKinG1Bq69H3+sZGE+jcFcVan2CKdB4o=; b=wi
	Bjj1RSpzL3HUHkkxOb+k6OGsyQi3i+d1MH14DjKN676gOeUoPTEYAxeFliiOH5h0
	ukOAwtrKOiMAZubvUY0RpBo5d0dnIp8B2ALNLmm6SV4IABpx6ghXZNZM2eoS4FHy
	oOSWrG3+cgjAqq2ZGV4XPWM6SXcRj8EkE/PlBonOk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=rup2KIGPu50NKinG1Bq69H3+sZGE+
	jcFcVan2CKdB4o=; b=SeLsyFiARxWTuVt8g7M+pvYKRUtBmvqrJthb35jZNMkq8
	kOQiptXm5u3YkLGONqmzbWQsxYeWV95GxEOEFMXnF29RnOCHOnN52DSDJ+hyJeCj
	Wl3zGhlkgW1FT0Jbm+WiOy6ExYtgx806kO+FiEeoyI/YMnmmrqEJmNkHo+69jwBf
	eThYrq5X73E/zssSc7D6lJqooQ96HqeVS+S/7Z6+CkM3GIxzADtYgQzJ4zhqCUJD
	xF6ah+im4+DTVF8DD3zpuONzz4AF0LjdBmehbZNRCKPjxleAjHYUMOVeVU//O2Ax
	D3qFZqkO0o+34zPhk1xHFyatMaHLDJ2VrAdzCg3ag==
X-ME-Sender: <xms:RbsvYgOR9F93yOVaNINb2X2UDtXvP-OZDgSLu6Jjt9Ymk4qKYhgP_Q>
    <xme:RbsvYm-MJCb3Plh9i5vB3wWXzRhEtTTkCjUBTwea4X-KxKTnGxX3uAcyFSvFL1OKK
    thPguqlrP0ST33A7A>
X-ME-Received: 
 <xmr:RbsvYnTdb8M8eIj4VGYlQhKThZglE3gm_iQM_1B7IvG5md0s-sLpoJt1RyNzUv2nJ2YqdVBSvY63Kj65sPtHReN-EQIlpGEaCAPKMYULQ5p8>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepvdfhtdfhffeiff
    evteevieefuedvtdfhleduieetudekgefgveffgffffffffffhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholh
    guqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:RbsvYovuarvJZvo6t0h7FfedZmdmpPyVNE0_sW3yzoscSTVs7Xihrw>
    <xmx:RbsvYoc3QI0zXQIjzM9lL2db3yTOdJX037Owz1zOm6BiONlsEX-RFg>
    <xmx:RbsvYs2KlZk8aWDcaBvYQTNV0VDNGKuxPOiLUyKp1kf1yYV34SKnSg>
    <xmx:RbsvYio-vkqz1DaVPE09HmjCW3vw6MhkRA-J_H8dNowjVbBgAkxaiA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Mon,
 14 Mar 2022 18:01:41 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pymodbus: add asyncio to package config
Date: Mon, 14 Mar 2022 18:01:39 -0400
Message-Id: <20220314220139.8956-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 22:01:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95988

When using asyncio as the backend for asynchronous communication,
pymodbus depends on python3-pyserial-asyncio.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb b/meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb
index b628cadafe..46565876fe 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb
@@ -11,6 +11,7 @@ inherit pypi setuptools3
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[repl] = ",,,python3-aiohttp python3-click python3-prompt-toolkit python3-pygments python3-pyserial-asyncio"
+PACKAGECONFIG[asyncio] = ",,,python3-pyserial-asyncio"
 PACKAGECONFIG[tornado] = ",,,python3-tornado"
 PACKAGECONFIG[twisted] = ",,,python3-twisted-conch"
 PACKAGECONFIG[redis] = ",,,python3-redis"
-- 
2.35.1


