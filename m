Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE86C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 14:36:27 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.12334.1639060587124677973
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 06:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=wduLrtg6;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 0AF535C0215;
	Thu,  9 Dec 2021 09:36:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 09 Dec 2021 09:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=k82Kk9nzz3aROLMO1l3oK2vwlQ
	DYY7q/mq5L+Qz/518=; b=wduLrtg6fHf0+gegsKten9JzGflozLRksh/sfesKrh
	EwjGhCTaWQ24f6Vr7O+0NVu08+34URiOYUmht/THw4D+y+aQP7PnFFTYr/j5kcSK
	5f42H2Ui2YQjZChJJrPEIMo/8WTlIG+8I1vAYltrgfdDB1rGOuhypmxvm4T0YdqZ
	54k25LLr3fgsfhLSwZPvxPRJDVRkblSpqGlE4idoD3sbE/ASkpoKT6pC7QORuMGG
	IK9vwP3DJwsC7s2VkaF1LTrrexocjWQu4DAYlLURMwlvCpevxOXtZRNnwUlQfDd5
	c90LDQuNQo5YqexHnJwMLhzHkduPhh5ioNofa/Z9w9JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=k82Kk9nzz3aROLMO1
	l3oK2vwlQDYY7q/mq5L+Qz/518=; b=Uth4M+1Il5xp9ykRQ8DT3oN4TaJSM7hA6
	6zCbVXDZNl9E0nH2OOdhEeL1v0OmeIwAcxiE2JlU48xenXnjHO8leLBBvz7bWFDm
	F2fm3RneZxmVX5/g1r1FHppOuaAwgxxjpwdmxv3K3ZedDDpLu4Ud7dHe8lK2mmXc
	Lv8pahofrLNPXkrXeAH1eqyNo44KKsnU4gX2Czfqy+3AYrrn7dIwU6dGevPXwyck
	fcEJX392kLfPD0kzzMuiI0aDWVbw/TcMKjf86OANdirL0e9Y/lDlvpo1jOzB2rep
	QdDvbcm1CzdCK6BiZ9LqRYXjm6kkK6YDnpz15VjMxizFObodFEcbQ==
X-ME-Sender: <xms:aRSyYSWKwdPQNTbe8scoyNPXkZgVrDvMvy6QaDVVtvWKCtYbsyaDvg>
    <xme:aRSyYekrl8OnLnTggdumZitt98wazguDJm2HxcI_2RXutAwjWwdXFKETK1gxfeaxJ
    9HyiQJ0a2dtS58YCY0>
X-ME-Received: 
 <xmr:aRSyYWZg_ZjQT78GD8EL7AjbW4s6Vpef-5Yox-dzQgRjDMsA_JDHaymp6vaO_emvcPo0vSdsAaGc3QSFqVJbtxjE7Dgq_Yc7GGJ27MyI_75t3umDr5d5xcLq>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghr
    iigrnhdrtghomheqnecuggftrfgrthhtvghrnhepffdvtdefveejledvueeuhefffffhhe
    evfefhtdevfefhhedtteejvddutefgvedvnecuffhomhgrihhnpehmohhsqhhuihhtthho
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:aRSyYZUbaV9p4uQ1g7Qtvv-VNW8_cxmHiSmj363DMtfVGkW1dM0X-w>
    <xmx:aRSyYclgKO4OaPoi55dVh7OZCJqbToHuATwupX6eQn-z7OxUFCeLKA>
    <xmx:aRSyYednWLaqzI9wkBwm_vYefoMh5iwkIh-bdhL_Xwvgfz_w4QOUfQ>
    <xmx:ahSyYYskjjepoFKyUO_QR2VPZML_7iXkF1Z-dqaHCTGTXK7G6QW8tw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 09:36:24 -0500 (EST)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-networking][PATCH] mosquitto: Don't depends on dlt-daemon
 unconditionally
Date: Thu,  9 Dec 2021 15:36:17 +0100
Message-Id: <20211209143617.2221914-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Dec 2021 14:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94260

From: Andrei Gherzan <andrei.gherzan@huawei.com>

This dependency is already handled through a PACKAGECONFIG so there is
no need for it in DEPENDS anymore.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_2.0.12.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
index d2fa9cf32..06d8211a2 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca9a8f366c6babf593e374d0d7d58749 \
                     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
                     file://NOTICE.md;md5=a7a91b4754c6f7995020d1b49bc829c6 \
 "
-DEPENDS = "uthash cjson dlt-daemon"
+DEPENDS = "uthash cjson"
 
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
-- 
2.25.1


