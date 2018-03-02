Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 1D83678989
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 21:46:27 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 0A853211D8;
	Fri,  2 Mar 2018 16:46:29 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Fri, 02 Mar 2018 16:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=tzDfBSAM3xt3hE4Ur7wWrhgPKirqkc88EgFvTV
	6o8W0=; b=UUrYDspUHUKl70mcyJhD1Q/tvWtI/usMl5RHn+tru/1qcg5FW2KFmV
	zUoG7XEtL3ank0QpB+8s2kUdvYrzfyBNaCMyY2qU2whKRA0ctkTZSj544vkQrmGt
	ZGra98MN44vxtHy5uLdOJZT7ntyfPOJ5z1x7GJiI8udIOv0LpByJ0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tzDfBSAM3xt3hE4Ur
	7wWrhgPKirqkc88EgFvTV6o8W0=; b=nYuHTFcx6GvCmLtpy8PJ8qo07Rp2eU8Fa
	s8yGS5e0baocecfvM6dMD5cw5haOeWPSDb3eKAJaeIEtMTHCLD2cEOmT3xwMpCdM
	BxO3HXMPl28MzV1+zieGPsGM+5djoulb0VRRwXK+g4YHT62vL0Coo1o1sx3vkNXS
	LsX9mIvFYtFHy6Ee9gMpcFK/s0/MC9NgDLrnGWSU931PBwf6RR2b8c4J/FTF87fp
	QUN14yPM3PDt4YYKzHIp/p3kxN20xH7b+LmefgxrP/wlM1tqSUyjesha5yWthof9
	7wFG+uSo2NeqfVzep8rCs1jr00bW4+wH1wFZFNT31uFQ/wUcCPfsg==
X-ME-Sender: <xms:NMaZWpQuYERah6_r7yxvJcaaRIRm5qZErqJu2wl4x6wRe7ti-jyEvQ>
Received: from localhost (unknown [96.237.180.55])
	by mail.messagingengine.com (Postfix) with ESMTPA id AE0927E5A8;
	Fri,  2 Mar 2018 16:46:28 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 16:46:23 -0500
Message-Id: <20180302214624.18596-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
Subject: [meta-oe][PATCH v3 1/2] cppzmq: 4.2.3 update
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
X-List-Received-Date: Fri, 02 Mar 2018 21:46:28 -0000

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index a64745c94..4920bce8c 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "68a7b09cfce01c4c279fba2cf91686fcfc566848"
-PV = "4.1.5+git${SRCPV}"
+SRCREV = "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
+PV = "4.2.3+git${SRCPV}"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
-- 
2.13.6


