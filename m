Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6259.1792499551538419179
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q/vy+qwb;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so16526805e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499549; x=1793104349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSCQbFHsyzj2bBizNRyMZ5T7JFCxr3p4/vT8Eo3CSas=;
        b=q/vy+qwb1NSExgJoalr3mu+PKYEWNZNpPDc8EKysWSeg+etaxcWTRlfhT4pT5P7ZRJ
         07U8r03i0DXgJsIMG1SfQh99g4EQCQohwkd4zUxm1DP8OYRInNWfZaBY6xahcFI+iOi4
         eMRm0e1N+GDEk0jiXhxSfIpHhHfcsed9/3tN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499549; x=1793104349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSCQbFHsyzj2bBizNRyMZ5T7JFCxr3p4/vT8Eo3CSas=;
        b=RoWk6xYKUhVQ0h1+vMmKjIV2URvlCqLTdC8Ng+1MgZXfK/ByfcgIZ8iaPFfSndng2E
         ZlZ0jau3EKiMHW3brfWp/BD4wRaAyllnHAMD3wR+o8BzrI5epcAU2o6oJWIlhcn7ikq3
         xNAnmujpqqZV72aLsyfrXFhuX6fZ7kXZzh8gljeUc4/PKIUOhfFBzdPeBjvFKynCFsex
         HzCLObLIYWkkyhn0LGIUU/rKAmyFLGUzAXiJbSnKGkGstX1qvigGn2hQdTFsymUeoRlJ
         1GVR7eKYVXx1Wj0BbjsGOMJoBItd6GXTp66NxpNMdIrS/MgKT+7RxZmys7DEza0m1WYz
         DxUA==
X-Gm-Message-State: AFq9FYIBQyGlfalcpsTQqx10+IOg71KuZFQLuH5ofIviwvOv1LlY41bM
	kysLs23V4c7jXxvFdc8+u4Rh0nmarh639sybvc7tEilILIUKIJIow1HSbkz9Bhjwu76V3rxkDg3
	lFOCX
X-Gm-Gg: AYBFou1HEXj9l1nPP2bh+rFIlr9eKJ06q5H055dB4moNmvE4ZEDSMyC8rSolhuKTY+J
	xRuPUppQRUUr0M9inDGT/207fmpz5InDRbhHZRIG1aKyvb1Uzci2kZrgEmXNmZJkWbm1g+h02V0
	WNJ6VJjSVOHLqKHZEP6MRrkPVFuRet9s1TIh4X+iD86zSfqTNq5yLa2kyr1otGCJ9W4e7depAeJ
	ynPGzkrNDuLh7B0Lz1FpQveRRkCcIZxzEXIcBwFXfhYT8oyPx8IZAyK6gphbq7GsQjEYtyZXX/X
	CafhzALyHwsiE7Mlcrp85ugb5wV+8yorV3oj267d/WADPCnEkCk/BZvs6aG76wEJ+b4ekbIqjg/
	on61ETT963L2t4uOGUY6cZ8/AUWJ9WzBdmqpdZza8rYuJ/8gc4O3073kHAbtUymnUu+XWyLtQJx
	O10aI0zic/K2oz4SCHiFhkSZTsPlrwMtsa8DMBsDHhS52RxUiHkNMf0sLpvMP6sAtkXanpT+EDZ
	ZA2qNSpcf8fr8PBicCnuoNY7QE9Vqo/8p6/fIYVCmndJqsm9Ccf32D839O8N57SV1S/xVvTqwKW
	a43VYHZWujVpaddccJKHDltzwuitaoemzA==
X-Received: by 2002:a05:600c:3b91:b0:4a1:e0b7:ff09 with SMTP id 5b1f17b1804b1-4a1e0b80060mr205955105e9.33.1792499549445;
        Tue, 20 Oct 2026 05:32:29 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/14] python3-bitarray: Upgrade 3.12.2 -> 3.12.3
Date: Tue, 20 Oct 2026 15:32:13 +0300
Message-ID: <20261020123226.4033600-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131159
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.12.3:

- Fix unaligned buffer handling on sparc64
- Preserve bitarray subtypes in operation return type hints
- Fix Hashable detection on Windows
- Add workflow to build and test on SPARC64, RISC-V and NetBSD 11
  (amd64) (all successful)
- Add documentation for [platform support](platforms.rst)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_3.12.2.bb => python3-bitarray_3.12.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.12.2.bb => python3-bitarray_3.12.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.12.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.12.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.12.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.12.3.bb
index 93be8393f1..dff01f0aa9 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.12.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "940b64a0701cea18c0698ef23ec2d9a038e47103b0402b19cfb298d71817d27b"
+SRC_URI[sha256sum] = "919e35a951c0a551631b94bf568f3f5e38d004e0c60866cb2ca51bd8c4778fec"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.47.3

