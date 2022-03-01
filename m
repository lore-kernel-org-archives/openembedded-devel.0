Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E032DC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:33:05 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web08.10296.1646152384839643826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=l/jGstrk;
 spf=pass (domain: cold-front.org, ip: 64.147.123.19,
 mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 1177F3201E78;
	Tue,  1 Mar 2022 11:33:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 01 Mar 2022 11:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=VDO1FBufMQ471llRUaRinqAu4uMq4RAQ9Ew
	7ek25mOw=; b=l/jGstrkNbPwcslnEFIvYfHw5XrAXw6VZsqPxR+RjniGw3j+qms
	k8WJgmL7P//ETI8bFxyLCoksDGUxDBT5tzwnqYZqFv6/SL5KDXWeEBWRsN0W4Hl8
	rVp0LURXymvQJokSPMy7IXGt/kn7yN9yFFpCMXeyD0uSMdG2JQRIkJqk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=VDO1FBufMQ471llRUaRinqAu4uMq4
	RAQ9Ew7ek25mOw=; b=NSXwWeLu4NNff2QjyD9LjvP7QLOFFt4+MkmDBAPeRnTkO
	UEXxSGN8J+ZBj5Il98gypxlKZANpM7o1o3fV1+1WxfcNWzICkbuUrIcZ6SxhuAwu
	HmXJS91ZeeyMFbsk3KNyJ4VAlGB1qY2kMlWdjUZ/qIkY4zxwiQNuuzxVYRS9CIQx
	umc/Ar6u2kXsBveypRLuagNTbvBHcBzwHEoi2Gd4iUwZ8dgS4MSk9iRe5jsTHWxS
	Q0WlF2I96P35O01uRevUD64qNbdYwl8A43oX6LgewgHP2h3+3pKjn+RCiPih4XUV
	Ini8HfWChMiEVkOYY7ySVuOXDJPgH4uOlFn27MIPA==
X-ME-Sender: <xms:v0oeYjmo7agL9Z37udoy5CEAyj1aPt-Ph3PHzqZHtZsFD9tpwfUCzA>
    <xme:v0oeYm3y1TwWPA5L-x07scJgj3xAVb-m2NqM7oEPxpzTaqssiPeH3VMQduXUu3a5U
    -91OUgO-1r4apus9g>
X-ME-Received: 
 <xmr:v0oeYpp-whjXmwWn_3fnLs2ofmK9Deukm0lpg-a0FYfNzhldhwCKm8pHgAmEtLMHgXy4eMXdyRH9Buxmnb5Avcm4sluS7S79q-Cfgn28qcN8>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpedvhfdthfffieffve
    etveeifeeuvddthfeludeitedukeeggfevfffgffffffffhfenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlug
    dqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:v0oeYrmvac_kE5TIwzioOkihKbLw13y5ZshugXoQQyxrTL-IKXM9-w>
    <xmx:v0oeYh3Mr-yvSdkwNeEd1ZbLllXJqPNUwTgwj1OwWRBUGEXaGXdjIA>
    <xmx:v0oeYquS3ol7UYcE8ZPr_fkoq4KGn40qmHl7rWixzujg5hcTATXWEg>
    <xmx:v0oeYu8UQxgUdtRoxz4uziXC0KRmxPm1KFBmA5u2x4Isyun6Uyew1w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 11:33:03 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-crcmod: use setuptools instead of
 distutils
Date: Tue,  1 Mar 2022 11:32:58 -0500
Message-Id: <20220301163258.1329-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 16:33:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95639

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 ...-use-setuptools-instead-of-distutils.patch | 22 +++++++++++++++++++
 .../python/python3-crcmod_1.7.bb              |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-crcmod/0001-setup.py-use-setuptools-instead-of-distutils.patch

diff --git a/meta-python/recipes-devtools/python/python3-crcmod/0001-setup.py-use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-crcmod/0001-setup.py-use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..9bcb871135
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-crcmod/0001-setup.py-use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,22 @@
+From 3dc1e9584ed2ac81e7526b8dbf76b4a06ea8ac76 Mon Sep 17 00:00:00 2001
+From: Justin Bronder <jsbronder@cold-front.org>
+Date: Tue, 1 Mar 2022 10:34:42 -0500
+Subject: [PATCH] setup.py use setuptools instead of distutils
+
+Upstream-Status: Pending
+Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
+---
+ setup.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index e3a524b..2f2bcfc 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,5 +1,4 @@
+-from distutils.core import setup
+-from distutils.extension import Extension
++from setuptools import Extension, setup
+ import sys,os
+ 
+ if sys.version_info[0] == 2:
diff --git a/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb b/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
index df8f0d83d8..f8f1683601 100644
--- a/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a19291627cad2d1dfbfcf3c9fb85c2"
 
-SRC_URI[md5sum] = "2d5b92117d958dcead94f9e17f54cd32"
+SRC_URI += "file://0001-setup.py-use-setuptools-instead-of-distutils.patch"
 SRC_URI[sha256sum] = "dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e"
 
 inherit pypi setuptools3
-- 
2.35.1


