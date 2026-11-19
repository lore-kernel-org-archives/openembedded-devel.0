Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.459.1795102826156984049
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GsZPn5YJ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2133039f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102824; x=1795707624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zdz+I2RjhgRVMnSe/NbCQMi8rMhSLhSPP5QttnUv+dM=;
        b=GsZPn5YJwfQemw4oGa1YRVX0QsoTIRMmKIIKMvbbyOqwKwrFG2vutwadbw6LJXz94+
         MdepRe9GEisaNfQJV8RWmVdDs5+MRqRfAMliBgrOwOKmJoVlTO/qa8L48gqLmudB3vcI
         UoM+myu5Gj8uza3RYtshlUGWWXOtfExMm5P8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102824; x=1795707624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zdz+I2RjhgRVMnSe/NbCQMi8rMhSLhSPP5QttnUv+dM=;
        b=qXfcs14bXjHofVxHjv/eP1iwRAzNrwjdzu5n16I5dwAPmO9uT3NP1YkAbhJgG5Y94u
         hFDKtc6nlhVQkQGWs+gM7fDKui7sONfb1p56tzDS5nqEpUvPkKTpXuEboPzQaGGodO5h
         mQ2XxV6hDWKt4WqyCDQNQ8jP+XlmFAzhgPJk0RCYezohNSA472MmhyG9mP3fyfjYE83c
         6BSATsbsOJMR1YUkn0qJtj/cSqQ27Lk7ZJD/GsNW5P5tzsyr3kURi7lOfDDsyAToQjdM
         yuv/XKrj2sF0tv9d3fNaUy9tJ4v5z9jVyV0Agv0QFvBl+uhA/buPDJfHw1uiavetr6y6
         DrBA==
X-Gm-Message-State: APuU4Z86+ppjZhNJa72WQttRJWtKN+FtNMoq5RCg61hKUMG+XL2NQqJJ
	7ALkuMZsklU03P21w+S3XRXKYZRlmVT22g8ZwUNah7is5m1oIds9FNcKywSdKl5gOHZ7vxaDiR8
	o5rDs
X-Gm-Gg: AZFdTZfsjQfESWICdcGYDZZrOY1cvSZNmekH8JXg9u0MeKFP+k4jaT+z0B308RrwWRU
	27ljL1I436YLdW1QnecAj2t+j74CXLGM6hhrdbW2eJhAWLL+5EiWUe1K+rGa6Ib1u3sDJKvJXub
	HLuSt5a7Iez/IqQBdCIGsZXFO2cWHlLboh31hbDvmdEJjcItk7JxJPqTbA7/+BVNWQi+m/ewrmv
	pmr+PmQoIjIbI+qGB+lV7DdXLvLWzABesCLKXIcXAOn0sKJCF82CDHuI3ZzPYrGWd49aMWs0qs6
	LKFTuMa32R3LYwX3wU5cihrJPRar2TMiy976+E+GLHM6VrZ2tgGI5Iy2BrumMOL3fvmS+3TnCHU
	PenLuZz99onYuPZ2l73vQwZBtjORA3GkjAVntWpmxb5jpfTbnJYRmv7NnFhSCkn7PGEalCcMsNQ
	cZzzFjgECPNA3kX1wgqo49+K4kw+e23V73Pgx7vtVrfzUIkFtQtOCwh/UBwe1PAkYZJH4WuvXFP
	+H1z9QDqE8e9qPGI4XxZi3kx9H2EKk7nrBaKLHWWNBxQLm44h+DrNShA+CJzvKFN8MHmhp42Lu3
	58bMG/HGLmWmDj3qm73DJEID7yhaIvpgBV3OczrFuNh9F+mLL5EWtpNKOlK497HQ9yUPyYc2Mtt
	Xpj1tqdlIq7yG/u+KLGOn31nwut7OizcbkBnUMg4Bm2vz36+Ez6uooA==
X-Received: by 2002:a05:6000:4a04:b0:4a6:8012:19a with SMTP id ffacd0b85a97d-4a68012033bmr11582975f8f.22.1795102824322;
        Thu, 19 Nov 2026 07:40:24 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/11] python3-inline-snapshot: Upgrade 0.36.2 -> 0.37.0
Date: Thu, 19 Nov 2026 17:40:09 +0200
Message-ID: <20261119154014.1039002-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132684
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.37.0:

- Added is_snapshot() so extensions can recognize inline and
  external snapshot objects.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ine-snapshot_0.36.2.bb => python3-inline-snapshot_0.37.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.36.2.bb => python3-inline-snapshot_0.37.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.2.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.37.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.2.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.37.0.bb
index e854384776..48e27b988f 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.2.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.37.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "fb30d99a915a768d1c46ab5b7576b7ee2a8d60eb31063a14ada305c05bb5ffc8"
+SRC_URI[sha256sum] = "9de2ef1a246ee0af9b2c7d12bd14ad5a5977b8897c4d5f94e7f6251ab5196f1b"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

