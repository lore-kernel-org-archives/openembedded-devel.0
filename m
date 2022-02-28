Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527EFC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 20:24:00 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.2786.1646079839406715473
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 12:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=Cy4U7Hwc;
 spf=pass (domain: cold-front.org, ip: 66.111.4.29,
 mailfrom: jsbronder@cold-front.org)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 562435C0293;
	Mon, 28 Feb 2022 15:23:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 28 Feb 2022 15:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=rL12srmqmEAJQwmENFINO0XOycySfc+muye
	WWWvpKQ0=; b=Cy4U7HwcAeYS1L5XNK2s9h06mQ4d6GF/20RTycMxnk12YNOFDaa
	uxyCdSoDOzr+mEH1rMG4duyd6QxQ0kM6CB7Z6Onbl0PWxgMTAqKccGfIZhBM0b8/
	5ZAqUFtlSRSb/ZH/zrtmpwfMjo++0i0QthmgNwrJwnUhQhpyDbJc+KUQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=rL12srmqmEAJQwmENFINO0XOycySf
	c+muyeWWWvpKQ0=; b=a/+gZK71Q5KzMudic4Q31sTBWrvFIOPystITwlrKWICzX
	s6zROUe5KaeRI2dR8OESLwWMZ1k3AnUJ0crVLIFBtozm9xNBYB8HhgllSEZztpfw
	EmCR3s4/cxowD1GXHZaI5kC6F6R7dvB+Mbbbz/u/T3OHlOXedMmsmVuSYynUGCcX
	OCGuLkRfEkOI3lafaK53UafjGdNS1TBYf72AY+T/9oRofdskzN0xbOFnct2J7GnY
	McAv/L9B5xEaHNFw7iTfdd0QGEBbaQkvHX840ZGXLXzeIZ5dH/qzKVDyfGsjDPIx
	fWEBAHqWrIyKb2rEtJ+j7mRLY2+8lFBZOhIsQD7fg==
X-ME-Sender: <xms:XC8dYh5zRoIjKTbsxIURqCcrcH5kSKfMWj0CJPXuuKVEgLl7sB9KfQ>
    <xme:XC8dYu4TCi_HMINdr61X_p3gPekGMlKhorBJyGrwgLxfsuPDPunM4PCv8DS14Qi_N
    y3stMUh05DCjGWkrA>
X-ME-Received: 
 <xmr:XC8dYoeo-s_G1vU6giYEJA9MDNnTi2W5IZo4j7hzqlMdmqCilwU7QTG2sJ3T7FBFiGjI3px4K4nZxZqpBX783-9ijIZk7KUkjRv3182hcitU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnheptedtgefhhfdtie
    dvhfekieffkeelheettefgieeuhfeuffffheevveeuhfeigedtnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:XC8dYqJ3enTUyIlgUmWFY8Z5yTyzOfamF2Bj_yMRhLhd0mQ70irf4g>
    <xmx:XC8dYlJAPKESSS3W7GWULqmiCbkXS9dmfOmPVNgY5qqN3L3jzYZKVg>
    <xmx:XC8dYjyr77ABTQlqd7vT7BpE6LWwAYlvNvODzH_jMQYV1LE_fP4E-A>
    <xmx:XC8dYnyvy9qF-FnDnSPmH8sym9eqGf4BfbxBNny5bJQ-dB3bOsa1lg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 15:23:56 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-bitarray: switch to setuptools
Date: Mon, 28 Feb 2022 15:23:43 -0500
Message-Id: <20220228202343.3386-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 20:24:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95595

Backported patch from https://github.com/ilanschnell/bitarray/pull/168,
committed upstream as
https://github.com/ilanschnell/bitarray/commit/947d364841954d60bab7a4cf1497a272b1bf73ca

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 ...-use-setuptools-instead-of-distutils.patch | 29 +++++++++++++++++++
 .../python/python3-bitarray_2.3.7.bb          |  3 ++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-bitarray/setup.py-use-setuptools-instead-of-distutils.patch

diff --git a/meta-python/recipes-devtools/python/python3-bitarray/setup.py-use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-bitarray/setup.py-use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..cef7ce15a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bitarray/setup.py-use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,29 @@
+From 947d364841954d60bab7a4cf1497a272b1bf73ca Mon Sep 17 00:00:00 2001
+From: Konrad Weihmann <kweihmann@outlook.com>
+Date: Sun, 27 Feb 2022 11:57:09 +0100
+Subject: [PATCH] setup.py: use setuptools instead of distutils
+
+as distutils will be deprecated in python 3.12 and already produces
+a warning when run with python 3.10.x, it might be a good time to
+switch to setuptools.
+It offers the same interface, so results will be the same
+
+Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
+
+Upstream-Status: Backport [https://github.com/ilanschnell/bitarray/commit/947d364841954d60bab7a4cf1497a272b1bf73ca]
+
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 4dbdf859..c7787dad 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,5 +1,5 @@
+ import re
+-from distutils.core import setup, Extension
++from setuptools import setup, Extension
+ 
+ 
+ kwds = {}
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
index cac003a4fb..6566f8d664 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
@@ -7,4 +7,7 @@ SRC_URI[sha256sum] = "4da790ab193e993107f3ff0aebc4f8d6ad5196a19071fbafad16b02898
 
 inherit setuptools3 pypi
 
+# Backported from 2.3.8
+SRC_URI += "file://setup.py-use-setuptools-instead-of-distutils.patch"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


