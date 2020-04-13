Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.14243.1586781851648706447
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 05:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=oNdBJl6G;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 2D98D6008F;
	Mon, 13 Apr 2020 14:44:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586781848;
	bh=jr7hFOPmoD+Pre33dIxboHgE4U6CDhz9gsPb8aIJwbY=;
	h=From:To:Cc:Subject:Date:From;
	b=oNdBJl6GueYmC9TpQAHCRiSAXUJXqvRzKnnOqi7h8koCskj6GZ5odm6TVNB3pFdy/
	 mwjt7Kxwq/4vdc0CjFFSHghwTncn1H4DwgBoFLD7jZmBlFOIlfHFx72aMwkW5UAo/E
	 EWgDhKk2u8LwnTKVTj2f0Ob+4kri6jn0JLvfALMX73FIJA86+gy/SJL2DjIpq3pAeZ
	 GqbszR+NMMCErsQF3bYmJC1WnKyfzFItqgevzR+FQcaStBt3xJ7VwhxGHW3rXZRioI
	 yJRy9VEJg2cuous8s3SqA2kC9FIfYgcWwhOylLTwbSZcHqVUZfg2YymNeomDZrYTRw
	 4mH3zyg3VC2WQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] nss: upgrade 3.51 -> 3.51.1
Date: Mon, 13 Apr 2020 14:44:02 +0200
Message-Id: <1586781842-11513-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full release notes:

 - https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.51.1_release_notes

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/nss/{nss_3.51.bb => nss_3.51.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.51.bb => nss_3.51.1.bb} (98%)

diff --git a/meta-oe/recipes-support/nss/nss_3.51.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
similarity index 98%
rename from meta-oe/recipes-support/nss/nss_3.51.bb
rename to meta-oe/recipes-support/nss/nss_3.51.1.bb
index 889967c..755eb76 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -34,8 +34,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
 
-SRC_URI[md5sum] = "e59dc16965ef7713669c628d2640ebd1"
-SRC_URI[sha256sum] = "75348b3b3229362486c57a880db917da1f96ef4eb639dc9cc2ff17d72268459c"
+SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
+SRC_URI[sha256sum] = "085c5eaceef040eddea639e2e068e70f0e368f840327a678ef74ae3d6c15ca78"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4

