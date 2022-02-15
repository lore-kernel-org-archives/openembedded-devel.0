Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3677C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 19:50:08 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web08.2175.1644954607657565880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 11:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=Ukia7Zb+;
 spf=pass (domain: cold-front.org, ip: 64.147.123.25,
 mailfrom: jsbronder@cold-front.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id DBF093201DBF;
	Tue, 15 Feb 2022 14:50:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 15 Feb 2022 14:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=mesmtp; bh=dySQm6FKMOP
	ulBtWl5iJI+Uu7B3Z2V2WL+QLym3MpKc=; b=Ukia7Zb+V0gdwVy0tuMwDc+gePr
	GcOYTQ1ikt3wqV8AyF5BzfsGM0ccmlqmLJh1mbJuQ+eW7EmPYGXLJAdgwa4mwGS1
	tRsYvsUVWBV5nEz59VxRd1YV+aPQGCV8oqkORQ1yfOP8xETme8J9TpSIgAvSX7DO
	VpOvicB7NyM0GoQE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dySQm6
	FKMOPulBtWl5iJI+Uu7B3Z2V2WL+QLym3MpKc=; b=l3M8n+YOzv3bTEKN2WSeU+
	/2UGq7X9wVFeZw4C7wFYVEszaAdjfwC70MuQE9i+FHAk4ZE0jo3mn5vaQXh+ui6+
	/GMAOl1PiJBAAXfQmYTTc8UVQHuCEFu+aDiIGWt3u49Y3B8snUfck8jz1J6GeLYN
	UU/U2BW5G8iWDxwD1/4rCDA7+nWDhcoXWFvCAwcPV40OnEoS3E0TkGw+6ySzeEkv
	JdKtf2lbxKq6q87pijQXpV3sBkdkZdI6VHIPk+DwShHbrRvl1cfsNYUzgwCT+BiH
	kDCqKA36gO6YoN1umrpNS2kTYcvNH//k2gKTU+opYCckMRfvD4g+3bpr3wper7pQ
	==
X-ME-Sender: <xms:7gMMYhokI-RqJR8JLweonatr1pIHIEnCzOMNZXMaHdWVVRb6pHOhNA>
    <xme:7gMMYjrXU9FJdQSbXfGM_5PWjipCDaGGm_ID2ijk7uXsTCuw6vfJBKGwaJ5t2C6lv
    V_6teC7kayrxE-OyA>
X-ME-Received: 
 <xmr:7gMMYuMX6SBkoi1MmTQYWDGgbAwvRKZFb1r0o42-wF-u5d9UUK-w6FKg5WJHLlvszv8kcZJKbd28ggQY8Q7HD--FlZ18JlVENSni86s0TNN_>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeehleetteejie
    eiteejueeufeduudelgfegffevieekveffleegiefgfeethefgkeenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:7gMMYs6J3JL7w0Js-IzlIqcY0M9Crtjt0enOb61GokT9-x8Kf1Htpw>
    <xmx:7gMMYg6F4ZXtuMoLACwDdwN5rvE8o5R-IAdOPE3qE2v9zgs0rW0phQ>
    <xmx:7gMMYkjXXryaAMh0FpkR_aiTn1peSqDxkyxdLVLa9Y2pELawff7CWw>
    <xmx:7gMMYlgu_pxbICp93DzWcDPPY-lYCwmhL_3KM0AVRM-v2gZbxxX-4w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Feb 2022 14:50:06 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-oe][PATCH 2/2] python3-pytest-xdist: add 2.5.0
Date: Tue, 15 Feb 2022 14:49:31 -0500
Message-Id: <20220215194931.1716-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220215194931.1716-1-jsbronder@cold-front.org>
References: <20220215194931.1716-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 19:50:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95319

Adding a pytest plugin that enables distributed testing and loop-on-failing modes.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-pytest-xdist_2.5.0.bb        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
new file mode 100644
index 0000000000..a10ac8cc49
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "pytest xdist plugin for distributed testing and loop-on-failing modes"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
+
+SRC_URI[sha256sum] = "4580deca3ff04ddb2ac53eba39d76cb5dd5edeac050cb6fbc768b0dd712b4edf"
+
+inherit pypi setuptools3
+
+DEPENDS += "python3-setuptools-scm-native"
+
+# Note that the dependency on pytest-forked is scheduled to be dropped in 3.0
+RDEPENDS:${PN} += " \
+    python3-execnet \
+    python3-pytest \
+    python3-pytest-forked \
+"
-- 
2.35.1


