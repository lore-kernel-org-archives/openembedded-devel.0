Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5021C78275
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:27 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id f127so15346449pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=io3fJpBH4KjgSWh6Zgx058g/VuaLVvoVe9T+aRp3UlA=;
	b=Dl4VOcUbP6039xdJXaANc7IBxxHfEflLYTt2kBG/uMLp5OjZzTbOB0bC/yGT5jyzUJ
	9ry2koYhrY/m1FAF4T2xZfLlPv3f/aGDPuyFQm2vumrqZ3ckHZU9vlgYPlguQe/cXkzc
	QiEVNYcVLlGeb8SVJzB13PPHK35SyJKwmZA9ij+8WzBcjdS3kyd1+j2RY5S/jNWuQYBT
	Og4hkNEt3x0er6y7lZCu0WJ5ZaYNOkNQgWUE7wXljteEx02rPOo3XRVsV9pXRG9BLa2F
	8hOLzNqeoVQEwUXoHlvk3zlK3iWBLLFJaQGuOWdnzlM2nLAVGbhk+6tmRU7lnlrDiLs4
	uOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=io3fJpBH4KjgSWh6Zgx058g/VuaLVvoVe9T+aRp3UlA=;
	b=S5qQxmv/Ac3IfcIV+PUbbGOzCRxX5g0u+SEKjYawSxAfO9ACuGcXGgKpWfPP3KMq5x
	0/KqYpAasjHCa+CeNwyd3FkIQLDkctc3anD3Mw9LZVaGFbdqFjKXJcFQttzAkPto/IS+
	CozqPiQ/6yyc7Fq+J5FjK+XYIoitGRgNw3H6TT645oOPYy0kiB/oVpo2pk1kVdoSglxL
	vX3szVXFLixPBYduVWWTBC1LveC2HWkOFOhzNDH0AlYaJZn8Npu9cteF5L8hjadkgmMz
	p3bhGwm0nSkoYkjUg8O+N7a2KF/63NbFLCBVaU9I6vRv+CNajASsBGS6XbPQjDlBy18P
	fJPg==
X-Gm-Message-State: AKS2vOykp1qhaJyjsX6S13VTdV2D+rIFjHz3Pt5Awa5N4/Tul+AQGxm8
	tdnyd7luefl2/r8G
X-Received: by 10.99.228.69 with SMTP id i5mr20532886pgk.192.1498827628756;
	Fri, 30 Jun 2017 06:00:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:52 -0700
Message-Id: <20170630125957.3342-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/17] synergy: Update to 1.8.8 release
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:28 -0000

Change license to reflect openSSL linking exception
https://github.com/symless/synergy/commit/a8472d2eb2106a0d1503d25369e6bdc6e3b88c7d

and copyright changes
https://github.com/symless/synergy/commit/c3c0913633041584fa41180640d2e4c83fa92820

Point to new(moved) SRC_URI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index 1c55a8a0f..68f0387ba 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Synergy - control multiple computers with one keyboard and mouse"
 HOMEPAGE = "http://synergy-project.org"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0f366945b209c5523e39889f636af00a"
-LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ba51ca68e055566aade24662f9eb41"
+LICENSE = "GPL-2.0-with-OpenSSL-exception"
 SECTION = "x11/utils"
 
 DEPENDS = "virtual/libx11 libxtst libxinerama curl openssl"
@@ -10,11 +10,11 @@ do_unpack_extra[depends] = "unzip-native:do_populate_sysroot"
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://github.com/synergy/synergy.git;protocol=http"
+SRC_URI = "git://github.com/symless/synergy.git;protocol=http"
 
-# Version 1.7.4-rc8
-SRCREV ?= "588fb4b805dd452556d05dbc03fe29ea5b4e43c0"
-PV = "1.7.3+1.7.4-rc8+${SRCPV}"
+# Version 1.8.8-stable
+SRCREV ?= "c30301e23424db1125664da17deb8c3aa6aec52d"
+PV = "1.8.8+${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.2


