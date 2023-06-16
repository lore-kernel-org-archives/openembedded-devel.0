Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA6AEB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 17:20:59 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.4544.1686936054044713023
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jun 2023 10:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@stwcx.xyz header.s=fm3 header.b=dD3UAdPK;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.21, mailfrom: patrick@stwcx.xyz)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 3209A32003CE;
	Fri, 16 Jun 2023 13:20:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 16 Jun 2023 13:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1686936052; x=1687022452; bh=vvH+TTxRF9
	y5eYRqbQJlxyW/iTS0TJayvFq0AlyYR+g=; b=dD3UAdPKwUcHgjgTj110DEMYkR
	zu3yN1lC7YslWAhtA4l+7QghgdyQEIVu3lLxCZ5f3NhZ7FgTqGI8PzT0+pIb+wSj
	qypn81fdH2LM6pbHD+KgmSuKf39w+mGrE6PGvve/Ybp97IZ2lcmGltwyPr+G8YgT
	gLdzOX7ZfC5CRU+rATg7I2XECuJX5JtW2hHG5RRdyEE9/SFB2s9NpwUOS2phFMkQ
	ovTXhyXVDNYxhq7PB1blaeMccrUZI/bhE1JevffDOr1ROK7MgFlYYuVRHye3Dgca
	DAm7d3YzVGpWNdSLQ9g5WXwvdPI/A0Dc2AA81lwc4FDBBhd+BB/wZHCba5MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1686936052; x=1687022452; bh=vvH+TTxRF9y5e
	YRqbQJlxyW/iTS0TJayvFq0AlyYR+g=; b=QXs7hychYvUUw70rYGdVb9nssxYHf
	A7pKN8NLkAPjXulhSF07FOhhcNkjWwW5qfS5Zxpaxo3i6IYnUPQuSaEFHd3GpmPU
	zUjXUy0pJD67XkV4dnnBKpw7aEZUFXgzKQED/ogyhsEnSGeSyQJ/tK+gCX4ZQH1Y
	mCfj1lvo77GAVOExYZWINupwfyxp+zC/xeis4kEqNYZwcT+LqtejJ4KG7PqMl+m8
	6HQHY64cgvPnoKbpBzfvAEphVOIsqTucmU+jYziD+nUu0f5IqFs/EC7LdI8lfKcz
	C6gEg5LRq3tUxnRskjlkksGfwOmZsoUOQdchO/qh+/u/dFrsa9b/gLm9Q==
X-ME-Sender: <xms:9JmMZAeXe8xybHKUezHHCsCjj_X5YdpHAYCnCzMVeyeqSXAGtmwUNw>
    <xme:9JmMZCO0ua5x-coRqP9h1lf5F4bF4y28APLkk-Jd_tJOB_QmwkT5V3blvi5VGCrag
    me9yAXEsA-e3peDsLU>
X-ME-Received: <xmr:9JmMZBh9jZ4dBmZB0oeZMcqKk8yPEldiexIjL1il_-e-IfUHc8dZw70v8WtBW8byJVFpJ4tnfi-9jYFamPIo3pYp79pnKtjrHRc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvgedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhephf
    fvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    eptddtvedtgeefgfegueehkefgveekgfetheehvddtkeekfeeiuddthfdtfffghffhnecu
    ffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:9JmMZF8_pQeZYsG8HKzBCWMk9aqOT6iX9RdddvgSdVl2koE8fBm6WA>
    <xmx:9JmMZMsZI8LWE_vB67alM7zH027gFuADpz1Xkmd6G9s76fOL8MvUPA>
    <xmx:9JmMZMH5KITzXmC93w_PFQhT6jYyAc7FSzPJVQYKG_oT9GgaTGf-Hg>
    <xmx:9JmMZC0ltHXDI29zl66YhBawJY4TuanJMtoREOuDWKeRogQrE1nJNA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jun 2023 13:20:51 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-oe][PATCH] libplist_2.3.0: compile fix for version
Date: Fri, 16 Jun 2023 12:20:40 -0500
Message-Id: <20230616172040.3156102-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 17:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103344

On CentOS9 it can be observed that that PACKAGE_VERSION variable in
the configure script ends up having multiple lines, which causes the
rest of the package to fail to compile.  This has already been fixed
upstream and is the commit immediately after the 2.3.0 tag.  Rather
that backport the patch simply increment the SRCREV to incorporate
the fix.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb | 3 ++-
 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
index 0ca21314a..1a74dc88f 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
@@ -8,10 +8,11 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native python3targetconfig
 
-SRCREV = "72480212cd8ec0ab8d0b5064df52c146cac603b4"
+SRCREV = "b8fcc89b74c9128a13b07cc15a0ce25dca0cd97e"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
+PR = "r1"
 
 CVE_CHECK_IGNORE += "\
     CVE-2017-5834 \
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index 8f5a7f166..db092600b 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -10,7 +10,7 @@ inherit autotools pkgconfig python3native python3targetconfig
 
 PV = "2.3.0"
 
-SRCREV = "72480212cd8ec0ab8d0b5064df52c146cac603b4"
+SRCREV = "b8fcc89b74c9128a13b07cc15a0ce25dca0cd97e"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.39.3


