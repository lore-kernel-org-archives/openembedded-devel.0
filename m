Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2100FC04FDF
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 15:40:17 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web11.20539.1691682007809679802
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 08:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=zSdCZQKA;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=mvpo2LKy;
 spf=pass (domain: cold-front.org, ip: 64.147.123.21, mailfrom: jsbronder@cold-front.org)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 1A742320094D;
	Thu, 10 Aug 2023 11:40:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 10 Aug 2023 11:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=mesmtp; t=1691682006;
	 x=1691768406; bh=l1UZNa0TlidAb1x82pHADIFkBFYi6zizCy+tMbud4AU=; b=
	zSdCZQKAnsmVh/8B1NORbos3f/BiD41uIcid9pmMHKKhnPj2//2xD574O6pvstup
	sRuNN6NT1/d28qcbtkB8FvyUO9+cDTrxRsg+EqDB9q6A+JlXdHfU+ozKnKlZ0CUH
	Yxp6Rw4w2XsPlhyHj+15nV3PS44S1YmhUuRS08C5oEM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1691682006; x=
	1691768406; bh=l1UZNa0TlidAb1x82pHADIFkBFYi6zizCy+tMbud4AU=; b=m
	vpo2LKyVQ429tSvsF/KEii3R2RgefWT++JXKc002SwwGeWb4tyQQWc02dmVXmPHP
	UqkhGeLoLmUvFod/yYbj22r7WowdNFNEJjxkqIB3J1qjhKn/woJXVvQ91TPYS1u5
	yVhemu4qO6Bj8U0Cr4t23Q1pS+596Ea/aoScloUS6pVHnW+wZ7gJOk1vzCTKG8bf
	lg/UiyeaTMng9ngkxesXqBcRaC//ylxgl+Jwy38+5dnFF6kMomNvvs4fxnXxgtzO
	uu0R8SMwecvn9BxYzc5uPUQg2otz1Yi7qbPt25ijgyEVusRoRgLg2CHWvoRw8oCQ
	J3O2WGzlYKX5/PQycMBWw==
X-ME-Sender: <xms:1gTVZBizrlCKB_OpTinzNvGRJorynRfzd2xA3TMcGm6sSDZ-m12iBg>
    <xme:1gTVZGDtX4Fe80osC6dYgZeS5Fsh4YIHv47W2E4ulVFr1xhuItXw7nlKgxE3XzGZi
    2On3uDEeryNAqgVSA>
X-ME-Received: <xmr:1gTVZBGq_FDU9dCmw24SUiOisMb-F8AHgyvWk0GxLEv1NQKgHng_qFaR_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeevteehuddule
    dtheeigeefveetfedtteevhfdvgfejudfgieeiieffudehhffgteenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:1gTVZGQb70YPVZgDe604TKqkI6fsWZ6pUitSKR9lkeEqx825cV2EQw>
    <xmx:1gTVZOxF3jr92iJJa-PbOfEbqnV6a5x8cohERUtJtBkNlucRowuF-A>
    <xmx:1gTVZM5p7GEJ9Hc7pRN8uLscc0EvLlAC2x69Wzws6TksJx6y-aEpEw>
    <xmx:1gTVZEaY9KkaY11EnIviIXQoOdFVdLUkwCFz52os_g-6lVBln0uibQ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Aug 2023 11:40:06 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH 2/5] python3-types-setuptools: add 68.0.0.3
Date: Thu, 10 Aug 2023 11:39:49 -0400
Message-ID: <20230810153953.17293-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810153953.17293-1-jsbronder@cold-front.org>
References: <20230810153953.17293-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104326

Dependency of python3-mypy.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-types-setuptools_68.0.0.3.bb        | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-types-setuptools_68.0.0.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_68.0.0.3.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_68.0.0.3.bb
new file mode 100644
index 000000000..5a810c795
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_68.0.0.3.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Typing stubs for setuptools"
+HOMEPAGE = "https://github.com/python/typeshed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1608a4a9c7b578e"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "d57ae6076100b5704b3cc869fdefc671e1baf4c2cd6643f84265dfc0b955bf05"
+
+BBCLASSEXTEND = "native"
-- 
2.41.0


