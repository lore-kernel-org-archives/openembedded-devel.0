Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962E4C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 20:53:22 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.18333.1690491197753128084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jul 2023 13:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm3 header.b=a14mO8ll;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=XB+LeGh2;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.24, mailfrom: cvubrugier@fastmail.fm)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D59953200910;
	Thu, 27 Jul 2023 16:53:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 27 Jul 2023 16:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1690491196; x=1690577596; bh=Df1m0cClfa
	5wngTFCxHAkaeImTR3AdU+0xBveWwEbFg=; b=a14mO8llRoYefRMlW2ZrZT4WxA
	3sUZfESVYPwfxDtTKPMVa1DLSI5sWzfJkAGDqexdLOKWyGLeShIhAedZ21RaSl+z
	hoQ7gFefZzYJofX7xA+au8CnQvEAum+I4UQ2kqFEsWeyTY/ZSLUzmobHsFEL/wB/
	0DvwqAaBbmgaTJz5FrvgVgra68F6HyFgDuKkRIS0tjYTCPc0B6zKBY8wFwe/sH/Y
	Evdf7+K1rZ4goWJ17SVMXR92VKJzUj2fW8W4/6/ksiyPfyZ/wjqSadMWryjC8Xe5
	KGgRmlAxWTNwnvahqNtsCoUGPskNqWmNAaEYkaDZuH0/juZzC6mzKBnWLs8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690491196; x=1690577596; bh=Df1m0cClfa5wn
	gTFCxHAkaeImTR3AdU+0xBveWwEbFg=; b=XB+LeGh2Ble0HamswQyk7RP9ut84B
	mt2shqVypT7nsqxRh1m18h5Hus9BsimRUYY8MmSYdcaXk6e4oBXo5G6rGvqN/T/1
	VthpJbvQk0MTAQP9O1iFZm/FeYhrMHGc5uCLFCt7KeCplkHI5KbeKFqjXn3AYUh6
	eQY2DEdAAE3UUGIW0JJC1G/BTI99qZmNYhQmRgfviski7uBYEsyhFkHd/5lPq0bw
	HVu/HreTO05LXUlJOldmQJMy6XSxOWKydXyjSSf6x0bbfkXiATGzQSzuLEJcYUpJ
	B7vae68xvIcOnLiuQ5MxsYiQ43M4KQVNYYVSfqyGFp48bln1D/ZvzINVw==
X-ME-Sender: <xms:PNnCZHKS86eyZXLpbMalWerHbSFrlPVXqzeKvAS9wTlEWGCLU-_kww>
    <xme:PNnCZLLiVX2T2wJuSmhCSUPi_H0XByw3fh4Y_P01FIt9I75iXLVSxalY8ZcbSRC62
    iq9iGJ-WGuF9OBoqQ>
X-ME-Received: <xmr:PNnCZPvJtdb7r5fuE9UaOJN7pzmjNh_JZJIjGIQFqv9Tc9fF9aknWipVKWuMw_cysm2MVLTlwZiUPBBJDjciGGccHXuwbrwgg0crXgWeNH1DBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieeggdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptghvuhgsrhhu
    ghhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepieeuledtkeegke
    dvveelgeefhefhffeiveeiledvjedugfeivdetjeffledtleehnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:PNnCZAbuJeEZB4ikzBA5i-My0uxk16wNwJ9tE5LxKSnWJ0RWfJJGgA>
    <xmx:PNnCZOaAy85GvxGeQ3HREX3LNmk8yloEukCEG1QPxAFw3JtvyzPKMA>
    <xmx:PNnCZEAiY6v9RvgP4ENxVzmlSUhxdbRmo4VXxsqaZnIjqMhU4lq0Pw>
    <xmx:PNnCZHALdtQdrIc7q9XKwrF5-UgjHw8gChqLJGgNu5-sQDFO8GgnCg>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jul 2023 16:53:15 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH v2 1/2] libnvme: add recipe
Date: Thu, 27 Jul 2023 22:53:08 +0200
Message-Id: <20230727205309.41265-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 20:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104061

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
Changes v1 -> v2
 * Disable Python bindings that require SWIG.
 * Disable dependencies on OpenSSL and Keyutils since authentication
   and NVME-over-TLS are not supported by Linux yet.

 .../recipes-support/libnvme/libnvme_1.5.bb    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/libnvme/libnvme_1.5.bb

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb b/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
new file mode 100644
index 000000000..4b6f1e30b
--- /dev/null
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
@@ -0,0 +1,22 @@
+SUMMARY = "libnvme development C library"
+DESCRIPTION = "\
+libnvme provides type definitions for NVMe specification structures, \
+enumerations, and bit fields, helper functions to construct, dispatch, \
+and decode commands and payloads, and utilities to connect, scan, and \
+manage nvme devices on a Linux system."
+HOMEPAGE = "https://github.com/linux-nvme/${BPN}"
+SECTION = "libs"
+LICENSE = "LGPL-2.1-only & CC0-1.0 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
+                    file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
+DEPENDS = "json-c"
+SRCREV = "4fea83db8328ea788ea8f1001e8ce1cb80ef5fae"
+
+SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON += "-Dkeyutils=disabled -Dopenssl=disabled -Dpython=disabled"
-- 
2.30.2


