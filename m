Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DF7C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 22:14:18 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web08.2660.1644531257610145389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 14:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=wi5s63Ve;
 spf=pass (domain: cold-front.org, ip: 64.147.123.20,
 mailfrom: jsbronder@cold-front.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 428B73200E42;
	Thu, 10 Feb 2022 17:14:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 10 Feb 2022 17:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=4m5Jg5Z3A4xyjCJYdAz2fvmwHMcbF9l7Jya
	956P/4po=; b=wi5s63VeopWXrAQhKINmuOpnp6GwAbAy131+vdYTTBwMXPyUcfb
	41Fisd8GDJTdbUlG0DopjmLc0d09Qs0vHZNY/mzdrJoB2BtXvLMkL6LcKoIwXc9w
	vV0+JykoKKVbtvODfxLv1eTNX5ttysVMARgd4IWHnAfQD2TtlSRTvC0Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=4m5Jg5Z3A4xyjCJYdAz2fvmwHMcbF
	9l7Jya956P/4po=; b=C+BMXybrRtfNbC3utHbssLwiTCJsc1tc/00nphJXOAGy1
	uk29+MC5aeANc8BKAeCifskMG6q3pvwpytnUBjk5cYnw5iyxurEtL2tHIoGSm8CO
	+bWwYqKtpEE1EPolqhSBG7MVi+uAE4mvmM2BVL139+2oTxb5y5SXwOACoq8eXxx8
	6C/uz4vhYBoz06VozZgiluZ9miJ4Xckk1RtX+wMtDCAKs6zm8n/NCVaWiOu5L8l5
	pN6I1YxlsgLk0FcQ0xffvaRfaQhiDBwHxgLYeboExI3+rOoZpxSSd0FWPYjhsXnF
	nlyXWXOXQ813qVf/j3OTGEJ9wivRNHq4JtMEgChGg==
X-ME-Sender: <xms:N44FYpL1dsfhuLjIchUMG74-CBQBCCFOkQ6tVNIxFN3dNnun0JWR6A>
    <xme:N44FYlLX1RSpdbIHTD9mv-IMIw8dbnGVFfKOwtAUR0Ovn281sCFz6xsTd8N4b2P_m
    -afBk8jfY0FrwnbYg>
X-ME-Received: 
 <xmr:N44FYhuyeJGAy3Dyglfj5UZHSrab6IU_yz2DeX2R2IcWVa0PQkp5F71NyATHMIAfaheeO-JLzpJQEQX9cOcp4cFIAFOldtkQYuOX66SxaY31>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddriedugdduheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeettdeghffhtdeivd
    fhkeeiffekleehteetgfeiuefhueffffehveevuefhieegtdenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:N44FYqaDL0AAkgbUsvwGmjCtlrpE5vvxZzhcMnad25C0StX_I7g8tA>
    <xmx:N44FYgb2zZFMcrMGxUG-rE4HjgkIr_VpBtgj0vxtk79PGmUlGU4g0g>
    <xmx:N44FYuDAKaKzQ4dfzJY72ARHU-BHfMKUlRoxfMeiASP4myh5hS9Itw>
    <xmx:N44FYpDXYWKF8NzprQUCB07yIngITQPbTG_RsWQyHo2dGIAduZ4FiQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Feb 2022 17:14:15 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-oe][PATCH] yaml-cpp: bump 0.7.0
Date: Thu, 10 Feb 2022 17:14:02 -0500
Message-Id: <20220210221401.9004-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 22:14:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95294

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../yaml-cpp/{yaml-cpp_0.6.3.bb => yaml-cpp_0.7.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/yaml-cpp/{yaml-cpp_0.6.3.bb => yaml-cpp_0.7.0.bb} (92%)

diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
similarity index 92%
rename from meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
rename to meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
index e38303781d..d3984abe8b 100644
--- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
 # yaml-cpp releases are stored as archive files in github.
 # download the exact revision of release
 SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
-SRCREV = "9a3624205e8774953ef18f57067b3426c1c5ada6"
+SRCREV = "0579ae3d976091d7d664aa9d2527e0d0cff25763"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.0


