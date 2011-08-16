Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtJfJ-00028v-5E
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 15:26:45 +0200
Received: by fxg11 with SMTP id 11so4563533fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vFlceyOdCL3J9kzPD2Fh/jbyIJxZQF+Gywir00DEFpE=;
	b=mkcLGMQ3aVwdzr1LFjxYRkXRGGTVV5G+UXDg6jOrffJLcFVKtyxu/2gU/HwSQiNPJh
	9V6hGn+aJT6N3GR15+fEB40jRPG8vweLl9nx7ETlqRTZeBE7T78WVVHKoMLtCPHS3IPW
	Ia1iFLI0S92hBhmqkC4XJLGJG4FBj1+TBb1cU=
Received: by 10.223.156.65 with SMTP id v1mr7038837faw.39.1313500927850;
	Tue, 16 Aug 2011 06:22:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i16sm21828faa.21.2011.08.16.06.22.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 06:22:06 -0700 (PDT)
From: Martin JaMa Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Aug 2011 15:21:58 +0200
Message-Id: <1313500918-26444-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH] openssl-1.0.0d: use openssl.inc from meta-oe
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
X-List-Received-Date: Tue, 16 Aug 2011 13:26:45 -0000

* full path was using openssl.inc from oe-core which doesn't have BBCLASSEXTEND and INC_PR

Signed-off-by: Martin JaMa Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/openssl/openssl_1.0.0d.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
index cd5408d..73c8df5 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
@@ -1,4 +1,4 @@
-require recipes-connectivity/openssl/openssl.inc
+require openssl.inc
 
 # For target side versions of openssl enable support for OCF Linux driver
 # if they are available.
-- 
1.7.6



