Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC624E81E17
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 15:58:02 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.16775.1696607881622056326
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 08:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm2 header.b=oqdsnbb3;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ikndP/SZ;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.25, mailfrom: cvubrugier@fastmail.fm)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id EC3B25C0233;
	Fri,  6 Oct 2023 11:58:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 06 Oct 2023 11:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696607880; x=
	1696694280; bh=YcxlgYb0JdeROaKsn4/MZKAfJu3+3AzaWMSpRTiQDcE=; b=o
	qdsnbb3KfZv8E1JPW/Q54ut8lOA3dmXNGeM+C/RcbmsM28RBEFkkXA2hiIymwI6h
	uyx6V+5CLvT4SG65K9kVtrPRjel0xZwfiT6Squ0koH47s6WNk690pN9drbt6cDy8
	b1v/Jew507KZj2M147C5CiVYlgcOFVWm3qpETH5M9hu97W7xn9XA8Lg/sOnwPhM9
	Aji7spxfvQcZUTklpwvn7tHyll4WOs9mK0lQmt3YTYitYiMTvrwUNZCqkTWb+TVE
	Om1aM2vz+oU4OCLLK+kXUIo9QfSHWpU5btvkQWVUlR8Wo+wcB91FfAFaXkLRxpoJ
	MM0npOIdVvVoYdhzBmm0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696607880; x=
	1696694280; bh=YcxlgYb0JdeROaKsn4/MZKAfJu3+3AzaWMSpRTiQDcE=; b=i
	kndP/SZIkuFEBMhfAvuQ8bACJk9nserEGynmDmNBmGDhk2FERWXnP3DhHOBY15AE
	1yHoscMYbPXMuMByAE0cyhQjXbfY8SLODUx0khn03Pd9Sjxr6B7txMSmToNUsZTs
	O6v854V/jSYVjv3ZjsaBw2jcoXUCujOxcqEK+ieBUoXEAhVUm5TNsErVtVh9yfRG
	54B0v5FmDpwtrr+0+l/aaUj8vSb6yAUZrY/z7HQD/cvCHconWlwQIdk9OQ9U5gs0
	PPPnvJ17aozuwE6yfaoIIN/HBnjRBQK8qc5Knn1RozJVFk3DOJAKaifA1W89qMzH
	sCEuA4sMRT24eHwjb2H2w==
X-ME-Sender: <xms:iC4gZffxq7VCLeUa-xO4fGc8EVio8dzWcTF84Tcf7RL9N2rCP7namg>
    <xme:iC4gZVMMRF-In9CfxXyY47Hw827-O2Z2KkG4iR5t7CzW3qx_zu4rKWoOvck0O3P0m
    5yc5T48l7UXgv_EOw>
X-ME-Received: <xmr:iC4gZYgp8AANKihj97SgYLM4N1ymbFmIS0gRAWnR4ondxBdkk_zw7XwmNzZrFtJVUhpmOU9R0Z4cYarOw64TqTZk0SfSvK32MlZM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeejhffhieekje
    egvedtgfeuiefhudevgeetuddtueduheeffeehiefftefgjeeuvdenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:iC4gZQ9L1alORr0QTspBtMt7qIXUaDx36dUQOH1u6fWDe7OXDYYT4g>
    <xmx:iC4gZbszWGH5tth4KIURSU1gZoGYJ5cRy3KRY5j5DBZpUQGR_oxk9A>
    <xmx:iC4gZfGkUgwSpyA5DWDuh1onJK6cVrTWwza-gOKo4h2-KCr7Ap_U2A>
    <xmx:iC4gZZ3vtemjJfqNzh3UtUu6ZyNE3iA4DrSXF3z5Pyln52JFPVltXA>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 11:58:00 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [PATCH 2/2] nvme-cli: upgrade 2.5 -> 2.6
Date: Fri,  6 Oct 2023 17:57:44 +0200
Message-Id: <20231006155744.36093-2-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006155744.36093-1-cvubrugier@fastmail.fm>
References: <20231006155744.36093-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105371

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../recipes-bsp/nvme-cli/{nvme-cli_2.5.bb => nvme-cli_2.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.5.bb => nvme-cli_2.6.bb} (95%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.6.bb
similarity index 95%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.6.bb
index 492de65a8..0d8923f34 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c libnvme"
-SRCREV = "d6c07e0de9be777009ebb9ab7475bee1ae3e0e95"
+SRCREV = "bd2f882a49a14b0e21a94c928128b1979e4316fd"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
 
-- 
2.30.2


