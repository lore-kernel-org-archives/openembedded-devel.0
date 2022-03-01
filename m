Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1894AC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 22:55:47 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web12.1439.1646175345672692185
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 14:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=x4sWzCUj;
 spf=pass (domain: cold-front.org, ip: 64.147.123.20,
 mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id F15EC320187F
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 17:55:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 01 Mar 2022 17:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; bh=Skwhofn5g7SCoGE2XfBlebx3vtxFYL81RRWmHpFP0/M=; b=x4
	sWzCUjEZsMEgJhkjQWpimpBG/uhZG52N0ZN4woZt5SfrFlHP3iuIFUQfcV5rCYAt
	QsFHYnsRwYrRC8iluNUQ7j7cNT5J4ZFTDyhutpy7j7gtXluicbgdCFo7DWbHGXR2
	W470JQvXwNWaG6vyxvyiZ0bGI96KVk0Eplzi9cApA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=Skwhofn5g7SCoGE2XfBlebx3vtxFY
	L81RRWmHpFP0/M=; b=Yf7jSNTU80MxiHs/OERTCe+Mz3juT4TCHkpCy4JAdlbyd
	APKlSzpfnxLV3Paiw+DZbiU6K5SVWu1oDzuIZqxgxVJ40P0jtGCx3m4+X1yCQswG
	MhAlXsEPaerenSB6qsCZUnooOxdZ7plHUnTm/pBFrupZsYQXgAwXVgODNCweVNRq
	PQE1bUweEcnFdO42I6UftKcXwGRQQBjaPkAptmZdKTyj8tVb5WkcKTYfTv9fJpVy
	qcImSve4JELxgrJz1Q6BaZTDFHi606LE2xJ7OIR+ulGSMy/s110ayDgd9pY6X+EX
	0Jq/oZW3JGW3hhUyU7dx1NT0OnTXGc54r57zZl9uQ==
X-ME-Sender: <xms:cKQeYignnMdWugE_bygwEll7M2IViZoaoOYSdVZzgAjMZIGlWalsoA>
    <xme:cKQeYjC4gFkXcD7riA621Xf6ekEv6aZXVCQ7sEynP5ncpt-q7OPPB2Jfjt5wykMhN
    WzrSrm2AdpJngu3qg>
X-ME-Received: 
 <xmr:cKQeYqHk6SQdBw5qs5NuP6-VfS7PviDYersoFS8tIQtP2KehEqzXIN3wxu-kE18DSOSZK125vluNtZFVAA1NjXnC2PJ76tpNjB6taP1tC33E>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgudeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheplfhushhtihhn
    uceurhhonhguvghruceojhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgqe
    enucggtffrrghtthgvrhhnpeelieeludffhfduvdfhjedvtefgieegfeeijeegueegtdeg
    geeljeevjefffffgveenucffohhmrghinhepshhouhhrtggvfhhorhhgvgdrnhgvthenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhho
    nhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:cKQeYrRqToK_A7W1D_OC7FdcOzMy0GgKhrTrOeG90mi5cEGA85-_QQ>
    <xmx:cKQeYvzqdKEvnZ87PVk9Bh1v20ySS_8WHdl6E-GYPpWjLbKg4U8S4A>
    <xmx:cKQeYp4RHXNM3C8Qq_0EM_GM4DK4zF0Jyr-XHKVtwSZZhTtd0Kz56A>
    <xmx:cKQeYgvBsVrtg8yB3GvVS4VGafKEDIWDLOOl9LS--Hnr09QplCPOpw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Tue,
 1 Mar 2022 17:55:44 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-lrparsing: use setuptools instead of
 distutils
Date: Tue,  1 Mar 2022 17:55:42 -0500
Message-Id: <20220301225542.19724-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 22:55:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95662

Recipe also does not inherit pypi nor would PN be a good guess at the
name of the wheel. Set PIP_INSTALL_PACKAGE appropriately.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 ...-use-setuptools-instead-of-distutils.patch | 27 +++++++++++++++++++
 .../python/python3-lrparsing_1.0.17.bb        |  5 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-lrparsing/0001-setup.py-use-setuptools-instead-of-distutils.patch

diff --git a/meta-python/recipes-devtools/python/python3-lrparsing/0001-setup.py-use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-lrparsing/0001-setup.py-use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..28af8fa4ec
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lrparsing/0001-setup.py-use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,27 @@
+From 04d9a4cea699d64b464daef7760de594b1c7f9bf Mon Sep 17 00:00:00 2001
+From: Justin Bronder <jsbronder@cold-front.org>
+Date: Tue, 1 Mar 2022 17:34:34 -0500
+Subject: [PATCH] setup.py: use setuptools instead of distutils
+
+With python 3.10, distutils is deprecated in favor of setuptools and will
+be removed in python 3.12.
+
+Upstream-Status: Submitted [sent to maintainer at russell-lrparsing@stuart.id.au]
+Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 89ea344..2848b4f 100644
+--- a/setup.py
++++ b/setup.py
+@@ -3,7 +3,7 @@
+ # Copyright (c) 2013,2014,2015,2016,2017,2018,2021 Russell Stuart.
+ # Licensed under GPLv2, or any later version.
+ #
+-from distutils.core import setup
++from setuptools import setup
+ import re
+ 
+ def get_long_description():
diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
index 24e4e2671d..9974326de6 100644
--- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
+++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
@@ -7,7 +7,9 @@ HOMEPAGE = "http://lrparsing.sourceforge.net/"
 BUGTRACKER = "https://sourceforge.net/p/lrparsing/tickets/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lrparsing/files/"
 UPSTREAM_CHECK_REGEX = "lrparsing-(?P<pver>\d+(\.\d+)+)"
-SRC_URI = "${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz \
+           file://0001-setup.py-use-setuptools-instead-of-distutils.patch \
+           "
 SRC_URI[sha256sum] = "7c060d9f03cf582fdbc0ae0fef0ea2ff6fd56251047ba7e425af97e23f46f582"
 
 RDEPENDS:${PN} = " \
@@ -15,6 +17,7 @@ RDEPENDS:${PN} = " \
 "
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "lrparsing"
 
 S = "${WORKDIR}/lrparsing-${PV}"
 
-- 
2.35.1


