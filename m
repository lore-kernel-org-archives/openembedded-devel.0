Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2531.1794961621726181279
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BIhBnOKe;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-382f4710a17so6452eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961621; x=1795566421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9HSl2FnKESezVvsAkn8dNOY9euTCrlUrjaqDHyrkDc=;
        b=BIhBnOKeyXUyNHAsZzjGwdcsZEn69uniWGii/fQR3ZwMv5OGg9aPE7vMTNMnDIyz+h
         3CP5EQOjo9hvg7dD9HlBf54a5Tl4/sOvHcnxrErgFsOnCr+55/5jZzWk1Hw2jOU124Ui
         iMAUKG3b24KEv6y9P0INeg9bZNcEOsEQg9DNTIfjMOaEUVI8Er564QayosBWwaELx8A8
         NNipXBOrlAsoYYy1PkFXkUTw8sjjn4tOzChb70xFgwT0RFr6Qg1fGRpZdxlGjMrtJ5SK
         gimSSouIVFACngkehHa7SzCgcS5wzqY7Ihk7c+/Y/+1tUN2UuLzB66+mGj0n6uBoabWg
         Mx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961621; x=1795566421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x9HSl2FnKESezVvsAkn8dNOY9euTCrlUrjaqDHyrkDc=;
        b=KkvYquaLEq1NfJ7lHt3HBynkf32z4rFBh0HgEYjVP+5CMnkP8agu4Lb6drZqah3Aaj
         n5N8WBa1oMVElCsaFiI8BvJgcVOXSqVdfrW2hF12OBorvO24d8qZs9fxpQy9X0mI2JfR
         1u0br738LvKq7Jwq3PRaF49U5FE0EaL9GCP1gRH8gVHsgZ/vvj4Pb1vp1tlwNjaTcXRp
         KaTdNxmESzRWudP3kX8BjYzkX9HA5vyRtxX8I5uHS/Ag4BmpH4LBzoZODFmX6Z2HZZji
         BfHFhUrLmBci7Kj9PtVIknpgZDA8dMpbrG3aYoQ+BfCNgcYiHP8pHvDh4PVyao2tUWrz
         ikHw==
X-Gm-Message-State: APuU4Z/a4Yo9oHinXVk/5x8Eqw3++RBljag7I5Vapucg4djZysiyHW2k
	R5EDHielrLzEIJkN05pMKOhDhr1UWDFBN4XbPzX1gzoHjid+1tjqeoy0IYdq5GRj
X-Gm-Gg: AZFdTZfxXHry85NGSMwMhlsaDDCrqGecrNzBVYAq/Fiu6xv5HiorBAp/Jigza4OsrDt
	zOZ1OvBF00Vw1SMI9Hu0r4sXEcRHvGW71mWMhH0k4yrZ/0JOJskugf53d9a0WJhoAO8bsLBlnCS
	Dsai2Pul3X03e/zGfx8ZqoSMgfyje8xwGFtrlk6oCbjZMWSENwquueVmlev4cl80zATt9xuItOJ
	1OBXm0PjkNO1HeCKYsDJ4Og7HupAUlF3jxGXoVyuniXvkrh1k3NCB2R3YpLeYeb42TmA75yJIWB
	mEdY0CqkZTemaoHto4vrrJYvlYSeTdea1CXDCnGqEQNAoK5Om8vdwg/n+/ruLDUlugOSGmDvps9
	nw5C0K2DghLpuKJnBfd8zcNb7pu7Gax42VkWqAte30OdbxiL9SbNM8HLHq21BEY96/+oQG4kIkD
	GRR/byHjC1mb0JTjpswjfqeGZYB4zAqY207zZyotMyGYdsEd9zWYKomEuggjabPldoLaApGm+lT
	UyK2o19HOlt+TPwloXzJqcHcBfchVpKqnESW43H40/kPrw2iup/0WElz7N628Kyd50+YZK8G5Rq
	jMrUtc7Sre7hNuWw7yzD/i7D/59pyHXm9fggaprDkKOFuErhXLTb9UTFaQnXzCsMKHMXNFpkqu5
	Hkqbj2ik7ZzeqWAf8D7tmhByxfspTUmrJ5AE22MnNVGivBwmG87FmUyhI8m+t4XU+nLlTZ6idtK
	FBSGDSfDTOoecfjdcZOqiSY6VYLs1UmvoVC3YReDp4s8bWlRmmJ85IaxBYnQEiMQ1cb8hAYFNuV
	NFERUVwd2J5S6e7+O6/HZKzbaNEHt1Az5033bxVcPuZhL1pOFMIlW4OB2wmBhWkiwuV1Slp/O6W
	kbdz
X-Received: by 2002:a05:7300:cf96:b0:381:17f:2735 with SMTP id 5a478bee46e88-38281523ee1mr1133972eec.27.1794961621008;
        Tue, 17 Nov 2026 16:27:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:27:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/14] mongodb, redis: Use SPDX SSPL-1.0 identifier
Date: Tue, 17 Nov 2026 16:26:42 -0800
Message-ID: <20261118002643.29829-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132615
Content-Type: text/plain; charset="utf-8"

The layer-local SSPL-1 text is identical to the SPDX SSPL-1.0 license
in oe-core; use the standard identifier instead of LicenseRef-SSPL-1.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 2 +-
 meta-oe/recipes-extended/redis/redis_8.10.3.bb                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 6c4fdf91a9..a0dbf36b24 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "mongodb"
-LICENSE = "Apache-2.0 AND Zlib AND LicenseRef-SSPL-1"
+LICENSE = "Apache-2.0 AND Zlib AND SSPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE-Community.txt;md5=3a865f27f11f43ecbe542d9ea387dcf1 \
                     file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
diff --git a/meta-oe/recipes-extended/redis/redis_8.10.3.bb b/meta-oe/recipes-extended/redis/redis_8.10.3.bb
index 240eb4143f..5cf8e6fdbb 100644
--- a/meta-oe/recipes-extended/redis/redis_8.10.3.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.10.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Redis key-value store"
 DESCRIPTION = "Redis is an open source, advanced key-value store."
 HOMEPAGE = "http://redis.io"
 SECTION = "libs"
-LICENSE = "AGPL-3.0-only OR LicenseRef-RSAL-2 OR LicenseRef-SSPL-1"
+LICENSE = "AGPL-3.0-only OR LicenseRef-RSAL-2 OR SSPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9f1da87999fb281d8a9e3e3b2d0403b4"
 DEPENDS = "readline lua ncurses"
 
