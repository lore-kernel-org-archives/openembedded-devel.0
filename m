Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 958 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Apr 2018 13:15:27 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE277540A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From;
	bh=jTRPe5UmFjUUmixc/tO5/fdSJ7rwTTkdvpxnRUd/Vjw=; 
	b=tEbsCK9jLXIofIPgztRwGnlHuBUlMd1oEtrxgvgjgFeToP1ujlgX6OnAfe/5kBeXJMjYjrSxjCv4bLOT01OgdOdVjvHk/t9AJ2VqDrad7mt11zu3XNX3gCepxgrx1+Pbgy9OSgWXNM3+g5GUEX0tGEaZfwai11BCfu5UY5ROQ0i/Upd4Kz++crFI1sKCy9qdowdj9zNOrOrQlkBgnWXPH+ZY0pqFy66xc+m9Ig6/whDJ4WSDPSmu8X/UlZe+PwIwV5EZ+dJw4CODNPop0u5MpCgoiHqgWn1VejaRZFBtf7RNS97VAVj177VUD0nnREmg6lqJFnHJ47RxRHyOGPaehg==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1f4Qxk-0007Op-1Y; Fri, 06 Apr 2018 15:59:28 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1f4QxZ-0005Gm-4n; Fri, 06 Apr 2018 15:59:17 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Apr 2018 15:59:02 +0300
Message-Id: <1523019543-18710-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mail
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.0
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH 1/2] crda: fix typo in patch metadata
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
X-List-Received-Date: Fri, 06 Apr 2018 13:15:27 -0000

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 .../recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
index 93c836c..1bb5c63 100644
--- a/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
+++ b/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
@@ -17,7 +17,7 @@ c. keys-ssl.c: error: 'keys' defined but not used [-Werror=unused-variable]
    static struct pubkey keys[] = {
 
 Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-Upsteam-Status: Pending
+Upstream-Status: Pending
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
 ---
  utils/key2pub.py | 5 +++--
-- 
1.9.1


