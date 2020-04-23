Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.1293.1587621701731545665
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 23:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm3 header.b=iXUE8w9U;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 66.111.4.28, mailfrom: alistair@alistair23.me)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E07815C01FC;
	Thu, 23 Apr 2020 02:01:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 23 Apr 2020 02:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=7Bl6lwG3d+M+H7f+0d9y53dykA
	HbucJgR2EO8/+ZFFY=; b=iXUE8w9UQ12DBlfXrsmSlL0WztRsPOAnIH+iIU0wC3
	j24oRgIO2LgxxYPHynSNDabmIM2jGulebjOpruNPBcNh6rG8ErUMHbiqR4PWI3xn
	IxBJVQ+vvCAe7GkcYQWaQL23xazpFR2zhrwcQ6rjguKuUo5Mkayl3j5UuQI5j2KT
	1MJPyLu3+Mgl+apFgfIduc6tEB4iP3m3uDFs7r3f8G/asr92EIL9E6GjFk1ae/dC
	7hyqDmeQJ3bdbs1nIGgudzxADjN7U6VPZx05GutcqssBM2iW6y5aSC0hAQrl34c0
	V9b0U05OvYgf1T4dtGxzCwV1+/fDmRhJmcHFWRqmM6JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7Bl6lwG3d+M+H7f+0
	d9y53dykAHbucJgR2EO8/+ZFFY=; b=IAkZKNqH6wJIddwpnvQU4dBDaWFR9Pw3z
	tUUQo0PZ+a5zfl0hH7Zu8vWGOSCxpgitpOfjv+gwDtqQuwUxa+WlEdZXQh7xJn2K
	q3jEhKIK3a8kcFVutvIDkgKa0gvoNdsCpJ+JrHp48aJWwmZZS0lqQgAI5bAgVLJc
	FBfVtuJW9UKDiQbKLdAXHW1FyUwREJwJesALOlwLrQCQ2V9WmiUEWfWZKSbgN+QE
	jONJKKsM50yvZBdLcgHsngP2RDyReyX/ijXeG3PQ0t4a0DqnsF/uKfNhqRonvYJw
	+aKwUStj8ht6rXquuqSeIBlbMlGCs/htzLXSWK7aOnTGuA72/T6SQ==
X-ME-Sender: <xms:RC-hXndilX3qjGUIZrXbYraPKNpwBBkG_I7e4I-53EBh13kgS0HjIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeekgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecukfhppeejfedrleefrdekgedrvddtkeenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:RC-hXhfM6kd-7fgT00sY7OzXqGKhOxE4K1cXyCd9BZYHYPYP1ByOzw>
    <xmx:RC-hXrh8NGtkr4Ef5bWWtSu65L2L73tiyQPlqFgs3jfPxTqKMLTLNg>
    <xmx:RC-hXtRzBWZ3Kox60MlKcKDoI606NchaN2Ecv-HTOd3_Mv9YCn-DmA>
    <xmx:RC-hXpHNDkZan57bHSViujsFCaySTz_rCZ76EoeEyw9e3xX-nBW3tg>
Received: from alistair-xps-14z.alistair23.me (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id D96C73280068;
	Thu, 23 Apr 2020 02:01:39 -0400 (EDT)
From: "Alistair" <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] python3-obd: Add missing setuptools RDEPENDS
Date: Wed, 22 Apr 2020 23:01:36 -0700
Message-Id: <20200423060136.1369993-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta-python/recipes-devtools/python/python3-obd_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
index 55131b333..eb8a5a747 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "8b81ea5896157b6e861af12e173c10b001cb6cca6ebb04db2c01d32681
 
 inherit setuptools3 pypi
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint"
+RDEPENDS_${PN} += "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint ${PYTHON_PN}-setuptools"
-- 
2.26.0

