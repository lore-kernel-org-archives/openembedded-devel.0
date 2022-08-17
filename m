Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B925FC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 11:43:44 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web09.28025.1660736614968663519
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=1dJWKdCP;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 34C4D5C00B4;
	Wed, 17 Aug 2022 07:43:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 17 Aug 2022 07:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660736614; x=1660823014; bh=5WjucY84ALXt3nzTVFBFOeYtL
	8GtA9fvwexe4V4OkiM=; b=1dJWKdCPlK5/mYgG/avsUgAXCfVhER/mc5T9nXhuo
	FOaMYUfuvNJlws4bcUHLzfJS9fw3Xjhlg+kYOx34DTJ+myEqIXom6acYjaMw3zG/
	3kDMXBRCJK273FTTux4zzdXPjQ7UsBrvTDoH5H8bFlxaRPQLoA5jk0ajEodUw6m5
	R+UAcGOAzkm1SWcuAI0ywaHL1DfDtfMsxlpdiX2U5SbweQhOrY6pl3Orgtmb9942
	hJTuDWiaanU94PrDHHbHhQM4+MJeGigDX61g5r4x4ktzlB2DbBK8jtNG6vKdawwl
	wcPBeCzcsojzWwvFWsY24eqEQdqEiVyXzXYtwEnL2wvmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660736614; x=1660823014; bh=5WjucY84ALXt3nzTVFBFOeYtL8GtA9fvwex
	e4V4OkiM=; b=JhnpaMQiokT2Wbplin8rOHTc19Hn9+Y+ZaOjZBA02jmKUbcZkD4
	9mFiEJa63UCi/VQ9o8UUxChUxK3Z3NKa97Ci6ychots0k6/PEyex4x4uQFGvdPjx
	5eBj+waE2s6DsuouC8wJI2PMNONopdkefHkFVQWEtxgrlpTAB0Oj+CAoLWaeP71F
	jFGLOy9yeL68/a+5DkPtFeXOwbE/5vB9Ry1tZQM/OIT1kJumMvvIB+vSZSIDARNO
	wgDJBfkfkgI9pVnKMpo1pv7Ln6lezC/RmPJNpueDH81BmHfoLS6ZDGGQBYNunqZ7
	ecsXsB/Fmqnp0A2nzDW2bF26L4hDjP7wqqQ==
X-ME-Sender: <xms:ZdT8YlIOC9olpIzXCH3i4gQqNEikZT_hFynBD1atsU05MkhvqrWGRg>
    <xme:ZdT8YhLhIF2TeWcb3pIbVGRwrUgC1DWdHioBAsNW0Sv11JezxD-4CF9YtNCzX5p91
    j6VlkW_8N9ABeo6B00>
X-ME-Received: 
 <xmr:ZdT8YttYLkGcZTf6PJsJb-5QzlhXk9PMDWk4yG0kThzd2nLSR9K0ZB_dsP0hbCyKaC2jHZ1xowRMi62J7CNApmVduC596CMmhvzg-HSv1lbaZghJk_LC2P4w>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:ZdT8YmYDWH0kKkthLn_mTAoykRzNdcvPr2MnjppLVccKdBz0YG9H_Q>
    <xmx:ZdT8Ysba0kMHFn2-OWmPCrSW4qL-iXR4XhgY41XwA43DhEUgz0Bjzg>
    <xmx:ZdT8YqCmwzTxuLYImyZwp2jpzNPZZLHPtYDlwEDwaAgYcTDSEDw7DQ>
    <xmx:ZtT8YnzVicXXbDXkW68NPBz6_SxXE8ishs3bs13euWN5_d8kznEFhg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:43:33 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-java][PATCH 1/3] classpath: Use an include file for x11 feature
 check
Date: Wed, 17 Aug 2022 13:43:06 +0200
Message-Id: <20220817114308.347965-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 11:43:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98289

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


