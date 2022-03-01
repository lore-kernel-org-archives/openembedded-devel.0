Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35F3C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 21:45:04 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web08.574.1646171103625438250
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 13:45:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=QER0GgQw;
 spf=pass (domain: cold-front.org, ip: 64.147.123.20,
 mailfrom: jsbronder@cold-front.org)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id DDA7E3201DDC
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 16:45:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 01 Mar 2022 16:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; bh=jI5IZ4CQE7j6ROVbc23CCeSWVQS9aKxH3ZnIMaMLp3Q=; b=QE
	R0GgQwLuXj4nRXrzkHVbK2VK2BAinGxvE7h5qnLFA+GNGl3MH8z3nvRcUIrsGamH
	IEp/Tq7IJRXm6opwA9wogxPEWsaYPqYeVaOdk1IFt+mW/9lY+B7dDheoWBh3goFi
	ltW/B7GaS+TIEibPb/bLc09n+B8gUQ7dIH4wrQqsI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=jI5IZ4CQE7j6ROVbc23CCeSWVQS9a
	KxH3ZnIMaMLp3Q=; b=YIWxZrsN1oNTh/Vm+8XczGTBxCQ6jcH3EM/Btp1XRa4ah
	miLJF7v0Yjz3FZEpN3VYmjNPGmhBy/zUk+IC052/35GpcbVtUELHQhYX5ioQ4J7t
	X90k3/FZsukwHtcicZ8Pi0lR1kbLOJ22GtEUm9fk+fNCF48aUxyV2R1qHvlhHsFL
	+bp3m+s8zhqID+Ekd6p+BmGh1vOMZsF3GvVb/SS7s0eu3bL740/zJODtDluDgKKI
	HCzCdbgeAJG/iKe+biV+1IVMRrbf6Tcbn5BtRw6sCvRBjbBXzhzVMxWpSVURhJ/n
	NWxwdFfimF31gBWy+n7yQw/eDdJhdlpzLjAI+WjmQ==
X-ME-Sender: <xms:3pMeYqYIx9w5Ym8XNpHYUIoKSWhCpLfL4z9zvJYGiQrIAjarCix_kg>
    <xme:3pMeYtbugQel2YhHLttweUR16x9il5xM_uoyt6PbXeOUDtFfZ2gq7v_Djzq56ITff
    VlF0NxKPNBkDWsLjA>
X-ME-Received: 
 <xmr:3pMeYk9Nj6fkMEE6kXWa0hJsryhgFmApYobjGrVaJF8SUK8rnRErsAPY35b3NFwDmTZde3hRLKQ-z4zfU9v7FsJ6Evk2PIUyRQvrC7IVLtXM>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnheptedtgefhhfdtie
    dvhfekieffkeelheettefgieeuhfeuffffheevveeuhfeigedtnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:3pMeYspQMCM-JlRTb6F5EBVcG2LpHJHxMvlBX8Xh7ouuZJdfDtar4Q>
    <xmx:3pMeYlqmo0acMRmmAsx88ccPlIzsn38OYOgC-vaQcjZzs_TmHJTWtA>
    <xmx:3pMeYqRMAQPrXO6Of3nN26OKjArOlQGfdAbEQw_fas_2ud7CQsFJCg>
    <xmx:3pMeYnHmyIlCEThw9DUhtH1sW8mxNZryUF2ITdOOQmeWVpXqeHiq5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Tue,
 1 Mar 2022 16:45:02 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-ntplib: pull from PyPI
Date: Tue,  1 Mar 2022 16:44:46 -0500
Message-Id: <20220301214446.26796-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 21:45:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95658

Switch back to pulling from PyPI which now does have appropriate release
tarballs.  This fixes building the wheel.

While touching the recipe, also add HOMEPAGE and point LIC_FILES_CHKSUM
at the LICENSE file that's now part of the release tarball.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../recipes-devtools/python/python3-ntplib_0.4.0.bb    | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
index e8620b14b5..d78bec046f 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
@@ -1,13 +1,11 @@
 DESCRIPTION = "This module offers a simple interface to query NTP servers from Python."
+HOMEPAGE = "https://github.com/cf-natali/ntplib"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://ntplib.py;beginline=1;endline=23;md5=afa07338a9595257e94c205c3e72224d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40707636fe237d725e2bd32cd949b7fe"
 
-SRC_URI = "git://github.com/cf-natali/ntplib.git;branch=master;protocol=https"
-SRCREV ?= "b9c11c5906bc802a20a2dab390e57c50be558808"
+SRC_URI[sha256sum] = "899d8fb5f8c2555213aea95efca02934c7343df6ace9d7628a5176b176906267"
 
-S = "${WORKDIR}/git"
-
-inherit setuptools3 python3native
+inherit pypi setuptools3
 
 RDEPENDS:${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-io"
-- 
2.35.1


