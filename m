Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.3815.1630407488071192670
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Aug 2021 03:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=SoHt7z7d;
 spf=pass (domain: nathanrossi.com, ip: 209.85.214.170, mailfrom: nathan@nathanrossi.com)
Received: by mail-pl1-f170.google.com with SMTP id e7so971619plh.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Aug 2021 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=FUKQ8p8IqW2gEhKJbjrG568gcqP5G4HEmN6o4IfAjsw=;
        b=SoHt7z7dZuq4lAgfWC6ZrFBTHF4aqI1FJYJEzIieViO+5oEHERzdJA4vgDW22Zx2si
         duQuIasMF+y4rjPvSWtKR/uUD9CrOv3j6e2S2ryxLLCezYof3CgBhyx/+kzuL9aMw2Kh
         BBDjl+XoRx5FXRpFT9Bk3maoe1Eikx/Xmv4MHErs+xH5dE2zIWS1p8LvGfy0whL/Lplf
         0AvNX7+vNKXqyjbN+5JBy9bssj2tKrBru9/AZDJ0IHG9/+07o9OSWcq7PVTClxecPuzj
         RsDlnaORJ+euacX7atG/XFpwe/9YlWpTucbMKd34xRlveu0t8BsSAYW1iw11RkVCcEAQ
         D5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=FUKQ8p8IqW2gEhKJbjrG568gcqP5G4HEmN6o4IfAjsw=;
        b=MFlRZcYtNttKeIkEtM3ULzarVw/J9E6S4V2eu1IqsywxaMRnVeDr+LGwqWGjfaR5/B
         p48kfqIhSGWnDzBjAmAIcNd1DXQYwPo+O84xe8fmYEevycy36hC5QV6tXN5PA+iccmqK
         VIM06XC7BSf7Ni+g5MTJPirN30HK/9IBdW0YZEtX+C1SLarb9aUYWdTWmja8abB19dVD
         tPPTDrDWP2QRgd+xk0UE17qmJsP0d5hfecwT/awjiVNjpnVeRI8ILwUmV3+jdKuHPdp5
         lrjTqIpif5YcrqbzRGBVEUewJGnJeV6p54cVWz7LGMM+po/P7gp+gMsuECAjXGfRJQz2
         T8Qw==
X-Gm-Message-State: AOAM5327IuAGlBFaGAWfMstfqPpABFiYwIgIPYYQmoRZjURmmZ8PJGES
	8xx7H2g8CW5w5NNOgQxUuQZGPg==
X-Google-Smtp-Source: ABdhPJxLSEFeWBoOQtI/svZ1BKHFxJo8Lkpzgoi6Z9zPrf6Ln88ozosnkk28aiNlL5h2F81TkUQgGw==
X-Received: by 2002:a17:902:8543:b029:12d:461f:a6a8 with SMTP id d3-20020a1709028543b029012d461fa6a8mr4210484plo.1.1630407487421;
        Tue, 31 Aug 2021 03:58:07 -0700 (PDT)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-69-24.751445.bne.nbn.aussiebb.net. [117.20.69.24])
        by smtp.gmail.com with UTF8SMTPSA id i6sm17706255pfa.44.2021.08.31.03.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 03:58:07 -0700 (PDT)
Date: Tue, 31 Aug 2021 10:57:56 +0000
Message-Id: <20210831105756.217662-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>, Khem Raj <raj.khem@gmail.com>,
 Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH] nginx: Fix off_t size passed in configure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

For linux, nginx will always compile with '-D_FILE_OFFSET_BITS=64'. This
means that off_t will always be 8 bytes long, even on 32-bit targets.

This configuration change resolves some issues with nginx and handling
range headers.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index ab37fa3146..7637002f23 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -65,7 +65,7 @@ do_configure () {
     --with-ptr-size=${PTRSIZE} \
     --with-sig-atomic-t=${PTRSIZE} \
     --with-size-t=${PTRSIZE} \
-    --with-off-t=${PTRSIZE} \
+    --with-off-t=8 \
     --with-time-t=${PTRSIZE} \
     --with-sys-nerr=132 \
     --conf-path=${sysconfdir}/nginx/nginx.conf \
---
2.33.0
