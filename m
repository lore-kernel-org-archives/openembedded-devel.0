Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2271CEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 17:12:11 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web11.520.1689613923245111643
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 10:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cold-front.org header.s=mesmtp header.b=SCDqppXg;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26, mailfrom: jsbronder@cold-front.org)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 69E6B5C017E;
	Mon, 17 Jul 2023 13:12:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 17 Jul 2023 13:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=mesmtp; t=1689613922; x=1689700322;
	 bh=urySfOrfAwxAt1XVqBjfaERsw/EIT3X3lSNc+h9wwCc=; b=SCDqppXgwLua
	V8FXGsyZJtPhPRjy/v5BLO6oRnXEygUZsmZ6tMpcBZWQLE/9VCfp+G4QRZAEwUNt
	JJM2OSJu/0RRbEuRldgfpzH3jeCvFe7unpIpau/iBWB2dtwhisG9phV22eVwTWGa
	PJItAEwR+LkR70Ct4SEbgAApH1KxlXI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689613922; x=1689700322; bh=urySfOrfAwxAt
	1XVqBjfaERsw/EIT3X3lSNc+h9wwCc=; b=Tj5inzwkoBWrnuah8tJruWQIGD16a
	oxluSfRPmeFpYHaFd8WnI/7mgmMCs7jUYf/lSiXPqD1aAqKmDsj3d4B+gM3+tYk2
	aKcK8XDUk1JBgVF+BFtaRbiKVJOdejZheE1omq+96LxXnFqfMA+aToAUvErMIm3O
	5gHrYVeLfODaGs2S7Bx753u3FiDXLp++RP4ppBxQ/TB2Er89xlrouPITQFINlmuv
	vkbwTG3rba+1aqFFS4BNXQfX0w0Hsg6Me9gkH8dPXvduuv6LRpNtV9bQvMCVCxK/
	+imw5H0BbO05WoGVoEbx3w70idFIvwt86jYNczI4ew0BmeCcezLdznkJw==
X-ME-Sender: <xms:YXa1ZPXW3rrx8eWVo9iaMPWjBf6nMGiZRrUXkYl44Xe3-MJoe-ZJNw>
    <xme:YXa1ZHnA062w5RraENevsiGuRK5sAmFIhae-2Ce4YcffAifM4pXD0N20Dv6EVCmIA
    ctM_2dSpYBUUJeRQg>
X-ME-Received: <xmr:YXa1ZLYBApd7gta2fX7hDRhLbFg41CtLBJnkwVvXzleyfC1im1nrKZXEwI8aDAq_-aFEaqLIFSdfso9IifQ8WUjIZRUHnLAsbRviKVL-qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedvgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepjeeghfeuteehje
    eukeevuedugffgfeeiudehieeuvedtudduvdfhgeektdehkeffnecuffhomhgrihhnpehg
    ihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:YXa1ZKWqD8bqWIttPz4HXITvBWljnT8GLfV-onRFPpc6AeRsHIE6YQ>
    <xmx:YXa1ZJmqWwoN4viqOcVzNu9MNvP_lZ-NSIZeD07zRsBjPGn2Xx5Deg>
    <xmx:YXa1ZHe1PzgUnPENGt5klcoG7m9agmGYH0gopCheq-_BGAIjmNPEUA>
    <xmx:Yna1ZItf7ScxkVxD-PusB6tQqr8X1mzv3mcF-29bkYZuOEunLJvpXQ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jul 2023 13:12:01 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH 1/2] python3-asyncinotify: upgrade 3.0.1 -> 4.0.2
Date: Mon, 17 Jul 2023 13:11:34 -0400
Message-ID: <20230717171134.17840-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 17:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103887

c5590c5 Switch from GitHub to gitlab
22b0ed7 make pass all mypy type checks
abd15f8 add __weakref__ to inotify and watch
5e57e0b add slots to all classes
f907237 restore support to 3.6
5269b9d improve documentation
2512aa3 Merge branch '16-add-timeout-for-the-sync-version-of-get-sync_get' into 'master'
5beff57 add sync_timeout
c8f8653 fix readthedocs
97056b9 remove package rule
faebfa9 move test after package
a75f116 version bump
6b4921f rework docs
35716a4 rework docs
c51d603 fix test for deprecations
ddd987c switch to pyproject.toml, test against all supported python versions

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 ...n3-asyncinotify_3.0.1.bb => python3-asyncinotify_4.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_3.0.1.bb => python3-asyncinotify_4.0.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
index 2f4adcea7a..08dc77bd17 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
 
-SRC_URI[sha256sum] = "da812bf2be6a76aac6670b766eec4564d9484da6595d3ce1f9bba8ba78c30445"
+SRC_URI[sha256sum] = "bcac19425b1b418bbbc4d31193ea3c39e24343cd7ddff2074ae7b599f1a04829"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.41.0


