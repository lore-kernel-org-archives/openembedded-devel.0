Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB36BC48BE4
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 11:43:44 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web09.28027.1660736622738551539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=gLSOLZlt;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 175FC5C00B1;
	Wed, 17 Aug 2022 07:43:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 17 Aug 2022 07:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1660736622; x=1660823022; bh=qZ
	Ha7t96W80f+Zf/LT7D+dMm9c6KcHucOnnuMAqAEd4=; b=gLSOLZltschPwhcHlS
	gvMqKLFp4A4m/Qoj3s5MtiCT5+rkV6moJHX3Prn9GGJcyHIPe4lw7Wub/jNsbPC6
	5ontrmo+WD89lowel8moWoaicAcTFkqQNVVj9AdV/W6f96d7o/rjrf0anj1CB5CI
	CzFGiv7RCqU1CCu7yB8S1ZNEizGqhlSSp2UeEwoshi0l8AAFmLDwqwCWaHuyQcsZ
	CfVBcRggQXoKCGPec4Hob47zLRo12u5xwZOACEkCij+05TczSivBKnxzFVN+viDl
	13SX+p1CO3Tjg4hPnaSTgQ+0BxcK0Ti9d666DvUp5RNJ1CiQko1F6X9oxPDaOTj8
	6CEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660736622; x=1660823022; bh=qZHa7t96W80f+
	Zf/LT7D+dMm9c6KcHucOnnuMAqAEd4=; b=jZA2fy4Tz2LhG3i+mJ9O0JnboT872
	+d1CwIO9hlSGdkEpfWDvXOe6Is0Bz5/DSx5NzOVjoN/jqGsrH22AiP9DROMlR4JL
	5mQ+3abBKO7L46IBiFjWhhkdBIaXQT317v6g6H32Ydiqv189i/G2SSnxiH9bV9d+
	rtv6pfmp2/Wv0beFU6ohaWLnt83R4/UEVhqgdMZ0oQtKW7LkCU9XfkBmrWNZQaR5
	yYcCMEcYKMx9tB1WNLpLKDw38Gpv3NicR/Ei2BgXAXv0SDVsQtLFhXZsmoNIkDFp
	8xZcLryRMgmvyot5FzJMYoyuBtBQRWIF74Nc/GpWx2yNKx2UpKqI9oosg==
X-ME-Sender: <xms:bdT8YmQh8BEMbvAIsVpG20Rrmz-j0CUUSFfN3fkKwJXy-Ln6yJkkZg>
    <xme:bdT8YrwrZCkRzbw1iYgj8hP4s02T28ZRKG1emNVO-kGBz9LHQNGGXd5ATt7zZatnt
    0aaUguVhd9Jtt5h_Q8>
X-ME-Received: 
 <xmr:bdT8Yj3foe-sOO0fNqdcQXFF82KTvFZ-2JxqvlonOZA4sSui--GSGHeAPjrRo0KUtQ0o5O-T6D14u9XmcNUBgNaWp9wI_vm_0KzJzO1oK-7p_TaHRA2DbNxo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:bdT8YiBHnG2Lq8OoP7i22H8RB5ZdoPu_RSX53JMV0DxxvdSuAcUk8A>
    <xmx:bdT8YvjMNKERs0sEMD9z1X2uy8XyRhHUs6SicUVi75ZYOwJmtQw2qg>
    <xmx:bdT8YuqxKJl06l8JsNcVJTU1qBXzsCTKs53HU9ncsJ5iifxIecRLTA>
    <xmx:btT8YnYWSXT6_96DjPdKDO41dIgrmHoWDkyb8NDhcnY7CCETS7WB-A>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:43:41 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-java][PATCH 3/3] dbus-java: Include features check from
 classpath
Date: Wed, 17 Aug 2022 13:43:08 +0200
Message-Id: <20220817114308.347965-3-andrei@gherzan.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98291

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


