Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BE8C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 18:48:47 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.1493.1646074125259912763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=nofJ2ums;
 spf=pass (domain: cold-front.org, ip: 66.111.4.29,
 mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 58D625C0166;
	Mon, 28 Feb 2022 13:48:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 28 Feb 2022 13:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=U+DO514Q7Bpr1NY/q/uTlMN88Ffxkjs1kuS
	MFD2M86Q=; b=nofJ2ums8EPMRgBatNjrugqOf4rbsLaJqCLhbgNqK+RiMhhosvt
	l6HyahwfHCZBz7y4scBHK2soPi5DxaYu78pZUr73XN3UPirpOSjsWVcrAN8J8uiq
	NAm/i7sD2n+ETg3izkCAQR3NvSAjqCvFDKD+DUTKw/Uak6EgtNIXmvw0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=U+DO514Q7Bpr1NY/q/uTlMN88Ffxk
	js1kuSMFD2M86Q=; b=Zy398KK6OCWsUBl+QYKTz4EYWlbFIlIXAjFqcFh2jyb4Z
	6FEJDYqIWtEfhgYqOTCH6ctYzSiLxfE40WCtLWbRupEgZ1ZQb66ym0sxsI3jbpQh
	/hCCMbA/Fy6oiLGOaEYc0LnNVJKswHPdOGqiNH2TglDRoy/7yT0kc9hULU2pxvTO
	WsZLbsFI8x2nAUk5Uo+UYqRlySZCvLiUIbnmYDJfmGkCOUFlbH2rv5S2b/oSiMe3
	cLrGUM1IfXY9VyuiBK7oeYiBAedP9kPgFuPe/dRe2E8bEjSjnirbaF3o/kv1Sku4
	i0pH5JNQSfI1gNUDOLr6Or496qAMc/3Fv6jpwE21Q==
X-ME-Sender: <xms:DBkdYg0NvLgF414WegAR7VrzzGm9x0Ltn6QJVyZO2N05i5Be0hfAfQ>
    <xme:DBkdYrFYvTG8QK3rNnr0Rm035HsvyCAdQ3LOAJH_fp7AaidYijJszDgokzZIaQUFn
    -xqpmOiHtKFwXFE_w>
X-ME-Received: 
 <xmr:DBkdYo4h2oN-mN1ahVWAz4qhzS8yHEVvEAZ2-aePsLCf5ChW7sMSkkewei4TzY60xaRNznlPUf3dxCsXWctF9bu26oPbDKdreVpKKKtw7smU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepvdfhtdfhffeiff
    evteevieefuedvtdfhleduieetudekgefgveffgffffffffffhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholh
    guqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:DBkdYp1J0XX1ETDSqfNZruMVCznmpL3_Omt3PoIl_5yd0RL8n9jZig>
    <xmx:DBkdYjEqP3F-FjTe_-YKV3Tjn8eGkEFgQF2ANnxHEA_U1WOORZb16w>
    <xmx:DBkdYi-Z39s-SvR9kmE9vE2NUnVfm_5W4tEVSxiXt345yFx10pfAdA>
    <xmx:DBkdYmOiyK2u_F96Sof2Nv4kbTkUSFMPT8o4i_siVgA6jW4Bsk9x6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 13:48:44 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-coloredlogs: fix location of
 coloredlogs.pth
Date: Mon, 28 Feb 2022 13:48:39 -0500
Message-Id: <20220228184839.31132-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 18:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95593

When calling setup.py with bdist_wheel, the find_pth_directory() in
setup.py correctly install the pth file to
${D}${PYTHON_SITEPACKAGES_DIR}.  It's not clear why setup.py was being
patched original when the recipe was added in 2019, but it doesn't
appear to be necessary now.

This fixes the recipe to build with the recent PEP-517 changes.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../recipes-devtools/python/python3-coloredlogs_15.0.1.bb     | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb
index 9eafbaa3c6..d17ab87525 100644
--- a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb
@@ -8,10 +8,6 @@ SRC_URI[sha256sum] = "7c991aa71a4577af2f82600d8f8f3a89f936baeaf9b50a9c197da014e5
 
 inherit pypi setuptools3
 
-do_compile:prepend() {
-    sed -ie "s/find_pth_directory(),/'',/g" ${S}/setup.py
-}
-
 do_install:append() {
     rm -rf ${D}${datadir}
 }
-- 
2.35.1


