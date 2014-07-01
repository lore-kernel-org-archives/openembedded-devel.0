Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB8B65F1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:04:32 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n3so8142089wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=urMRrOwpQmU7Pd27PGXBzyAWlV1Uu9rbu6ndkgLo+fY=;
	b=afMOgYycDEAIwzAktVyIv/cNhgkP9bZs8U93L3cwJ05HLy972SmZm1mWOTjeHW7cQt
	kXfnrXZk7INupPQeOIbaiaVTIEjZH/3dW5qPcJ15RIjaBmSDSdkk9VoO1Gk2jueHPHs1
	JOJejhDVQgLypEmpAZJJw/PDesmzEBQpkFbE+nryYGQBQ86tTqjiVyZ/vvf/wAg+Ts8A
	zeSi1SXV2v0OHv2y10dJDx6/2h+WwWNefhAL2IjfMcQ9uxZDyiKSDc6AwkPdaeYIreNs
	xhFt3Sxsd2Gizx1HKWUsCLmqvfHQfE3A0hG2q23uKuCe8RwrZuo/IqesX1w+hZfL2crO
	twUQ==
X-Received: by 10.180.206.15 with SMTP id lk15mr10581983wic.43.1404230673319; 
	Tue, 01 Jul 2014 09:04:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fn1sm44717992wib.18.2014.07.01.09.04.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 09:04:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Jul 2014 18:04:38 +0200
Message-Id: <1404230681-5064-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][PATCH 1/4] efl, elementary: upgrade to 1.10.1
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
X-List-Received-Date: Tue, 01 Jul 2014 16:04:35 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/63/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/{efl_1.10.0.bb => efl_1.10.1.bb}             | 4 ++--
 .../recipes-efl/efl/{elementary_1.10.0.bb => elementary_1.10.1.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-efl/recipes-efl/efl/{efl_1.10.0.bb => efl_1.10.1.bb} (92%)
 rename meta-efl/recipes-efl/efl/{elementary_1.10.0.bb => elementary_1.10.1.bb} (79%)

diff --git a/meta-efl/recipes-efl/efl/efl_1.10.0.bb b/meta-efl/recipes-efl/efl/efl_1.10.1.bb
similarity index 92%
rename from meta-efl/recipes-efl/efl/efl_1.10.0.bb
rename to meta-efl/recipes-efl/efl/efl_1.10.1.bb
index deeb92a..6ad1db6 100644
--- a/meta-efl/recipes-efl/efl/efl_1.10.0.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.10.1.bb
@@ -4,8 +4,8 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "4dedbbbd03ccd3c8ac227b8682d0d0e4"
-SRC_URI[sha256sum] = "55ab54150e4c53781f7b3239f39c11a06c3b9208f4109700bca049c36cd6c49b"
+SRC_URI[md5sum] = "1385f69de925bf242deb1ba86cebc121"
+SRC_URI[sha256sum] = "e791168db744bd7bd4b16ef59659447415403d089f13576cc31081e9184bb7c2"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.10.0.bb b/meta-efl/recipes-efl/efl/elementary_1.10.1.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.10.0.bb
rename to meta-efl/recipes-efl/efl/elementary_1.10.1.bb
index 86e718b..37f7b38 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.10.0.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.10.1.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "81d4072c728a41518f59f3d115c1556b"
-SRC_URI[sha256sum] = "01c9127f0b29c1a07328199f51fb6d72d7f250be31e8afb26914566fb1c7e612"
+SRC_URI[md5sum] = "34e6df7c59a2dd9e5fcf0a1e99d5880c"
+SRC_URI[sha256sum] = "1bf9fa7a220d5845806238ec5c5789ed9141f9361d4857f5482abc33b8133c87"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
-- 
2.0.0


