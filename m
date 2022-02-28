Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41796C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 21:55:52 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.1014.1646085351224379722
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 13:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=b0EYv2jE;
 spf=pass (domain: cold-front.org, ip: 66.111.4.28,
 mailfrom: jsbronder@cold-front.org)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 940D55C0120;
	Mon, 28 Feb 2022 16:55:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 28 Feb 2022 16:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=ALaD2i2g2VPem53qs3vduFcOrJgYKee7hGW
	VwzEnGME=; b=b0EYv2jEJRTE2my6Msh+l2VXprdq2kKuaz7SAhd7mjOHAfOpXn/
	CraqbobXbl3kp7j0GU8b7gPMai8SJvmjaxKNeOKqVTbECWHyjq4yvyhqi6mlFff1
	NN/1S8ZrVvJLUBsZxZXQih7wCur8moa1lFJgfae+z7MfhUrrdGza82q0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=ALaD2i2g2VPem53qs3vduFcOrJgYK
	ee7hGWVwzEnGME=; b=TMC9B100AZNIA6GyczY+Kaj/rDOW4IdQv9GAczqJInKwv
	HcC94b06fUtDj86rr9YmruGwCmzzuYPH+DuzDc8Msu6Z9kZDNfD4J86OgjF4LiZN
	1WisrAYvne0E4WaRq7ZqTrszQQOB5irLGtLJgXE68guOLNoF/UKVl++DUU9UxS8Q
	ZeHQMRYAGJi+2x+T4MUH7mpxglE5eHwfQ69ArkIH9UM99Kw5/EZIvMvSkJLQS9Ev
	56F/pAeHOhWdswl0NmeEkJfZyKE9z1I8am/zs2QIb4I2ol0ouQjfJ3s7/JF7ZnfH
	nI3iDUMHLSScyijHPQRaeGhDoe5HJIc/hT+U5/Qtg==
X-ME-Sender: <xms:5kQdYhH6HLwW4X3zb0WUfqww20sgew8LQdT514rzVPmYcKiw4yaEWg>
    <xme:5kQdYmXbo67E5KPEQ_iJqsu6IPCJ1KUgsL_14s_qCVc_FQQFGkQj0Am6JR8-V6YQI
    t7Dc0Y5TI8kM-5Z0g>
X-ME-Received: 
 <xmr:5kQdYjKAXWEWm_jC0yuJZYsl6JGpxoCmeYKrhoTNaB0q48qeARTPagiir398hXA7KvJ0xim5nNsFKU4z-kT5D_4FZut9299RBlXZvv64eeG2>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepfefhgeeujeelud
    dtveejledtkedufeejueetgfdutddugeekgeevgeeitefgkeefnecuffhomhgrihhnpehp
    hihthhhonhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:5kQdYnHt90Ro9FJtEH0gy0XzqvB4w-RoqbtDfcZCD6oNIccWFSwb6Q>
    <xmx:5kQdYnVjUzu2LQ0hbiu_grjqTyYHSCY0ZIuEk0xEw4b7Ia4YWPK19A>
    <xmx:5kQdYiMTn9TN3IPRHnhstcgN7fT4cSv2K1p8P7W8fyxeV76o4luHDQ>
    <xmx:5kQdYoexM10-43ahL8SppD2sBKtdR-35c0eRes--Gato81QXTkAsTw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 16:55:50 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-termcolor: drop recipe
Date: Mon, 28 Feb 2022 16:55:47 -0500
Message-Id: <20220228215547.17414-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 21:55:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95597

No releases since 2011, no upstream repository and does not build with
bdist_wheel.  If you depend upon this recipe, please work with upstream
to update the package to PEP-517 packaging.

Note that there are alternatives on PyPI and numerous forks on github,
but none appear to have become canonical.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 -
 .../python/python3-termcolor_1.1.0.bb                | 12 ------------
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 9626231bba..dbfa991ebe 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -421,7 +421,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-sympy \
     python3-tabulate \
     python3-term \
-    python3-termcolor \
     python3-textparser \
     python3-texttable \
     python3-thrift \
diff --git a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
deleted file mode 100644
index 17df7f983d..0000000000
--- a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "ANSII Color formatting for output in terminal"
-HOMEPAGE = "https://pypi.python.org/pypi/termcolor"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=809e8749b63567978acfbd81d9f6a27d"
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "043e89644f8909d462fbbfa511c768df"
-SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
-
-BBCLASSEXTEND = "native"
-- 
2.35.1


