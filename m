Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F0DC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:33:10 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web10.9733.1678890781546846935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cold-front.org header.s=mesmtp header.b=yDC/8bVf;
 spf=pass (domain: cold-front.org, ip: 64.147.123.19, mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7EAEC320094A;
	Wed, 15 Mar 2023 10:33:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 15 Mar 2023 10:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=mesmtp; t=1678890780; x=1678977180;
	 bh=h46kGxVND9YRxHThHvlHVk8fPcpLp4zRozBtwNHvkMg=; b=yDC/8bVfW1e7
	GeCckm5HECTfDa6ALeWVLjXrznXwEipJGBVTJiIJPPwhkMpd1nX/yhh/1BOjIByo
	5cMoRfH7dg+41KLwkojJgI3/rjIc7PuyCVvQEm2VGWPdmrVP6odocj1oxxt2EeU7
	Gn9Ze5lnuA0vCP6lUZ3c0avGPHTjOIE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1678890780; x=1678977180; bh=h46kGxVND9YRx
	HThHvlHVk8fPcpLp4zRozBtwNHvkMg=; b=phsquebR/nPlTJV5Vav3bE/bzYnRm
	4zFcZuh/NrBZ7JTxlstI6p97VHyyxz70mLVfINU4zc6M4mX6UTVnYPE8ihXZsKNI
	g8JwCjxkyMObSAYgyUx3iWFRm8p5zJ6eTthYbu0OswR5JSTFlsBsGrv+vHIoMLX7
	cQsdw50AndS/ptaKqACy6gIrj92byJbl1NIowTT9oGfuuxj25i279f5Ab1YRLBQo
	weXJyn0tjiNkfXos0XH4hG31f6FSO+9+3n39wV1lyPUEzjE3dxadeGdAnZNQiZxJ
	HWDkVv7H9WAn/H6sqEtcviZZedDlFp54pBMUKjgcP9zPCkI99R2O64+NQ==
X-ME-Sender: <xms:G9cRZN8p6Y-RoxGLZ4irysWLTvuAzR-4yGkvXcIOnqLYnrNEdnmc0w>
    <xme:G9cRZBtKbwWaukXsMZM2OZTsfDoRs5bqUqj-tmpfRpL_33wXcENr3rKSZx5IYhyjw
    dogA8Fod4LJ1IDUSQ>
X-ME-Received: <xmr:G9cRZLAnO_8KHnlUvt-NAuqA0Q-RWFzqz56PCgRXcTTjc0Y8PT2Wj6k8mrEeh6rZHYZCgwO1fRGHMFI0PIH-1DSY0VoYdtJ0Zwe_ixcagA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvkedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepudfghfdvkeeuhe
    duudduhfeuieeikeegfeelhffgfeejgeelheejhfeftdelheegnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholh
    guqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:G9cRZBdy-0x8LYLietu6dl0e3_6qvXZtjGNAeloaA77H7sg3CkrOhQ>
    <xmx:G9cRZCMCCAvLGZmvQsMoAAir63Bnk1_ccPMu9fWfGjxc-NVXDXsHqg>
    <xmx:G9cRZDn3freAR6leR886xKuj-rA5eqy2IQZkJcvbAczzSgUR-eDcSg>
    <xmx:HNcRZMWKA9mg23it03EJ6fcfy6gtRIELb6GdvuKMHrRSMxUTgN_Z4g>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Mar 2023 10:32:59 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-oe][PATCH] tk: inherit pkgconfig
Date: Wed, 15 Mar 2023 10:32:42 -0400
Message-Id: <20230315143242.30243-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101563

I noticed that xft was not getting enabled as expected because the
recipe was using pkg-config from the host.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
index efab9618ec..f3cab4e610 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
@@ -34,7 +34,7 @@ PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
 VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
 
 LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
-inherit autotools features_check
+inherit autotools features_check pkgconfig
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.39.2


