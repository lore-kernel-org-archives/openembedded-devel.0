Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.43851.1589813418074974379
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nHCEC50m;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id y198so3485116pfb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RHwtG9XEBGLPH4SkGDFRroN7zVpqAseNhPQXLjKyc70=;
        b=nHCEC50mJbN06ysWQWp2WqUvclI/pZgh+7zc9dq2xHGkZkIVQ+ZRT0PJ3mLI2eY+3Y
         CgA8ZbjmYeA8fj9J/UBJmLE4bdu46VgguB/8hpEDcfXRk4wLzTcgYbZruMVqmLD0rcGe
         8aJYxp0aWsuJq7GtO6zUFpk/bixqmPaBotzdsMAaGSAI8fxUSWxDQmu+QZbOsONPwClK
         rTVumgju+Tqx/VtOXtsWIHk6SWzleew8v5yDe25RU8hjCRVigZOtUlk//w0b9RxG1yxe
         JFB+u8EqsJIrU/gDAVou9n8AG0ofWuVWIE3D5xACDrWUa6uE4pOV7wtuDexzlNUOzhaD
         h8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RHwtG9XEBGLPH4SkGDFRroN7zVpqAseNhPQXLjKyc70=;
        b=GvZDDVSowxLaBHBOhevopAylf858H6ISNLQlKhJSx+MLT2YQ1gXiJ0wpEdESCQ+H56
         Wq7auL7oiW4fORAK2qQt3hvTjSDgyWddQd34g55aealu5v8SzFhnKfZ3AdlqlgMNnR97
         awbVy14/ypxuVqM0MGvetxNHE4Fk72lhhmaJQyHl5lwAhlMaEma7w0sl6+7CwCd1Q9Kh
         JLRdy3gkN/eEdx1rnW7C8JHjMFLGp9dsxStUoZNH8sL0GpnIKFk0YAPAP6cBrqd4j35k
         /yNrjiuhPP4uqq48XzXBzn6k0qfsBtlUYrI5GUWAh6JHX7/2xRqOjVuE1xDG/odB7ZOd
         nidA==
X-Gm-Message-State: AOAM533X5PvLuUTAshz/TuUjaIfHkriVAHyVbKqQUEI+wrw27BBxtjRd
	9Mwwv8d0eAFohtSWHy5JaZeZFW+8
X-Google-Smtp-Source: ABdhPJzIZ+eEk/G07KZi65SlCw9leSmRyqPzctIEKHCOFR0desdDJrTpA+32bL73FjgV5DEEXhNYmQ==
X-Received: by 2002:a63:658:: with SMTP id 85mr14864272pgg.181.1589813417405;
        Mon, 18 May 2020 07:50:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:16 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/57] php: fix opcache link error in 7.4
Date: Mon, 18 May 2020 07:49:16 -0700
Message-Id: <a009197ef469f9bfb2fd341329e9a2fa38667e61.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Claude Bing <cbing@cybernetics.com>

Explicitly specifying -lrt is required for opcache to be linked against
the proper dependencies.  Additionally, PHP disables libdl when it
detects a cross-compilation environment for some reason.  In order to
load any type of extension, re-enabling libdl is required.

Signed-off-by: Claude Bing <cbing@cybernetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0145cb4645b720efc36e4a034bb9e1077c191e5e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/php_7.4.4.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
index a76dcaad37..07c3115060 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -110,6 +110,17 @@ export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
 CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
+# link against librt (libc) if opcache is specified in order to avoid the
+# following error:
+# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
+LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"
+
+# Adding these flags enables dynamic library support, which is disabled by
+# default when cross compiling
+# See https://bugs.php.net/bug.php?id=60109
+CFLAGS += " -DHAVE_LIBDL "
+LDFLAGS += " -ldl "
+
 EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
 acpaths = ""
-- 
2.17.1

