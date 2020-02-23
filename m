Return-Path: <leo.yan@linaro.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 301376094F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 05:35:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e8so6515093wrm.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2020 21:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=f1flKJLJ9ZL9pwy+KWool+92ofJzyOO8TKP/dLiqoVE=;
	b=OyxfNM9V6bOMB0pVq4afUBiOTzoHnMiXrjY9xe6IpsXsT8e4YLlXllU5rdJDNgj/EI
	xs10ZayhWnqkJgh8y6sCrB2/lypZVwdtt4QJL8ZS80XuHfL3QcfJ3upD1J7hD4s+XkCe
	P8RNZyrIOVO463FJ1NsxaEcLwA7ceD4Hmc3EQmKnIexDqbu+jmV7XUV7znVRZ9EV58o6
	xR5vhXRrsg6rmGhhRFzKRYI4Lnm4EsfNUGCpQHJPa1Jq2N/sYD2jPkQ89yktySs43XNb
	PqokjWDDtrbo/xcVu4WINaf/cyMIuL8t6NsYxuXRR2xxjWipibyEdgtFBGvVUOeU5xSH
	FfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f1flKJLJ9ZL9pwy+KWool+92ofJzyOO8TKP/dLiqoVE=;
	b=RUBAdX8Dn4bQJ2CQrFnom3CPk4zVUEKfnPb/UeZ0s4WwoY/m0cw/eZTP0TRztRLuNI
	qs/ePASY1k4NeTz6Kc1YUNqPZSJNB91WCIq3QgF0IEyzxPwif6moOnvuMvJ+C8iwBPel
	hFvO8a/RLGeE6/mG5D0Tg9qO+DGXsb2vEyUOshSGcbZ3woeLG+yact2kxcv4wcvzRFeo
	EQV5vAsn2a+TIL8hawUJQ5kc89DTEYQGPY8eaOIl+5qY+ti7tE7iVYJJ9Ekv+lbs0QUc
	wEM+sQbagr+lSz31srkKy9nyEwrYLAv6HUzejrOKpsgVdgTYK7EWIyGDzMEow+Ro5thk
	qZqQ==
X-Gm-Message-State: APjAAAWhGAJckmG/BMMFyQLLMviLGEUtkVX/f3n4sodLpOfE/bE2g0KI
	vH0wBTyeFWU7YQDSOdwovWCGqEpkvOhLFQ==
X-Google-Smtp-Source: APXvYqyV78VSdLkLrCAqMEuGjHLjeRtrUePJinXGKUXBV2SkjVPrlZf2r/DzCkRaH23Od9N503GaPA==
X-Received: by 2002:adf:fa50:: with SMTP id y16mr55847423wrr.183.1582436157380;
	Sat, 22 Feb 2020 21:35:57 -0800 (PST)
Received: from hackbox2.linaro.org ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	j5sm11622357wrb.33.2020.02.22.21.35.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 21:35:56 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Sun, 23 Feb 2020 05:35:49 +0000
Message-Id: <20200223053549.7056-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Sun, 23 Feb 2020 05:35:58 -0000

Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../luajit/{luajit_2.0.5.bb => luajit_git.bb}        | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (88%)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
similarity index 88%
rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
index 93128dda8..afa60dba7 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -3,12 +3,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
 HOMEPAGE = "http://luajit.org"
 
-PV .= "+git${SRCPV}"
-SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
-SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
-           file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
-           file://clang.patch \
-"
+PV = "2.1.0+${SRCPV}"
+SRCREV = "8271c643c21d1b2f344e339f559f2de6f3663191"
+SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1"
 
 S = "${WORKDIR}/git"
 
@@ -90,8 +87,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
 "
 FILES_luajit-common = "${datadir}/${BPN}-${PV}"
 
-# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
-COMPATIBLE_HOST_aarch64 = "null"
+# mips64/ppc/ppc64/riscv64 is not supported in this release
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 COMPATIBLE_HOST_powerpc = "null"
-- 
2.17.1


