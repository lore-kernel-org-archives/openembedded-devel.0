Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8123.1795739795579031059
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LyZQHgTW;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9ae391a05so51928855ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739795; x=1796344595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ykg4NpjrIjk4o0uQ7evxCZxrA0SmG1ZBg0lU1LFJsnw=;
        b=LyZQHgTWRdpNPhYjNu/DEP9SA7mcx32QrU4wJgsY/nm7mZNfuc20vnfVSEzhFzuatk
         Oynvgee8qGk8fQXqj1QYGwbcnZiytl2TEj1O4WXWwpbfZ94Scgy8HD+pW9RkJmwZK0PQ
         87d+zZpGgYGOMi7ffj/4sKZn1Nydbm6A9hGLnvtuQEEYVjWuatUTeXPp1DcFtMmd7t5A
         L6MankymlKA2rCYC6ZzW5HObWtiTbO4Lzg740x7L1DAbUjoFakYvffef9rHZ7lcBh5Cj
         6q6D4mbhjiQL9I/W+mEgDZLa31Pd21WkRa1srhGl4PkKjbVEVr6Yao+R54glXWT8ByOI
         KgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739795; x=1796344595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ykg4NpjrIjk4o0uQ7evxCZxrA0SmG1ZBg0lU1LFJsnw=;
        b=tL7joUQft+7Q7SNCTM5sxa4LljGzRqEvReWo6w2MbGuKyp6h6gF3wmpfNVCIj+viYc
         OqXHxBY6MPuDhtcK1QJlwdq+lQcg5xTFIR9vuHv4UuwGKvMJZIjdwBtzkJHKin7TBGcT
         d15Di0yPYJkJbLPkRRpucelhvjTLIRCAQa02T+9jOGRCceXuWZKllzNrEkuGgZNJyIgh
         yTg5hW2XkP/Bt52tGTImffbOsXqdvgGxbZHG3XALxFYLbDTfZGKCT3IQYn5r73N8XMZR
         hElGaXEyPKwSSt7CJhV+v4PfycXoHJqtPKvc4QtRkbE5n8Ltq7O9fia8DFGHaEZkXjHF
         oI0A==
X-Gm-Message-State: APuU4Z+ukOruOSSschqfGPh3v9gcZ1TyAcSD6Z8PvJFKNv/c9VKFDhl0
	WxHlS4yrPCY5QH1J8R0qFTKjf+vwr8XAeJjCaJZTXEIEBsDHgEa6OVrwM78GEb2u
X-Gm-Gg: AZFdTZfiVHxF4vXqQO/8Qulq7FoP3i5RP3RRyFu0Bz9dUkv+sknYVjHV5Jfunx2Ix2Q
	ooXNs+V3VGYZKOLVGqDK0ex8lDQmF2rmIRhW+BXSwFBAM9ZbSzxuN+lHzsH4OeGrmQPtTbA87jC
	RQBY99SsYl5JSZIBenbuZaz6kBLcY5d0zy/A1/pWQ/iIAx+T+lHAxwygKeoPddgdvHKR/0y7jxv
	VLKEBo0TsAxIics/M5Gf+CUTHqBubw+L2OVIG/kFy4JEYe+W1Xayl9W16+FQCaQN1g5NDX9YWG4
	DwJGHpOx0LXhx0qCcb6crwhc9lyh4dOFMXtBnx7PfTSoF9sh1uLHRu0wndFAmyaGH51YHBj1ZN2
	+ydgbeB2RPGevq6yrWSJLLFtKrGQ28HAIb1gkV7jlD64+MqzzEWVJHxE8Tw3rNUJ6+pIDHvYx3W
	1n+NdB9v87dj+TNlVISM27jUycZe1DCD3G/K44O4tCecgMCEnTOJ/lTgrWlNhlLGq8GMljmjk+d
	a39RwEa6XYS9gGKBob54daUC/n1vGOluxkPhFsBUOoSemBRKFBffjlJNmdwMV++jQbdH6arWjTb
	PHQOjnbPB+b/Si3eqrkv33i9tW0GKcAjquNLvkEyKnNZHGdjhZh5IatngkbgLtGoZP+1cmIYfS4
	KUXj2wgoruzIVGBfOoeRToz6rxpZrYPTlAQ/AvdfIhoAzK4sp2SIzFeww1Gdoved6qOFgtiL03P
	wDPkXkce9JKdDJSZHp4BAvaWTOr2F7TeNIwGMry5+aBEVxFF/uWEVqYN24iIFbA9M3FPgQ679RB
	zxgKlE9OYA0CX1mX1pnV6UqG9DMUNmj9UybeUVPj0Px8+YK9m65KtGzYOX1U+uq9stQu5d4XTd1
	epua
X-Received: by 2002:a17:903:32ca:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2f03f20f8d0mr165896445ad.33.1795739794866;
        Thu, 26 Nov 2026 16:36:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 25/39] proj: upgrade 9.8.1 -> 9.9.0
Date: Thu, 26 Nov 2026 16:35:29 -0800
Message-ID: <20261127003543.2167775-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133195
Content-Type: text/plain; charset="utf-8"

- Database updated to EPSG v13.102; this resumes tracking EPSG after
  the revert to v12.029 done in 9.8.1.
- New operations: Transverse Mercator Zoned Grid System (EPSG:32600 and
  EPSG:32700), seismic bin grid methods, IVEA projection, TIN GeoPackage
  support in tinshift, faster Aitoff inverse.
- New API: proj_create_linear_3D_affine_parametric_conversion() and
  proj_crs_is_dynamic(); cs2cs warns about dynamic CRS without epoch.
- CMake: minimum version raised to 3.22.1, data dir is now
  ${CMAKE_INSTALL_DATADIR}/proj.

The upstream check regex already matches the release tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-navigation/proj/{proj_9.8.1.bb => proj_9.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/proj/{proj_9.8.1.bb => proj_9.9.0.bb} (90%)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.8.1.bb b/meta-oe/recipes-navigation/proj/proj_9.9.0.bb
similarity index 90%
rename from meta-oe/recipes-navigation/proj/proj_9.8.1.bb
rename to meta-oe/recipes-navigation/proj/proj_9.9.0.bb
index 0ed8db5c39..2204e214eb 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.8.1.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.9.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
 DEPENDS = "sqlite3 sqlite3-native"
 
 SRC_URI = "https://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "af5b731c145c1d13c4e3b4eeb7d167e94e845e440f71e3496b4ed8dae0291960"
+SRC_URI[sha256sum] = "791a0610547eeabb17006cfd49cdbd2034f3240f47ed5e88a1031811f4e2bcf3"
 
 UPSTREAM_CHECK_REGEX = "proj-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
 
