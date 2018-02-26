Return-Path: <jsbronder@cold-front.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id DAFE8786F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:22:46 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id BB68120D7B;
	Mon, 26 Feb 2018 15:16:10 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Mon, 26 Feb 2018 15:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=RfZ7c+5QDRixEIdWUU2BtVwa0w4FMC2Idq1cvP
	N9CZw=; b=zbM53j9m58TtpNdQ3gmCTS0mU2ybRcZ2Mm3Uf+eJdGuwmA61mhjc84
	STkQKab2q7FcXyjVqvXIEHuZyZlhflhKgDQ4c6Af3OkO6jXQw2KPYGV5CL/yQ6Ct
	yA67nw6z12uBckE38D1PjhgtLYvA3Nbrx0KIGR/54+5Vf4Yz8IbCY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RfZ7c+5QDRixEIdWU
	U2BtVwa0w4FMC2Idq1cvPN9CZw=; b=S6N2tozYGJjCzxWJJRzlGIa9U7wly9hwR
	NnIMpCtNsIp2Kgui8uyqeVq21pyYayvSyfnCgxRKzN/r+yq51ok1cZFg027UUhT2
	PrQ+NMxzf/91WPcCIRwgoumzTeY7gUeIP38eAG2/LvdDqO+RQBCNd9CAWfQKS735
	caZrwTTGIim+8r9PrgqRrobgc29N44bMhwX60gG9enSe1HxjME7JtGWNYx7rsZqA
	u9LQIi0BuEpJL78Lula1anbmnmRWv/DShKSzFuwltTA/QGInM5ufJ/i34VnHeO0k
	EbSaTCY1engVqJgVkYaqRxxHRxAtGKxFso8LS0/Y6Y+SDL6i7xnmA==
X-ME-Sender: <xms:CmuUWsC5Bs8yePWFJd0SHQ8SFvkGO_YT61GR3cvqtcCC67TzhQUcGA>
Received: from localhost (c-24-60-203-86.hsd1.ma.comcast.net [24.60.203.86])
	by mail.messagingengine.com (Postfix) with ESMTPA id 777C57E188;
	Mon, 26 Feb 2018 15:16:10 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Feb 2018 15:16:04 -0500
Message-Id: <20180226201605.29261-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
Subject: [meta-oe][PATCH 1/2] cppzmq: 4.2.3 update
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
X-List-Received-Date: Mon, 26 Feb 2018 20:22:47 -0000

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index a64745c94..9e8ad5151 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "68a7b09cfce01c4c279fba2cf91686fcfc566848"
-PV = "4.1.5+git${SRCPV}"
+PV = "4.2.3"
+SRCREV = "v${PV}"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
-- 
2.13.6


