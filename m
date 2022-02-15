Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11AEC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 19:50:06 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web09.2167.1644954605342502292
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 11:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=mFM9MUdv;
 spf=pass (domain: cold-front.org, ip: 64.147.123.25,
 mailfrom: jsbronder@cold-front.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id F3DE83201DB0;
	Tue, 15 Feb 2022 14:50:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 15 Feb 2022 14:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=virwDptus8MDJDQWFkAVl7w2ax6Q9vNdYcs
	GwAfj3DM=; b=mFM9MUdv01ID+M8wMXEby0qyuk/geA++spdfwVjDEMJ6LEj8YP5
	Qcxkmx8StPgmfXzgxwTtrfDkqVyfC2nwNwcphtL7ZL2oGCL+P1ky4fmx8ZPPh3fg
	Vg/uvWLEXalTs3OAemr3RhTp9OLXRekpNntaQl43UVqPNQPZ7VcUG/gs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=virwDptus8MDJDQWFkAVl7w2ax6Q9
	vNdYcsGwAfj3DM=; b=VZa0jzBeDT9QXHQsyAJFDDiB2yjUYPFxD6jtt2m/AWzQ2
	eg4KEMJp3pbKi6zbbpQV0p+b2XPkJ36XEWZUDTVBiqRQNupYvrCtQwhW/Az29a4T
	as85S/qk8fh5rM4WeDjbC1UQguuQna47DPP67YxkGf+ZQF28W83r/K6y2WWfHegH
	fwaYjTOx3Y2Oo+m131YOO2gFu7Fc/nlMl1XRye2ygFpLDIcAE/IoYjjKikR+I2ro
	ayjvI6t5J7mNAiGfGvpZ0uWuEIVQLgumStvlX/xePm62EsZsWeiqyH8t6EQW49Me
	MCha1B4j5liEpAkNGcjeKfnSfOj9rNPGpCS1Zi52A==
X-ME-Sender: <xms:6wMMYi_HZ6PIWEV-bPOOsAJ3HkO2Xvw3BoWX2Wj77AmlhilTrlEBgA>
    <xme:6wMMYislbnkuZQyNPspW9TiAJTDrrZXoaOg2-7-TCzS9vBsm6ALMDtTq-HtnDlaAU
    PF7ma9rK2A69Dln0Q>
X-ME-Received: 
 <xmr:6wMMYoDNTi6G0rsuoB1b_w6jGH_kQHrSwxhaT51p_N9psLfb5m1U2s7o5aPtkgqpGqgpESabdNYRl2Bc5_WGdV-ulXuzbO3aSW1PTRJuOjN0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeettdeghffhtdeivd
    fhkeeiffekleehteetgfeiuefhueffffehveevuefhieegtdenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:6wMMYqfrETuTaLAM27X8FT11hK8lbnyIw14A-nov88jKwpcRMHecmw>
    <xmx:6wMMYnMkkYxBiCKKnskAlrSDcUBf76NgO8qkwAIUzLNdh1ULVyxt6Q>
    <xmx:6wMMYklzdhVIzZehW8JLyNg954BL1C6MEBxioBcn8pCkbE9Z5g9tiQ>
    <xmx:6wMMYpUamEXjjj5GCyLB9I7jjkUQz827DkxDSEyCL0TheeR_WCFo1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Feb 2022 14:50:03 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-oe][PATCH 1/2] python3-pytest-forked: add 1.4.0
Date: Tue, 15 Feb 2022 14:49:30 -0500
Message-Id: <20220215194931.1716-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 19:50:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95318

Adding as a dependency of python3-pytest-xdist (which allows parallel
execution of pytest test cases).

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-pytest-forked_1.4.0.bb         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
new file mode 100644
index 0000000000..c6f352bc61
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "run tests in isolated forked subprocesses"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-forked"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
+
+SRC_URI[sha256sum] = "8b67587c8f98cbbadfdd804539ed5455b6ed03802203485dd2f53c1422d7440e"
+
+inherit pypi setuptools3
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} += " \
+    python3-py \
+    python3-pytest \
+"
-- 
2.35.1


