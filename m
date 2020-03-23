Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.52458.1584970419168868863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2020 06:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=PrIHylBS;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 0929E6010A;
	Mon, 23 Mar 2020 14:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584970416;
	bh=Xk/0xOyCiZ59q0V8esX8PDjf7f0sbnoAsHeop5cy0Rw=;
	h=From:To:Cc:Subject:Date:From;
	b=PrIHylBSmvjKGx3S8iDkpr64MrRihw9AyCZmnrbwLWTtsPp3ghbIDFkTJH/OkNBlN
	 VkR31UOCCLKj7DmXnZTBqoip2jPMQ/eug0u/BAty99a33iaXBn9a57/iiJjRVwgM/A
	 q9gSkywnbMXKIYFSRsXytPNQ0gK8fuCkSEDTB7joZymws5MHvqODbNU1rDwMiHRBDU
	 Paw1WXpdwNuM8W+6pDS1Xya2RdrZeyFKV2G/LrTxTQGznOqbGpAY5vEfu4TWMzduwJ
	 q5RaUHbW5aNPG6ZzfogmNeg5t5DmhEsB9+oC89B+6VHwydJe5/KN56LIpmdYc9HpXn
	 8LvN4DY3ODwBA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] libcereal: upgrade 1.2.2 -> 1.3.0
Date: Mon, 23 Mar 2020 14:33:29 +0100
Message-Id: <1584970409-18269-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This is a feature and bug fix release.

See full changelog https://github.com/USCiLab/cereal/releases/tag/v1.3.0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../libcereal/{libcereal_1.2.2.bb => libcereal_1.3.0.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libcereal/{libcereal_1.2.2.bb => libcereal_1.3.0.bb} (88%)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
similarity index 88%
rename from meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
rename to meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
index 365b40b..6fc5881 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23"
 
-SRCREV = "51cbda5f30e56c801c07fe3d3aba5d7fb9e6cca4"
+SRCREV = "02eace19a99ce3cd564ca4e379753d69af08c2c8"
 SRC_URI = "git://github.com/USCiLab/cereal.git"
 
 S = "${WORKDIR}/git"
-- 
2.7.4

