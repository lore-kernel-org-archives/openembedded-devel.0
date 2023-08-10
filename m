Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12283C41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 15:40:17 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.20622.1691682012461612113
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 08:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=NnAuA6OJ;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=RLBnN54x;
 spf=pass (domain: cold-front.org, ip: 64.147.123.21, mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id CB8BD320047A;
	Thu, 10 Aug 2023 11:40:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 10 Aug 2023 11:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=mesmtp; t=1691682011;
	 x=1691768411; bh=1/Vje0VRPGqmizI8nQXjUkyXdZcdvikGytEoetOfszU=; b=
	NnAuA6OJfxtEmJG/uSevxyB24MO7VplL+916VE7Yvm5ACyaNyFcX33/9Eho1kl9a
	9Ar18KupaZgyrh/R0ZXggbTzivrQgi3PBTvccA4lg+MkY8iFd3QmIpKHryB7XXdh
	NlTWTarmblvHYbfyUaS1f/Sq19S54/qEwXPhBQWvzzg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1691682011; x=
	1691768411; bh=1/Vje0VRPGqmizI8nQXjUkyXdZcdvikGytEoetOfszU=; b=R
	LBnN54xbpvO8j7Kd7ikOnN9A2D3v4y8Xxv8gciJRye9SoibTCT+vOCKTwRu87JQp
	bYqSaNbYafz/51cbUns//cmMRRcagSfzIgCec2SDifi61e+tBRnBjtyG3gXghPCx
	Eu/v7yxAY3jzvryYnZTYq1GgsLNPnxYSmRqH9VYb167ei8PHBHkJlB0yddsh0P8H
	cVwd4Wj/UYL4W+qp4muYVZwXYWbt7NBCo/9GnSQRGax+2JwgtAY+/OJaNL7kR+kG
	6kGIjM44BS7lDH+3ycKOwlboUvZ/a91IW/wGss6XDZ2nsuiU6B7566EU+vHpVNqA
	dO7OVOY4ssznseEQxtd7A==
X-ME-Sender: <xms:2wTVZC6yf0q2p2qy41ze3vMQuVnAyiLReKvgY4_e7eyh0MqJJozcbQ>
    <xme:2wTVZL5N0uBWHYxVydSHlZbIvMZoZE7Ffe9S0UW21nVBR-N5KAnSUU2cZewNR2zVR
    fL0hQwfTK4aK9gAeA>
X-ME-Received: <xmr:2wTVZBcm7BFH_-rCHtIkLRUFY9ysnb-x9VOgViSrQ-HBPpMIoT1Y3IsE_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeevteehuddule
    dtheeigeefveetfedtteevhfdvgfejudfgieeiieffudehhffgteenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:2wTVZPJN3B81MmqrP_XxvGdG21bBd6B-PJZptdKha8veyHz3y_U0xA>
    <xmx:2wTVZGJgMHIxn-IaZs3v7LOVncTWQS8z64xXYUkEh_LJZjzh9Lii1g>
    <xmx:2wTVZAyyb2yA8YgR5TPSN-AGwJGbyIPUNZ5KPuBJQVWtr_6w_4vNpQ>
    <xmx:2wTVZAxPue2p6hlayQklvBIeVy1BSM_lu8QNULn71zfXY6lMC45vMg>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Aug 2023 11:40:11 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH 5/5] python3-typed-ast: remove EOL package
Date: Thu, 10 Aug 2023 11:39:52 -0400
Message-ID: <20230810153953.17293-5-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810153953.17293-1-jsbronder@cold-front.org>
References: <20230810153953.17293-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104329

No longer required by python3-mypy and no longer maintained upstream.
https://github.com/python/typed_ast/issues/179

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 -
 .../python/python3-typed-ast_1.5.4.bb                | 12 ------------
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 9500f80e0..f75007e13 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -437,7 +437,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-txaio \
     python3-txdbus \
     python3-txws \
-    python3-typed-ast \
     python3-typeguard \
     python3-tzlocal \
     python3-u-msgpack-python \
diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.bb
deleted file mode 100644
index e6c1746a8..000000000
--- a/meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Modified fork of CPython's ast module that parses `# type:` comments"
-HOMEPAGE = "https://github.com/python/typed_ast"
-LICENSE = "Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=97f1494e93daf66a5df47118407a4c4f"
-
-PYPI_PACKAGE = "typed_ast"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "39e21ceb7388e4bb37f4c679d72707ed46c2fbf2a5609b8b8ebc4b067d977df2"
-
-BBCLASSEXTEND = "native"
-- 
2.41.0


