Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263ADC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:43:59 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.1697.1646088238365646634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=0FoxQQtA;
 spf=pass (domain: cold-front.org, ip: 66.111.4.28,
 mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A3C555C01D8;
	Mon, 28 Feb 2022 17:43:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 28 Feb 2022 17:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=2q53zx5/1UQLMfRa2PRnEQOb6rGJn/oJxPj
	TAfGCc1g=; b=0FoxQQtAVwopKqkaVdJOYhuiGUWlGUJlk9wVX6JGoV2p3YIs2bE
	VgUcTfkj/gv4+QieZgbCVaJ5j5iD2MGsTu9ILaluXJHIIsb9fQV1RKkTJnxojsHU
	fykbpXNTwl2ODzx3xda6v1tiUC1ACH0Bzfhzxhq/Q0PiaorlztPELGK0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=2q53zx5/1UQLMfRa2PRnEQOb6rGJn
	/oJxPjTAfGCc1g=; b=VFk/Z9BnKYMIB5WGepiE88YnDgYsgdn7DSB+03+ZAXFph
	ICN3y3Sg26jp8CToRHmXWStMH0bS2Cnrt0iwwAptfhK3/sMN8ZqmRJQvelBvavBt
	sYcgeR44UK+ZVvuE0SqfOn1p7XqTu2Lo1XUEvv1X5nkccneMtfXeqX8BIj6vOo8z
	w+ITK5ZX7PpSy0NyrpYbH0HRNKd89Z16U/OePk8XN2Ns9ijzKw9seCawYL/0BzEz
	p9Fff2HVT+PRBMDXlQ6bfPynJnaq2fC+YZCpC2w192brUlI6x2a5NkDrCfj7Gw5H
	ozblvISyE+A+TMt/ARYRtEN1Dtcipw/zRf+q4AVVQ==
X-ME-Sender: <xms:LVAdYl5o8NW493vFwSKLXb06-nD6h4xSlcJhtrFKw9x_xuX9Wxeb0A>
    <xme:LVAdYi4AvxdNToZOWZJBoKglQBiPLAlXvMo325Jrj3rDhrw2-MZ2oK7VA8emD0GwC
    RgK_QROUyyBnGTXXw>
X-ME-Received: 
 <xmr:LVAdYse_RLzAiiTisbMU_iYFqlhXVPxlmn25GQ5FqVjW8i78RVWY-vJIvRWBwH4XtJR4y61E2bG2Y0qgzVdO3GTczdhk6Rio4pTnFaze4kTG>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtudcutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertddtne
    cuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghrsegtohhl
    ugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnheptedtgefhhfdtiedvhfekie
    ffkeelheettefgieeuhfeuffffheevveeuhfeigedtnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:LVAdYuLd6Y_PTEG9uPu8iQ0qpXpD1V3nciqjqPzdsVi_HuWrYbztXA>
    <xmx:LVAdYpJJiCiyvnEtVI5yMtoRF9cXjLqhuFeVXhdbZfx8HmDOIcKBQQ>
    <xmx:LVAdYnwbn6O61gg_D7gzWpRcIPofmsE1UCrG0YFjTJnRnXflDgniRg>
    <xmx:LVAdYrxuCXGABJwEIlSCjCVvq3ke8G_zCkYpow6hMRnrob6wVNZwtQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 17:43:57 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-astor: fix wheel build
Date: Mon, 28 Feb 2022 17:43:36 -0500
Message-Id: <20220228224336.28814-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:43:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95605

Recipe does not inherit pypi nor would PN resolve to the name of the
wheel so we must set PIP_INSTALL_PACKAGE appropriately.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-python/recipes-devtools/python/python3-astor_0.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
index bc3315f751..54e43e3754 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/berkerpeksag/astor.git;branch=master;protocol=https
 SRCREV ?= "c7553c79f9222e20783fe9bd8a553f932e918072"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "astor"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


