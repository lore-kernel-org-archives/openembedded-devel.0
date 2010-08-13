Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Ojmpf-0006Im-6a
	for Openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 07:29:32 +0200
Received: from compute3.internal (compute3.internal [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 48766AE1;
	Fri, 13 Aug 2010 01:29:15 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute3.internal (MEProxy); Fri, 13 Aug 2010 01:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=SaP2xedFuLyYpMh2BaVltxcDmiU=;
	b=nQL/BB8kKp1SOeKozxmxQ98oB6jp7lr5b9X4sU+BXP2nMj0ZHOo7w83/3kPNmmioXLOT8Vwcgpjt95FLot87Zx3MAoalFLWFBVhoriazk/KfjRU0wMgAnVgQPrJVvSXQmliwfE3Q1NHzk3K2wotYkGZryEid1NkUQBa5+E651Ik=
X-Sasl-enc: RSDmK350LAi7x7yjg1iNH+5IimKZhqUYLeR6uLFp+13B 1281677354
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07a29e.pool.mediaWays.net [77.7.162.158])
	by mail.messagingengine.com (Postfix) with ESMTPA id A18874032DC;
	Fri, 13 Aug 2010 01:29:14 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Fri, 13 Aug 2010 07:30:17 +0200
Message-Id: <1281677417-15063-4-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH 3/3] canutils: update to version 4.0.6
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
X-List-Received-Date: Fri, 13 Aug 2010 05:29:32 -0000


Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/socketcan/canutils_4.0.5.bb |    4 ----
 recipes/socketcan/canutils_4.0.6.bb |    4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 recipes/socketcan/canutils_4.0.5.bb
 create mode 100644 recipes/socketcan/canutils_4.0.6.bb

diff --git a/recipes/socketcan/canutils_4.0.5.bb b/recipes/socketcan/canutils_4.0.5.bb
deleted file mode 100644
index c084bcd..0000000
--- a/recipes/socketcan/canutils_4.0.5.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-TAG = "v${PV}"
-require canutils.inc
-
-PR = "${INC_PR}.0"
diff --git a/recipes/socketcan/canutils_4.0.6.bb b/recipes/socketcan/canutils_4.0.6.bb
new file mode 100644
index 0000000..9ddb697
--- /dev/null
+++ b/recipes/socketcan/canutils_4.0.6.bb
@@ -0,0 +1,4 @@
+TAG = "canutils-${PV}"
+require canutils.inc
+
+PR = "${INC_PR}.0"
-- 
1.7.1



