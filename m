Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33D8C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 20:42:48 +0000 (UTC)
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by mx.groups.io with SMTP id smtpd.web11.68052.1718656964273693663
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jun 2024 13:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm2 header.b=f4t8/Qcq;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=pgJCz23s;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.156, mailfrom: cvubrugier@fastmail.fm)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id 6F67D18000B8;
	Mon, 17 Jun 2024 16:42:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 17 Jun 2024 16:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1718656963; x=1718743363; bh=LeOulyb4b0Qq7T/jM9mzE
	l4nkm9IEqLg0qoRqag88XY=; b=f4t8/QcqFMV4g0IJ2bg6ewZkp8Cvi3MzVZeLX
	LFrIFo5Qn0xaOKytAIxyIhemRuHIpWny5ZzhAkcPgUnWcLxEunrh7zX42wbcRfq1
	7daHf0sHXpsKWyvyjMR+PYZ2cA3ahg5FZNUYnwNES+uXwxleF2FMRVfWDmOWh8EO
	CXoZ0IGwzcZPpOql4NDmi6ToaOnnXMhpAHzW5m8XIFa67oADwFo0FglWddvg077v
	SQk7khaRVNg+W2fktK5+3qUMvISYC9pagHKJxrKbpeUZIpqsnyUnb5nL41mnCLHa
	IxyoEpg+C9eiCYY2itN5pt1rGv+3YctPLzfltMsgmA9p/SOdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718656963; x=1718743363; bh=LeOulyb4b0Qq7T/jM9mzEl4nkm9I
	EqLg0qoRqag88XY=; b=pgJCz23sUpUTzJu31yW0hzEVykLO1Y1uN+Ev99h+Yka/
	FeVCXY1dMKIHDZ63hbOtcXPmY/2e4ypXrWGS39r1imOd4Xfch4BwIPniTrwxXxGu
	FBawP1H3E0i5Vr+FUXpUygVFC2LD5EizrQCbac2sbgundWx+E/LDMOy5Eih6uHh+
	9mnHCZ/ssOXbSHmvMJ0nfk1MB5JD+9V0TtOOUTR3+O8+9F6pHStHWU0kiRGNpovS
	Lr6zSaxPeis5IKRAH09LY/t3RB7Oq/wvZ2VkN5+jiARe8y/QEKN3wsJpv1jpavZs
	KzRzM+jMqfL+wnGB/wRsch+/l/YHCisLzWguJaPcgQ==
X-ME-Sender: <xms:wp9wZgfBJI9QOt3fWjxKkITuZzo1J6Qxe9ss1T2MXB4O9Ht1rG8b5w>
    <xme:wp9wZiOWfEQNNp4SzcKDE5Pe4U69H0Nc9HF72s6JHn2TAVFqbrD42LR65KQJboC7v
    Lope1KP8xmsKol8yw>
X-ME-Received: <xmr:wp9wZhi3k9GbDXX1_y0Sh2icKKxxNY_18l2LFDcsnCnjREs3R7kbctEosCpKZEjtrMPx3qCmpMoOoTNqOepP7Ov6BBg-et4wxtWtc4FMmqEy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvhedgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeeiueeltdekge
    ekvdevleegfeehhfffieevieelvdejudfgiedvteejffeltdelheenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:wp9wZl_xZ9E4IONZvELTvvlAvMk0eT5SDx069utZVpHACAJZyDTyeA>
    <xmx:wp9wZsvj9K26_5rkOqlfUceh74p54rWYD9B7x4H70xbyRYTH0jJMfQ>
    <xmx:wp9wZsH7958aTRp6yRLDZi6KR3Z8mpxp_nWDowxRlHBAQuyjeITxzQ>
    <xmx:wp9wZrMoT89-7PYe-UQtJqrmvqIDXm3UM7a2Xn0rllNZEgSHqaEXGQ>
    <xmx:w59wZl5_LkSSvr_iIVY4JR_AhIRFwTOCpj2mnVREftzU-D3npEkVA9gC>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 16:42:42 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-filesystems][PATCH] exfatprogs: upgrade 1.2.3 -> 1.2.4
Date: Mon, 17 Jun 2024 22:42:31 +0200
Message-ID: <20240617204231.248029-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 20:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110944

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../exfatprogs/{exfatprogs_1.2.3.bb => exfatprogs_1.2.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.2.3.bb => exfatprogs_1.2.4.bb} (91%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.3.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.4.bb
similarity index 91%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.3.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.4.bb
index 98d7cc08e..aa6a19978 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.3.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.4.bb
@@ -12,7 +12,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "fe7eb48d9a655b4fae9b08ef22c7dd20694a92fdbe9ae768e0af03c8be5c27ed"
+SRC_URI[sha256sum] = "ad38126dfd9f74f8c6ecb35ddfd34d2582601d6c3ff26756610b8418360c8ee2"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
-- 
2.39.2


