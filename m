Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15DCC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 11:44:14 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.27515.1660736653817590948
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=T9ptdJHR;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 293C85C00AC;
	Wed, 17 Aug 2022 07:44:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 17 Aug 2022 07:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1660736653; x=1660823053; bh=eJ
	GDvhHkwNgIrklhqb7e5oBRuFr9Tisb2pvPdRJJZy4=; b=T9ptdJHRVkflsWT9xF
	hqiywO3GRnLTYSjxC8Bez0P9Wc9j8H/oyIunji6vdknKKXMBNNX65/0J8PpcDHdr
	MANqXbpmLYYSrSuDfj0D4/nnZGvVn0326Pxof1JlRwBwQjitlLJBOgD479/TpIZ/
	f9ORV224Qzo+Kpocjwp4mHXODMovgTqNggtI5DE2n6ds//nkAyf8sggmWyp0H1qo
	N8GYMHutX0evchyxe2IUL51evZk4WA2pMSFmRsM9jOF3IB+6gw5lxaukuL2Ivlah
	e6JkR/77oOcAD4kEPF47nFs3bKDHLXyVXFcgsnsXFoIgAyZY3L81xSUjP5/yLfUc
	D4xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660736653; x=1660823053; bh=eJGDvhHkwNgIr
	klhqb7e5oBRuFr9Tisb2pvPdRJJZy4=; b=zMiZeO62hfYEts9OygC0FSUH/7wYs
	IYhm8y08+lwda5yj7rmVoUhXG5kqinupGJkNEIivtT/FBQIta5pxsgOrWUOW41iA
	gk911L7XB1uHD6z6AusLUkhKhYyGl/XcbJV8z4ZaRyUcihqgE4xTiGPTnSi1Ggug
	cJm1pSi5tRaDUH2rNLCjQRYDU6lehwQvKh4Xv6BF8Lgjry0QfxtOtkb/g4nvjsPu
	2xFucxla4yvf5+nqePY3VQ0Oa8tU7jHnSzt+06UxdY6WIqAXxN6qNDdDrX8ECu1y
	4Tu22W+jsvPxNqyZE22UI7KtkpLsSPdXsoBnjrc11JX4PMf5pPaPFt9LA==
X-ME-Sender: <xms:jNT8YiM4UWJSeyttmNGRmN_hl3XQMLuO6G1Mol3b3OwM7vSfnu92Eg>
    <xme:jNT8Yg91PjdneVIo7Mp-gHH3hrTdhNar9If2Ffhho3FpawBFa59W4pBTFnjoOABAg
    TKO-okL6nwd4k28Rio>
X-ME-Received: 
 <xmr:jNT8YpSp94XMF4kdVlb2NTO-s5F5No1YQJZlYikMibY3n2UQkA-QNw7NNdQtreKlCOjUJyHXkFGR4d-u0_rw0lbFyWWKWFJuAGWbEsmmX6YHMfXliCGJOVlS>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    udenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:jdT8YiuYIX7ezXyXZg--bpuW4aNGDSkWNrD6QotkDmfiT5GVWERnMw>
    <xmx:jdT8Yqcw7LBkMmjpO3GgMeywOP5MuXc3IdPpj7G3A-fqDbWC_zPexQ>
    <xmx:jdT8Ym1dIbWEf8-dy7rhUK5f-JZ3Aqy3KSqmC4_KVqteCLzOJ8_DTg>
    <xmx:jdT8YuFdZe5XWQhrTOZItH2KM5v6yyQVCmktqjlByJ7BZavkahf76w>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:44:12 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-java][kirkstone][PATCH 2/3] libmatthew: Include features check
 from classpath
Date: Wed, 17 Aug 2022 13:44:05 +0200
Message-Id: <20220817114406.348705-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817114406.348705-1-andrei@gherzan.com>
References: <20220817114406.348705-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 11:44:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98293

From: Andrei Gherzan <andrei.gherzan@huawei.com>

classpath is a dependency of this package that also has a required
distro feature on x11. Without having the same feature check here, a
world build would fail when x11 is not enabled. Reflecting the same
feature check in this recipe, makes sure that world will skip it as
well.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-core/libmatthew/libmatthew.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/libmatthew/libmatthew.inc b/recipes-core/libmatthew/libmatthew.inc
index b000387..4157d51 100644
--- a/recipes-core/libmatthew/libmatthew.inc
+++ b/recipes-core/libmatthew/libmatthew.inc
@@ -5,11 +5,14 @@ SECTION = "libs"
 LICENSE = "MIT"
 DEPENDS = "virtual/java-native classpath-native classpath"
 
+
 S = "${WORKDIR}/libmatthew-java-${PV}"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 inherit java-library
 
+include recipes-core/classpath/classpath-features-check.inc
+
 # Some internal version numbers which change from time to time.
 # Allowing to override them makes this include file more
 # versatile.
-- 
2.25.1


