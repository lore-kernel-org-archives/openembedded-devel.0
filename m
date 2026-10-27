Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14842.1793092857428450208
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LJQyBoSZ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso15270915e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092856; x=1793697656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvKHFFubhZ9iQpuA9UqgW5b0p5Onfq8VHSuVoAGrQ2g=;
        b=LJQyBoSZr18IrXmuYP9gUHBVcL8aBh+ctmv8PgHap6unhj05QHMNIIbeCLgf6HUQoK
         jWePEJ2PQfET3CpQnP1hsoYs89Jy5tCVB7pabqTIvp/E0/USXklOTiIDZ33+ZIynpppv
         kK9xSo6pTu1HLrFdhBX9DDL3deTuyskEJG5RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092856; x=1793697656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RvKHFFubhZ9iQpuA9UqgW5b0p5Onfq8VHSuVoAGrQ2g=;
        b=ZXI4Xg1i4dA6qLksKvrZEA6k0yidqPU3FiCbh8HBZzGVd+s3tnBR2069OPJVrRIzeD
         dPzmT3QGuEgtZ7dx65fKNLI9rTtpA9t8yQFL/XlJBkP6GowKjiSyxyg3N4h4zVtYbS+z
         eZP4izk+oZdl45XGLokCVynJ2huHJk2BWRByQ/xiy87VK4HEbmod+dPge52VRh+kOw+b
         Ybl1quiJ/HJ1BtC2fGQEVR26pQGxAoQqYXPpD9Vo4NAxfH/SOViPTzjZWMV3dW1kE+7+
         Cj5VCAOMEHtRdl/+wFasOQiWpv2Lx+Fb9zsI8ahahBX7QDsUpgviWcvNfUNFmM5D8d+f
         OKDQ==
X-Gm-Message-State: AFq9FYKZ7REb6EN0eniM5DlFoCYHwq8Rhu0/xrPRwdELhJmENpto7zZb
	wmuwsacWmxwUsB2wjkYBGJSzsVlCoWJaywSilLbM8YPkaIZMGq0XIfTkpMrgGbMAs6KczZObMzB
	Ftoku
X-Gm-Gg: AYBFou0yhXtA6VQy1bclD5lli+SegiYlWCSIYJU1xEu2JbMyqsf5mMPFRm54F58IxO+
	YcHbSCNXzzgMKGdY7KJ13BBh7n0+C+FEbkyI7ik55HHs22EeBPr1/+EU7SwPWIOIbhNpEmj/UKC
	Yvd7QgYTGwO+CyYswgu3G/17Btn1qkOmZvzmK63ek63Ac/vGtirtFS/xtbB9sqWEhZE/CYcgsBs
	Yy5yYNMfPm3GgH2e0Fesu57xlHvagwSnpQPL/wGJozZCmoFyTwuEXi9rdKDy/JQ7xanggdPCKec
	zc0jyOPdHRePIX7B0BRWSEe1S0xTRBZh18a7jM7uxRnuE/LONgzKnw+Cd8py0O2HZZf9aYiPpHi
	e5sf0w+wTYbx58X7LT5j1npSy7kw81WvB82ctgynUyme+Bn/r4PdIb6xYaGbXmlNCTPzv/IeF3s
	E5MfmYWE7xjWMZhJPU085biRsR8c5Rv93dAQsvoFyq9nWrvOr0Bygge9c8Cu9uHJRQzEuVvUMMB
	mUr7Smc3lVj4YyEkFLF7unsLNc8OJ9Mw7bvbKVijmhX2hu6XUzcOU8/2+MAT2kDPlenaQWIQcIr
	QN0/OvNfqt5tLx2pIHhbIHAgvD9WVx/TjO07vDxotbOyQOuKfiGdQtfqAQmHF8L7WsvuxGEaRas
	0W96S
X-Received: by 2002:a05:600c:4e4b:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4a35aca5bd3mr159036375e9.16.1793092855725;
        Tue, 27 Oct 2026 02:20:55 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:55 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 22/61] python3-pymodbus: Upgrade 3.15.0 -> 3.16.1
Date: Tue, 27 Oct 2026 11:19:49 +0200
Message-ID: <20261027092028.782979-22-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131486
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.16.1:

- Revert changes to serialTransport (allow no pyserial).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymodbus_3.15.0.bb => python3-pymodbus_3.16.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.15.0.bb => python3-pymodbus_3.16.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.16.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.16.1.bb
index 8debc4c067..f843b931f5 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.16.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "4c5f715128bfeba59f4c9fb3542b0c32a8afd4b90081111e39c12f7af0c89aae"
+SRC_URI[sha256sum] = "19e571826dff37860afc31c845c1fd2fb72acffca02a233506b32d94fa022c33"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

