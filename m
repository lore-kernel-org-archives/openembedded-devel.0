Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A54097E265
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 20:24:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46BT6t4RLmz3y
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566159862;
	bh=iIkrUdbb6zYMTlPMkUX06tT8oNfc3UWZJFxfDHfBwY8=;
	h=From:To:Subject:Date:From;
	b=NlWSdQhxwSvUl9Sh5UllX5zixwTP0ocgfmSaisHMCIN10pd61SWDSLAem1Aueac1O
	7BI9zzgBSumYAoIU1h/p+LjbP9oUWEt7ll2dHlmU0jqoEwJmQMnAJ4OlfN3PD1IN+p
	fgCiMBHzFMcxl/bqijQCfRn4fLPLqHvQamxhL1wdPxtaN6brLvF95iOJXdMbCZKcks
	oR3YAmpbxpComQwLSlrHOKO/D42aQ6JmEP0CXBR2WFpPyyn62+2SDppe4HnnilJd+j
	MG+J7kuiHZ30vOVKtCwMA9Xkt3cBiks3ZjE6+7sCGp+PuAbcvAoDZgGumy55t1xlpm
	j1hJXHUyOjx8YgyrcejEM/yvVi+FI4juVlycV27g2GBt58+BEqQpAJSIxR+JtonaJy
	MBPrUpVvIgL0ktSrf7aob9MoLPv3nHycWBYxhUREINoqvW7Lh6rJdsnH6dG2e/Wf8z
	4MFUeRAYbHyHFfwO/EXPbX4Rjme1ocCajfAQn2BS+Df5nLdOmnl6B3DJ46VFYcMWet
	6YSnQoLqUugm9mq3d9mPD0WYixa8UpkUxnlv0PK0zRjDASi1DuAN3ZaBaB21nFVxon
	Z3vVQ1B5Hg7+6MrB5ALm9rAWB1l81ALGSVtLxN6evSx5QiJ0JSpH4tBD+RkNKMmmGK
	LESLYQcUE0HMy3dEj2CZexj4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Aug 2019 23:24:21 +0300
Message-Id: <20190818202421.13622-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libgit2: Upgrade 0.27.8 -> 0.27.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Aug 2019 20:24:22 -0000

This is a security release on the 0.27 branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libgit2/{libgit2_0.27.8.bb => libgit2_0.27.9.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.27.8.bb => libgit2_0.27.9.bb} (90%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb b/meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
similarity index 90%
rename from meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb
rename to meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
index a43408908..3ef7bee43 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.27"
-#v0.27.8
-SRCREV = "2882803ca2b2cdedd069746422155a23fdd002b2"
+SRCREV = "3828d7afdd08b595584048e8e4dab6ddd4506ed1"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


