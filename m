Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.242.1586383542934201618
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 15:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=kYq/PQmd;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id CE6286022A;
	Thu,  9 Apr 2020 00:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586383540;
	bh=mOY/H2eMFMSHnPecAlV9CGWEd3em4/UrH7RlrIUB0uM=;
	h=From:To:Cc:Subject:Date:From;
	b=kYq/PQmddFevXpLZNtOo7sWaL3cMMH3iiV/AD5RQQ/aZ2/j1la/Gxksrwo19weLTR
	 Z9p4m+nBpZab6AMqXWQ2lBjRvvnFES20iOWd/HYt02767Q5TUnEaeAja1iqxDx9Mfr
	 itf/qCX4BrOM03B+HUdub1CBaUw+4yySMkptorfP1tZZ7l30ckwmz7BDHetVoqJ0kl
	 WY1HE5W0NLvavIxNUKulyEDctaeEqEM7OSPmAnZL3NVvXTBBeX0HDEFIjV7qINazRm
	 Ds0u86+JG5EgVj75iJ9sxIh7phJ/6Bi3254d/1Lm4JePYLQcIBGJhvgT/NqpC94tFw
	 0D110jT/gtcdA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] botan: upgrade 2.13.0 -> 2.14.0
Date: Thu,  9 Apr 2020 00:05:38 +0200
Message-Id: <1586383538-23685-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://botan.randombit.net/news.html#version-2-14-0-2020-04-06

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-crypto/botan/{botan_2.13.0.bb => botan_2.14.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.13.0.bb => botan_2.14.0.bb} (89%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.13.0.bb b/meta-oe/recipes-crypto/botan/botan_2.14.0.bb
similarity index 89%
rename from meta-oe/recipes-crypto/botan/botan_2.13.0.bb
rename to meta-oe/recipes-crypto/botan/botan_2.14.0.bb
index 4143264..42e89f6 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.13.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.14.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=a02e03c8fa2c5e7b9b3fcc1b9811fd3b"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[md5sum] = "9f90c7d523778be5f23f3ce79046ba35"
-SRC_URI[sha256sum] = "f57ae42a41e1091bca58f44f41addebd9a390b651603952c881ec89d50187e90"
+SRC_URI[md5sum] = "ebc68c08b99bbc4b4fc9bdbfad398b02"
+SRC_URI[sha256sum] = "0c10f12b424a40ee19bde00292098e201d7498535c062d8d5b586d07861a54b5"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.7.4

