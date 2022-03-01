Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A25C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 17:48:01 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web08.143.1646156880370622805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 09:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=BBZusItN;
 spf=pass (domain: cold-front.org, ip: 64.147.123.24,
 mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 7DEA53201D7C;
	Tue,  1 Mar 2022 12:47:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 01 Mar 2022 12:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=5J/jPJyL8sxgN3E3POvGBgJKHiJy7abG+yJ
	SZlmqG88=; b=BBZusItNTG5T6giurxliJud9GOBber4/xoCDsiL+QdnhSwBdMAU
	x8OWFXWa/znzkPlBkCongEZnIO6iBt/Kub1/mHhKVq5NeCQvoGWd2jYTwga9IcoJ
	3OduQrS9i1pYD8/H+oBVs6ffi6Edt7tQAUL+HePOYdiYv82FfpC0MsHQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=5J/jPJyL8sxgN3E3POvGBgJKHiJy7
	abG+yJSZlmqG88=; b=VwJu2RHDOFNG87RCFDbJ5dtQr59zOFwJfm2cmsuDPu9JP
	RcGEs0wWqa/f7lcZhaAQr67G1ROe5uecFHWFicCjjaMFagzU/Bds4TOxQ8ElnJ+l
	l93KS1EkI046wmHoYLF5/jILTRIG2qOnSEpld9jmmNMFrPf77MXhxHpLJM0W+7vK
	ICSFbIirXDHVTUvFskkSRmdIwyuh7086hSkEs1mIR5l3wCaSY8A7XA5LAWU4jqCF
	m1RGvjjhbQcIcJN7ZTHfK/AZVGM66sK6j8Q4o/4vkVwhRU7Dy0zIlMU2i3E9nODE
	y4Wjy9IuXGL76NlZgeKWRyABZ8mUxAWU8E+N1PZpA==
X-ME-Sender: <xms:TlweYp3oltqhyYr5cCStCvqvZKYgaSwP5kMPaj8g4-4GfVs0zXbuZA>
    <xme:TlweYgE18IVyrk_CnBNMA3N08D4EVnjfftctRuhDQZ03ESqUVQjaBEoPxE4cXDTN_
    OinWuL2z98B6ijVbg>
X-ME-Received: 
 <xmr:TlweYp7PMYkuvisnAs5Na6oy_-jl3O2uFLEeFX54EMCx4RyfH8Lx4Gb4nSsskoQf4zpEHynxG68Nu6ZB-h08v83iATWjsmXojl4gCeF2fRTK>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnheptedtgefhhfdtie
    dvhfekieffkeelheettefgieeuhfeuffffheevveeuhfeigedtnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:TlweYm3GSNkuAIuJGbk2XxkUQy0mgbB2CTTnwB6TZUAz_oRoU6w_OQ>
    <xmx:TlweYsEuApVJLJglZ7dBXFsWhTiQvVDfBCWMgsU82X2Pjnh1pEtfKA>
    <xmx:TlweYn_qwWDYCbZErlgTUYTGfMSz8iwHsSBrKLyh8YDjZlzgpb9SYw>
    <xmx:T1weYnMCgusp4lY4kr7i0go7U88B09aOhhcanb6VPuttGek9Yz67MQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 12:47:58 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-prctl: fix wheel build
Date: Tue,  1 Mar 2022 12:47:41 -0500
Message-Id: <20220301174741.17308-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 17:48:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95643

Recipe does not inherit pypi nor would PN be a good guess at the name of
the wheel. Set PIP_INSTALL_PACKAGE appropriately.

Also dropping '+git${SRCPV}' from PV as the SRCREV is pointing to the
1.8.1 tag.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
index 8426e48113..28d94ba5bf 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
@@ -11,12 +11,11 @@ S = "${WORKDIR}/git"
 B = "${S}"
 
 SRCREV = "5e12e398eb5c4e30d7b29b02458c76d2cc780700"
-PV = "1.8.1+git${SRCPV}"
-
 SRC_URI = "git://github.com/seveas/python-prctl;protocol=https;branch=main \
            file://0001-support-cross-complication.patch \
 "
 inherit setuptools3 python3native
+PIP_INSTALL_PACKAGE = "python_prctl"
 
 DEPENDS += "libcap"
 
-- 
2.35.1


