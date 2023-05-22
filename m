Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFF9C7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 08:47:58 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.17493.1684745273567860125
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 01:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fastmail.fm header.s=fm1 header.b=kco88yMi;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.26, mailfrom: cvubrugier@fastmail.fm)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id D83E05C00B3;
	Mon, 22 May 2023 04:47:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 22 May 2023 04:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1684745272; x=1684831672; bh=qhqj2jpnEN
	ymf6ALc4XNMppcxNX9ZMLX8b0NNAXNPvY=; b=kco88yMiguSMVUBJNo82NI2rK0
	o9UTOJOBPPVlTeq/bAhC3AHaM1AbLnXZSZRg7/bs/aQ2TTYFzVc2rEqUx4kssJCu
	x5GicWuIx2832kgDw/ANbXOxEYISBjBmLob8eFbpidZHxpsmsD7iAOKD2+NllyJT
	c6+82jwTbm7acZQpqk1ULbX3Lpm4AjyPk2TQpHCwPp6v1xRN7TbtgXMl4BApCCGh
	MBqGylSrrAZ2vcIPXfGfEYBo9TjdxNxpQqXMbZMHmkhE76AEcbBDc68ZF93xROYN
	s+nmRAeiBTvOV/JZiU/7gvE3J3pHUkHE7NKaWmZpOBJJXmPiXKpJUJathD1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684745272; x=1684831672; bh=qhqj2jpnENymf
	6ALc4XNMppcxNX9ZMLX8b0NNAXNPvY=; b=JIme5LxbbjYyNk/HXrObw/inBKcY0
	Ov4O9x08XwhbOEJd8GtgYuotbP0oQ5IZFDtCWVE17ClphBTIG7AZfDwyNQGBjZlF
	FQKAmdnT8m/PksGbzBuIayv+/O8I4HZrDqKPkUvcMVWerHMReJ8dja9Z2hW4s8Oo
	b9rJ/TbVRj/raNHksX7VC4Ev8oJbw7NNPaz6ifG9CzNVM0WOq6KroeaXJDvN3dBQ
	x14NxEu09HLp2kD5skmICvbJyE0zS0+sY+5kH+ZIRFIf1pzXA5k7pv9P6QnoGM9j
	+WALgPlBHKbpm4FA94yky8weOms83xha1fFXvqTLdbjjtgIhlSLqVMYTw==
X-ME-Sender: <xms:OCxrZPsCY6wAgD_WRHr56UeV1PLOx_UbtTRjpu5WA973Z5bwBRR-EQ>
    <xme:OCxrZAfjLwwgMSjiAJXDGlnZaV7NvBAfccoYc74s_yfRyI647xvm5Jp4Td2DrvCAm
    Cfca9P1IKqY66AHjw>
X-ME-Received: <xmr:OCxrZCxMMIoGI18iF-8pJU4tjshEcOePEhai3Exce03ZAR84eZ0nh9kyBQ9Wp6fXf207kkbKaRirajz50SoOMRild0iL5sdwE5-WM3dT-wSzUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejuddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptghvuhgsrhhu
    ghhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepieeuledtkeegke
    dvveelgeefhefhffeiveeiledvjedugfeivdetjeffledtleehnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:OCxrZONic-AuRrWdRqiss9gNbZ67YrsKooa2oKwgo_gUON6Nii14VA>
    <xmx:OCxrZP_QgHvEIuqMwUEHvnr6RA4m50kILqCCkAcK2GreR82vMIylRw>
    <xmx:OCxrZOWymJ8_p5syPfQupeZBEQXcL6ZvYzDtEFg_IuUTHpJ6SfZ0ig>
    <xmx:OCxrZMFCMk6oSgQVTkwA9O_scuV9oE_TL_-60SHpMjk9COUpzgRJcg>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 May 2023 04:47:52 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-filesystems][PATCH] exfatprogs: upgrade 1.2.0 -> 1.2.1
Date: Mon, 22 May 2023 10:47:31 +0200
Message-Id: <20230522084731.37107-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 08:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102699

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../exfatprogs/{exfatprogs_1.2.0.bb => exfatprogs_1.2.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.2.0.bb => exfatprogs_1.2.1.bb} (91%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.1.bb
similarity index 91%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.1.bb
index 8cc59329f3..3767ec48f5 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.1.bb
@@ -12,7 +12,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "56d9a49465deafc367d428afc71c8098705a30ee19a3cdf3c5320650b8880742"
+SRC_URI[sha256sum] = "a6f3b1fb4bd37835c8f8cb421aac4eb75b880a51342b29850c4063973162227b"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
-- 
2.39.2


