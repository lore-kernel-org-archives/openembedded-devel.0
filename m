Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Ojmpe-0006Ij-9g
	for Openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 07:29:32 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 86F5FAD3;
	Fri, 13 Aug 2010 01:29:14 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 13 Aug 2010 01:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=2/pgBR4l/5nTisTxGufB1x17UlQ=;
	b=QkrGwXO6asCjT6Q6Oo86fRm9+9sGDTjmSFF/e+ndMcWfV2OJij8fFxzfbECjUXobGbqlEif13U0C26lIeW03G4PeUsVPTX9OYYPMGhbLuzGsOWu/jAA1gBalDvCAS7W7T3y+Ob+cdlNW+VXDMvrtFaVW38zo5WbxEsmJq0LWn8k=
X-Sasl-enc: RSDkLnp0Pguhx7SwmkiFH+5IimKZhqUYLeR6uLFp+13B 1281677354
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07a29e.pool.mediaWays.net [77.7.162.158])
	by mail.messagingengine.com (Postfix) with ESMTPA id E2D474032DC;
	Fri, 13 Aug 2010 01:29:13 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Fri, 13 Aug 2010 07:30:16 +0200
Message-Id: <1281677417-15063-3-git-send-email-vjensen@gmx.de>
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
Subject: [PATCH 2/3] libsocketcan: remove old version 0.0.7
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
 recipes/socketcan/libsocketcan_0.0.7.bb |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)
 delete mode 100644 recipes/socketcan/libsocketcan_0.0.7.bb

diff --git a/recipes/socketcan/libsocketcan_0.0.7.bb b/recipes/socketcan/libsocketcan_0.0.7.bb
deleted file mode 100644
index 18f607e..0000000
--- a/recipes/socketcan/libsocketcan_0.0.7.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-TAG = "v${PV}"
-require libsocketcan.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://install-can_netlink.h.patch;apply=yes \
-	"
-- 
1.7.1



