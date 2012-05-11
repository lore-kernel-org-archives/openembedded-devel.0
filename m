Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SStEr-0002Rn-Uh
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 19:02:46 +0200
Received: by wgbdr1 with SMTP id dr1so2537108wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2012 09:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=DhuLn7+ptVPhFh5OlNmjAKi5DwHrZBJEp4GZp8876+I=;
	b=jlofzKNfE2nh2y74VOrErYb62tv2i1PhfmvIrWpzPtlwmd07oP9pcuWmsJJDlBp2oi
	75EkZBLoDJYll6Hwmxyk3UU3/KDYEig35Uc085IWtrKRfsGjE6FjOSFrI4qPA0f4x66m
	KeT8lU1rKaW/Zp3RkIbwD7lxqYc/9x3JchjMnUk7WWPiCRBTms16DuBfg3CI0kD/QnNI
	9BunHW+ujWr9iKz7C/ii1WZebXarVNiRfAMTWK62H3EcbQB28MseP9eRpQSvXmuWBrmp
	Q3JnmaKywlmAX552vxTiB3N6ZKS6MUyRUC9hF6LFSEKTKuPQaElipzMl+18fI0U91Sqq
	FJJA==
Received: by 10.216.27.200 with SMTP id e50mr1967134wea.23.1336755170439;
	Fri, 11 May 2012 09:52:50 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm11655361wib.6.2012.05.11.09.52.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 May 2012 09:52:49 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2012 18:52:44 +0200
Message-Id: <1336755164-22911-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmzs/IpaX2cHAqeTkvQotOctND3/M8ClGXoHBPETJ4yPWSb7VRd+baXbI85pAgr/9rvw2EB
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] nodejs: update to 0.6.17
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
X-List-Received-Date: Fri, 11 May 2012 17:02:46 -0000

The license is unchanged, only some sections were clarified with different wording.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../nodejs/{nodejs_0.6.14.bb => nodejs_0.6.17.bb}                |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.6.14.bb => nodejs_0.6.17.bb} (87%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
similarity index 87%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
index 4f85bf3..1be5ce1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d66c1f33ba9b89616e45f588e7606ee6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
 
 DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
-SRC_URI[md5sum] = "3033a866e230cca64e212ee8f2af27dd"
-SRC_URI[sha256sum] = "e41922308155c5197c2d048948ca9cd76ea5f9a51f977e1591bd93fe17d4cf1f"
+SRC_URI[md5sum] = "55641d5d280cdd4e0c030c203107599d"
+SRC_URI[sha256sum] = "8dfe5948de27e37a14af184f06e7bd89a23c3b248af44c8ef5cffcd0e4c65778"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
1.7.10



