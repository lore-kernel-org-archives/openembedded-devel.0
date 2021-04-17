Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.3513.1618693580256586208
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eiUZYkzB;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t22so21584208pgu.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=X2Osm4g7ngVFk1m99rE+5DzbxBqP0jSlXOcSB+MHgOs=;
        b=eiUZYkzB1Fho1Zcnf2FpNzkdHPgQB+Mw/NmkP9R2nHFmnoUgm6Irexu08auflINQuW
         3Fndta0JAOVQGmAWpjRPme0X5PEBxshGM3Vol3JNP8tPMP0yt8uqrjtD6lGdUOHQWbs+
         4kKEFR8t2cC/UJrXT7ryjk9X/mETo/iJtHEyc6QZfEHVRavhuc1vver54rHxrvGyiKMP
         +bKbVSiKR3TyDSHgZoJE1b0YVbpejq8JAV4fyjH3Q+ZdAHAt8ZYRHleVtogXBJfVRA4o
         1EPBr5ZWpg2jW00mD59CJyAnmBIFG0yVuRGcYypajW2c1Nt+FDBhL4OMaygWZhpGNPk4
         dfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=X2Osm4g7ngVFk1m99rE+5DzbxBqP0jSlXOcSB+MHgOs=;
        b=LX1YbAV3R8Dn0iQSHH26CtQ0Y2uzYdjodlnyFwcsNYEyhnSAuLLs32QkX5hU8AwOi/
         pInVhjntijyMur3OGOzxr+7crcUcZwiJ83+s0OsLoHGh3dpUek78PdOoo0yqDHpxLW0L
         MP2BW4xi4UKwLLbeqtZz+7rxZbBarC2MDPnocDM9kAKK5UJ7FmHOyausVD13fNGHqN3f
         zGdrQrMXuID0gNxCllrW6JfpjbQy4ItVL2gBJuZl75pVxIk8isS32NI31xeg1AcZKoxR
         s+xRlQQxq2mynPFmqtCRTUuezlUMudzTYe4DqRCfc2ZVvuRsfY3EVYHr5Vxp8AZKbxBE
         rtIA==
X-Gm-Message-State: AOAM532WqbO4yIA/LxuIlFazhH4jO1r73YTXcsclui5+HMawY+Hic/hu
	i3PF8Bdq4YJSdNi3G6HI8R5pjc3AKdJt5A==
X-Google-Smtp-Source: ABdhPJwrxVviJSMjT8mId/GpyzHATFJbF+Mj7pOK469U1mzxWpWIgQWUM3mkpbEXVE2DR1vNyG85QQ==
X-Received: by 2002:a63:ef06:: with SMTP id u6mr4070248pgh.252.1618693579699;
        Sat, 17 Apr 2021 14:06:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:19 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 14/50] python3-bitarray: upgrade 1.9.1 -> 1.9.2
Date: Sat, 17 Apr 2021 14:05:23 -0700
Message-Id: <d8e0ab6171668fca2e1e8176c9c936d3447b6a65.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit d46d6e58c26f596fba7cbd739fe8856f89306ab6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-bitarray_1.9.1.bb => python3-bitarray_1.9.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.9.1.bb => python3-bitarray_1.9.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.9.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.9.2.bb
index e6bfb25c492..0716e8e1d8e 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.9.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "ec99acc1b18f99b7e9d0b77766b99f80b3c42d4e83306334deef9745b41a2079"
+SRC_URI[sha256sum] = "d7a49d21ae04c5af195023b140800186ebf208e3a4fc5b21a1389531cb7a7170"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

