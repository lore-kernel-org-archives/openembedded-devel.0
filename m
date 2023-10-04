Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1175EE7C4D0
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 15:07:44 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.12763.1696402818074236888
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 00:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=e6+qF5N3;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=fbKdbJOi;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.26, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 67E0D5C02EE;
	Wed,  4 Oct 2023 03:00:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 04 Oct 2023 03:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1696402817; x=1696489217; bh=cxRK5n7n0a
	56TrQsgNAUqqPthvZSWjr3lPjVnyzOoGo=; b=e6+qF5N35Rt1QvMakiQ6xkg5gU
	z9+21rTVEv/P8dIzeE2ao4Nr+ZaDWbrOrDv8x0LgJY8yP2h3XCw3rK/ifi3hPx32
	SsoUEVWVu6W0whtf7pxj6+nZ49uyPPceT02DaVhL1ZvjNtAiBpZQT1W52M8hZ1NN
	TXvXcMC90DgIxyae/cR9I64F3803Z60lCcWg6qiWINqZFRsP6thTsUlSluG/3L+T
	XJHRaBaZV2lgtDUgIIsHoGvSUtI5DUQURsq7z0Cv29lOk+W0Tvapr259LFAo0qBp
	VVBIKFlfvjeL1h1We4kZP8MjIkB0io4YoazfPUOlEabA16yAebzxje/tQeVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696402817; x=1696489217; bh=cxRK5n7n0a56T
	rQsgNAUqqPthvZSWjr3lPjVnyzOoGo=; b=fbKdbJOizW9mCp/XnAf7FOTrkgLeT
	T1X9SRIqnc3IepWe0D5y+PVnY9BGs1Vo0QlIIgZYXLUiS9pAm432ltRRQlEEqrUt
	rv9wfbfNvfHM2YN1pyghYTHVzOHS6h7+isDe9R9RiO7d0ium2nj+TXk8Xi3+WVir
	209i0151jk/KxNIVs380vCw8i66tuv7DlyX3q16h+kJgp15whIiPAIFLpZCBHt0U
	OxQBV6zZpqUm1zWaOWO3UOG2ZKvQLdf6Bs4+lRePn2pHP1dn24aLGcm3b8KfrddV
	y9zOEhC/uP6hH9aW+tCfpgcCCuuaU/E+BEJDJ+GrUi59977NDrrPGRT1g==
X-ME-Sender: <xms:gQ0dZSrGEBxDYe3eFOpyS3HzdO8HUmhz8-WCASvodoFbturQkDqohg>
    <xme:gQ0dZQo43Ge9GCV4e44ynWFp74fi2TCkUfmF_gRUr4T1yZwAlEQTMbjltlroPMS1p
    ox7dUpa02WXDzhP15A>
X-ME-Received: <xmr:gQ0dZXMwtV9xfAJLKzEejvYHATiln4bdMxgNxGf9jsqSJ9HW88H36BK1rrm3w0wrarr0fYlVw6ubEJGwQbynVcY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghlucgk
    hhhukhhovhcuudcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrghtth
    gvrhhnpeevffefudetkeduffettddugeefteeigfehfefhgfdufffgledtieegudejfedv
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    hvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:gQ0dZR5flDJND30AmLF4KUSnJOvV_Tjq2GhV05BkY1OKxgxM_ceRbA>
    <xmx:gQ0dZR44jcbtg66Ej2I2mxneGqKDR8sU6-VkjpHKZrMNg1S8KD77JA>
    <xmx:gQ0dZRh1Gqv9ATf7o_SKML18vZTxWNKw3nDgUIwuGK9pU0wDxVRVcQ>
    <xmx:gQ0dZejIXnVgr4WewtGrkh4CxTIMGecngLMiW-jNSH36HW-3huJDKg>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Oct 2023 03:00:16 -0400 (EDT)
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: openembedded-devel@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH 1/3] dummy-sdk-package.inc: Filter packages which are marked for installation
Date: Wed,  4 Oct 2023 08:57:26 +0200
Message-ID: <20231004065728.4283-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 15:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105332

From: Pavel Zhukov <pavel@zhukoff.net>

if packages is provided by dummysdk and in the same time marked for
installation with IMAGE_INSTALL it causes conflict in apt because virtual providers are
not taken into account if package is asked to be installed explicitly.
Filter such packages from provides/conflicts to workaround this problem.
This workaround brakes RPM usecase because of file conlicts with
DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
doesn't include file based conflicts).
While this is needed for the case of package_deb only adding it for all
package managers to not complicate the code.

Fixes: [Yocto #13338] [Yocto #14066]

Fixes:
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 target-sdk-provides-dummy : Conflicts: bash
E: Unable to correct problems, you have held broken packages.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index bd26e39ad3..6ccafbf8bc 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -19,13 +19,14 @@ PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
 DUMMYPROVIDES_PACKAGES ??= ""
-DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
+DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is not None and pkg not in d.getVar('IMAGE_INSTALL').split()])}"
+DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
 DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
 
 python populate_packages:prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
     d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
 }
 
-- 
2.41.0


