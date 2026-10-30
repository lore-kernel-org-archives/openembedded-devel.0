Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8948.1793358224500382985
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UKxrn3ug;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4649b35bso532075f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358223; x=1793963023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYtsCJ2E8k34HmvadH5EfG8yu5ODv414uGJZ5CFZGT0=;
        b=UKxrn3ugDoY/dnyRfks0z55y7iXY5GnfdfH1ofggX36myfyrV3Xj/kxPfMLAx3H6v4
         U0WBU751sw3IIUSTOKymhaUGAarcaB/xFLoHlxhZDAa7ojdLCM6ISHmzB5S63dpACE7K
         1g4yXxsqlPXfAmMmGYl9hawjwhMnU2ZVsU7SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358223; x=1793963023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYtsCJ2E8k34HmvadH5EfG8yu5ODv414uGJZ5CFZGT0=;
        b=gf231wXQ5e+KIT1Mm4QsMss9+wVSBGxI7RnXYi58JxzwBz6MCamnbJJqmQgtvm9Bn4
         jYa1WQmtPR649FAZC5KBBViepYnJwf8LzsBa3SBqpYrZLMkZ0pTbl0NQM9D0XQ4hX1aH
         qw81dTZnHzWdrZ0PAYf4VlJSC/AmK8BDTtNDWDdJJNciHgEB1cl5w27RkO7ZdaltOYlz
         r9nIC43xnFYLJ5ZTyTP/vCtjeDC6tRrr/aVALmv9nNdAPtIB5Q+gMzn/yvthmEgZU2BY
         XaJSbxJsYDPYD85kfiYid+hXuoXUqdMMQDliMTL3thC7IBtrI6ifLa369x+5V1EmPSvC
         63Wg==
X-Gm-Message-State: AFq9FYIXUZSqRqfbuHkSuABnaP22zxtKF3g+Xy4YwZ9N5cGJ8MskpMlF
	s8pDj9Ir8+mVJSwzmTfeB2aYshpsR5TX66oWGRCaJuPc7Vjg5owFpYw5HvBcEO61XEVlG8mefMa
	7N8LZ
X-Gm-Gg: AYBFou0UhLig3zf75vZztiyX7crZn5Fx+nmZtU1+fpT8lxZNS/EgvU4CQ1W7uprlmRy
	ZvWGufYj26a45+5rwUJVRbY81CyKgQXhV/HMoF+4WWknvREAjnSoiXQgi7KGYcXTKZv4n24LfXq
	DAryKEHvDP1tgr+1R9N9uiRXlYSc/GG7UHKSCx95N2xp1Z0c1mdFYUnznTFFKIZ/32RjxBkaq07
	s04jUqoh7Sd2SsUPkTHfWot8jYOnHmW9owqZjjgYsOwDqfUqtVo+UZsPSZF2FwRGRUAkvD/MezS
	3Qxbp9AsqxUAucFfnBrGcQjGru9GAXl41ddzPuartyGko42y0aRURe9dXITvxwDensTCIcDztFz
	l3PYI7HQeOSmjVGbz1Iz4zkMgigQslbHP0Py9FzbEHkHzK0KVD1S22H+H98XzrbOzlil8cKYVtq
	GnCcdnbF4eJkA9NX5Ok3v/Vl4Akp1x8g5AhGXVnPBN+cIKnR33YsZRnVmwEnHdIsZ8orYwKfJg6
	Y6vOcfxm/fSvAb02C3lKwI9D5oqItCY725ftj6IN+MaPTKcOYGkBLrYKhA9qFc5c8bB3//ezX4t
	AvvREhc6WDu/QvQOzyrHRqa9Gpa2w9QdougJlByaBdFOPFGOipNAX6lUzKlPsnJvfefXRbbCY4T
	vPQ8zala5dj2TW4iotHrWrYk6s9FcFGwaTZQH9GNHDni7h5V2/NKRMA==
X-Received: by 2002:a5d:5e02:0:b0:488:8232:d16e with SMTP id ffacd0b85a97d-48e6e50b12dmr4619542f8f.45.1793358222187;
        Fri, 30 Oct 2026 04:03:42 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:41 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 22/25] python3-hexbytes: Upgrade 1.3.1 -> 2.0.0
Date: Fri, 30 Oct 2026 13:03:06 +0200
Message-ID: <20261030110309.1124614-22-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131704
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.0.0:

- Add support for Python 3.13 & 3.14
- Drop support for Python 3.8 & 3.9
- performance: remove redundant cast
- chore: partial upgrade project management to ApeWorX standard
- fix(docs): build with uv
- fix(docs): skip --locked because uv.lock file is not used
- fix(docs): use official uv install command

Fixes:

WARNING: python3-hexbytes-2.0.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-hexbytes_1.3.1.bb => python3-hexbytes_2.0.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-hexbytes_1.3.1.bb => python3-hexbytes_2.0.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_1.3.1.bb b/meta-python/recipes-devtools/python/python3-hexbytes_2.0.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-hexbytes_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-hexbytes_2.0.0.bb
index 79eb54255e..d55341c544 100644
--- a/meta-python/recipes-devtools/python/python3-hexbytes_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_2.0.0.bb
@@ -4,9 +4,14 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a26e64020156e806cf0054a6d504b301"
 
-SRC_URI[sha256sum] = "a657eebebdfe27254336f98d8af6e2236f3f83aed164b87466b6cf6c5f5a4765"
+SRC_URI[sha256sum] = "01312fcd5c57e8a8d2d7dd3274dcf84ea50422aff2abcc2d9fd89ad6a32498e5"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "\
+    python3-wheel-native \
+    python3-setuptools-scm-native \
+"
 
 RDEPENDS:${PN} += " \
     python3-core \
-- 
2.47.3

