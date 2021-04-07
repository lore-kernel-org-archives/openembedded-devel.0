Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.422.1617833924396814756
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z1Ag8TSj;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id f6so13467118wrv.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S0EHnCRE9xEFWLfIMhLmGvG4zixbVlmDtUQG/PaljUA=;
        b=Z1Ag8TSjONXCBL92u5HYSGlxXhdGH4PMn9pisEpQf2bEJpbvPpYV8Kq3m+pczOjWNz
         MqYWr9VQsQjLM/vvqRC9jBp+J6Ct+guZI37RMZOIiqWbsyY78VhXxpc2EcLTvbPjj0nQ
         JKFeb7ZGPJcwzOwaKNQdi6JUTXJxGLdetdgFw4Ho9OX5n9pUPqKul3bRZLwLCLDyGJgh
         kOq1TPeYvEwEaN+cG4eW19EMZUej1yCQVuAP75/sESWp657e1CBY2+5f+HhQ57cvghuI
         CvOZQM6uQ6Q13NkYyTmPS9oKfee1Hx9zw3eRL7zyGPEu3Sjj2lwSdyL4/W4xA1iRS1JF
         Lwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S0EHnCRE9xEFWLfIMhLmGvG4zixbVlmDtUQG/PaljUA=;
        b=g30HZpBOpUTJrOxsbYU4AcKaIxIHlT0MlXesrxO1sIP11ZGBA4/mFL0CK/K/GOQ4vb
         9h+Ild2FxDO+fNURYut20vJBYKP9Kfhq8NaxRRdoqK7TMhYPBiV3HCj5kXUnTRTWcSLr
         qhM8pnllxSpiglM+usPYd93GKUMgP0MzxOMW8MtGE6Ak9dTZ51A+SW5KM4oVgxtwjSVR
         3C9QITUnADN4kyOTjr5+cdh/MfXeyyX63uynD9knIFPBub1rQ0d6kp2yA/tigRBZZHec
         0XF2O9mcpyFZf1SjDYNC7CvA2TdLG85onBh1USGcsUyrPYOE2HCjE8Ypv4XRppnjcknK
         bLtw==
X-Gm-Message-State: AOAM531hLa3Wm5LDm/UPbsPtHR/sAUutew8XE0P7nCEXBWU0aA3qoqS5
	p+kKBMIaJ8DESyMBgtrq2pSSQxNBMF0=
X-Google-Smtp-Source: ABdhPJzjIeQac7Y3QM35f8tYy4gIr67fJbWwbKvTL7sT0u3C4ekk5bktXU+wqdJGATN5JPRvGrE/3g==
X-Received: by 2002:adf:e743:: with SMTP id c3mr3950740wrn.408.1617833923063;
        Wed, 07 Apr 2021 15:18:43 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f1192521410777e3304dd72.dip0.t-ipconnect.de. [2003:f0:7f11:9252:1410:777e:3304:dd72])
        by smtp.gmail.com with ESMTPSA id e9sm27462434wrv.92.2021.04.07.15.18.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:18:42 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/6] poppler: upgrade 21.03.0 -> 21.04.0
Date: Thu,  8 Apr 2021 00:18:29 +0200
Message-Id: <20210407221829.606871-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210407221829.606871-1-schnitzeltony@gmail.com>
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 21.04.0
core:
 * Hide symbols by default
 * TextSelectionDumper: fix word order for RTL text
 * Fix rendering of text in some files. Issue #1052
 * Implement rendering of Masks of Image subtype. Issue #1058
 * Forms: fix unclicking standalone form buttons. Issue #1034

glib:
 * Expose more fields from MediaRendition in PopplerMedia
 * Use stock glib macro to define boxed type
 * Remove incorrecly used volatile from enum type registration code

qt5:
 * Fix crash in files with malformed signatures
 * Fix memory leak when QImage constructor "fails"

qt6:
 * Fix crash in files with malformed signatures
 * Fix memory leak when QImage constructor "fails"

utils:
 * pdfsig: New paragraph for "-sign" in manpage
 * pdfimages: Do not assert in "too big images". Issue #1061

build system:
 * Require cmake >= 3.10
 * Require Qt 5 >= 5.9
 * Require glib >= 2.56
 * Require gtk 3 >= 3.22
 * Require gdk-pixbuf >= 2.36

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_21.03.0.bb => poppler_21.04.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.03.0.bb => poppler_21.04.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.03.0.bb b/meta-oe/recipes-support/poppler/poppler_21.04.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.03.0.bb
rename to meta-oe/recipes-support/poppler/poppler_21.04.0.bb
index 52aa17021..de5f38036 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.03.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.04.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "fd51ead4aac1d2f4684fa6e7b0ec06f0233ed21667e720a4e817e4455dd63d27"
+SRC_URI[sha256sum] = "5e2219656c6bbd36154133fef2e12b7d0938464518827098b29a10b1697ea79c"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.26.2

