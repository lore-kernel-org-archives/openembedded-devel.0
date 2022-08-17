Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1363C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 11:44:24 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.27657.1660736654661230174
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=4KIt7zfT;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 050F55C004A;
	Wed, 17 Aug 2022 07:44:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 17 Aug 2022 07:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1660736654; x=1660823054; bh=qZ
	Ha7t96W80f+Zf/LT7D+dMm9c6KcHucOnnuMAqAEd4=; b=4KIt7zfTbrWF2IAWD9
	+H/05pHaLDMnAeCQYA4Yy23uaq52Szn/9eoW4mvpIDpWJE+G3969LAPtqUQDjOmH
	suEBr9nh287XKHCruilsXmOKSMzj1kOt/flWI5KLSQYN1WUqbYnIBpkBY7+C4+Fv
	UYE1HY+hIut5DoiygtVdhOrpLdqTN1ApMN63R8rdRiGCHUste8aQUxxnAPbmN0cN
	XDSBYCb+YICAC2N99NYugLEGhyMxv/FB3tbvSAZO3qIokeiKVD8537nDg435AhmS
	m4kAPOM3i6LEulzOVudIuKiza20DJxi+dY9kle62wptKaMTg3ofwd1SpPnGUKZrS
	EuaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660736654; x=1660823054; bh=qZHa7t96W80f+
	Zf/LT7D+dMm9c6KcHucOnnuMAqAEd4=; b=2/4bhvnYJa5oJ40/t22xdmFSTXc0X
	zlgtmitsoN6SWmiM4KJye5+LP2utORpjITg3T2fqtA0GGe91afY/YE3ANWfDwoje
	jCZ+RagL1Ey+woFYByJTEJT68AcAxEnW2DItsBETTT3Mp0m2HBzjEKH8JYmi3UAj
	PB/d+4eVj3pH/8qaU2vR5jy9+HR5iFYM8kuVv/RyOLW6G6Ucfs5L7zxPlKCkyvD7
	BeSLKuOtaatn3Y3nEKZKB39RuSWw1XLfK8CIzmQFdt0a6lCD3N/JhceyRz/6nwfj
	WfcHk489Y6gmmDvwXmYW3f4Goy/k9N73zOUHtCPiRMMROOZyPLkjYuETg==
X-ME-Sender: <xms:jdT8YhcbtZJqBfpu81BeQcivzOuVFmu5kdFpVoDJ_BiZ_46sLcb2cg>
    <xme:jdT8YvNOnWDDy2Z4vXHfCK2HfYTQ5NIMBt05x0wjDfkle3QHra1sNf3Y8_EI_9ukB
    2Po-Ws7KrukLknM9ok>
X-ME-Received: 
 <xmr:jdT8YqhHTfGAW-J49ivr2kZqEYpKPTS6O-RJZik1yU9IFeIa0u2lrCM_bt3K6ovovYBfVptBf9GuV3jHvXf9uOjQvhHlbmW0mfGWrXUNVml7kJy7tH1wUOQ2>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:jdT8Yq_eCzAa6MZnBGhYzvKn7I3FYGoJiMQuHw_xcvKQm8hCzJvcow>
    <xmx:jdT8YtvOtmYZECULzHS3YaDAjNsBybGr2XkED2RNkhQFlS5hrWgHoQ>
    <xmx:jdT8YpFxeRaVa1t50NyoaV_tuss1tX7JhVc1yguR3LDJy0pzU8sDXw>
    <xmx:jtT8YuVweIyTvxC8o5vGQhxe890BuqD2yPO0y6p5yC-OCY3YlHloRw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:44:13 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-java][kirkstone][PATCH 3/3] dbus-java: Include features check
 from classpath
Date: Wed, 17 Aug 2022 13:44:06 +0200
Message-Id: <20220817114406.348705-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817114406.348705-1-andrei@gherzan.com>
References: <20220817114406.348705-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 11:44:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98294

From: Andrei Gherzan <andrei.gherzan@huawei.com>

classpath is an indirect dependency of this package that also has a
required distro feature on x11. Without having the same feature check
here, a world build would fail when x11 is not enabled. Reflecting the
same feature check in this recipe, makes sure that world will skip it as
well.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-extended/dbus/dbus-java_2.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/dbus/dbus-java_2.7.bb b/recipes-extended/dbus/dbus-java_2.7.bb
index ca7652a..0e5ae92 100644
--- a/recipes-extended/dbus/dbus-java_2.7.bb
+++ b/recipes-extended/dbus/dbus-java_2.7.bb
@@ -25,6 +25,8 @@ S = "${WORKDIR}/dbus-java-${PV}"
 
 inherit java-library
 
+include recipes-core/classpath/classpath-features-check.inc
+
 # jamvm-native unfortunately contains non-generificed java/lang/reflect classes
 # which are accessed in this package. Work around this by setting the bootclasspath
 # explicitly.
-- 
2.25.1


