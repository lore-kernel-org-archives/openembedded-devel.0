Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.6976.1620483726567464845
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 07:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f/gkMjOb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id l2so12040814wrm.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 07:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CW4xChsNbsHlU9c2V+finD/Leol7t4xcOYRipDiLEgw=;
        b=f/gkMjObVurnXBndFIF+Ha50xeE4Hv+CDVNlrrKfYuRBevp0p+AetViBSXwGuzFeSN
         c5do2zadTU5J6ewjLfWlBqZv9h6Bmyz/0/lUpJKw2moUyZjlrgPR2nRJj4YL6bpYu51k
         J3LGACtV/5MmExAtL7ClWyu68pisAo/9b2CP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CW4xChsNbsHlU9c2V+finD/Leol7t4xcOYRipDiLEgw=;
        b=OuZCRRQ8NutgdF2PT/poOItxqQ5kVYBxP8SC4YWV/bHmvOmSj0lp7HWcQ8IoWrtQNP
         qn9NhizcI9wmksiVAzz0TBUbVQXIbR3So7ERDg1hf3f+jiuyIMsD4Cz33AZDpazLontI
         8ap/nT0SDjRK6vHHNsjuErJfQvkBWmiC5SgYBOYBk2dRtiXeeZdkO94Ay+2oJTbghS5U
         QGWv4X7O6x3krMe+RE3TRAPCQ19qKakEdTnilEXJsLLSUy3CgQgFHvnH9yVdR3Tj9dEt
         BOBlKYqeS1brhwW7t7pILhT22i698Hfe0f3V8AaAD8NURgS73LhwarpXxbIM87cKg1BX
         XaEQ==
X-Gm-Message-State: AOAM530cc1mrVrtQqIqjtLg5hWmTnA9KigG/9sj7vSuN9tyEUgvNmhV6
	wLlHcLr8T63eO/tU1eof+vpiXOWlJBzUuA==
X-Google-Smtp-Source: ABdhPJz6klB2Tg9FXrPkQr57H0ZPF6/yoMGFL+QsMJHMYfqwBKei2tiLFTeN5osHG4+X4D6tGnM/xw==
X-Received: by 2002:adf:e947:: with SMTP id m7mr20175711wrn.70.1620483724408;
        Sat, 08 May 2021 07:22:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8b6c:ea91:f112:97a5])
        by smtp.gmail.com with ESMTPSA id 61sm15587812wrm.52.2021.05.08.07.22.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 07:22:04 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] [meta-python] python3-m2crypto: Improve multilib header workaround
Date: Sat,  8 May 2021 15:22:03 +0100
Message-Id: <20210508142203.2098012-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The multilib header issues continue to cause problems for this recipe. Simplfy
the workaround to something which resolves all the current issues and
is much simpler to understand/maintain.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-m2crypto_0.37.1.bb         | 25 ++++---------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
index 896d9d2cc..45abaac33 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
@@ -36,27 +36,12 @@ SWIG_FEATURES_x32 = "-D__ILP32__"
 SWIG_FEATURES ?= "-D__${HOST_ARCH}__"
 export SWIG_FEATURES
 
-# Get around a problem with swig, but only if the
-# multilib header file exists.
-#
 do_configure_prepend() {
-    ${CPP} -dM - < /dev/null | grep -v '__\(STDC\|REGISTER_PREFIX\|GNUC\|STDC_HOSTED\)__' \
-    | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' > ${S}/SWIG/gcc_macros.h
-
-    if [ "${SITEINFO_BITS}" = "64" ];then
-        bit="64"
-    else
-        bit="32"
-    fi
-
-    if [ -e ${STAGING_INCDIR}/openssl/opensslconf-${bit}.h ] ;then
-        for i in SWIG/_ec.i SWIG/_evp.i; do
-            sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "${S}/$i"
-        done
-    elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-n${bit}.h ] ;then
-        for i in SWIG/_ec.i SWIG/_evp.i; do
-            sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "${S}/$i"
-        done
+    # swig can't handle any multilib header redirection so just remove it for this build
+    if [ -e ${STAGING_INCDIR}/openssl/opensslconf-64.h ] ;then
+        cp ${STAGING_INCDIR}/openssl/opensslconf-64.h ${STAGING_INCDIR}/openssl/opensslconf.h
+    elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-32.h ] ;then
+        cp ${STAGING_INCDIR}/openssl/opensslconf-32.h ${STAGING_INCDIR}/openssl/opensslconf.h
     fi
 }
 
-- 
2.25.1

