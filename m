Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 17F917DFBA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 16:03:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450J645Xymz7P
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 18:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557417788;
	bh=aefxP8LNyn00zCKu+SoQHDI5tUgfjw+l7/motGA9ZMM=;
	h=From:To:Subject:Date:From;
	b=ByRggHsvJThTWSA3i/jOJejSqJ38fxfuK7uLc2IXkQx60sK0cRAkidQj4lPmT+hRk
	5UFr5MYq+aC2ObY/aaLYCv11iRoBS+KV/VAfo27ASyB9iaL9CEOT51J11alqNTXnjc
	Ph0X9EL4wnikWrMK+jvlagm9D5Sg7X5lqZHf5gPKqVyWhwsqBB0+BGMIxBXUGS/qWS
	MpiBWXWndVtS5OqC8/8ZVgLMwwgWa5Xle79Hg8DVj0csCGnXfkIN/mdyKRVKdtoFiv
	uPw/lDjbi7EhQc6pAkeKQslcf98HXu9e6td/faWIwJJH/pz0RY/FzqX4azWk1EAsTs
	Ufs5tHltXbkuy4s9jsporLhxayi1XGtmDI9sHXsus33Wn8FEWHZvjOPlny6RQl07ze
	17D/MUvz4orhNd5sYbBh/AhUrn1HVJ2GGFv7DOVryQzsW/QBzloLAlS7vOpgWmPb/4
	jZ2d/XVBZG3THaDcO3wrv7GhbN/8fMM7A24hjpm3+bX+yGUnh4j6cYAsHOQ93Gcjau
	8IQO1KUux17RhWfDU80Oln3soh8JinH/StOsZ00cBu7iOd+SxA3Y0XjLY89SHq1vZA
	uZjomSU80D6zxl6BoTkojDIHgUKnGR7x3zdmoSyRsh2CiMDPelN9tjGqm0K9v4OV0D
	imGv9gJyil+/vei7V+a/yZkI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 May 2019 19:03:06 +0300
Message-Id: <20190509160306.857-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] dovecot: Upgrade 2.2.36 -> 2.2.36.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2019 16:03:08 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../dovecot/{dovecot_2.2.36.bb => dovecot_2.2.36.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.2.36.bb => dovecot_2.2.36.3.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.3.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.2.36.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.2.36.3.bb
index 39bfb912e..be633e03b 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0001-doveadm-Fix-parallel-build.patch \
            "
 
-SRC_URI[md5sum] = "a8d6492584025b2413e82ea48de3cd5f"
-SRC_URI[sha256sum] = "e9aba89bb1ac1e9581b84e4a7a50f53142539614eaf7cc4c80007ebea4988be5"
+SRC_URI[md5sum] = "80c1c271b1c4cbe26a793f4e3b09eb8e"
+SRC_URI[sha256sum] = "992521305fa1d61f4726aac2619ccc65094a3cc2e5c80644455199764305863e"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-- 
2.17.1


