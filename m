Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.700.1794955422549086103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TK0LoXam;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so3169385e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955421; x=1795560221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryvQu8uo32YL0364PEHHCWht1XKYk1+VaVlUrLw/TpA=;
        b=TK0LoXamydBV28i2Rv0xto33f0AQ3YK10V8e2buSmKNojVRdClC2sWHVvW/VQ8gytK
         s3vezgMeWZZlulwXkVgz8ZvzaaqLek13oKF9JTlx+i28uaAQmPYJnA9oUPUPHuPSqh+v
         o+sSDZK1vs8Ev/4KYtDWMVVw0pln1bgJg7xx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955421; x=1795560221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ryvQu8uo32YL0364PEHHCWht1XKYk1+VaVlUrLw/TpA=;
        b=IeVj8k2fawkHIzUwwY85nloNW+GABinqWxydSLCoDLHWGKSI+RIJZVBsPN6Kaq9Nht
         OW/BGcvmJOQ/PGr6YY3faYQloq1gY5wVC2DucjgUGbKfDD/YG2KKs/xI+cj6q4sHv0AA
         8FwGjxp3+G91Gj7BRSyN3K1T8sT2wBUylx1xjo+Jkmfw5rSpD1G7oRC1WZqc7FLX01wW
         bt96US5ymx9l5jyWtyuu5saAKEFjely7xvrX5MfvV6XENNSooYU/fXAPYAN5doo2vO+y
         E7xznlRy1nx3bgAJkVo41O5VLx/BtcLo0LjKXayURB9uch+SKz5iRjA344P6eyTYNZq6
         kF1g==
X-Gm-Message-State: APuU4Z/7KAO4/MaGGjQ7viDzesbusibj7zUyQYA+4wRY0zynWjWbY9tn
	yJaqNlAlNDboNzB23DXZgtEeOZPfhfx9Q65BL59DArac2yVZo8h/sHjh+1ocPnoIkE7NNAiL1Rd
	QswXL
X-Gm-Gg: AYBFou0wuObkoZy3b3ZPBYh8nn/+/Wdfbu8YeZKE8k2H5x5xwLnBVK08u5gvxauOEMP
	mPBdEEjazopJobRL2hT5078EyfK5ZC7t36XoYdjoK4LJwaO6RzDs46lcgCiY5/uQD69EdcmlHjD
	cVIZKtkF9JPknCjrbttTSPFg99S5NwLBCagtVU35tdMGqzSpAVizPLXelVtPObU8EXdTbV7/zmB
	/euFESz7Y4W0apUFzJtsjXvX9sAgHVd3J1LpUY5sq8/QiAOOM3mgt1z5fQhuvfxNAtvB15B7xDl
	N7cVQD1z1Vrqt3p+R9tIB1URqFAonvZZ5a7zg1IZt5pYUJ6BTkGPXHpYszvqabuha8yEl8p60ia
	a1MltiM3G1nd7d5SqtD/+uhaIMV9UEKURbF5u3U6nzDHlPSeE0CFOCY8PHn7i+07l0aPDnmWHnz
	M0oNOgm5cQNcbCQoOTaExWqQzfp3T30NZkK3n8oQ5Rx/USyC/yMdxRqcQOqxd7pdNsE6CuRbjln
	75C7m81uayC0/Ho48nzdVaIIEQXjiOVq86MGfajt47Ff9IhfGZ0U5S0S+0UzbQSXCRUn1PUXIP0
	YnMW0RQAJzI2iT1E5iWc3d3I3KhhLpuO8Xw1pIyhucOJZcK4AB8i5ruTgWYx3PVhJsSkyGb5DKS
	AUWQ6Jnrt/skz3z4gz6gjoCAXQu8s1THwlskZvakApeqVNTZJzBo7XQ==
X-Received: by 2002:a05:600c:6092:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb7da1efc6mr11496125e9.19.1794955420907;
        Tue, 17 Nov 2026 14:43:40 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:40 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 02/11] geos: Upgrade 3.14.1 -> 3.15.0
Date: Wed, 18 Nov 2026 00:43:28 +0200
Message-ID: <20261117224337.4181772-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132592
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.15.0:

Breaking Changes:

- BufferOp returns POLYGON EMPTY when fed Inf/Nan coords
- Return Inf when calculating distance to an empty geometry
- Overlay operations now produce a LineString geometry in cases
  that would previously produce a MultiLineString with contiguous
sub-geometries.
- Overlay operations that previously rotated rings by one vertex no
  longer do so

New things:

- Add GEOSMinimumSpanningTree
- Add GEOSCoverageEdges
- Add new C API functions for Hausdorff distance
  - Add GEOSSubdivideByGrid
  - Add support for curved geometries to the following operations:
  - BoundaryOp
  - DistanceOp
  - GeometryNoder
  - GeometryPrecisionReducer
  - LineMerger
  - Normalize
  - OverlayNG
  - Polygonizer
- Add GEOSLineToCurve, GEOSCurveToLine
- Add GeometrySplitter
- Add progress reporting to GEOSCoverageSimplify, GEOSUnaryUnion

Fixes/Improvements:

- Buffer of Linestring includes spurious hole
- Preserve M values in GEOSInterpolate
- Preserve M values in GEOSLineMerge
- Preserve M values in GEOSCoverageSimplify
- Preserve M values in GEOSDensify
- Preserve M values in GEOSSimplify
- Preserve M values in GEOSPolygonize
- Fix some cases of dropped M values in overlay
- GEOSClusterDBSCAN fix unsassigned clusters with minPoints <= 1
- Fix crash in GEOSConvexHull
- Overlay performance improvements
- Fix intersection result for slightly overlapping polygons

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-navigation/geos/{geos_3.14.1.bb => geos_3.15.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geos/{geos_3.14.1.bb => geos_3.15.0.bb} (88%)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.14.1.bb b/meta-oe/recipes-navigation/geos/geos_3.15.0.bb
similarity index 88%
rename from meta-oe/recipes-navigation/geos/geos_3.14.1.bb
rename to meta-oe/recipes-navigation/geos/geos_3.15.0.bb
index 28a620c5bf..7430c78860 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.14.1.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.15.0.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3c20919cda9a505db07b5216baa980bacdaa0702da715b43f176fb07eff7e716"
+SRC_URI[sha256sum] = "d5e5192a686d065eaed082de14dd26244c5c8e02bff16b2c6cce3265f648e00e"
 
 inherit cmake pkgconfig binconfig
 
-- 
2.47.3

