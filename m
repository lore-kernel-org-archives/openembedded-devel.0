Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FRD-0005cL-SG
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 08:38:11 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1154438eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=K9cxKyU3WxPAAkg/oOAqPyjANWVXOeyoSVLjEPfASsQ=;
	b=E60U4VXa1/k4W7e570O3jnw5K64D5Ief5MG+R1MNVJB4m4gOxp3gf2hvfrMXUgTn/k
	FI5YEnt2JZ0efQ2V62N0+4/9wNXqEUweBVUkdm5+MFq/ZOtCO+bidDp2ZTv9sXio7n67
	EBPBnJuMCG0xMLcFleE3bBjp8oAtEONdhQFUSXM8DB3EMtmt3vh6OhqGyeYrmwTmWPbW
	XKl+lM+RXiw8R8AA2FNJW2l8w5Y8bGdz4X7PcFVChp5ZHmxyRikM1pRkeEPS5fxO3wil
	uGxhfA2AhpyzseI/Vd2YX3OQODY+UwZb5pPpL3Jw5qGa3XUAJUKWSxfziIeDj4A4CMF/
	uj9Q==
Received: by 10.14.4.201 with SMTP id 49mr20835755eej.0.1346135161667;
	Mon, 27 Aug 2012 23:26:01 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id i8sm2260792eeo.16.2012.08.27.23.26.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:26:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:25:44 +0200
Message-Id: <1346135149-11256-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
References: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm30VZ/HGA9T7uSEVDzayUzu//pn8/39doLIqaqHtpIX5dOlauQ8eNe5Meq1A52hhY4OUef
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][meta-oe][PATCH 2/7] nodejs: update to 0.6.20
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 06:38:12 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../nodejs/{nodejs_0.6.18.bb => nodejs_0.6.20.bb}  |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.6.18.bb => nodejs_0.6.20.bb} (92%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
similarity index 92%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
index 7136ffc..77ed388 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
@@ -7,9 +7,8 @@ DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
            file://fix-hardfloat-detection.patch"
-
-SRC_URI[md5sum] = "4a3d3123ccc7b9b21c1990fe074e3d14"
-SRC_URI[sha256sum] = "6cf4311ecbc1700e88f4382a31b3a7017c1572cd641fd06e653fc1692c2cffff"
+SRC_URI[md5sum] = "fcf8e0f2981f9dd66606a2162a2df55d"
+SRC_URI[sha256sum] = "b7bf4cf143ddf46ba5e975761b98a38dd3d72b176fd5d4bb2f9c9e7bbe6c4b15"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
1.7.7.6



