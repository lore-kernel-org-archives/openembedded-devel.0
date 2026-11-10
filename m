Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22.1794324471164454468
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=m8Nis396;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so25833905e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324469; x=1794929269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5Ip2tqXmkP9bh4Z6aOgA5bCdV1fAVc9frlBZZkjo5Q=;
        b=m8Nis396dkFKSa4WZvDqDPzMCGEGBdE0FpV4xKOIuufo6OMuR+5QGcnKaAQcapQw6Y
         CO8ttUa4qoT2Qmssf6mt26z9n1ms/hH458Bt5CIot+55hgG3XXJkmOeBo1IL6PUsm6Fc
         A7Re3qgqTOv/rkwf4aDcdXnf6KBT6ViWoQ830=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324469; x=1794929269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V5Ip2tqXmkP9bh4Z6aOgA5bCdV1fAVc9frlBZZkjo5Q=;
        b=hEfuJ44P/EfLpAy2Tny1bKw41x1g2Cc/sXyXroN6RZ9BId/L5UfrZB7jPYR8EicdPz
         1SUo/a5S0rM+B8JoBnrgveVp786cbTlbjA6orT5wuk0E4lxQYrAW3jfK61pDTEjUhI/f
         vjNta/V2LHPSFaJrxm28BSTnta2H0Y7q8Y/PFnS6msv0fiGAAXzQgNlDqb8AjBarBjuY
         inVFsD5EllaU7RNf4Z3fx2JVJRLS9lAYnpPHctiNnDglKrz+UuR6nWJ/Hp1HkxR+CRPx
         i32Y6NquYiWQMHa4Y35QV1tm1YDBU9Hpz5qLo9zxo/KIOf1ye78zcMa6nu/t9jRcw84w
         xF7Q==
X-Gm-Message-State: APuU4Z++9WX6oVtHfYwcc+1Z/MHMHxXHx5ji35aLqBr3oYLR4rr3TJYc
	tSWYzAEBJa2JQ68SX26bfDAiW0PhJ4MrZ7dTh0SOrobhB7OhsIVj9UERPU537AAGlZVN4jYWlxL
	zH7sp
X-Gm-Gg: AYBFou333aCuqIN6U0VDJkEa5bA3wNx4XcSdqkFIcQ4DcOvKMT68wUR04Lxf1HttWCA
	SA5+evsYI7Xx6eYJLYY5VBMKOCaT4pb8DmpEwtRp/sYm+6ivxTfOSoeOKfQY4Q0s2v5urgRKbSn
	wbtMyArAdxfeo0vBSiTEd181THE20cEpVSeKlxS2QJh5CtQOeYeX7eRpDzcAtjeVNiOTSEdOcZH
	KE4tuQaSfCp+qQ5TRTw4ewgYQTrp8OMtVz0SPBjVc1fZDaY9G+bttbQqo+JVALLb9cG/DJLZuuZ
	V35+1UYoN0tLLsDER+MEJwoO0f+PjQUUA5HOGhQ8x+OaxyKlFHdIWdS9xdei6FoeyBAb6Y7ApIs
	kwct73HcIyx2rfmMkaQJm2CTPHTkg4zBTjdad6ufdFfTlF8LFWnl4z0L7LNsymz7AfXd5nz6nrU
	IphGEHKBBVgxep5zIgvbj+MEsZez+H3tuCGoCvoTIY9POER0QaW8Bu/1+dSge5sEdFJswEutDSJ
	hwJqiA/Z5+Ks7LsmtGllLu1GK2PvnTFWKQudnSclWP+TVlDOsc0cHyTVuXlDkb6gL1aQawfyexi
	MlKk3Aw782ZJI9QAsaUKr8fbp/SiLzPfiSWz7LYUFf48ZwY/x9apVvz74pCRLeXUlpRPGN+jktf
	K4YKXp/pRahHwfY2kNqqjk0kveDB0yr0VAVDQfR6F1UCKO1IZsGA+qg==
X-Received: by 2002:a05:600c:8506:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ba02346b62mr53343405e9.18.1794324469249;
        Tue, 10 Nov 2026 07:27:49 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:48 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 18/19] python3-typer: Upgrade 0.27.3 -> 0.28.0
Date: Tue, 10 Nov 2026 17:27:28 +0200
Message-ID: <20261110152729.1065911-18-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132092
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.28.0:

Fixes:

- Ensure that the default option name is not changed by setting a
  metavar.

Docs:

- Enable Ruff formatting for Python in Markdown.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-typer_0.27.3.bb => python3-typer_0.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.27.3.bb => python3-typer_0.28.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.27.3.bb b/meta-python/recipes-devtools/python/python3-typer_0.28.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-typer_0.27.3.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.28.0.bb
index a334ad78e6..9d80300421 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.27.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.28.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "d0396f770a560ab1b0a8504e13b5f254b728cedb05c61cf0359e944e50ce8901"
+SRC_URI[sha256sum] = "69ab84ef79fd601cff071bbd2566d855ecadfd93adbc4b3360b9924359bdd857"
 
 inherit pypi python_pdm ptest
 
-- 
2.47.3

