Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F655E95A8F
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 15:52:21 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.40530.1696780339210231213
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Oct 2023 08:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm2 header.b=MbA2GtDy;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=gZKRRsdh;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.24, mailfrom: cvubrugier@fastmail.fm)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 86FC032009F3;
	Sun,  8 Oct 2023 11:52:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 08 Oct 2023 11:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696780338; x=
	1696866738; bh=SHxcQgsDHaSBScJfMOsoi4cgt8uxjH9cv295g+p0R/E=; b=M
	bA2GtDyxUdscYO9hH9KnnrCJ8cVTwUi/WTohYZp2yMvbKhXPtB/+zgFABlNVSndb
	/e4/cF6snrb59MiUN8zE9G66AP0QSGbBBck5F6PDM3yANa70ahH5xTnyY6B0zlrO
	CaH037sEyDmYED42frFHjSTDTFmFjd2xCWits9isZEqYZEPGfnEW6VFhfunYWwCP
	maKnsl3gQGhWmIY8xizk3aokQBSo8Kjf9zeMMwDME7L8prVhrlDStyZaMwlriObc
	7jzVsCCJAsCVADaxPVYbt10Cid3i4WJbkm1tK+ujIn3mMVsRz/vxsW/AA0LnP5RD
	HD49llQ22b1awDn4HcJTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696780338; x=
	1696866738; bh=SHxcQgsDHaSBScJfMOsoi4cgt8uxjH9cv295g+p0R/E=; b=g
	ZKRRsdh/u8U1kNJWaaOLHFhgDjUUZ0Je4CypZ+gVaXlBMDC5dKdg2gNAZeJMMLP0
	khgxaN3S4Wpimhv3H0XXZQc6IGkRkaQAbtFR7KhpbANi1fWtt9bXbGiSoit4eS5+
	TjCSL/aKANLQrKy9sH/5Fs0RhrYjQOv5V4uGzdYzPdDu6uMeEfdoj1cyb6NmjlkF
	7HwF2gBVQcbx2GCrprYr9pk7e/q0udjUCLFHsuOuNvXFATvfc4h1H8p2loHTgQgO
	f3ZEFNOi5q5WsdvFtY8iorPJuPyvI9qYaqDT1TGJKLRAD9dkwAZ7RnI8wR+mcq4f
	+7BqLkuT0seKcGQWPoOtg==
X-ME-Sender: <xms:MdAiZYz3Z8i_ptMEBv5lHOp4lL9d9NrCQ6PFswz9eWckkTZQ9BWdoQ>
    <xme:MdAiZcRKsqGAOGqz3silUno4u63I6ayJ9CDCPtv9oTIfRL3usrboDuKZ7RvdRuiJU
    saF9qm5JMHN9Qvzjw>
X-ME-Received: <xmr:MdAiZaVFJuS-T2EIBQwgdPZaitWMEY4wgHqsNFDpHHNxvor6brNvh9MJfiDygUZsCcg1yw3HznY36zN1i5VvjNVY3Go4xis2GREw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrhedugdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeejhffhieekje
    egvedtgfeuiefhudevgeetuddtueduheeffeehiefftefgjeeuvdenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:MdAiZWhR3RXBZq_BY9meUVKgjgFH3yhLBhChRUsiLpHhBuqdqgg9tg>
    <xmx:MdAiZaDdgp6g7e9MN4nLmicKKQhqqp0-ouOsP0ggvqPBOeR5qS8yxg>
    <xmx:MdAiZXK5PKGCFoHpSF8BLT-ytw9WOodJFbhI5HEfzVGB-g2hNXA5ow>
    <xmx:MtAiZVqSVuLWYAw-5QPirHSRgaP3v-GJnRil37Hi2OJYmaZnu-SCTQ>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Oct 2023 11:52:17 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH v2 2/2] nvme-cli: upgrade 2.5 -> 2.6
Date: Sun,  8 Oct 2023 17:52:05 +0200
Message-Id: <20231008155205.267182-2-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008155205.267182-1-cvubrugier@fastmail.fm>
References: <20231008155205.267182-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Oct 2023 15:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105386

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../recipes-bsp/nvme-cli/{nvme-cli_2.5.bb => nvme-cli_2.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.5.bb => nvme-cli_2.6.bb} (95%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.6.bb
similarity index 95%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.6.bb
index 492de65a8..0d8923f34 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c libnvme"
-SRCREV = "d6c07e0de9be777009ebb9ab7475bee1ae3e0e95"
+SRCREV = "bd2f882a49a14b0e21a94c928128b1979e4316fd"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
 
-- 
2.40.1


