Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D472E7C4D5
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 15:07:44 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web11.12846.1696402822160878317
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 00:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=1iB0slMc;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Fblcrxi6;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.26, mailfrom: pavel@zhukoff.net)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 79C205C02EB;
	Wed,  4 Oct 2023 03:00:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 04 Oct 2023 03:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696402819; x=
	1696489219; bh=GiMmnji/vplkR5O4dVMYzULkqv0Hr5BL0TsyHWjMamc=; b=1
	iB0slMcVAIUeQGpiz6/451sDmj4yAoFpQRozZCnculZqHI1KARwIUt+MQe+fscsh
	LzTrrOA7U/p5/hyvpsDG0WTKpNjwIFkO3b6cKIEQbFLJ703QONIDOQnKRXrXnv3c
	b3qB0EBv234R+S2HZPVyYBRaN9+5uOfIhxJXdTPQhxUzBXXnFgZNI41hYA4Myk1d
	Q6SSPrncI7psbNpZB6tTzj5MZQ60eO2ofS/prciPUGuT9xmI8MtOyrdVLMlZR3jc
	H44c1xu/SoyXflmA1baydZlyEZRrYfB8uSFymblOcZd9erUFmLwprRGC1vC6l2bl
	Bl5V+NYyBkcQ/DUrtFPTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696402819; x=
	1696489219; bh=GiMmnji/vplkR5O4dVMYzULkqv0Hr5BL0TsyHWjMamc=; b=F
	blcrxi6BHDXgfuTwOJ7G9MyKRuMSTE1H1Afzu2vWaPvjKHv8c4q35qwACO1BhfKi
	27M6g2/fTui4t4QAL9G+UlUx7rmY1Hwvtua5P705czTUK+JoLFN/ZvFl6SAJWBq/
	7F+sLiwuPdXHiNyvi7Hy/g6w84Hn5bYbwvIQqwYzp8OKPJ53RLgxWQO4RoejzOwK
	fnm95K9ApzzqhVvrd6ftatQmRrvF4gFM4vjajR8kQHKz1hoL7bbyxBY5w6VK7fGD
	P7GCgpayIGMyOkayohZT5h/NCbJ+uYt/AnP7VxosVsyzCC0oBkTEijdaJ5ckoKM8
	yuyHKVg6Efjtq7SyKW0eA==
X-ME-Sender: <xms:gw0dZY2ZrkMivjcrpyCmmuYTlX3ZG3EiggrRaB9FJujOMOeYkwwdEw>
    <xme:gw0dZTErPsvyZnz9yW1_1P7ZG3Hki7mg_hC75EKOxt7QrkXURRpqAi9jlrBeMaRtZ
    g7mpPaBt2ukydJWYbc>
X-ME-Received: <xmr:gw0dZQ7C0qrlCMwKB8gcFqWeUrQcUlHmIfTOiffo-GaEj-zn5t0JFL2nthNnNaSGpPmQg0FlzQT8LLvGcQ230vFG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghl
    ucgkhhhukhhovhcuudcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrg
    htthgvrhhnpeduhfetvefgieeitedvudegjefhudekfeeikedvffdvueelieehudekhfff
    heeivdenucffohhmrghinhepshgvlhhfthgvshhtrdgtrghsvgdplhhoghhgvghrrdhinh
    hfohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
    rghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:gw0dZR2g4GOV9B71CbcA9YEDvqWwAjoTaLTiPz7OwZLCrq8uTAKpog>
    <xmx:gw0dZbH-fVNGgwNxzx3psQP7H4RRWEDZiK1bF9-763WIlMa--kCMHQ>
    <xmx:gw0dZa8Ti4m-eOCZyzUCFyLj77a5-FlhB25VJj3CeU_wSp-Gaixy3A>
    <xmx:gw0dZePSBNJW9D8WzDfvWrttoX0Ks104mRS4yYEWuOsl01U3vOX8fA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Oct 2023 03:00:18 -0400 (EDT)
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: openembedded-devel@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH 3/3] selftest: Add tests for populate_sdk task
Date: Wed,  4 Oct 2023 08:57:28 +0200
Message-ID: <20231004065728.4283-3-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004065728.4283-1-pavel@zhukoff.net>
References: <20231004065728.4283-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 15:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105334

From: Pavel Zhukov <pavel@zhukoff.net>

Two tests to cover both installing package with IMAGE_INSTALL as
well as installing versioned dependencies of the package (using perl (>=
5.XX).

Related: [Yocto #13338] [Yocto #14995] [Yocto #14066]

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 .../testsdk-perldepends.bb                    | 16 ++++
 meta/lib/oeqa/selftest/cases/sdk.py           | 79 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta-selftest/recipes-test/testsdk-perldepends/testsdk-perldepends.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/sdk.py

diff --git a/meta-selftest/recipes-test/testsdk-perldepends/testsdk-perldepends.bb b/meta-selftest/recipes-test/testsdk-perldepends/testsdk-perldepends.bb
new file mode 100644
index 0000000000..428e1f52e2
--- /dev/null
+++ b/meta-selftest/recipes-test/testsdk-perldepends/testsdk-perldepends.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Test recipe for sdk populate test case"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+RDEPENDS:${PN}="perl (>= 5.12)"
+
+do_install(){
+	mkdir -p ${D}/var/lib/
+	touch ${D}/var/lib/testname 
+	echo "${PN}" > ${D}/var/lib/testname
+}
+
+
+
diff --git a/meta/lib/oeqa/selftest/cases/sdk.py b/meta/lib/oeqa/selftest/cases/sdk.py
new file mode 100644
index 0000000000..35734d8a7a
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/sdk.py
@@ -0,0 +1,79 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import get_bb_var, bitbake
+
+class PopulateSDK(OESelftestTestCase):
+    '''Tests for populate SDK task(s)'''
+
+    @classmethod
+    def setUpClass(self):
+
+        super(PopulateSDK, self).setUpClass()
+        self.buildtarget = 'core-image-minimal'
+        self.classname = 'PopulateSDK'
+
+    def sdk_build(self):
+        """
+        Test if package added via IMAGE_INSTALL
+        conflicts with dummy SDK providers
+        """
+        SDKTASK = '-c populate_sdk'
+        bbargs = "{} {}".format(SDKTASK, self.buildtarget)
+        self.logger.info("{}: doing bitbake {} ".format(self.classname, bbargs))
+        return bitbake(bbargs).status
+
+    def set_config(self, image_install, package_classes):
+        config = 'IMAGE_INSTALL:append = " {}"\n'.format(image_install)
+        config += 'PACKAGE_CLASSES = " package_{}"\n'.format(package_classes)
+        return config
+
+    def do_test_build(self, image_install, package_manager):
+        self.write_config(self.set_config(image_install, package_manager))
+        res = self.sdk_build()
+        self.assertEqual(0, res, "Failed to populate SDK with {} in IMAGE_INSTALL and {} package manager"\
+            .format(image_install, package_manager))
+
+    def test_image_install_ipk(self):
+        """
+        Regression test for [Yocto #13338] 
+        """
+        self.do_test_build("bash", "ipk")
+
+    def test_image_install_rpm(self):
+        """
+        Regression test for [Yocto #13338] 
+        """
+        self.do_test_build("bash", "rpm")
+
+    def test_image_install_deb(self):
+        """
+        Regression test for [Yocto #13338] 
+        """
+        self.do_test_build("bash", "deb")
+        
+
+    def test_image_install_confictdeps_ipk(self):
+        """
+        Regression test for [Yocto #14995]
+        """
+        self.skipTest("Disabled until [Yocto #14995] is fixed")
+        self.do_test_build("testsdk-perldepends", "ipk")
+        
+    def test_image_install_confictdeps_rpm(self):
+        """
+        Regression test for [Yocto #14995]
+        """
+        self.do_test_build("testsdk-perldepends", "rpm")
+
+    def test_image_install_confictdeps_deb(self):
+        """
+        Regression test for [Yocto #14995]
+        """
+        self.do_test_build("testsdk-perldepends", "deb")
-- 
2.41.0


