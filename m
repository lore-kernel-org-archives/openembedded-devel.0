Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF98AC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 18:20:27 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web11.1085.1646072426965409912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=eqVXsB+y;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26,
 mailfrom: jsbronder@cold-front.org)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3BF8C5C0174;
	Mon, 28 Feb 2022 13:20:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 28 Feb 2022 13:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=Y+FtEzn/1hrT1VOIqvwHLxo06qP9XtPwwHe
	dkOEXwjY=; b=eqVXsB+ypysgtpxAwm2Tn2tBS5seOi8I9CqPH9fVzq+OBaQqQ93
	6Hg37+dGTi5XNsFILicqlN6GNUAP1rYSjyhZ1yIp6kgRdGZxJ1VBIdRLHLeBI9pv
	bopmXtO3emxypRQaCRkhIVCBONLIOhUoQhzt+CCBCsgbJzfHDUaahKQU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=Y+FtEzn/1hrT1VOIqvwHLxo06qP9X
	tPwwHedkOEXwjY=; b=nO3c/Qy0EjUs3AFDnB8326CuVnKjX19F0eKFQhJLY62ab
	asuSbJkYjHGKxlq4QDVIDvMGpgcNakRoMYjgGVKRShyIOVm7uQMimUhi1SKLiWuN
	LI3xMOmuayU1ypDayhJuAcIWlTCZGsx7/mgoDDC1bB9XnD6/qJfXEKeegWcGhSRb
	1j2bLNlpdumWsCPamTxOi94GUn7NitwmhwXlBNSK+bTmzdmz5+6rLUA0iJv6KFC3
	b8Zcss6BM99LiLte1q57f8gngEta40EOa2kOKhyHHa4pYJivJrU/LDGKeKfQNOVU
	6GTtW45/kZMsLKw+hjBpi2D2MCF5btxR9WWEewLZw==
X-ME-Sender: <xms:aRIdYkhdOxJ3Ra2iVbcXdUrKGdf22lhTph_OBO_YntBeR02IhbyStg>
    <xme:aRIdYtCDa89P-7FsyarxudY7bzo0UQQIkpxUBDJzU1CHpAbvVx3uQ5pNnCavj7zEI
    tDzCJ2WYNVYV5Rzbg>
X-ME-Received: 
 <xmr:aRIdYsFXVMQ22qsiq1ma8CDqKfjE7vGVLRhdbJ1joZE8y-5TmQbUmh5Lpu1F8AkFq4O4mrw5mcPL9z77yTCHoMkoBYuFGKis7CYLFskk5QHy>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepfeelgfeifeegle
    dvieegveetieejhefhveefveeujefhfeefgeejfefgvdeufeetnecuffhomhgrihhnpehg
    ohhoghhlvgdrtghomhdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhho
    nhhtrdhorhhg
X-ME-Proxy: <xmx:aRIdYlQvkOcJm-UnCqDNcM_jsvOgsuxUpv8zGs-qowym5awHNn1jgQ>
    <xmx:aRIdYhxjndj37QET2JlfORJzsvzhR4cnxu48qlknbv27roxsDdoNHg>
    <xmx:aRIdYj73xMhDwps9i_k3Jv77O8m_frrBNT0jgDwdDk0jlFGGf5o6zw>
    <xmx:ahIdYvZLkmcXJE9F8wl1LqpUTOIrOB8Auy6DQPFwAlIzG3f5MTbi9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 13:20:25 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-feedformatter: drop recipe
Date: Mon, 28 Feb 2022 13:19:18 -0500
Message-Id: <20220228181918.26647-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 18:20:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95591

The current SRC_URI is pointing to a fork of an abandoned
code.google.com project, the latter being what is actually on pypi.
Aside from some activity in 2012 porting to python3, the fork hasn't
seen any real activity.

The package doesn't have wheel support and has no dependents in
meta-openembedded

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../packagegroups/packagegroup-meta-python.bb  |  1 -
 .../python/python3-feedformatter_0.4.bb        | 18 ------------------
 2 files changed, 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2b20937f78..9626231bba 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -124,7 +124,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-fasteners \
     python3-fastjsonschema \
     python3-fastnumbers \
-    python3-feedformatter \
     python3-fields \
     python3-flask \
     python3-flask-babel \
diff --git a/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb b/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
deleted file mode 100644
index 6932b3b549..0000000000
--- a/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "A Python library for generating news feeds in RSS and Atom formats"
-HOMEPAGE = "http://code.google.com/p/feedformatter/"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=258e3f39e2383fbd011035d04311008d"
-
-SRC_URI = "git://github.com/marianoguerra/feedformatter.git;branch=master;protocol=https"
-SRCREV = "7391193c83e10420b5a2d8ef846d23fc368c6d85"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-xml \
-    "
-- 
2.35.1


