Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.6206.1591908717828777142
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 13:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AGuLahoO;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id r9so6218397wmh.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=usyUQz19LPzRh1ZBGEF8cMLc2DIv0dX8O6tBLQiUQ0I=;
        b=AGuLahoOm6e4jUhRNdJB+GClAjByloYd6SGGuo63OPtX+2DxbaJN79Aj+PL1BlB9yU
         +p91UdogPU0vAiMeBFXrG1ZhA/bm7jG8Ew5Cw/sESjm7eurhvzVnIsKxuuAIPFcpjeUz
         DD0K7g/x/tkalHVVQaFZ7ueBZd5Zq0iGcCd5z+aK24TCaGj35VBuB30hV3m2aIc7LQiE
         TEochStl8PDGCrb8BxRbAcU5Hf0XHoyKF7/wwcI2bimTXltOTmEuVdNhZXOrk27p25xn
         eU+gNJHXRuZm6LO4CvJZNCfOrAezoTZJVLyF1kSfOs65Ots+nw+8reavR1gP6UzK17pX
         Ma1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=usyUQz19LPzRh1ZBGEF8cMLc2DIv0dX8O6tBLQiUQ0I=;
        b=RsojcBFbwqDjo+Air0ieE7YaDGuTARG5eNgCGHrscawpoZhtOMThcr9A9Qly6yCYIo
         r+NMrqnkV4R+gi+xvOjYnAZKcIAM0+squrWk2Jygct7GVrq8O7noZ9Ixu31JKSspmw0x
         lZwFgsAFMjh/FMnk5l8imetRZ/XyUteYsJxD09K0xD8u0zeLE0oSerc6KbHKcEPio5ei
         YKYRnCdgfMuecd1uyiDKVNaf/8sc5wTlFGFcA6YkUuK1MG0PMheKR9xDwlapH0kas6uS
         gRU5KhVbPlaYEiibUREfvVb/hmckyMGabQPnIN7EBdSZdUHfEd4P1EQDXJNNifQeCYGX
         D2GA==
X-Gm-Message-State: AOAM530nwe96mV/gVcDRcnrANQm4rdG0ChIpAIjxhuEks5M3XmvwSJo4
	GVuAwfIxxWdhSvuqCs0V6fIo4mUg2v0=
X-Google-Smtp-Source: ABdhPJzN+VtNplmhBNf6fkZlcy6A9FJNx8lt9lnvX0MjaT0Ymb9eNiw3hpLTEQPOGW4ibjCJv4Q+vg==
X-Received: by 2002:a7b:c7d8:: with SMTP id z24mr9455651wmk.28.1591908715772;
        Thu, 11 Jun 2020 13:51:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0ec768c1921725f2fd1a21.dip0.t-ipconnect.de. [2003:f0:7f0e:c768:c192:1725:f2fd:1a21])
        by smtp.gmail.com with ESMTPSA id n7sm6827825wrx.82.2020.06.11.13.51.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 13:51:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] babl: upgrade 0.1.74 -> 0.1.78
Date: Thu, 11 Jun 2020 22:51:41 +0200
Message-Id: <20200611205145.793353-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/babl/{babl_0.1.74.bb => babl_0.1.78.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.74.bb => babl_0.1.78.bb} (73%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.78.bb
similarity index 73%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.78.bb
index c470987b4..173d5aa74 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.78.bb
@@ -6,7 +6,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 GIR_MESON_OPTION = "enable-gir"
 
-inherit setuptools3 gnomebase gobject-introspection
+inherit setuptools3 gnomebase gobject-introspection vala
 
 DEPENDS += "lcms"
 
@@ -15,7 +15,7 @@ CFLAGS_append_toolchain-clang_mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS_append_toolchain-clang_riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[md5sum] = "d032853f2678bc95054c39d4f02045c1"
-SRC_URI[sha256sum] = "9a710b6950da37ada94cd9e2046cbce26de12473da32a7b79b7d1432fc66ce0e"
+SRC_URI[md5sum] = "b1a85d1f3d710407164848708f1f49f1"
+SRC_URI[sha256sum] = "17d5493633bff5585d9f375bc4df5925157cd1c70ccd7c22a635be75c172523a"
 
 BBCLASSEXTEND = "native"
-- 
2.26.2

