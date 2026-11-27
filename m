Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17795.1795793633720019739
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=umLtLepV;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e3b22e971so4354453f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795793632; x=1796398432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2i7iu2jzSbFqY4Q7yhqRNcRmd3QsV1dE5LsG9UqrS0Q=;
        b=umLtLepVF+flKMpnkOXeqVDu8T6GhqoKJrMTlp49y3WDq2MGOzaFAmWzy2A7xgusYi
         cRqoTaLugJ/xbq++rAdUnrlMFfIXd9+bGl4mW41E99QARHOuBhZoLBvxbOjeKPQG0Rnh
         FnCtnsrM3fxJ4amKLXT2ik04XEukftAYGA07Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793632; x=1796398432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2i7iu2jzSbFqY4Q7yhqRNcRmd3QsV1dE5LsG9UqrS0Q=;
        b=xcqCBFqsnW9NAY4idf/fMrkaqCsm2FUi9As3WdSRQVENBj7qPToboyqbwnuEuhl1bD
         mMa8ds18P27Uhn/SxpqFNTARAVznIdh/Wh+A1usHOuZ2alFTvAGHxubFW0DhUYISA62v
         sbNFlBVg4loXJHgo/JwmeKKbE/U745MHE4GbH0RNy1pU3hT35KisM2cSRIcgRycUqQdS
         rsIzVUijjtgNKtQelsuyn368xI1OF/z2OC/x1OgVe0kk9XRct0ksk+oU1RGre7E+2gns
         hj59gyUqTr8pwUGqU9F5FfrYichpf2/AFxvSD8JCGRuKaX49BflkrHKmrVthcZSH/Y8i
         BAww==
X-Gm-Message-State: APuU4Z+ETUR/L1gCsLlSZkR3n4a1d84J+6Gt2oy3gy7XFn6hFKqdW5Mo
	3nusDZrjvh4CmlwRN78usX447SITi1pgzleN2s5/xU6z0It5AacCZbF4M2qrU8MIx+4/HBOMrYx
	j3wPL
X-Gm-Gg: AZFdTZfzDIZqRBxl3Iip4Oc6ZlJTbM0tzVhTcqpx1cEDhPdquW7xXMafZvTFdaMlQeM
	xmsDt1wyCDD/vF1jUsNQbXCMlcBPJClB4r68IcD1ViicL544cLXH221oA7A/0tc6PnV9ASQnJiN
	Yl6cxa3BZZCV0gxI0IfSFfTB2fEMMmgsp0eo1g0GbvNx4KjAp4ogOjA4lPTSvznXICDZ45oWgNq
	5Lk5xfgg1jJOKUw0pXcC3A95wRRFx5rj3AEvSAIS8q+SD9nwFEl+a9vhOjrRPXKzfDw8wHYQKeg
	vzOS+ngKLTgK7c20jbNzkZpePyUgLpaq0JYLvzXGrLpmMtMZ0L1yVxZmtE5F1tfXfRDiUNWJPuL
	zhNFBDW/gVGN4bxyCFopBSwxRbKpiT/qRqhS6qlLFd86uye/c2oNulRRdHgtPtg+S//106tqMlV
	CtdXQMdkhbFFZlJLmPmiEvppXEg0aBxagX0/MRB1eT3Phd5cesUTJ57OJ0I2UsRvf6xxM+CQACt
	NAIE9jX8Jn2gFWPXnab1SOQin6n5pmnPZNFpbRoUVDRVAYxtHAldgLKDlMv7yv+cnsRnpIDwqBm
	BRbq1wsKqBSimz0zuAGt15GR/rotnpBeRMYuQXIYEhH7Wqn7OLJOQocGA19er6Ufw6ypgmby2CN
	lTUxbMxafdl2etXlOQEaHt2iP0iv9puA6MhRSMCfgD8vGveJ5cS3GHg==
X-Received: by 2002:a05:6000:3102:b0:4a8:9836:90c3 with SMTP id ffacd0b85a97d-4abaf7401f2mr48265724f8f.16.1795793631592;
        Fri, 27 Nov 2026 07:33:51 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm24174207f8f.9.2026.11.27.07.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:33:51 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-cyclonedx-python-lib: Upgrade 11.12.0 -> 11.13.0
Date: Fri, 27 Nov 2026 17:33:43 +0200
Message-ID: <20261127153348.2880928-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133376
Content-Type: text/plain; charset="utf-8"

Upgrade to release 11.13.0:

Documentation:

- Explain model fixture and snapshot workflow

Features:

- Add support for Component modelCard field
- Support CycloneDX 1.7.2

Performance Improvements:

- Get_component_by_purl to use early exit generator
- Get_localised_vector with pre-compiled regex
- Optimize get_all_nested_components with stack iteration

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n-lib_11.12.0.bb => python3-cyclonedx-python-lib_11.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cyclonedx-python-lib_11.12.0.bb => python3-cyclonedx-python-lib_11.13.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.12.0.bb b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.13.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.12.0.bb
rename to meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.13.0.bb
index f11f9ab026..4753915e1e 100644
--- a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/CycloneDX/cyclonedx-python-lib/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "16767c4039de90c04e9f03348f8f0ed4b8ff842eaa7eefcad3a95685f970dacf"
+SRC_URI[sha256sum] = "f347c0499befdef9f8265fecc796907c1cbe211bd7d94f576e1596a70d040c36"
 
 inherit pypi python_poetry_core
 
-- 
2.47.3

