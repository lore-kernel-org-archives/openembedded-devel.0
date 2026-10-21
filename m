Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8878.1792580511227904194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KQUXnN0Q;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfb76b304so63774f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580509; x=1793185309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7hZohA2JImra7p+jgS1B0FAhr7dwg9hG0WoF021y8o=;
        b=KQUXnN0Q9HG/B9RYTnXhykOrdrvwzVl7EnUjRM/qEQwgOZ5IHpQD64w6KkJJj7KIGb
         UoSQ1WHV+uHImq8XIl27mcwoQ/CB7N7j7FEfXlujU3vyi7t8pbhA47ItjPgP1i4yYz5T
         yKne2GkSJzNpLA8iIoVpZSOKT4ZDxuJcGWeu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580509; x=1793185309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7hZohA2JImra7p+jgS1B0FAhr7dwg9hG0WoF021y8o=;
        b=Gmp/HLZPOSJuyMN4sQbRcHtSW5GoqPaodqVrSJIExbCRul8c5ItFjXsQam1dkHcEnU
         WLgEzDxdMB0kh0H04gN09rzlK6jY9eaePAbFc61dXD0Unf6QEXW7o8FAcgZgDUNHIlbR
         viHBOf2ihiBg/1/6OobMsbyigFJG8bTfG0b4l0P1vocyoo9J84znDVAu/aaFHTy34X5P
         SzhhQmep3k4RWf0a19TgD5LTlorwtHpynKY0Yu9PLnDYd/hDk3nGx0mA10jWAEIMe5uE
         Gyv61N0Ugdl5zUfEtoAwBIK+Gg4lrNY5qagjinFlGzrdALRcBalUAlNIEnGi/cyseYm1
         KOsw==
X-Gm-Message-State: AFq9FYIiFDgy9i4TllW8pl4b2x7cM2Qh6gmJCPwzYcb5wSqsKHAMjpx2
	bhLhvHFiEQSQauG3JVupgCWVUjSp1YSnXbMclnZ9AxtL88ksrrmTnjB34maZN1FQhMWAyEy3THt
	LR0f9
X-Gm-Gg: AYBFou2IYd5K8qz3Q6Pxx7D3Xfs5FCCUr0pF3n8Jdb+9zBomGPT7iR8BWNJTEwX+v6l
	hILRA7luelWFRDdXWAE3Z/EtqBZ2mCUL0EQ4ZWxl0ARTNDwS4JP/03cI1qScFWT7vM5kjGPJETt
	sbFlkfksYG8l4CIbg9khyI8zfL8aoHHOuygC2VnVzhuq4O6dfXhNW2IQNquGpzjOdVc4MrOMb92
	G0yfS85jxVVBKVUZa0ji+0AOlSzgUoG22iYCt2uufngoEoj3oHzQm4sjibv5tq0H6iDPqwqtLZA
	Gf9yHPIGtGXQbYf9FY4yVeycB7FWT913XdcH+8CLJbL56i/oIOKBk0wLvRpJ/BIJG6lBXBgS3rP
	XW64g0uClLtfHrh/Z+NmDQBQInDm3D0X8DMvEt+gUw0nJgAvCOjsuyZOO8XRiQ8i09Tjh8Tn9aL
	R1VBUcimocwpCIY3jpGfFBALKNtQcP+NefpgtUxp0KG8NbY0Dlbdv5wn0+c5RheHdS7L2161HI3
	VjzEPGKuICAxog8t5mFXN7+QVcpqatd4P5iqf4ElrGRm/oeICl0O6CaM1n2dSIlxbU3t3wlIhny
	Zqj4haKqNTTtmtT2x7Jah6Pza7Ca0/4bNW9nnYKm4tvVELBBUclTHDX3cv4ePb0c9gNsoe3y0W5
	aUm8RCRihYDlKIEOFwIMN23mNog==
X-Received: by 2002:a05:6000:1111:b0:48d:fed0:ccbd with SMTP id ffacd0b85a97d-48e264caa01mr2377519f8f.34.1792580509304;
        Wed, 21 Oct 2026 04:01:49 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:48 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 24/36] python3-jsonpatch: Upgrade 1.33 -> 1.36
Date: Wed, 21 Oct 2026 14:00:48 +0300
Message-ID: <20261021110103.1943456-24-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131283
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.36:

- Honor optimization=False when generating patches
- Preserve the original file when in-place CLI replacement fails

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.33.bb => python3-jsonpatch_1.36.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.33.bb => python3-jsonpatch_1.36.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
index 6a1715c6df..3107eddb52 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
+SRC_URI[sha256sum] = "7e110cb3c5a1c8768f7170bf8fb9887c4aa575fba74c95239e868b494bd9a522"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

