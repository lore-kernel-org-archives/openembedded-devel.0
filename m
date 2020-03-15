Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEBF61B72
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 13:11:29 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id BA6CD6004D;
	Sun, 15 Mar 2020 14:11:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584277889;
	bh=QWxJ1n6dCtMmFjvpTOqWWtBoNtg/SCPhkPavS0zfQkE=;
	h=From:To:Cc:Subject:Date:From;
	b=EqpzQpAAz5IJB0z13IwR4HywWCG4GE5lvQZUnMNuo9w+qNFO0apihGSaneSM5ZOlp
	eoqEBPt8WxQdHnzSib9MDKSy331/bqDLpf4/38eqRdC2Wu5Bruh1YsOZyT+qb9HsJ4
	C+G9s6iKSNSL5nlSI7GN7wBn5EqyC4Xm9gAl5qjzMIRBuu56B125vUzNAwsZbVPOjU
	QhiwlapA0hKB0FTbQQQQ9qI+yjR+mPgDrFf2pSnKavA8bmv4X1YgsKrNrj7vFgX/Ld
	0toP8trRMo4XaoYeibn72VyEb8SUycB0oXJEmzMgBBbelSte3/j4kj81kCj9GX+Sz/
	LsB9sbi9GNeTA==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Mar 2020 14:11:24 +0100
Message-Id: <1584277886-652-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] xxhash: upgrade 0.7.2 -> 0.7.3
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
X-List-Received-Date: Sun, 15 Mar 2020 13:11:29 -0000

License-Update: change link to https

-BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)

See full changelog https://github.com/Cyan4973/xxHash/releases/tag/v0.7.3

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/xxhash/{xxhash_0.7.2.bb => xxhash_0.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xxhash/{xxhash_0.7.2.bb => xxhash_0.7.3.bb} (78%)

diff --git a/meta-oe/recipes-support/xxhash/xxhash_0.7.2.bb b/meta-oe/recipes-support/xxhash/xxhash_0.7.3.bb
similarity index 78%
rename from meta-oe/recipes-support/xxhash/xxhash_0.7.2.bb
rename to meta-oe/recipes-support/xxhash/xxhash_0.7.3.bb
index df106e4..865adc5 100644
--- a/meta-oe/recipes-support/xxhash/xxhash_0.7.2.bb
+++ b/meta-oe/recipes-support/xxhash/xxhash_0.7.3.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
 working at speeds close to RAM limits."
 HOMEPAGE = "http://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ed3511a67991a5923907dff2ed268026"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01a7eba4212ef1e882777a38585e7a9b"
 
 SRC_URI = "git://github.com/Cyan4973/xxHash.git"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-SRCREV = "e2f4695899e831171ecd2e780078474712ea61d3"
+SRCREV = "d408e9b0606d07b1ddc5452ffc0ec8512211b174"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


