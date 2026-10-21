Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7536.1792574976195171946
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hRKDnBnw;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1517bda04a0so521340c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574975; x=1793179775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HOihMnDMJkcXyygoOReELhms2F3rzLvYN/eIk1Nou4=;
        b=hRKDnBnwMDXtcu+OU6CSVofNZbQJ638RcT5x5O0Iur6DtGEzf0rdNRCxxeStrJkdmM
         pLMAxjdT3lzUhxFDRUgN/W94V0OIAHh03kH87RAvFkgQm8tN0VsypFGGJ7dmX9Q9qsr8
         zCgMCpQO0uA1yw4IM84jgvddWjwPynQtTx/YTlxy56k5ikx/9tfOLC5s/5jNC4H7Y9uo
         oexHjxHRm84ROpT+VSQWRAUMtKz/OiO7UzbUdEbFUDZ/JphlUdmulBZePfIhXQ5xp7I1
         D9k2/WVOFjQgsMNxszFMAKR16V3v+I2c5I+E4RIX/BEVK5d18kxtbZfMh1qujHarMJsD
         fHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574975; x=1793179775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HOihMnDMJkcXyygoOReELhms2F3rzLvYN/eIk1Nou4=;
        b=OEF/15Q+BJmBttJMn7s/hBbn0RHEsalasga6nLSt6950h/bS779GRIGy3AJvECgIgf
         NmNAnO2qIeLGCST2P2TBmiRjEo5Ky8AwevkgPxQAiFawruxW8mKwRQC276ElPJIYLoTk
         +aAdC9emGvrEjMR39E24DW+x3qhH54bXWV9Mnc51wQi2qceq7fvP7yjx22d0QprEqEOn
         8mC38lInFBPU19ylwD+o6wOcFgcYSNqA0WhPYKtnLNTulKWaZCSfnosgRKK+kqLEKPdv
         j6PM55plIKPcBa52/UhoZfGv5Kru6XTCfOYd1B4gRsnITEccpsba/B11LQnxXQ5T/d87
         b17A==
X-Gm-Message-State: AFq9FYKbc0RyhbJuwwEPkpoXEWIX4zLUiXqJA/9yySfgEyHZFD5dIrgG
	DNeH8vtYIICdzcNosbz7tcv84kbcv3kZMBFEclIbmN2Ve6SP5/su+3Xdgtk7xw==
X-Gm-Gg: AYBFou3aFDtosetow//3Yz0mIqQD/cNEBpJjQzPgf8mWVWtFT8xBO6Zp2j6vsC6Goa7
	ANu5pnCExfWBc9cY+9ZJJGZHvmTbtvRw3bV3r9xM/CBAzldy3hbDrKe8cnE2P9MtYiPzxrEoPCT
	iTGgd6ljHheauiea+WFHnd9WVINWaWFu3s/oGaIUbSIuav8mObKPYIGud5nOZ6rX1K9jyRbshAu
	U6HvetNZfX9QWzgz4N7TjTj1X90WOKUQG37BWVoJ1sqaDYhYhGHVh+koL9HV2yeWxQDk2+FVolM
	hojMuwPYZ6fJrLcWNZNI7VdrLDZ73SEuOldXNk/de1XcdLedQpwhhCIS2RgCVblZuojh+EGWe4s
	FOJdPVjRTUL3eBA5S/3F+hlHKCb2hSXkKL9WaGTRurHJXLZ2RpbzYTx3MLvA5LTylAxfCnhEuYM
	beFveU1ub1zeLYOHXohrNNZ7vx64DPEa7pDRI7xyz7p8zuLnAAJ+T5cpvLogR1M89uRUZbUHu3T
	4fhjvc1uaZGS9j8rLbIwdea8+Erh+dSD5YsN6bDxikZ2rLXv6PX5TeUj3sTTdKCR6dV0nmG9Dfn
	irNmqKmivVhUnnLyxhTrBWLugu8ipAA=
X-Received: by 2002:a05:7022:b054:10b0:18a:8164:ce4 with SMTP id a92af1059eb24-1909aadde56mr2158016c88.0.1792574975507;
        Wed, 21 Oct 2026 02:29:35 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 14/44] python3-cbor2: upgrade 6.1.4 -> 6.1.5
Date: Wed, 21 Oct 2026 22:28:27 +1300
Message-ID: <20261021092857.3585453-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131201
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/agronholm/cbor2/releases/tag/6.1.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-cbor2_6.1.4.bb => python3-cbor2_6.1.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.1.4.bb => python3-cbor2_6.1.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
index 6a894848d6..94d3f30dbb 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "01ecc79a28f33d17331943ce508fc1e21f4b06553c73f874f4c77120d72b2ef9"
+SRC_URI[sha256sum] = "6eb06160c42315ac0c4ded461c7d84d92fa18c69d13d17fc1dfc1fae96580c95"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
