Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id DBCED7F9A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 01:06:56 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id y8so15278214pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 17:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dqCCiEApvMoaDEv5Tnl/mclF4adT7g3E7bxQT2muEtk=;
	b=AvquMTaSSAeUJObMlTJ/aLfj9fJXRkCx8K6iYjtEpDpaH8o5LFSfa1t8xm9nCruqXD
	Q/vTHnALlF/REUTSG4aZgxFTb8aUsqBiLG4E6Q3Prbax/0tbjRm5sOFa5hQ2YDzylXtR
	jfxUFgNGFMZdRFje5VN9F8molYFRuhJepWCwuRu8HlYyhMSo3WUS+3UZKdNxkvevSGlb
	DX4h5Hj6rq570691x0Dwm02xcvsyL3DVZClDIHwYmbj/VJzNPc0lBjephHYiU7j0Pgf3
	uxb34dRYuA1SnQO4fXRWFqVzy/no1VQQSjESVcbvQsDAn0/GW79mV5kQZ9vtAHVSmCfg
	wwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dqCCiEApvMoaDEv5Tnl/mclF4adT7g3E7bxQT2muEtk=;
	b=qZ4AtAVKUm513m0JBEhSQ8jJs1iGcVCtQlPX1N4lfKwESn2lCBZvMQHANo3W3tZYmI
	xP2XHwDPE2TmEkA9pWGoL5hcoGAGHtZh9RszwB3pRNWzf3b25HJtCDytGWgn9J1q+aYd
	i325KPQUPcIdt9RrNCK4/+KoqtjDdyyWbGSsqlLVBSwGHmVGJ/IRQ8OWWkAb+OhhzD3x
	CWiTCf5XpYP5gdleTkSEUEHdIAVqYSWSoEqOaa5thtEAblsr1Gbm5nTILZCiy2/WT/Dt
	HlycGnBYl5wpojUr/DEjtLYuTlxWKKJV+eZRYdc8Wu4m9thRaA9BAEMikudThJOoXnzG
	Oy8w==
X-Gm-Message-State: APjAAAXLZQOQO54rKqJ1rTwh28yMvysH4GN4z2hurwzn5Jbi2ROGXU7p
	Hl3hqpst6Kbf8ubGLjF6Kr5VlAFMPHc=
X-Google-Smtp-Source: APXvYqyDxZId5pWHN/dd5muvYR6vOwf86Z3mr1hqIcUmSAdAwAw7MFxmF0KWE05q8d6O40XgDAxBvQ==
X-Received: by 2002:a17:90a:b106:: with SMTP id
	z6mr2815473pjq.91.1577754417557; 
	Mon, 30 Dec 2019 17:06:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	k1sm47345844pgq.70.2019.12.30.17.06.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 17:06:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Dec 2019 17:06:46 -0800
Message-Id: <20191231010652.3206534-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/8] glfw: Update to latest
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
X-List-Received-Date: Tue, 31 Dec 2019 01:06:57 -0000
Content-Transfer-Encoding: 8bit

Disable docs which needs doxygen
FPIC in static archives is needed for arches like aarch64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/glfw/glfw_3.3.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
index 0ceeba1f19..858e5c0592 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
@@ -10,11 +10,15 @@ SECTION = "lib"
 
 inherit pkgconfig cmake features_check
 
-S = "${WORKDIR}/git"
+PV .= "git${SRCPV}"
+SRCREV = "781fbbadb0bccc749058177b1385c82da9ace880"
 SRC_URI = "git://github.com/glfw/glfw.git"
-SRCREV = "d25248343e248337284dfbe5ecd1eddbd37ae66d"
 
-EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_DOCS=OFF"
+
+CFLAGS += "-fPIC"
 
 DEPENDS = "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
-- 
2.24.1


