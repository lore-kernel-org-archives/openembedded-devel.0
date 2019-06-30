Return-Path: <pjtexier@koncepto.io>
X-Greylist: delayed 508 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 30 Jun 2019 20:43:05 UTC
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id A51D56BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jun 2019 20:43:05 +0000 (UTC)
Received: from localhost.localdomain (lfbn-1-8923-205.w193-250.abo.wanadoo.fr
	[193.250.65.205])
	by koncepto.io (Postfix) with ESMTPSA id 75AF6600D3;
	Sun, 30 Jun 2019 22:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1561926875;
	bh=uxrNEcbZE9p2MrAqnAM+Q1JRastnlmp1enLKM/52hOo=;
	h=From:To:Cc:Subject:Date:From;
	b=BjGMbQKcuT1fQXTWy3kRXA1s7fNhYfiWi4ZA//bKTkYk7bLPLLF6tHAaMM++1Pk+z
	m67K8ouSmsTYtgXzLqexoJrGm7+od52A6IbkGynEyXAggyXJKh9IF8oKuo9owbvSBH
	b6568zSDvPMSAQnkKfbvSRZ2aS0a8GmkD0OsQ/K8MeTSfySp+WZxBFH2K0BMRsvp/K
	NG376yCJ7l9okFgcbY6yfrEJc825sqiG2GZH3QcNhx14G3Ubme2f3hyMuDm3WScpqq
	Vq0PzvwKEK2u30Ft3UivMN7hOKEaPAj/Nl/b02SIbiP16WyTv2mLh+CcMmspWFLp88
	HAsrRdFOn7J7A==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Jun 2019 22:30:33 +0200
Message-Id: <1561926633-9008-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] stunnel: bump to version 5.55
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
X-List-Received-Date: Sun, 30 Jun 2019 20:43:05 -0000

See full changelog https://www.stunnel.org/ChangeLog.md.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/stunnel/{stunnel_5.51.bb => stunnel_5.55.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.51.bb => stunnel_5.55.bb} (90%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.51.bb b/meta-networking/recipes-support/stunnel/stunnel_5.55.bb
similarity index 90%
rename from meta-networking/recipes-support/stunnel/stunnel_5.51.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.55.bb
index 61be9be..df455db 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.51.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.55.bb
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[md5sum] = "57040c64f4b95e35a756e53e1c496728"
-SRC_URI[sha256sum] = "77437cdd1aef1a621824bb3607e966534642fe90c69f4d2279a9da9fa36c3253"
+SRC_URI[md5sum] = "7b41592034ede114e8c4e058fc8c238b"
+SRC_URI[sha256sum] = "90de69f41c58342549e74c82503555a6426961b29af3ed92f878192727074c62"
 
 inherit autotools
 
-- 
2.7.4


