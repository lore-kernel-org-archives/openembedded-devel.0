Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.9758.1588868620099158728
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 09:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=vWtPIgRH;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 024CB6002C;
	Thu,  7 May 2020 18:23:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1588868616;
	bh=xYw5EB7XENT4E9rVTNsB1mI1l6+J8gxemGxfu4ztOhA=;
	h=From:To:Cc:Subject:Date:From;
	b=vWtPIgRHy/I9j8c1YRe5L01NCqBy+SS9f/pDwmEd9kwXuiH90x6OwCO0nJA5379jV
	 WjGSQtf8gQxYL0o9vj53A8htrPiqJklc7R8vB6TuFzfVbQPITP8YnCaOTaB+6R4s2c
	 OP+pKfDseivC1i+qGI0HlFEi3xbw9IyncfTk6HjSSpyK278oO6n4nKifFbE9UYSfUI
	 BiMmtYVaBndLEB2Bxj1F12qeEi3xaYVthIcenINzf9kc46AwaJtll1dDq0fWMhOAEP
	 GXKIm4IimILwNcyFGYcxvHmbtlAsfea5+N9VDQHlR0NAymNIhZcz+UePy3qLnLpr5l
	 3oz+enrjbOzjg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] ccid: upgrade 1.4.31 -> 1.4.32
Date: Thu,  7 May 2020 18:23:07 +0200
Message-Id: <1588868587-23190-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See changelog https://salsa.debian.org/rousseau/CCID/-/blob/master/README.md#history

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/ccid/{ccid_1.4.31.bb => ccid_1.4.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.4.31.bb => ccid_1.4.32.bb} (78%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.31.bb b/meta-oe/recipes-support/ccid/ccid_1.4.32.bb
similarity index 78%
rename from meta-oe/recipes-support/ccid/ccid_1.4.31.bb
rename to meta-oe/recipes-support/ccid/ccid_1.4.32.bb
index de07bfd..394d0e8 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.31.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.32.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://0001-Add-build-rule-for-README.patch \
 "
 
-SRC_URI[md5sum] = "e4690f3362f95adb2332fd47a2b08212"
-SRC_URI[sha256sum] = "6b48d7b6e4390e038d25630f8664fe81618ab00f232d6efbe0e3cc6df28ce8f7"
+SRC_URI[md5sum] = "c4c70e928455f6ac3c4d02c4d2a654e9"
+SRC_URI[sha256sum] = "545f4ab7887d512aa4b6967b80ef18a77b790c34769718452737a633cefc1639"
 
 inherit autotools pkgconfig
 
-- 
2.7.4

