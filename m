Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.13142.1590325591973927008
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2020 06:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=HOUfBNAv;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 19A50601F4;
	Sun, 24 May 2020 15:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1590325587;
	bh=DMGd4pNpmk9rYn7TfHHSkFNtu0d635+GAYC9bcgdDCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HOUfBNAvdX9tqKfl7xybuRl2nQp4m5HG8eMaFatSrrfKMQKSGOTVGuU5gSZEKw/Bq
	 8IB4iAIGl95zzvxCopcsuvPRr/WDvlBJKYbYY6dMeCoPkxK64Kqjm8FOImcYampWoF
	 4/L+WSq4KD5I+RqmytSFW3ZxGiOalY0BiUtkOpILDCHN7QwIevPGAsSmfhMySbS+ET
	 WADKe76ip+6kN3IaCsBVwEP+SB6Xk7uZmbK5OJAuEAd1fvDTWuJYK9qTzb4aTaFNB/
	 GpISWUeXxGqkIDS8JxUO2cdoDbdDF+lpfqtX31oX/8/UMacv5WPAHAXpOoWB9XJZM2
	 /d/v0hG9lqEEg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/2] ser2net: upgrade 4.1.5 -> 4.1.8
Date: Sun, 24 May 2020 15:06:21 +0200
Message-Id: <1590325581-32242-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590325581-32242-1-git-send-email-pjtexier@koncepto.io>
References: <1590325581-32242-1-git-send-email-pjtexier@koncepto.io>

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../ser2net/{ser2net_4.1.5.bb => ser2net_4.1.8.bb}                     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.1.5.bb => ser2net_4.1.8.bb} (76%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
similarity index 76%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
index 05d1ffe..4a91fa4 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
@@ -9,8 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "52c5e56d2d54ced0cdeb764a7e8fec92"
-SRC_URI[sha256sum] = "df904d271eb161c265c956f0cb938dd0a375dda4a919a344f73b08bc50b9f308"
+SRC_URI[sha256sum] = "cffb5147021202b064eb0a9389d0db63d1bb2dcde5a896f7785f97b1b5f51a72"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.7.4

