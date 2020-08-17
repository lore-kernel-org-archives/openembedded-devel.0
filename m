Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.38157.1597644971996192515
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2020 23:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XyqGYu2s;
 spf=pass (domain: linaro.org, ip: 209.85.214.177, mailfrom: arthur.she@linaro.org)
Received: by mail-pl1-f177.google.com with SMTP id r4so6993895pls.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2020 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4SQt2kbEX5sSJsyYUpiA29dq7Uxk4D+Iq5DqLTPkRvk=;
        b=XyqGYu2sgZ5kcNJWcg+q0X2Sk6LmHStoYTtUXsjpcjvZz0pItdtyUyyCaplYejfjhC
         5pjoF2md3QYTZMSWaAzRibvZhKUNyMr8nIKGWhxt4IydblyukfMnPk5rL8FfvmXvl2Iv
         e86icDkbaEasehTB2KHzcsZKHnA2BWx45qv2cdOMciso3QRLuzAT4KT8Mu94nG+e/s6u
         tBjT7opZ44R8g793gPkEufsfFMan0QrtrRH7M8qPG1TMKuhn38VCszm1wCz39XZ6f8ik
         7QOens3GNiMoGb4wK/qLlBsWcEHBq9x3g8J9ZUd221E2Cm/zR6YpQkE6GPUGyKJNrRNi
         S9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4SQt2kbEX5sSJsyYUpiA29dq7Uxk4D+Iq5DqLTPkRvk=;
        b=nKqYM47HseX0IhYmiehhCgh54JEbs7GQWpWRH263hLldVpQfIJqs0fnXuFrpJh0NYi
         Ys+Zby+R79xV7L8N/EkcOkMSAkaQVqm4Hm++FXQ4sxs6GTdIXtmGPNARrrea09IW+KZn
         EqDpHhrRdZxI+qEkA+gp7AfM+Izc6cqndNboB8e+UnRh1eUk9frVZwm8EjPTSV8dnVE3
         oUDGxfbTiBs5gri2TYjo1ni3yrtEqQjNpl113SBjEW8A23fMsvlE9H5c8fxiXHEtOLfE
         WXlrTVdsSMiCbPW9Y3QoLHUPOoJooTHH/InLVVrBHkrhvH+ZRp8dN4w13y8+51QuVKB7
         PJuA==
X-Gm-Message-State: AOAM5308PFiCz7DuliCv/Ug2ODftGi084gn3M2uIkC+k2oeybH/1wbt0
	BGyw62ZNSP6thFpoaLgy540VcVHIW6Q1xQ==
X-Google-Smtp-Source: ABdhPJyAeOfpwOOz/dTQn34DviK/i48eapPZ2NPMIpTCM6sd/hd86CyPR2ThtIbNWy6xLiidXqOwFg==
X-Received: by 2002:a17:902:9a01:: with SMTP id v1mr9836363plp.15.1597644971253;
        Sun, 16 Aug 2020 23:16:11 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id q11sm18082224pfn.170.2020.08.16.23.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 23:16:10 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [meta-oe][PATCH v2] xmlrpc-c: Upgrade 1.51.03 -> 1.54.02
Date: Sun, 16 Aug 2020 23:16:08 -0700
Message-Id: <20200817061608.4131054-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upgrade to release 1.54.02:

- Build: Use 'curl-config' found at configure time, not at make time.
- Fix bug: 'toValue' won't compile for vector of vectors or map of vectors. Thanks Yang Bo .
- Fix tiny memory leak in virtually impossible low memory situation.

It also solved one igt-gpu-tools test results misleading issue [1]

[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/92

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 .../xmlrpc-c/{xmlrpc-c_1.51.03.bb => xmlrpc-c_1.54.02.bb}    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/xmlrpc-c/{xmlrpc-c_1.51.03.bb => xmlrpc-c_1.54.02.bb} (95%)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
similarity index 95%
rename from meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
rename to meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
index 6c31b6981..c1f0b78ca 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
@@ -9,8 +9,9 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
            file://0002-fix-formatting-issues.patch \
            "
-#Release 1.51.03
-SRCREV = "343a3b98e54999d67edb644bcd395aa9784fb16e"
+
+#Release 1.54.02
+SRCREV = "86405c7e1bd4f70287204a28d242a1054daab520"
 
 S = "${WORKDIR}/git/stable"
 
-- 
2.25.1

