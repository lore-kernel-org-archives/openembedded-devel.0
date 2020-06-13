Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.14971.1592075046854272244
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 12:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=tWGxD3NR;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 3CF4560250;
	Sat, 13 Jun 2020 21:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1592075045;
	bh=K16LkoJRBetseZaUGDrwBJ4mKhgB28fDBN8E7Ak8vLU=;
	h=From:To:Cc:Subject:Date:From;
	b=tWGxD3NRW9r9ZAyQADuF5bVXoFt9HTLmfTBvddYjC9kE/6REWKSFFmeOXF1QE8iDC
	 bHEE6ys05Ud6pNUPQKBZimN7VCOSYwnzIZ4+8CYXkJ6dWNeVtw7jB1AfA/WKK3GgGY
	 IfsAc40kV1J2kE5WvnwB/HOBlLHJsDYtKzilPyyWl5Kf2JP+XVBz53izbvVTKal8Vc
	 kzD2LA/9QubH7ai2vziUh5ldf6kGRnsmj27JGkN6VijkLPUt2+5dr0CQx9Rknj1WxX
	 3UQMT9T4+3PXpD/ItQxYvztzuqoh9DMFVsVxR6hjQWKN5zHo7dRRPHdeLI4XFtb6cE
	 0KNflRtNTh5ag==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] libzip: upgrade 1.7.0 -> 1.7.1
Date: Sat, 13 Jun 2020 21:04:01 +0200
Message-Id: <1592075041-18741-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/nih-at/libzip/releases/tag/v1.7.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-extended/libzip/{libzip_1.7.0.bb => libzip_1.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.7.0.bb => libzip_1.7.1.bb} (84%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.7.0.bb b/meta-oe/recipes-extended/libzip/libzip_1.7.1.bb
similarity index 84%
rename from meta-oe/recipes-extended/libzip/libzip_1.7.0.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.7.1.bb
index e7cb6a0..1a9cd8f 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.7.0.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.7.1.bb
@@ -15,4 +15,4 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d26b2952426d2518f3db5cdeda4fe3cd668fc5bb38a598781e4d1d3f7f8ca7be"
+SRC_URI[sha256sum] = "a020dc1b17a79faa748e43a05f8605d65e403813e8e97ad3a300a90ddba097ac"
-- 
2.7.4

