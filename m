Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF02C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 20:31:15 +0000 (UTC)
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.web11.3022.1724099472829822167
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 13:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm1 header.b=kS75UaNc;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=aKC7+LoB;
 spf=pass (domain: fastmail.fm, ip: 103.168.172.156, mailfrom: cvubrugier@fastmail.fm)
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id DFC311151AB2;
	Mon, 19 Aug 2024 16:31:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 19 Aug 2024 16:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1724099471; x=1724185871; bh=7BmgTzT6PAZzrOgnBk/5d
	Yk6mL/6/Qklvo3Y5fPxYtE=; b=kS75UaNcqwrKd3Zeoa5vcnDNKHQAHS88Nfime
	9jVRu6C/tR3QPANMe2zYDZv3owUQFVEbWmmij3rstcoC7KO+Gnm58mUh1CLgV3di
	U51xFa5ZyKbfjI/XaF4lxpXGbsnUMBD45SiJFzKMUc4uUg4lBIwqO17CWvgKucvJ
	kQ+k4ASqWCp9IIyu9X60qxxjEXh4kn21/03OK3iV6n3Vfr3GLegcdMQdlJRLPcT7
	WxYUZc119rChlzkdUt2mmPIFtH0Sa7gMIaJPlHRSIV1ehRzcfpPqvUD08o0SDkux
	hwQqvK6UNZSssUB71ORAZQi9XQXnRUY02uHg8gVBUtby3v5mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1724099471; x=1724185871; bh=7BmgTzT6PAZzrOgnBk/5dYk6mL/6
	/Qklvo3Y5fPxYtE=; b=aKC7+LoBi9LTyKJ8L5PDrXPjhbpS9OTLC8Myhc9Vnp5u
	p1a06O+py1tLabOxP3hohAR5QbZaWVgYZCcbSvAy1HEZBdSj+b+c+oNAwWysk/sk
	6Ngh2cj08muAcrXKJ4jIadp/zPOD3x5yiFFgZknt3gPlDJ0Pea+XDHkwRM6SonoM
	wAK8MhM8qhLX5I4fQIixmVuFl9o2AOTljcBAk21XRtBP4de4lPnbfZct8kWoj2SD
	jWJDoxTxM40QXt+aXaI9Ko85CVJxoDvSS39NVHy7Guh5l2l9nx7Ti6hjPEth4b+B
	SokJT3AiQBi7iE+sSdy5flm9ZqZ7tv0AcG28Lv0Ptg==
X-ME-Sender: <xms:j6vDZhO-lpz6rJx-ij8FPCmR2M0-FY9BEqDSNnrbm-F9Ke9Gb4-8sQ>
    <xme:j6vDZj8cbhYCRXVn4LIFG2G42l6pDiL8rhV5V6jIZEWZ4qPU4YvufrUGq_rvraW_F
    PGoq0vnKSHGpI11pg>
X-ME-Received: <xmr:j6vDZgT5th3MVSHYJfz2XNNhBhsY0MAgiG-ouh6G3Fv8LjvreaokMwe4HoZQ6vunq8Ldp8VVM_hGYUW-aJF6RHFZqAXLlzqgRISrtOu-mJYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtth
    gvrhhnpeeiueeltdekgeekvdevleegfeehhfffieevieelvdejudfgiedvteejffeltdel
    heenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghi
    lhdrfhhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggv
    ugguvggurdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhvuhdqsghruhhgih
    gvrhesshgvrghgrghtvgdrtghomh
X-ME-Proxy: <xmx:j6vDZtsKNVeYDiAk330EkYxMPqcMPW3TRJthK781Ynp6UPUDwxtlKg>
    <xmx:j6vDZpclfvGyMGawzveKcJznRjt9Tb4yoYMaHtP9r81GmP19DQ89tw>
    <xmx:j6vDZp1HlkIzsHsOliRdjf0DpyVB-mqgfdJm3g9zZH44CVEaavmCKw>
    <xmx:j6vDZl8drftqlND4mclVf4Bzxulust4jlDkV-I6Lp9o8p5WzogeEAg>
    <xmx:j6vDZqquOW8z4ufkgesAF0ulzLsz8bOjtG9iF37F6XJCS7JDOwMui14_>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Aug 2024 16:31:11 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-filesystems][PATCH] exfatprogs: upgrade 1.2.4 -> 1.2.5
Date: Mon, 19 Aug 2024 22:31:07 +0200
Message-ID: <20240819203107.34469-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 20:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111859

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../exfatprogs/{exfatprogs_1.2.4.bb => exfatprogs_1.2.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.2.4.bb => exfatprogs_1.2.5.bb} (91%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.4.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.5.bb
similarity index 91%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.4.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.5.bb
index aa6a19978..c3ae8b838 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.4.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.5.bb
@@ -12,7 +12,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "ad38126dfd9f74f8c6ecb35ddfd34d2582601d6c3ff26756610b8418360c8ee2"
+SRC_URI[sha256sum] = "f27160dcc1ddd17c96cd41a6ceef7037adc2796ab5c5633d3d85cf532c3ee2f0"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
-- 
2.39.2


