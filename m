Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 744EB7FC59
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 22:44:28 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1001-35.w90-120.abo.wanadoo.fr
	[90.120.192.35]) by koncepto.io (Postfix) with ESMTPSA id 28D4F6004D;
	Fri, 17 Jan 2020 23:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1579301068;
	bh=7TdyI++yV82AU5mXXuxLam/MKER2ucWxgOBRDfBrJeg=;
	h=From:To:Cc:Subject:Date:From;
	b=dUzZumJR9P4AvU548fUeW2+UM3i/yvJwq6uU2QMcj3hawsKMMoFTqzFhU3yJ+m3ai
	sfcExlTR27iWXMNrhQzKBewM078bgqMk77MdglHbgJ91uBxlevi7rcri/0nfWkZ/C8
	hNpUyaQ8bwTsSwKnjovMhSySzhZdFH+iELdTPa2pV9ngSY6WMfATQ/8cHFXfVND6eF
	4bc3lItbn2FdE3hgDFbvcWXomwwcS0JHDhYiijj8o2STZz08/s8VuJy4aB27i5OjK3
	/4JG1/wKSox+N/FgZ03hqErnsxNTsM7HmShT3Kk9MtVgd7e6a7qPfiK/QH4ivQepK7
	Bu1g2/HYriifw==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 23:43:45 +0100
Message-Id: <1579301025-29499-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] cppzmq: bump to version 4.6.0
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
X-List-Received-Date: Fri, 17 Jan 2020 22:44:28 -0000

This includes the following changes:

8d5c9a8 Merge pull request #374 from gummif/patch-2
ff994d9 Improved comment on workaround
615380b Problem: Invalid 32bit issues when using Conan
bd27f24 Merge pull request #373 from gummif/gfa/tostring
4f9c2ea Problem: message_t to string is hard
de07119 Merge pull request #370 from gummif/gfa/multipartn
30fdfe0 Simplify code by trusting the compiler
0f8601c Merge pull request #371 from gummif/gfa/move-ctors
d3abe06 Problem: Move assigned objects still alive
93e3090 Problem: Missing recv multipart to fixed buffers
5ee8261 Merge pull request #366 from gummif/gfa/detail-in-api
0ef29c1 Problem: Detail namespace used in API
28aecd9 Merge pull request #367 from gummif/gfa/no-tests
76e5fb0 Problem: No multipart tests are begin run
a34d2a3 Merge pull request #358 from gummif/gfa/send-recv-multipart
d4d3ce3 Suppport for raw arrays in send_multipart
5cc7793 Improve algorithms and documentation
829997d Update version number to 4.6.0 to prepare for next development iteration

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 3697129..0b66970 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "e67fa0e16d7964876228952f60693f5c03ea0cc1"
-PV = "4.5.0"
+SRCREV = "8d5c9a88988dcbebb72939ca0939d432230ffde1"
+PV = "4.6.0"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
-- 
2.7.4


