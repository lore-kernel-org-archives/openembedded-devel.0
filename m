Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id CAE4D7ED5A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:42:01 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 7so31974383ljw.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=acIoZTEgxjsMXVCj0NI0MuqFkWwLO4qgXnjuKUa6tIc=;
	b=PQ7+b6mjheuqRC+u0n+E0nHz6WNcEVf95s+uhX/qmgm8RXFd7fIZoxQvd7YM68vxrQ
	2mfjnwAWTRXK8onb4QYqk6KvM/5RQFdlHTSNrK9UJX2nUW8UOygU5HOFWPIprHtnQ1Zw
	RRT6Zat++WEI9a/Udf2zcHs6hi4Gf0LOSX5+8Yer9NeHhECIryRMDawuesOqe3twCJ4P
	Slbs7amtzvaUek4GKirYEIoPj8d0VKy7OpZ4Ogl+lgHSmNNDJDat7iLJ2zR8cvzNNEE1
	hVgpg3rBoVNkkrkPtg8zet57Qtz4s1Y9CoEUYo+TaalhwqGhDbVeqKD9Wg/GWF2vGooN
	Igeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=acIoZTEgxjsMXVCj0NI0MuqFkWwLO4qgXnjuKUa6tIc=;
	b=rAXobks1onO/iap/KobqyPVB6Hk+tqVQJCz4wzgHKI8fXNslFxlEn/a1HsDi7aMX10
	vIYJfqQz9iu+cvAh2PRt5L3hGbqyhr9axUTKovOWsu611rRcaoQZFw5DDsTiht7TEASI
	5YPAlK6ofY2JZOKw7iIvZi4zKQojMcaKqIbiqQ0v7aPc/zGDMrsS6l51mczxLY3tqa5S
	jEtu03ztnzWTTxbesqVGxVKVOOvMoFaqJ0YrBh40yH1hDgNlrfGPExqGnuqQPuzOfStS
	ZsBJv7sFJ6Kc1xMku2kdjw+2HljECRlpfOrLFWetu4LlvJee9pN57BsMStZl22IcsQCU
	+OGw==
X-Gm-Message-State: APjAAAXWKqZixfR98YQxKNTBLkCv4IOQ78IwL/2DNrBsBLPA7I8KIiaT
	uh8MkMBmtWHqOYRFus13GobB1+5E98M=
X-Google-Smtp-Source: APXvYqyY1lo4Cfe4pHQ8rpWtWa9f0QnF4M5lAudxgkf7xrme0t+ik9bufTdLG4k6CfQEfgOiS48Ptg==
X-Received: by 2002:a2e:9215:: with SMTP id k21mr1014978ljg.20.1568590922209; 
	Sun, 15 Sep 2019 16:42:02 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	p9sm7982550lji.107.2019.09.15.16.42.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:42:01 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:59 +0200
Message-Id: <20190915234159.12862-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libvdpau: update to 1.3
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
X-List-Received-Date: Sun, 15 Sep 2019 23:42:02 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../vdpau/{libvdpau_git.bb => libvdpau_1.3.bb}              | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/vdpau/{libvdpau_git.bb => libvdpau_1.3.bb} (79%)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb
similarity index 79%
rename from meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
rename to meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb
index b79a562c8..d96b50186 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb
@@ -5,14 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
 
 DEPENDS = "virtual/libx11 libxext xorgproto"
 
-PV = "1.1.1+git${SRCPV}"
-
-SRCREV = "a21bf7aa438f5dd40d0a300a3167aa3d6f26dccc"
+SRCREV = "f57a9904c43ef5d726320c77baa91d0c38361ed4"
 SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
 
 S = "${WORKDIR}/git"
 
-inherit distro_features_check autotools pkgconfig
+inherit distro_features_check meson
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.17.1


