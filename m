Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OFTQS-0006CH-G0
	for Openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 16:42:13 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 17CA0F6155;
	Fri, 21 May 2010 10:37:29 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Fri, 21 May 2010 10:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=wTwldJF3S+y6d9oG17NJgA8iRQg=;
	b=ERttdevfEQlVZd27MHxdHT1l/1TGZmeWqr/lGLJmQBH/HMHGaUcX8VISdfVej+szb6qn2a1aa3GKOQuCRb02K6t3dJU1dxg3kdqWoTnJEXRb98Z1477wyu7ShKp9XRVrc6JYR45EtI6MTVrSHPYchbb1kwgh67Qaf1uaHOP/UtE=
X-Sasl-enc: M7D8d2ULd0vACZDjP1AFM52lcepeUTi4L/r1Au/dKnb+ 1274452646
Received: from localhost.localdomain (hnvr-4d078ae5.pool.mediaWays.net
	[77.7.138.229])
	by mail.messagingengine.com (Postfix) with ESMTPA id 499105800A;
	Fri, 21 May 2010 10:37:26 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Fri, 21 May 2010 16:38:06 +0200
Message-Id: <1274452686-17891-3-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <1274452686-17891-2-git-send-email-vjensen@gmx.de>
References: <alpine.LNX.2.00.1005162211110.21508@asterix.crazy-teaparty.dyndns.org>
	<1274452686-17891-1-git-send-email-vjensen@gmx.de>
	<1274452686-17891-2-git-send-email-vjensen@gmx.de>
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH v3 3/3] socketcan-utils-test: rconflicts with canutils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 May 2010 14:42:13 -0000

Rconflicts because of identical program names.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/socketcan/socketcan-utils-test_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/socketcan/socketcan-utils-test_svn.bb b/recipes/socketcan/socketcan-utils-test_svn.bb
index ca4c23a..20bd5ac 100644
--- a/recipes/socketcan/socketcan-utils-test_svn.bb
+++ b/recipes/socketcan/socketcan-utils-test_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Socketcan user space utilities and test apps"
 HOMEPAGE = "http://developer.berlios.de/projects/socketcan/"
 SECTION = "console/utils"
 LICENSE = "GPL"
+RCONFLICTS = "canutils"
 
 SRCREV = "917"
 PV = "0.0+svnr${SRCPV}"
-- 
1.6.4.4



