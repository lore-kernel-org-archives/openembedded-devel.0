Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.13089.1587915131933747032
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2020 08:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=p3zXnDPe;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id DF7946008F;
	Sun, 26 Apr 2020 17:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1587915129;
	bh=ZBbPiDfENl79B4Vtr4ANxIowJGd1nCRtSUCfSopbqUY=;
	h=From:To:Cc:Subject:Date:From;
	b=p3zXnDPeHnoLDwqkIqDr3tF+qeHUjvgWCSHpmFolg3hjS7nCJ2OI4amcbVpIWINPq
	 aTYgIhZjC/2+XMQbSvbOtRRC/0HxHXqKYzU6Mf9o8DQ6sNQGrWNCTwFnmVZYCZom04
	 nXgFlTKbBbuXEhRFmuEUMwzC78aZlQsK4Iov1DRx4Lh6m+4bvyLcEp19G96UEh1IoM
	 BIwf1HQxB/2CfH+//6+WHms3eiQ8jBbBb9AiknozdFpXpQoS9nH7aW4fTLiWnELkOL
	 ZE/zSkOp449wiXM31B4B+JEO6/pgzbAhgSImk0zSGyaL4ovFfeNdgZIyFBkjKw9nw7
	 Q70dE7lRPw8BA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] wolfssl: upgrade 4.3.0 -> 4.4.0
Date: Sun, 26 Apr 2020 17:32:05 +0200
Message-Id: <1587915125-4647-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Release 4.4.0 of wolfSSL embedded TLS has bug fixes, new features
and fixes for security vulnerabilities.

See full changelog https://github.com/wolfSSL/wolfssl/releases/tag/v4.4.0-stablefixes

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-connectivity/wolfssl/{wolfssl_4.3.0.bb => wolfssl_4.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.3.0.bb => wolfssl_4.4.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.3.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.3.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb
index a6c8cd0..db7b0d4 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.3.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
-SRCREV = "3f13b49fa318fbd3216d7da36d942e7c276d3413"
+SRCREV = "e116c89a58af750421d82ece13f80516d2bde02e"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4

