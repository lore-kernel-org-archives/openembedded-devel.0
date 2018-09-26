Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id A998D796FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 04:14:57 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y18-v6so9836081pge.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 21:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ycjtSGUCRH2CKfTip+2iC4wqOTkUmL397RRltD8/fBY=;
	b=sa0DDdr0Dci9uS+qR4NK5crepe9glEEqwv4RysvNq57VNO4cXbwTwEN+M/mMmJY57Z
	4ZAvPEnUeZ4jLuLkSbnH18OV8f+PcHMoWUdJRQRs0dPX5x/zLA4MY8hVkYWAOeKsxpWL
	aEyEQ5FwP5fuIgRarG1mTAAX4EQrRdYT4w9L1ZpOGqbPjoolVUsXMcAyOiygY8zJBMuo
	6nTM3Ko1NpGXIFDbsMLeyA9SZ5oBgr8S2MYWKQw9g+calufc5mZjK2C99XxcMZv3CBEY
	5P21UIy/8xcO0dhtHcoArx9Gkx/FSTtPOzkgTo5ftWAhQTO8FFO1QPc5Nf8CMxeitgbx
	H9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ycjtSGUCRH2CKfTip+2iC4wqOTkUmL397RRltD8/fBY=;
	b=Nai1hIQuzMC3+2y1u5VBgL+zeNIvFLqXDPQz29RHBSBux8E9Vy7HcEe6oPn/Ynrmvm
	BgYKebEfrRR7O6ao0IvSa36FI5PH/jddDc2TibtgbjsTJ90u013cf+AW8+WEneWOb/cC
	Z32x7EVlJbTV1YpHfpVL2dxRy3w5EqWISGm40WJfjbp+/CgHDA2JvXE1nj1urN8x4+yx
	22jmHQ/8a7WOE9oEtfuCrRwedVT3KnmFLl30wYTtInVO2SmLO7cP4gjBFroCPzz3Ks5t
	vHmJcPNe2BOQNPYamnIye7E6iQc8cRlPUNmtJ04GOqVbwclKqy9vapwQjI7SrnpW4l7J
	LqiQ==
X-Gm-Message-State: ABuFfogauZWUNcqG8B381TEw3iyGrSsaTEoRLswtCTwp9M62WQeQFDVA
	DSG5SPnXzJ3emZ0INctn7FE2P9Na
X-Google-Smtp-Source: ACcGV62XSK7jA2wZKHYV+/BBjXOVaVe3NizeCeSHlt3XTccnGrUMV82PtxDb6+4F3FVtVcpfaguN2w==
X-Received: by 2002:a65:654d:: with SMTP id
	a13-v6mr3756244pgw.35.1537935297967; 
	Tue, 25 Sep 2018 21:14:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	l21-v6sm5007047pgo.81.2018.09.25.21.14.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 21:14:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Sep 2018 21:14:49 -0700
Message-Id: <20180926041449.40951-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [PATCH] layers: Update layer compatibility to thud
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
X-List-Received-Date: Wed, 26 Sep 2018 04:14:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
Cc: Derek Straka <derek@asterius.io>
Cc: Tim Orling <TicoTimo@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Armin Kuster <akuster808@gmail.com>
Cc: Joe MacDonald <joe_macdonald@mentor.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 meta-filesystems/conf/layer.conf                       | 2 +-
 meta-gnome/conf/layer.conf                             | 2 +-
 meta-initramfs/conf/layer.conf                         | 2 +-
 meta-multimedia/conf/layer.conf                        | 2 +-
 meta-networking/conf/layer.conf                        | 2 +-
 meta-networking/recipes-support/netperf/netperf_git.bb | 2 +-
 meta-oe/conf/layer.conf                                | 2 +-
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb             | 7 +++----
 meta-perl/conf/layer.conf                              | 2 +-
 meta-python/conf/layer.conf                            | 2 +-
 meta-webserver/conf/layer.conf                         | 2 +-
 meta-xfce/conf/layer.conf                              | 2 +-
 12 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index dbcff42d44..002f099760 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "sumo"
+LAYERSERIES_COMPAT_filesystems-layer = "thud"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index e6e9532b41..e9d0785b1d 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -14,7 +14,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "sumo"
+LAYERSERIES_COMPAT_gnome-layer = "thud"
 
 # Sanity check for meta-gnome layer.
 # Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 97afc9374e..bd92ddfbc2 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "sumo"
+LAYERSERIES_COMPAT_meta-initramfs = "thud"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index cfedf2f6b6..e2a7701c33 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -29,4 +29,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core"
 
-LAYERSERIES_COMPAT_multimedia-layer = "sumo"
+LAYERSERIES_COMPAT_multimedia-layer = "thud"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index e594b7b957..d36ff5bf95 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "sumo"
+LAYERSERIES_COMPAT_networking-layer = "thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index f0e0f9cf1f..b6c8027b87 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -13,7 +13,7 @@ SRC_URI="git://github.com/HewlettPackard/netperf.git \
          file://vfork.patch \
          file://init"
 
-SRCREV = "f482bab49fcedee46fc5b755da127f608325cd13"
+SRCREV = "bcb868bde7f0203bbab69609f65d4088ba7398db"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 1a43575304..64c888d51d 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -29,7 +29,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "sumo"
+LAYERSERIES_COMPAT_openembedded-layer = "thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index bcb15e6c5b..dae1125265 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -10,9 +10,9 @@ DEPENDS = "openssl libpcre libpcap zlib boost curl python \
 
 inherit scons dos2unix siteinfo pythonnative
 
-PV = "4.0.1+git${SRCPV}"
-#v4.0.1
-SRCREV = "54f1582fc6eb01de4d4c42f26fc133e623f065fb"
+PV = "4.0.2+git${SRCPV}"
+#v4.0.2
+SRCREV = "fc1573ba18aee42f97a3bb13b67af7d837826b47"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.0 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -20,7 +20,6 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.0 \
            file://0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch \
            file://arm64-support.patch \
            file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
-           file://disable-hw-crc32-on-arm64-s390x.patch \
            file://0001-Support-deprecated-resolver-functions.patch \
            "
 SRC_URI_append_libc-musl ="\
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index ece6dd05eb..b2bb379105 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "sumo"
+LAYERSERIES_COMPAT_perl-layer = "thud"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 7089071faf..321d51bee7 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "sumo"
+LAYERSERIES_COMPAT_meta-python = "thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index f205ef23b1..aaa3a95c4f 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "sumo"
+LAYERSERIES_COMPAT_webserver = "thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index bee8e70441..f5f44d64bc 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -18,7 +18,7 @@ LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 
-LAYERSERIES_COMPAT_xfce-layer = "sumo"
+LAYERSERIES_COMPAT_xfce-layer = "thud"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   xfce4-session->machine-host \
-- 
2.19.0


