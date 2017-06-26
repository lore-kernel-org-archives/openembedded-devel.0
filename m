Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB8D77E82
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:11:32 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b184so451813wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IdvV6KnqBg71vz3q/BxNhgrJ9IgsCFScDObu4/Gw2zE=;
	b=wEi4FV23FGfgTRXP7DEN6r+klZId7MbF0YIPBa5u2RnK8bHlhdmk+s2OnIHcGBDYip
	QpS/Ak0/P0y4Yc/KJ6moAE8m4RN++/DxYtFAKPzGcV7sJKPC03lgNltFDEf79Gq5o69K
	BHy/YIoWmoNutDRI3+tbulmZpPsmHqjVCsbkPJU/+LEHLqeqn68R/nSGMmBewV/ZqqNs
	1XsOVMNg24N2790L40wn5KFNjuGTgMIb3MY5oeBs3sz+knz/NVMNUsMnllER4qXbyDsk
	yE9fgG2pgAfLDAU9gTpQZm5NIBDhfBE8hRlLX1pmLPD2wcCVitGDLZ8h0BTCX6UtjKvZ
	uG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IdvV6KnqBg71vz3q/BxNhgrJ9IgsCFScDObu4/Gw2zE=;
	b=XipWGanzDcoOyByRMy2iy1L/UBWiBeEbflN5QHq9HSeU9nSCienQmJb8heo9A2EWZ9
	7yhkQ8jAY6my4U6wavPzIRbqvcqpWna9XsYTC1Q+oc8KfGQItELtjl9r2fZNpihjztiP
	LfKTaCFrSNaHQHLumyYXNqWKLG4xli3HIQpTcWtd7T31YItRmNhLnIw0ezVBPp2cLJuk
	MiO7LcsM5IcSP2e/lTxXo1lJjubF8ijdFFFoe3AlAPFVHziSE+6+ZUdev/joipT5rvAa
	dYqfNV6xx4aFIAcx6m9E3CvA4napC4g6HIfVcuHvUGAWzEbLoMvvkVctSgnwSlw1dBnb
	1gZg==
X-Gm-Message-State: AKS2vOxYOiqCKSKnNacrKH5A8ohPKvAaBg/Efydl/Qab8hRMbthW90bC
	YOREfg1FdFsm/sP3u20=
X-Received: by 10.28.229.6 with SMTP id c6mr10355wmh.49.1498489893671;
	Mon, 26 Jun 2017 08:11:33 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d91sm368379wma.7.2017.06.26.08.11.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 08:11:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 16:11:16 +0100
Message-Id: <20170626151117.6221-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626151117.6221-1-ross.burton@intel.com>
References: <20170626151117.6221-1-ross.burton@intel.com>
Subject: [meta-oe][PATCH 7/8] meson: use tarball instead of git checkout
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
X-List-Received-Date: Mon, 26 Jun 2017 15:11:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/meson/meson_0.40.1.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
index ab54b8c79..f33256a10 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
@@ -4,13 +4,9 @@ SUMMARY = "A high performance build system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = " \
-    git://github.com/mesonbuild/meson.git \
-"
-
-SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
-
-S = "${WORKDIR}/git"
+SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "8475b19d5f5f3bd5c40f4bb1f31b93f3"
+SRC_URI[sha256sum] = "890ce46e713ea0d061f8203c99fa7d38645354a62e4c207c38ade18db852cbf5"
 
 inherit setuptools3
 
-- 
2.11.0


