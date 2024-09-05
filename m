Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3764CE7A84
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 18:55:29 +0000 (UTC)
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.web11.17641.1725562528338591317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 11:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm2 header.b=Evmhu7l8;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=f6084ucC;
 spf=pass (domain: cold-front.org, ip: 103.168.172.154, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6628A11401E9;
	Thu,  5 Sep 2024 14:55:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 05 Sep 2024 14:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1725562527; x=1725648927; bh=uEMisur/CQ
	zHtPyPofOhSmGy9fPsPDo0yPsVHlwXhNM=; b=Evmhu7l8WtdVwrOyUbahIYUuuF
	mRu7lWQ+IvH/HD61e7J4uhXfj8T4z07q5bQKvJV4u9vt5BQ/E0f5vBkpHpdb2udO
	C6Rby2cY8wELFzfckhrLhBLvPdz4admqnphZtoy5mSSWYmgh01l9KymIepUcFQNO
	ek4fXpsR2rczMN3T8qC0CpQ0sDS26gpvfa66kfFb/coeNFXzhL6QgWXZvXncuzOl
	5WBzfKqsI7ItABgJl5iaIsQr9nUtsEdzW1ZkWEI6F1k54myeEiMQ+I5Dwk0pprRB
	b3cg5uCaY2gsEyQ9P/Jeyl37APeDHYLhojDQ3pt0qbg5sbX5STSvxtiBVt8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725562527; x=1725648927; bh=uEMisur/CQzHtPyPofOhSmGy9fPs
	PDo0yPsVHlwXhNM=; b=f6084ucC7Uof4pkNVxGl8rs5YQo66XSwnIFtfXksJch+
	4hY7F+BHH1dBKTxfFajwybwShuY2LHsl2mrX3jhofR2aVjLmJ9JnSqVA+dYEiBD/
	VBk3ijJIv3F9c0RrhHLqY+qCGwK7kE7a5BMydQ2cGDnTkoraaxvJEThvtGvc1FYo
	Knckuyet+OPjMEzMDMNQ+pbQ0izBPJxTEL6ehFOT4cVLbcSQn420sAHsh8nnuQkU
	jmZU4KyFEo+XRDCWPI6IsYo0edAum/zofrTzXMfDJcxwUfzLTCBH35lNDBJ1hMG3
	7WdhronM3xvNd2eIhuPRjdrymwBL1jDkVlTHHhkD/Q==
X-ME-Sender: <xms:n_7ZZnyfJ9nbn-zEcIqZRgVmGWDcucw3-edaN0QHPrto5fEV5H4zHw>
    <xme:n_7ZZvRrbuW9roYfH4kxl_B6S3Ohx3zcz8-HgkR2cm9HBdFKlJR7fmQBNzDwjSGOT
    6fGM6473E4XoAnUag>
X-ME-Received: <xmr:n_7ZZhWHUfnq17KRq4LpOCxNHLJUtMZrfUR05jeztBVKLmKG4hIrGjXoKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghr
    uceojhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtth
    gvrhhnpedugffhvdekueehudduudfhueeiieekgeeflefhgfefjeegleehjefhfedtleeh
    geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsh
    gsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrghdpnhgspghrtghpthhtohepvddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvg
    hvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehj
    shgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:n_7ZZhjOUmle_EikLGe--6QU7_9G1FX7Z5A1AseyNiGy9df6-zZtfw>
    <xmx:n_7ZZpAUz0fjiemLWgGdtosonUqXwTEUbkDIzGUB7YZ6tai9ZDodpg>
    <xmx:n_7ZZqK9S_WGOI_4vRwpYd4_se0X44odDWpQyXzl_QtkcCBL9Yz8fA>
    <xmx:n_7ZZoDblD2lu0wKWFpxnr4zgb-Wb-ybK3m6aDfG8O0kMSHdfy5OKA>
    <xmx:n_7ZZsMjEgUKz4qnxhIrPkEZHP6yz2FETGL2ZNpohvw0bu9qzjMT2q_U>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 14:55:26 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-xmodem: replace hardcoded /usr with ${prefix}
Date: Thu,  5 Sep 2024 14:55:25 -0400
Message-ID: <20240905185525.1544233-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 18:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112107

Without this the native recipe cannot be built.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
index c1ad6a2a8..e41afb56c 100644
--- a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
@@ -9,8 +9,8 @@ inherit pypi setuptools3
 
 do_install:append() {
     install -d ${D}${docdir}/${PN}
-    mv ${D}/usr/doc/* ${D}${docdir}/${PN}/
-    rmdir ${D}/usr/doc
+    mv ${D}${prefix}/doc/* ${D}${docdir}/${PN}/
+    rmdir ${D}${prefix}/doc
 }
 
 RDEPENDS:${PN} += " \
-- 
2.46.0


