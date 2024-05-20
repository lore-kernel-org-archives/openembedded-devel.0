Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7488AC25B78
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 11:17:45 +0000 (UTC)
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
 by mx.groups.io with SMTP id smtpd.web11.58459.1716203863917971365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 May 2024 04:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm1 header.b=VgzklES7;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=F8AciXzT;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.158, mailfrom: cvubrugier@fastmail.fm)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 1FAC81800124;
	Mon, 20 May 2024 07:17:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 20 May 2024 07:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1716203862; x=1716290262; bh=Kg8RkQJAL+5oSEABS47CR
	DR4kzMLYtCeZ1Eq+pIyWj8=; b=VgzklES7h5PMMLHOQxhFXyTpWszb7LEY+GZ2P
	U4iMjt2OWobxi9BzX8Ajp14idxmP8A13TngMT1K2K8txpnj98FS9l7d3hDonav1C
	MVrm/fKek3a+MJJ3DxwBNJOjX1RfMbhLM2t1oYROQuXNYVy0/GzBZ2MAqH7LdVLg
	30KSQ8vK3xKcvw7LpJlqMciG8Jv4bhZlvDR7fqacaWXKImCzMMPnPKMvzW01viV3
	B4hV2mGU3yfJoNU5z0mI/qliQOir2xHjAJL3N5mc+B14pYcDC85Rs0vLetHZDWEF
	r2GEgJfAehiwuEJk0WWwssddeSt0MB4wnjTIZB0kCB2+lgPgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716203862; x=1716290262; bh=Kg8RkQJAL+5oSEABS47CRDR4kzML
	YtCeZ1Eq+pIyWj8=; b=F8AciXzTeAYyerMBN9fwrEHxYJJUw6AChhElQCcm/9sq
	AIuBfojNv2UhbHLtIMafVASb8iiG4q2YhACny2fcAfby4pD8LcmqYkej7PI/DB7C
	Gug5MRXiXSa2GYDOOivFK1fKdJeeK3SbeMOjlKCbPkmw1K+/okX0h8tBgQ3jQalR
	TN7zRcJoPN7iwDYtNSZfbld1ryDKw9caLOvsglDsO2OyUMCq5WWs9+uvvzJWQQLs
	SfS3DqEOKSKX3arVPRkF+zhhqnBbIGVufSyB5Mr37QLoQQWwVMb7xuWPHtXHvdsL
	IAH8ANnmB1PM/KBcnda/23Lzl8zrU6N0wHE7HNlJ6Q==
X-ME-Sender: <xms:VjFLZhvofIsCwfoRmG7jzm5vboBNszNZV2R1K_B27z25vrA7Fw_4Dg>
    <xme:VjFLZqcxkUeX91Z0jG-CXwMV7hymgUcckvO6RZHpN6kYbhgO8DW7usKz0ZTllMAfe
    ESKDtPypSx_9HVKrw>
X-ME-Received: <xmr:VjFLZkyGwnrbiWulK1aU-uwDiWrGFQPf-51Usp4RQ4lcz7e3Z4QBpEUM5v0azYCLwf9tojvDyoqAggw9yPhaGgDszgx8R7Qu1y4OK6XkTpQK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeitddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptghvuhgsrhhu
    ghhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepieeuledtkeegke
    dvveelgeefhefhffeiveeiledvjedugfeivdetjeffledtleehnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:VjFLZoPibgSxfndVpyEF73gz8E-4gymM2e2CzPGHnLr-iCox4Zv46Q>
    <xmx:VjFLZh_ovyn5B2ClGkuQUGpHMIDBk3koFbjkyIokhIzHTocZNqdMzQ>
    <xmx:VjFLZoVLvJDQLFKj0l1TDvG_fk_hFGJB6aYqMTCgJ1LFGVHPizMt3A>
    <xmx:VjFLZic3PzPDMC-D5yKv4UVjLwZrrRiF6HF9dB9BiQip1DwgwU68hA>
    <xmx:VjFLZjI6Lh0Ds3jqyLin4IlN09mjUibe4-sxDPBX5dJIXriGNLFUSogB>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 May 2024 07:17:41 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH] nvme-cli: upgrade 2.8 -> 2.9.1
Date: Mon, 20 May 2024 13:17:32 +0200
Message-ID: <20240520111732.82947-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 May 2024 11:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110438

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Keep nvme-cli in sync with libnvme which was upgraded from 1.8 to
1.9 by the following commit:

 * f3b2cfa3e libnvme: upgrade 1.8 -> 1.9

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../recipes-bsp/nvme-cli/{nvme-cli_2.8.bb => nvme-cli_2.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.8.bb => nvme-cli_2.9.1.bb} (96%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb
similarity index 96%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb
index 211d7ffe5..8c090186d 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c libnvme"
-SRCREV = "43b716b982da3df1cf8c4658f7c31b0fe28d377b"
+SRCREV = "b340fd7dcf1aef76f8d46ab28bef3c170d310887"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
 
-- 
2.43.0


