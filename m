Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02330C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 17:53:43 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.82054.1705946020811110253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 09:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm3 header.b=BtyYVhWW;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=kOpfdtFk;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.27, mailfrom: cvubrugier@fastmail.fm)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 30C905C01B7;
	Mon, 22 Jan 2024 12:53:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 22 Jan 2024 12:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1705946020; x=1706032420; bh=nVVubN7Ik53apdiMWVNvJ
	mL62bCTqIMN5vyBn843d9A=; b=BtyYVhWWSK6uYDHpzy+MRJjrTsLkQFwu5LRJf
	PrHcwkU6WRFd0CddprDto+A6LAunjiS43FvMDjc2sQ7z9bpfXXbkHH1MajSYVPfU
	Lm6tlDUH2KKZqioA8c8UmtSQMaKGDtNRz1/hee10uMpew4pTS6oGu/usZoELNlqv
	c/pRzD8qPMPPTkrPFOmHEd+Y1s/RixFaWReKXfpoVw4uegsdoFklcSSA1pOFuo0Q
	L6jtsyhWaqYXj23FAnT1YAcIEb6sLd79ECd+s3OWdKnVKBepD2WpqGmAtgdLCvbj
	mYPhR5w2xhTTZebU10HdSp59tENCfVHg/9wcsyapZf5ZXQ3HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705946020; x=1706032420; bh=nVVubN7Ik53apdiMWVNvJmL62bCT
	qIMN5vyBn843d9A=; b=kOpfdtFkaqV4E7U+vuFZFfStEcQCTUAtp6dWZdVxxGXH
	AZxNN8OUJFvlL/pyuHJktwqLyrZ/3NTbuw65pfDKAF0zHqwtMji6PFYgiDZd4qKD
	mAqWesc/9dqMEFbbxEY4AR3tOk8DDpfT/h7OCsWaufPcZQ2vttdujpiv7KwFbAZh
	CAO4scS54r1ck5SufdXT5KYAGD98OlHKJJbQNiWHJsxtxNn0LVUMQYdNvoDkIFbB
	ZY1ExFe3cZMZW+ce/krBLz8BFaymjKozY+ueQ9cIP98vHA2IY4n8KJfpjXk5xxF6
	cOvZJnSvkxCDTxeXoQ4jE72wOKEGsj4dFNMgxKB0wA==
X-ME-Sender: <xms:o6uuZQycM53boBRTWmItBcs5xPuj6DkkYyDMBV1vQRCDtGHG5unMTw>
    <xme:o6uuZURVMtiK_kzoZGmZIh92rlGqm2om2aXtV_UgLt6TFqBs0KqcQW_QLNBKBqYs_
    Xa03xabZaGpR-0osQ>
X-ME-Received: <xmr:o6uuZSW-GdDEqmZGxD1onZb8M_n5HfsCcywlZlYrGGeDuT2lrBWHkFYVpWz6bDVP49-9ubjFx0WYe57Dfvtbv0K6_3Y0xRj30DL-zx3d2z6-BE8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeeiueeltdekge
    ekvdevleegfeehhfffieevieelvdejudfgiedvteejffeltdelheenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:pKuuZeifymAKAO5Z5bjJQ0cQdZwR4jEgQvp3QRz5Yo7BZSJJsU4XmA>
    <xmx:pKuuZSBKFBi8q9QVSAdv9wGrEweJ-0zMgsN2ALR8ydk456oZLYuhvg>
    <xmx:pKuuZfLrohF9Jcty1jQk_ffeRpzCSomQRAEp5q4OXUoGdP0HJ4H1lQ>
    <xmx:pKuuZdqaEG-g1D7B-qYFaYcTJf-NV15_DrbGWVHPBIl4-ywFQSx93A>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jan 2024 12:53:39 -0500 (EST)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-networking][PATCH] dropwatch: add new recipe
Date: Mon, 22 Jan 2024 18:53:30 +0100
Message-ID: <20240122175330.41009-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 17:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108372

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Dropwatch is a utility to help developers and system administrators to
diagnose problems in the Linux Networking stack, specifically their
ability to diagnose where packets are getting dropped.

References:
* https://github.com/nhorman/dropwatch

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../dropwatch/dropwatch_1.5.4.bb               | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb

diff --git a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
new file mode 100644
index 000000000..e3dbac4a2
--- /dev/null
+++ b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Dropwatch is a utility to diagnose where packets are getting dropped"
+DESCRIPTION = "\
+Dropwatch is a utility to help developers and system administrators to \
+diagnose problems in the Linux Networking stack, specifically their \
+ability to diagnose where packets are getting dropped."
+HOMEPAGE = "https://github.com/nhorman/${BPN}"
+SECTION = "net/misc"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+
+SRC_URI = "git://github.com/nhorman/dropwatch.git;protocol=https;nobranch=1"
+SRCREV = "1e7e487a019a7c02f1f429c4d3a4647fa3787a13"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "binutils libnl libpcap readline"
+
+inherit pkgconfig autotools
-- 
2.43.0


