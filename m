Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.4435.1590606855770513386
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 12:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=cTDjRj6K;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 9C1D160046;
	Wed, 27 May 2020 21:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1590606852;
	bh=jTeuAsqT2oT4Yei9y1YsLDF35t4oxty5YpdoEmwLjoQ=;
	h=From:To:Cc:Subject:Date:From;
	b=cTDjRj6Ke/AR29ZOc+q78011u6dziPya6NbNPACgCWo5z+KgTDaBSkCK7SOdXbZdr
	 rAWcOvSkHJjZ1Ros4z4NFM1shN5zLM94gJzvFXMsckf2zj15q+t4Z1YM0VKrGdfWMn
	 V3FUwRpBJR9kO4BS3HuUCX/ilyWH/HIQAZx45h+MehIz8Ztb4o7OmibXOJ5tEwCFbZ
	 1O/yiEZeaDGx9/PhrXFz8qWO3mDe9QO0AF+n8zJVTEsHYNz1Ujxd2PPQlzAuLG4SQC
	 uuzW/BurN+ENdF4oi+3rXlUgKSOy/jcOFnoqAyN0rUmnIe2toeGBZGAurhEtWDKw7H
	 AQPLDLFsZMtlA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] libuv: upgrade 1.36.0 -> 1.38.0
Date: Wed, 27 May 2020 21:14:09 +0200
Message-Id: <1590606849-9916-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/libuv/libuv/releases/tag/v1.38.0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-connectivity/libuv/{libuv_1.36.0.bb => libuv_1.38.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.36.0.bb => libuv_1.38.0.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.38.0.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.38.0.bb
index deeaa2b..afc9b2f 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.38.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "533b738838ad8407032e14b6772b29ef9af63cfa"
+SRCREV = "1ab9ea3790378f9f25c4e78e9e2b511c75f9c9ed"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.7.4

