Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA533C3F6B0
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 11:43:44 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.27508.1660736621851827569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=AHBb0oDv;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 339F15C0089;
	Wed, 17 Aug 2022 07:43:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 17 Aug 2022 07:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1660736621; x=1660823021; bh=eJ
	GDvhHkwNgIrklhqb7e5oBRuFr9Tisb2pvPdRJJZy4=; b=AHBb0oDvhf3Up7xgqD
	nGcQwDQAWGWipM/Ne4NGytYzxnGtRcZgifeDn+mBrpWMvbU3/6Tufc0GFeRfGM1z
	jlaQ4ckO6FIqJVroWBOFKM71IFu6t8epJ04S5W7AJGMR5Q+vJjX0uPSnwKMNwOTg
	uI7XCAHoVnXVYBe2rNZ0lZORZpA9jGs8QJ5w6sKbgUi+ThqCCVc6KyOIrsQh8lPE
	moEpJX1/BG7TjDkD5JItfC4sPDUbAkC9lH/nMd/0tNXmMsAtFrZmQux8yr1kKINz
	z2dPRmq1ybAZN3K4Xc1qKdgapdCdNWBBu9HSGUVMH4bTw/9LEi7z2kFfPIuKdaeB
	01UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660736621; x=1660823021; bh=eJGDvhHkwNgIr
	klhqb7e5oBRuFr9Tisb2pvPdRJJZy4=; b=ImSqvGMI2BfTlNC+IJ0skPvuntDxv
	BYnt+WsTT+YuF1mnNaRrjLtEhyaebeduKOTtr2uIceKUiGMIfeRY3+VkeZKmNnso
	gIvWbmn9iodRgaZcT0ZiiLQKAY3sNzdxdlLYhiXNy8A9WvJemCpsNk2My3s8RdeG
	A2jCupXeYssDvafK1UBQ303FjElEYVCZ+KcA0K7roZ5kc96pcGBV+FG6ZTXqR1C/
	r5umZvu/J5YQ0cXIH0dMQnWaay0r0fjFTSlfpRyyyvL19nnx5ktwti/YdBIO+Hqk
	M+OXt1dfd54roceBUxZST7j2wr8Y1W8KxtS4H8Gl2hOJKAuHi89YHfeCw==
X-ME-Sender: <xms:bdT8YtpvGvjigS-rFM-xYrUyBe9IlBd4W0xqNcMs1EihgIX5JygmqQ>
    <xme:bdT8YvqXrdTW-6PA8OPNPpwNzs61jIqJtzMPjtkk-PxmCIjtOGov6OCfzk4abn1YD
    BbwHvvllXRZ2u6tvks>
X-ME-Received: 
 <xmr:bdT8YqOpTGKrXBAY9ynwhDPq8wIbLH3hkryDBJnexfQvUPEpVwhlDA-WXzm3DR8jxAZyCqqicJZVCJWgnu5I3W-PPWOAv0VhaazZrHiSNTcz5kFXk1N5gVCV>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:bdT8Yo4YNLyIlb0bsblCrPDdb6B8UpWH7ScvQcKQd1IhYTI9wiJNqw>
    <xmx:bdT8Ys7MafM0WMWQsiMRwecaBbTBoFd5gLj7_tOaRlK2apBAq0MrwA>
    <xmx:bdT8Ygjk26ShJEoJFS1pI7hA6GEq-VrvSTC-DXp_vsqJaWbEel693w>
    <xmx:bdT8YqRn1Hepgjy2nq-z3J3scy4h16kNE6sg7d5ybNtb4N1_UxJoPw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:43:40 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-java][PATCH 2/3] libmatthew: Include features check from
 classpath
Date: Wed, 17 Aug 2022 13:43:07 +0200
Message-Id: <20220817114308.347965-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817114308.347965-1-andrei@gherzan.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 11:43:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98290

From: Andrei Gherzan <andrei.gherzan@huawei.com>

classpath is a dependency of this package that also has a required
distro feature on x11. Without having the same feature check here, a
world build would fail when x11 is not enabled. Reflecting the same
feature check in this recipe, makes sure that world will skip it as
well.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-core/libmatthew/libmatthew.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/libmatthew/libmatthew.inc b/recipes-core/libmatthew/libmatthew.inc
index b000387..4157d51 100644
--- a/recipes-core/libmatthew/libmatthew.inc
+++ b/recipes-core/libmatthew/libmatthew.inc
@@ -5,11 +5,14 @@ SECTION = "libs"
 LICENSE = "MIT"
 DEPENDS = "virtual/java-native classpath-native classpath"
 
+
 S = "${WORKDIR}/libmatthew-java-${PV}"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 inherit java-library
 
+include recipes-core/classpath/classpath-features-check.inc
+
 # Some internal version numbers which change from time to time.
 # Allowing to override them makes this include file more
 # versatile.
-- 
2.25.1


