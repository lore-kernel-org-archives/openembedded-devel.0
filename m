Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id C45B16E5D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 08:58:16 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so24320254pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 01:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QKJzfoVRWgWr0hYrGzEIiiGABn7Dzq8F8nr7NS5US2g=;
	b=l+69M3y6Mp5IMouNYhSWWdL0+LfFEcCQh+Ex7lmpA6x1DpixI+aSZXF+Zz48d6vPQn
	GL2Qqab5i4gR+/wTJ1/JMLcN1DrTh0B9128bSFwQXdQmc3Vha83YvWktXHzFV9xVZ3YG
	u7C6HKilLzbBNiF2VaOEE1yhxRYrO+yCUF9zbzPsjy2MiQvvr2ExL53DEn7nevuySGRz
	Mb84h90w9JiEow9dUXWXnICVR5wdcgrZjx3dJyvSL3J/FO061bZw7saEkBX501v7xq8l
	gRaO+RVth2UiqQYM/DBf0SlWpwn+kzWqJyEuoay8TXxMEG0rGRX3dlJVzUbyGkfVtvw+
	w1YQ==
X-Received: by 10.68.89.100 with SMTP id bn4mr38366986pbb.48.1432544297489;
	Mon, 25 May 2015 01:58:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id q4sm9345917pdo.42.2015.05.25.01.58.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 01:58:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 18:58:07 +1000
Message-Id: <1432544287-21922-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.1
Subject: [meta-oe][PATCH] nodejs: update to 0.12.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 May 2015 08:58:18 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_0.12.3.bb => nodejs_0.12.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.3.bb => nodejs_0.12.4.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
index 4f80d80..4e1ba1f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
@@ -8,8 +8,8 @@ DEPENDS = "openssl"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
 "
-SRC_URI[md5sum] = "955448ae6c50a56da3f8992114563b71"
-SRC_URI[sha256sum] = "e65d83c6f2c874e28f65c5e192ac0acd2bbb52bfcf9d77e33442d6765a3eb9da"
+SRC_URI[md5sum] = "c2b4deea212c0b7c2f86368c65fab312"
+SRC_URI[sha256sum] = "3298d0997613a04ac64343e8316da134d04588132554ae402eb344e3369ec912"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.4.1


