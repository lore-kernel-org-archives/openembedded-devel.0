Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.1425.1591465957779516521
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 10:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=cIlcocKG;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 87DBE60103;
	Sat,  6 Jun 2020 19:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591465951;
	bh=gsBCYaB0bj6cDXf2Rd2hJmYWgbjawtcOJ1fKqzXHw2M=;
	h=From:To:Cc:Subject:Date:From;
	b=cIlcocKGc0uKnWHJMuoQ3UkwCjkLipnOchiJVGwW24U/jkltURaSoKKxn9sZ5omhz
	 pfW047Q+QKV7GX6MDp5tDECCkD+iOWzIOuSrCniv9BZ11HicBtVAcsyFkaVCR/O9mV
	 T+bjIDbGR+3KqMbV+P30r4yVNj7g0UaebhXRVz79ZaxF5GSyyVk7CcKmUACDbz7kdg
	 Gm1Ktup9FG4yJs/sF5N1cyfwz7UV69wS2GV64P6oVFa6I8NzM6gM7l5SC2RSAfmHaT
	 k24Gj5x+nNA7flQTvJSn0VgqsO4bzxAQKZYMAnz9km97qvkF38rL3tEltqHK6yGVQe
	 DMT9jW4y44DEQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] libzip: upgrade 1.6.1 -> 1.7.0
Date: Sat,  6 Jun 2020 19:52:28 +0200
Message-Id: <1591465948-9563-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/nih-at/libzip/releases/tag/rel-1-7-0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-extended/libzip/{libzip_1.6.1.bb => libzip_1.7.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.6.1.bb => libzip_1.7.0.bb} (77%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.6.1.bb b/meta-oe/recipes-extended/libzip/libzip_1.7.0.bb
similarity index 77%
rename from meta-oe/recipes-extended/libzip/libzip_1.6.1.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.7.0.bb
index 41ad552..e7cb6a0 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.6.1.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.7.0.bb
@@ -15,5 +15,4 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "f9a228619aab2446addc9c9e0e2de149"
-SRC_URI[sha256sum] = "705dac7a671b3f440181481e607b0908129a9cf1ddfcba75d66436c0e7d33641"
+SRC_URI[sha256sum] = "d26b2952426d2518f3db5cdeda4fe3cd668fc5bb38a598781e4d1d3f7f8ca7be"
-- 
2.7.4

