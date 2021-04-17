Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.3512.1618693584257666423
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U2QKCi8+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id nm3-20020a17090b19c3b029014e1bbf6c60so12214808pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=f2x+fWzi8JH+5USfLO4VCcE8mhUEptInwPJ/lWpnsXI=;
        b=U2QKCi8+upC0bJQiAL5SPiQvzFCcTlWVKed1MxVihj8D9yrpmLmiGOSMkWCpyUTes/
         u0IJvryT8mLUCz052nJ5xrBpBGdz0n6y/b89S5pZmDRw0SnP1WfdjQYKDO6s9vpl8MOE
         PA8oOhMSVqpKFZmz4EC9IAsLqMUN2bAQbAuhjpkN9ZTEc8Osip6aXTk0Dg63De3UyOqy
         +VEok565aWp6mbOtm8o1NqMlyqletei26rj12mZJUSEdZ3HYu1j3uneL03b4EPsQVype
         G+MNWGAo2jUQyPC4u3grqmIWYEB+XRiAYdInDHuHETqCL4u8Q4AVDeWvBd34kPCbfDxS
         yswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=f2x+fWzi8JH+5USfLO4VCcE8mhUEptInwPJ/lWpnsXI=;
        b=tIuw/wQIt6H+kT/RXWPR8tvga97KCxGwcObwC5L+NT+dyec0br3zw5HVh45sOklJ4h
         33aVZWF5iKRBVCw1pkoe4kN/zxlcO0COHyqzKuBhmddUSmSKeyCYhz3uEJcfpW00/Y7Z
         HCijMjurxqSib/votYQ1XuPlu2QGODvhvJv8L+vRGXjwJUiykHjtOI3LUCLKgA2SCc3q
         zxM6BgNV7rA4st+YPU2fCVSXILfWOwAXRfZW5aLrFeDkFLvDR4/nkFP+BUs3nR7N3I8M
         B8qDGoRxqw0Kq985iI+fuaOu71NlewDIzfeHpyqQ4CpgvUBinNUqBo5VcrT64Jq0hRl9
         iAvA==
X-Gm-Message-State: AOAM533KjxUIIp0+kuUcE42VdpGIp6OEfX01UhK687DgA4Y4TLWW6C8y
	WnZcJhFw2ZK9JBqZPeIPV53Sul5uYGl+qQ==
X-Google-Smtp-Source: ABdhPJyvYLiuDwmD18Mq4cDLwKFcrdPP5UcMAcaFkgrBaznYh39ZwUeRGHAf+5lFnWAaggAd16ZpaA==
X-Received: by 2002:a17:902:d718:b029:e6:77c9:faeb with SMTP id w24-20020a170902d718b02900e677c9faebmr16386743ply.30.1618693583730;
        Sat, 17 Apr 2021 14:06:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:23 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 20/50] python3-backports-functools-lru-cache: Upgrade 1.6.3 -> 1.6.4
Date: Sat, 17 Apr 2021 14:05:29 -0700
Message-Id: <12d0ac7b6cfc1e14ce3ea0b927299f618ad6f662.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.6.4:

- For test dependencies, when indicating Python 3, use >=3 instead
  of >3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 2627bb1a242747aa5a61fc8ca77ea604d3e9f171)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ..._1.6.3.bb => python3-backports-functools-lru-cache_1.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-backports-functools-lru-cache_1.6.3.bb => python3-backports-functools-lru-cache_1.6.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.3.bb b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.4.bb
index 0d232dcabb7..c90ffa1b470 100644
--- a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
 PYPI_PACKAGE = "backports.functools_lru_cache"
 
-SRC_URI[sha256sum] = "d84e126e2a29e4fde8931ff8131240bbf30a0e7dbcc3897a8dbd8ea5ac11419c"
+SRC_URI[sha256sum] = "d5ed2169378b67d3c545e5600d363a923b09c456dab1593914935a68ad478271"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1

