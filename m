Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3F2C98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 08:06:50 +0000 (UTC)
Received: from mail-wr2-f31.google.com (mail-wr2-f31.google.com [74.125.225.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2899.1790237208356373673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2026 01:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tbAy/2Hs;
 spf=pass (domain: konsulko.com, ip: 74.125.225.95, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f31.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1144510f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 01:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790237206; x=1790842006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2AkBA7CzgZtBzSWq10cqJHw8MQ1IYEE74huTjaHiHk=;
        b=tbAy/2HssSG2Iz2NVAAfBJy9t3AuXriC9WEY5wIUsyMJOppdenpQ6H5gr9RYHNPK6o
         duHLN3Zz4huGgGp1VPZKB0Ny3JII9wuw6SRWyxsJeEoqdNb52qp9X3gDbL1ShQK29xZE
         bv4g5h7vD/+dSbCE4JqbrE7sRSI2W0Id+RWfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790237206; x=1790842006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2AkBA7CzgZtBzSWq10cqJHw8MQ1IYEE74huTjaHiHk=;
        b=0hGudSL0rE0S4EfKlD/qs2vSM9q0w9yaJvunxpZNDHB6xOkLG5BePMVIShMVFjxRqU
         JR6jwvHuxbLvCm1BftDuiLOTGPhs1/vfVW8Qn2SUq24XOJny4/qG9a7Y/53pltNk49Ns
         4qYw8NJEfhulkp0rbFPYgX59dlt9L8OSiJ11Nxz71eD/Dhyj7H7VXBy4mafTxnB2GCRK
         E3SU+KNfDmshaZQPhUaSzB3e4n8/XcjRZY1b0rp2ycdXsGpMT5BOcmu52obzlqGcXPQI
         FGBMSwLp6Uex7ycAHpYmS2OED+aRg/YrPYMvvZCXG068xD3oaFdKC7DsK+PtMVkRh+Zg
         +aWQ==
X-Gm-Message-State: AFuF++nHYrsMtGZ7AQPQmz9vaCKeOyl6AZc/NEqb0y4+WTd7I2FPoUPB
	I5fFu7fshKaUAwLR45K7uTr9xKHLkrU/T6CkQLKCTD3l828cUmP4EjZ0QYK/w2dXXNMV2TVFVFC
	FYoba
X-Gm-Gg: AYBFou0aQEK9fviTOJQqvSEgTRG9y1FexeaufAXBxxAohdImd5Ac/qWO/0gLuuZ1m3i
	X8zUBfn6Q4dE69dCtJl39hflafxc2ktVJHfgKM+G0XkFNCr8X2OxnN6Gv9Nq3+VIA9JJ5I7K8dN
	ecK6+BGQhr1P9b/nYfjHWASG22bv9xV6MF5Wh0eXnFVX0V3jl/FwSFC4ixnBhCJ/JRoKoiFbafE
	68eq03cShO7Yl2i1nP4SYGuoVVFnk3rR/8Dq4oXyd9LnHAf5Qye1sYxGkG3tfEKDAAU5n0Gyg42
	eC2i2TJwD0awfBvd00qDqVZ8DIYjis6ZHuZkuTYKQY7+bCTXhNkGmRfLeG+kKLOb33E0HkRvqxx
	YjGSgnIY+1/+QYGX79rXAE22npATmsKOomsX8QlIwR6O3PJCiXn2f9ADyP+Kpi5q17FjxpodBHM
	QlY4d3HD5UJTllkIq+UL23sYk3rrny5qg3badL2e6HwndfXXFmp9IwWFba5KmH2KgtZtWBJiaNX
	C94hFvvNqyahBY7KhIce9unRP2ya5jNPpfrMSaYsZhPx9u7qItJNPOfj/W3I3qf07mz6GLG3L6P
	qcN8dJL644eLvKXYy80566hcoFB+xbEl/g==
X-Received: by 2002:a05:6000:40e1:b0:487:27f6:a4cd with SMTP id ffacd0b85a97d-488716a5fb3mr2838150f8f.29.1790237206345;
        Thu, 24 Sep 2026 01:06:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c64dsm13109301f8f.21.2026.09.24.01.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:06:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH] python3-pillow-heif: Upgrade 1.5.0 -> 1.8.0
Date: Thu, 24 Sep 2026 11:06:43 +0300
Message-ID: <20260924080643.3583769-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 08:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130282

Upgrade to release 1.8.0:

- Reading of entity groups: entity_groups key in info dictionary,
  tells which images form a stereo pair in spatial photos.
- Decoding of embedded thumbnails: HeifImage.get_thumbnail method
  and draft in the Pillow plugin, Image.thumbnail() uses them
  instead of decoding the full image.
- Minimum required libheif version is 1.23.4.
- libheif was updated from the 1.23.3 to 1.23.4 version.
- libde265 was updated from the 1.1.2 to 1.1.3 version.
- Segmentation fault when opening a file whose metadata item type
  is not valid UTF-8.
- Pillow plugin: load() of a multi-frame image reloaded the frame
  data on every call, discarding in-place changes and failing after
  thumbnail().
- A depth image of an item type that libheif cannot decode made the
  whole file unreadable with libheif 1.23.4, such depth images are
  now skipped.
- Type checkers treated the names imported from pillow_heif as
  private since the py.typed marker was added in 1.7.0:
  Pyright/Pylance and mypy --strict reported them as not exported,
  Pyright/Pylance autocompletion did not offer them.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-pillow-heif_1.5.0.bb => python3-pillow-heif_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-devtools/python/{python3-pillow-heif_1.5.0.bb => python3-pillow-heif_1.8.0.bb} (85%)

diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.0.bb
similarity index 85%
rename from meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb
rename to meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.0.bb
index fe1ae909d5..0a83129d1d 100644
--- a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "pillow_heif"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://0001-setup.py-support-cross-compiling.patch"
-SRC_URI[sha256sum] = "16b11a37b762ff42da2d36527bb5cb14bd9194c24c389ee911155d6e23c53065"
+SRC_URI[sha256sum] = "e47c27432c6fd3d66c22f0de9f27fd379383b646c947520bc485854ce72060d0"
 
 DEPENDS += "libheif python3-wheel-native"
 
-- 
2.47.3


