Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15A7C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 11:44:14 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web09.28033.1660736653182766532
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=SL8xstzZ;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4A09C5C007A;
	Wed, 17 Aug 2022 07:44:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 17 Aug 2022 07:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660736652; x=1660823052; bh=5WjucY84ALXt3nzTVFBFOeYtL
	8GtA9fvwexe4V4OkiM=; b=SL8xstzZLQ0xUxOBykfk/h46Ys9Rn88/TtM0jMHJf
	xASeQaXQDR7ZL+RxkwTPctrkF1WOrh7pFGn7oQJJ4YhBjTLWmsUhvHpAA/KoSrpo
	2JP/WLOKaw2bAeGwlZA6od1DjzMqN2uVHnekGOPPt/c6npFYabjG04S4WskvRe9R
	nzQMSBkAxTJ1LUYj4j75qHC6kWYhyaeTjawmr4uPMlHtXUBsHhKtOWwTTSNABF7z
	2KRgNrpfjMNj/SsRLzzUAChNdwJMAXvBtu8nIQYR/7MDOD7LZ+XirlTmU5PoemRd
	+f349X6BkOEyOeLFPUIg/qlMZrZM7pFOR38C/JgpUP0FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660736652; x=1660823052; bh=5WjucY84ALXt3nzTVFBFOeYtL8GtA9fvwex
	e4V4OkiM=; b=mML5GUc4Cl2FVnJZxP64fJJTTDdCratJdVnxCgC8g34ouvHrqec
	azdpXbO3Y657P1XfvmIdDosl+QzHdHRL7a5Mq70TQ+rjDtQ5kw1P+P8qbilPN4np
	pFHi2Qy22tVPlvqem+KvMo6Vb/V0R6N1B3yOnhprXt6tsNDi+p4IpzQuqXpoIFx6
	cB/XcEvFlKaQ3B2yaOSTkBM1P3Y3PuRI1n6ZAwPCSwgZrdfRN13NJAZ7K4z47PFa
	6/zeSzIQegCT4HJK0p30RW0XG96Kr2o0Ve8EGM8V3qqoF8D0vWAuMIGZFGeGzl7b
	be1Hs9ki1lnQwgbly1vWixn4cRbVFROOZjg==
X-ME-Sender: <xms:jNT8Yh7CZAEvsXwEDNC14OENm-J60IQS3-lLLwwUdx2lDvEJh0MkDA>
    <xme:jNT8Yu62611VrvRHfcrhJNNohqP2nfWT_X1qgafiI5B9rh7lC-KhydPHk-Hrixiw1
    HvV0VsBsjSMk2cxTpg>
X-ME-Received: 
 <xmr:jNT8YocPf8IbZqdN4-FGjcV4BXS1JltSCfqPeCTAt4VFIzZ3IfuAbXwjPDDmx7rMJMkYDIlK_ADcM-dvJYmF332CJ6CBmGJ0KWvXnoBBOqriWcutN8AqIIIW>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:jNT8YqJSZJ-AAFpBMDXBfYAoNU8OHCsrTfai7hQoq1hzVoLEGDTfIg>
    <xmx:jNT8YlJ_kOUtEfyk-LxMF1qc83C8MDA4HN0Ll4QgrZsv4BjkjJIYAg>
    <xmx:jNT8Yjx-aI0DUvDgq46jN5_ZfUfKjq-ERoiltCEIPkIeVpo6pxXZ7w>
    <xmx:jNT8YjhQAobek9scoakN9VEP8jvx0EmjRG8fmYMv914mk0efUKFlbQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:44:11 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-java][kirkstone][PATCH 1/3] classpath: Use an include file for
 x11 feature check
Date: Wed, 17 Aug 2022 13:44:04 +0200
Message-Id: <20220817114406.348705-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 11:44:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98292

From: Andrei Gherzan <andrei.gherzan@huawei.com>

This will make it easier to maintain reflecting the same distro check on
packages depending on classpath (in the dependency chain).

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-core/classpath/classpath-features-check.inc | 6 ++++++
 recipes-core/classpath/classpath_0.99.bb            | 4 +---
 2 files changed, 7 insertions(+), 3 deletions(-)
 create mode 100644 recipes-core/classpath/classpath-features-check.inc

diff --git a/recipes-core/classpath/classpath-features-check.inc b/recipes-core/classpath/classpath-features-check.inc
new file mode 100644
index 0000000..c238fc3
--- /dev/null
+++ b/recipes-core/classpath/classpath-features-check.inc
@@ -0,0 +1,6 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: Apache-2.0
+
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
index 5b9d904..f18ad1d 100644
--- a/recipes-core/classpath/classpath_0.99.bb
+++ b/recipes-core/classpath/classpath_0.99.bb
@@ -1,8 +1,6 @@
 require classpath.inc
 
-inherit features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
+include classpath-features-check.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92acc79f1f429143f4624d07b253702a"
 
-- 
2.25.1


