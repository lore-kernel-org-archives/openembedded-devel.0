Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3216DC27C44
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 08:44:14 +0000 (UTC)
Received: from wfhigh2-smtp.messagingengine.com (wfhigh2-smtp.messagingengine.com [64.147.123.153])
 by mx.groups.io with SMTP id smtpd.web10.7132.1717145050016373582
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 May 2024 01:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm1 header.b=u6sjxHfV;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=pnVXe3E6;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.153, mailfrom: cvubrugier@fastmail.fm)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 3279318001BA;
	Fri, 31 May 2024 04:44:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 31 May 2024 04:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1717145048; x=1717231448; bh=WBk97h4KS+w1Td3Ql9Ss+
	0HOQZ8blu//XVX5zOe18HE=; b=u6sjxHfVdJE1YclnsVJFojuPG5mvYIRlWN6GI
	JsRpxjo81M71iA6eJBOI1+5UntvSbxlrRAzJDCax5si/d6jG7lHk3QVYX0J9Ij88
	BUChUXTVsLuP7pvnQ6x2Vkug9xtbLYvvpc9s8iMEbj6bpeeyqNWDNpLH/S7fxs1h
	OZCLPtqHsmkvJrn5nDjwZnMqmRJoO4nBZE76kKjqzTibeK2mpWWCMildfm5DaMXQ
	JtJXFlQeG4SJJOkfXV6NF154Ix8MMHP+wC85pIFikNMh4UOWsqDGoLVASNfTerGE
	YLSADZgVJS47dZBwZzVBOIU6DtkVx2/AW9nZUGGEAxj5sklqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717145048; x=1717231448; bh=WBk97h4KS+w1Td3Ql9Ss+0HOQZ8b
	lu//XVX5zOe18HE=; b=pnVXe3E6LtQKEMb2VlgUPwV0Y283IGAGHpEeVEXFc3MP
	wtiPyAGOt8HErP0GLCH1wWRoVEoeRp7Id3qyboxFXvSnHwJDnN47s7UaDFWcKDA/
	/EJw1K9dLGcIhASO9UX7RmeMZ+s3ccwbWPJy6nMp38yk3CYwg4oI+FWB0KK3hoJ6
	2W4ZQ4+0A/CHtIvEc+Unv7MhpkHVWZYk8HJtgXvqsNM/x8CeaZNqrIldwA+njiX5
	uncZ1slFs3Mk8cFYiOGEheTYZj3kHKV2sRTya0RSgEzza+WBtI2x8KMl9Tam/b88
	rwYIeBo7OWoa7JuJdqX7//Q7d9W9Pne090a2cuu7Sg==
X-ME-Sender: <xms:2I1ZZgG6mwM20i_-UMz6bLJz00fAaNfzuKYGyLC-GrmRxCVvYp-qnw>
    <xme:2I1ZZpU0TRHZf5cq9vUhpMUMGKvebokJRiQYlYU9d72p0n_fETFgJYmKB9AtsWSoc
    jmKKNSH_LdHEEBP8Q>
X-ME-Received: <xmr:2I1ZZqKZ2WHaPkiTHPkRcYn7_knT4GvyGbY_Xzfnhf6zswfE7dJTxkcZ2EwoCk_BkktLtue9kbCnEccgxZE5YoOmfJPCgpvBHmAduKEdwnk5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekiedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptghvuhgsrhhu
    ghhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepieeuledtkeegke
    dvveelgeefhefhffeiveeiledvjedugfeivdetjeffledtleehnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:2I1ZZiFi6YsOCv3zZK6WpI1uodZokVPyM5ng8AGBBNnvMRokUKZmrg>
    <xmx:2I1ZZmUyOJG6B5cENYhSgz-GxH1Yqeo2mHbuNe9B50eCUfo8SQBjTg>
    <xmx:2I1ZZlPPNt4haLJfuRYOMfkEjM8JlQRIkr494VTgU7CXR1uA-D29Wg>
    <xmx:2I1ZZt1pvGhO3gC4dyn49AXO5p9fXi1BIHQjoaq63PzF8gvv4COfqg>
    <xmx:2I1ZZjhH71-Xa1Hm_1IEyosPHh6JNFM0iGbBGrTTueSOScQkIDdev6tF>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 May 2024 04:44:08 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-filesystems][PATCH] exfatprogs: upgrade 1.2.2 -> 1.2.3
Date: Fri, 31 May 2024 10:44:00 +0200
Message-ID: <20240531084400.157487-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 May 2024 08:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110652

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../exfatprogs/{exfatprogs_1.2.2.bb => exfatprogs_1.2.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.2.2.bb => exfatprogs_1.2.3.bb} (91%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.2.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.3.bb
similarity index 91%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.2.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.3.bb
index 0dd5d8f5e..98d7cc08e 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.2.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.3.bb
@@ -12,7 +12,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "61d517231f8ec177eeb5955fd6edb89748d3f88ba412c48bcb32741b430e359a"
+SRC_URI[sha256sum] = "fe7eb48d9a655b4fae9b08ef22c7dd20694a92fdbe9ae768e0af03c8be5c27ed"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
-- 
2.39.2


