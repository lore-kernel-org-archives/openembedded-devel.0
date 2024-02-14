Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F47C48BEC
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 17:45:23 +0000 (UTC)
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.web11.47939.1707932717430040920
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 09:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm1 header.b=HehajRRy;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=RHv4Jq8N;
 spf=pass (domain: fastmail.fm, ip: 103.168.172.148, mailfrom: cvubrugier@fastmail.fm)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id AF36E13800D3;
	Wed, 14 Feb 2024 12:45:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 14 Feb 2024 12:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1707932716; x=1708019116; bh=Q0tk25k4JPTnLoLf/N/PD
	Vgq73EYF2FLJ1PyuZiiTIM=; b=HehajRRy9i1vkEMzh/0V1PDUf0gfm0t2Jo4/8
	vmoil8jArBvZbGOE5kiJibEm6QLiHlEo5eG5XN8onGfvA0+WNaa1Sx5eH9QWCHXf
	VzR//SH5AbRTuEMYq9R67BoIV6ind2lqcL86vSUKE5blXRTdA/89qczLBVIGouch
	1msjKY1JjV8vBqa8SFBlgvtxpdM7nk5lEWvWgJ5K0IIwg2EZ7SCUvhhTiaFhxz9D
	0qjOHflTYRQLJQ4SDXiPUmD5zNF3mdCjNNO6l88dNsCwBFh1X2JP4uLx0yTlcC4x
	4ScgHaFFJWbNRA6bM7DGq2YlVRb2PjGPsRapHzyFw3x9nPH6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707932716; x=1708019116; bh=Q0tk25k4JPTnLoLf/N/PDVgq73EY
	F2FLJ1PyuZiiTIM=; b=RHv4Jq8NFUNnvlIi0ug2dPdwsZmAvN7TAvMin1DUteaW
	i9ZUKj3CJBtfnrMoJ1rFP5x8BynArCP4JiYWaLu4VT4uXA3y2ObmV9QFnluErqc/
	DpFZbW8aSpKbb1IMB7FB9uOYBjElW/M0wSiMlTDC6A5xhTEtgMjSPEBCoK8XCBcw
	E9RrJ/y0H5l0dx6l6hZ+Ncy/CWIdGefKb1y5CNyrPsO54m4yK9x9KS3q3t/RRfxJ
	HkeRt1KvEP43JM5BKnWI8V7xhpRfQh+FXbcIMB1tpF4bjnASyOu9qmur1+sPOBUN
	6IBKxJvWQjz0YyoddUG3ddLDG73NSgiqg0jgG8CHmQ==
X-ME-Sender: <xms:LPzMZXE-jKR4IRdsEgLWROHrgOM9HQQYl_eU1wZ0GxkZ7gMXlkYOLQ>
    <xme:LPzMZUU48uURx5TWpWshu7dHGliflIA_iR0nv8IWxW6dATA4-WlmwrAdtaO_F6tbs
    lSWy7hPG4rY20L8RA>
X-ME-Received: <xmr:LPzMZZJLrDOhYQ18y07QMN7-5-KTgn_QcbEttUgFdzQbgZeL9XhbyXQuyB9TO84VtiaW7aaTN0auF6g2rW83dvqoRIqgs-coOSbl1-UMg6ZFv4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptghvuhgsrhhu
    ghhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepieeuledtkeegke
    dvveelgeefhefhffeiveeiledvjedugfeivdetjeffledtleehnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:LPzMZVHFvFek5NoY0H8j7CB1VwHIuJUXSIck80t1hZXEAyc703oKpw>
    <xmx:LPzMZdWNllUWpEMZqiIWBwNba2CL3LYYqA-nvPrbKN-CeNkxyJ9SRw>
    <xmx:LPzMZQNeyqvUxTe2d4nB-ccxtN68PdB4XAYzHL39LKspGXa8bPfnRw>
    <xmx:LPzMZaigExI6iFXUEVkmauv46pqmXHfz4hE3OHqnoom6Su2A1B4cOQ>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Feb 2024 12:45:15 -0500 (EST)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH 1/2] libnvme: upgrade 1.7.1 -> 1.8
Date: Wed, 14 Feb 2024 18:44:52 +0100
Message-ID: <20240214174453.59408-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 17:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108745

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../libnvme/{libnvme_1.7.1.bb => libnvme_1.8.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.7.1.bb => libnvme_1.8.bb} (94%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.7.1.bb b/meta-oe/recipes-support/libnvme/libnvme_1.8.bb
similarity index 94%
rename from meta-oe/recipes-support/libnvme/libnvme_1.7.1.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.8.bb
index 985fd7c55..3894facec 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.7.1.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "13ba38387e5446849ae59d3ccd8183cf9aca3145"
+SRCREV = "bff7dda7e2a0f883d0b89e23fed725c916de3e61"
 
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
-- 
2.39.2


