Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB967784AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2018 14:32:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id h21so4478411wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2018 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v3O4tkEXParNHwi5Hs0kQXhiUpWCuTAdpAqq6r69KxI=;
	b=gx9AAEpMLlbCepVxUuoG7tXSoyvyWbdEigoYsZdUfJbEuQwoEVJ3IPj/ypcDswWAGf
	6V6nZdwVM/5dekvw9o9mjAq3KTuAzNKqZqqfsZTVJSebw9TQgQEIRFrV6Yk9gPBFpSGt
	Y6/6qz69R0Kzf3/3X3cj9kvsdqSzdgmimTIVaQhYqs8Cct4E2AcFBE06bKa+tEZW6+lV
	dZa/Ubncl0Q23P4uMEvm3WW4yQTXyFFyC5+OJabsyqoWnxg+2l/ymkml7afuwfM2Rviy
	F0NQb3JlkRZORrSrRXJC+f+DHAFEkkpNqTG5xuxSCTCfbbHpa60eu+3rl2V27AmTmOta
	wYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v3O4tkEXParNHwi5Hs0kQXhiUpWCuTAdpAqq6r69KxI=;
	b=bkx/PN6WSHsI0BOl3SdyGeLU16k3zn0Fczt9zT2z/OH/V8PvWYRsYMKze34Wn6P9Rl
	JzecPlGIs/9hCsAMHAGplHlKi5IcU+/BQozEdb8jxGVpePFymF5n7X9MEsPBl0mayOH4
	aY0PKDEpQT2b8onECsvnYvacGHdpzXqxMnOrs35FfUJAoxNKtrhJClT6GKR5eEABSfhi
	o+gK8e9sQgZZAYihjoyRu818cLS1JLpQoc6o0IzKH1YsLbIrqifHL9oucuAbVOXTkt1B
	Mvoh860iMGi8E7LY25HK0tCnveZUWepkhltHpaYL6hAAF2kybPOVeCa2EqE4bHSwvKKl
	tewg==
X-Gm-Message-State: AElRT7GRuLPjtkDN/1VNCU01vcLqFaK9+Xh1H7X2AZ3VB32/jZJHMbR/
	sHP22jd8KLbzx4CidxIUC94LVw==
X-Google-Smtp-Source: AG47ELsJLc9ZMtoeoQ2w1NICvC0Vqh759PeN61nCDQOsf0c+b/90/AZ0Pgt6eTe0yKMp/HDZ6vjAQQ==
X-Received: by 10.28.207.73 with SMTP id f70mr1985336wmg.92.1521037966336;
	Wed, 14 Mar 2018 07:32:46 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local (p50971113.dip0.t-ipconnect.de.
	[80.151.17.19]) by smtp.gmail.com with ESMTPSA id
	l22sm1353272wmi.39.2018.03.14.07.32.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 14 Mar 2018 07:32:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2018 15:32:35 +0100
Message-Id: <20180314143235.19824-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH] glm: update 0.9.8.5 -> 0.9.9-a2 to fix x86_64 (sse-simd) build
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
X-List-Received-Date: Wed, 14 Mar 2018 14:32:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Commit log shows many commints fixing sse e.g. [1-3]. Instead of creating a
  heavy patch series here let's move to the latest version tagged.
* License file 'copying.txt' was removed in [4]. License information is now
  found in 'readme.md'. License is still MIT.

[1] https://github.com/g-truc/glm/commit/8bcf9b5ae791fce37a86764b8acfd68424ac544b
[2] https://github.com/g-truc/glm/commit/1bbf2dafb9f67b14507dc37e4ee885464c5ffc78
[3] https://github.com/g-truc/glm/commit/fdfd03ffaf0e312ce0bab604982f50790e71b09f
[4] https://github.com/g-truc/glm/commit/a23911a5e9d8c631023c62be6f0cf0bf855ca482

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/glm/{glm_0.9.8.5.bb => glm_0.9.9-a2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/glm/{glm_0.9.8.5.bb => glm_0.9.9-a2.bb} (68%)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
similarity index 68%
rename from meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb
rename to meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
index a174f2af0..ed050a148 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
@@ -8,10 +8,10 @@ BUGTRACKER = "https://github.com/g-truc/glm/issues"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://copying.txt;md5=4431606d144252143c9c3df384a74cad"
+LIC_FILES_CHKSUM = "file://readme.md;beginline=21;endline=22;md5=3075b5727d36f29edccf97b93e72b790"
 
-SRC_URI = "git://github.com/g-truc/glm;branch=0.9.8"
-SRCREV = "6fa203eeb7fbcbb6f620501fad40359c8a456049"
+SRC_URI = "git://github.com/g-truc/glm;branch=master"
+SRCREV = "fcbedf5058ef8613dd02aac62ef00d55dcfeadd7"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.14.3


