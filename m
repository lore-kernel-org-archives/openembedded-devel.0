Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38366C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 20:19:01 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web09.210.1646684339816076520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 12:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=icsioONj;
 spf=pass (domain: cold-front.org, ip: 64.147.123.21,
 mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 383C53201487
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 15:18:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 07 Mar 2022 15:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; bh=4Y8121bJRIsnXvHQF7K3MWmJtWLL52tz3Cc+aeIOLzE=; b=ic
	sioONjPkrIxPNz/48P6lKNbDwEorC9l2QIOK0CK1sZ59aD60C8c//5HAFIfi0s0I
	ei751kjksXmZxMPvAhp3kx6KL+FRJQ3jK59+BbC72X1Ow/jmcp0PTAxnUXRLE6om
	V2CG8QYZlL5qdOmntATjbGxoNLk7JUywK35zYYsl4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=4Y8121bJRIsnXvHQF7K3MWmJtWLL5
	2tz3Cc+aeIOLzE=; b=nCubaOcHjq9vkQVLcuNqxSc83tkGQeqPJZ38PXY7FepH2
	dt8sU4jvmCNMkAbgNidc5J3B31TI/XiwMBU6mtsNdSUR54FLByIeFYrQDXa76Vx2
	Giti1bhB8hUOoIV46cvxzuFX6PM4ojDPgyYaLAN5Qt6zuV/ilyZ4+aM/wECH2OOh
	ppEG2XotylEbGTd/f/6z2GRV5EFVgRv9r4AEdy2fiRN1suxDoCPrjI2A+jN3jecx
	FDwN06GuQEsKM1kPvzrxrttRow00RfM3uPQfShMXy2JKpxYCRt9e5KbsdqKEzPpA
	hkcGUOE+6CHOSqt4A29kYf0zZk/oWaOWYsdSUTBAA==
X-ME-Sender: <xms:smgmYo0YQNk69U94oaeK0AtVJ-FyK_iRW5PvD3tOYYuMckGU2JR4pA>
    <xme:smgmYjE-S0ZqY7mr4h-CMYV2dvj_BogLkbUbInjU5e3WpvQZNfuoZB2rrJCV4i6cH
    CgRT-FfrbQQNnPhGw>
X-ME-Received: 
 <xmr:smgmYg7ZdVJYww96EYt7aEDGbj9GGH26qfGhqG_bSsaaCY638f-l6_RIDfYH2VfrlQi_utlQ8lg6xYwASCTFzras1mk-LynJTRBsN2kOINfp>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddugedgudefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnheptedtgefhhfdtie
    dvhfekieffkeelheettefgieeuhfeuffffheevveeuhfeigedtnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:smgmYh1r-34uC69CFvoZMpqh0FC-QKdRpsoyb_J7BUTXLrdrJR9XuA>
    <xmx:smgmYrFtSBRBit48adjbd95XfT42KDntYRstL_NiSwz0gpg2BgTT4A>
    <xmx:smgmYq9WdtNRKhvAwYfW_iBhQkrpuEXudOuKt02JNZ8K8wFCgHwYvA>
    <xmx:smgmYiymLKfW74MtsVCB87bAsGXKA_Bmeyy4YQ49v-eYcu56Mh4Png>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Mon,
 7 Mar 2022 15:18:58 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-pyserial-asyncio: add 0.6
Date: Mon,  7 Mar 2022 15:17:01 -0500
Message-Id: <20220307201702.31435-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 20:19:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95873

Dependency of python3-pymodbus.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-pyserial-asyncio_0.6.bb             | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb b/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb
new file mode 100644
index 0000000000..30ff62a7ed
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Python Serial Port Extension - Asynchronous I/O support"
+HOMEPAGE = "https://github.com/pyserial/pyserial-asyncio"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9a79418f241689e78034391d51162d24"
+
+SRC_URI[sha256sum] = "b6032923e05e9d75ec17a5af9a98429c46d2839adfaf80604d52e0faacd7a32f"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-asyncio python3-core python3-pyserial"
-- 
2.35.1


