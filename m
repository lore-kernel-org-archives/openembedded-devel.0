Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OjmpT-0006IK-VZ
	for Openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 07:29:21 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id A0DF7AC3;
	Fri, 13 Aug 2010 01:29:07 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 13 Aug 2010 01:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=1bfMiaB+3egqyTCvbXsjEwsjNIM=;
	b=Km9lB7EjE8TxsI9Ps/3odG3XG1Uy8PIrdH29++s41FnK+cG5XLgF3LEZ9K6sCFqKVZD+QT9WvbEwqR0ZMIdMpwqlNRM14GXHXuPbe6/8a07EWjRQ04PU8pK3N5y63fHyPijuidJ6TJKwSu7wOyVbT4AMZbcK1ajUEJ6moI7D9b0=
X-Sasl-enc: rUZ20iIFdUDCSHVJ3YDdhiM/3uLZWA9XkI6ntBYZvQgL 1281677347
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07a29e.pool.mediaWays.net [77.7.162.158])
	by mail.messagingengine.com (Postfix) with ESMTPA id 03C1E4032A9;
	Fri, 13 Aug 2010 01:29:06 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Fri, 13 Aug 2010 07:30:15 +0200
Message-Id: <1281677417-15063-2-git-send-email-vjensen@gmx.de>
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
Subject: [PATCH 1/3] canutils: remove old version 4.0.4
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
X-List-Received-Date: Fri, 13 Aug 2010 05:29:21 -0000


Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/socketcan/canutils_4.0.4.bb |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)
 delete mode 100644 recipes/socketcan/canutils_4.0.4.bb

diff --git a/recipes/socketcan/canutils_4.0.4.bb b/recipes/socketcan/canutils_4.0.4.bb
deleted file mode 100644
index 9ddb697..0000000
--- a/recipes/socketcan/canutils_4.0.4.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-TAG = "canutils-${PV}"
-require canutils.inc
-
-PR = "${INC_PR}.0"
-- 
1.7.1



