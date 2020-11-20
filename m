Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web08.324.1605900473225173372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 11:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FFuGVS//;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id y17so14385879ejh.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 11:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GN8s7jn+p2sSdI2rfqkm5Kz1yoZk0ZGLrwlpnVMGuhs=;
        b=FFuGVS//OXCCGFnuHNTME8KtZo5wo++eagPfTU/abBpq5whfyIv/9hTPPy1FNyjhx7
         Jcr3z+CLHvoWztr4FAra0/+VyeYBIET+ezPyvmg7hCQ0VKT+aIW2/EN+lttDUy1aMEow
         KhE+WEl5kON3CbZCuoXHckFUBi7cLpzKsUMivv0YWsvyLN3hiyE+6mjmdQyENbATO+DD
         bPY30fjnSpIE8ADH5xP7RjC05bncdPLguGL4wMmdDDTf3kTCBjtppn+ZJHv8F85WhZPd
         G6AmSUFkuj1JL7NaciKvfpFDd4hyiXwbi/P7XaiCo1zQVTVG5zEf9fQiPYdrpKNc1BoK
         3LrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GN8s7jn+p2sSdI2rfqkm5Kz1yoZk0ZGLrwlpnVMGuhs=;
        b=ZmqTxRq7BalCVQTjbRer8GCd4vmA9D5U8Ot/adYIuvYczL/t+3D32gqok3giDfBBLH
         CApPYQHj1eYAk/QX6FcJGXS/PpV1dzoU/IjrcijhUTMN/Gs3ECreDDCEnx1SKut2SXqI
         jP8y0nnJAR8r4k8PSwmDO7xcr99aYiMIGWYNiafOEpm2oUmvgNDe2f4VtqUGoFW8PYvH
         UUWlIfW+kBCVNbxqTqM6ZZJvBYWLksYEN0M0xosoOD7KeuInEKkO9nm3/ASEa+ye16R3
         q5VSYxLLaOatN+yE++pIW/ukRyjSL3lq9X5XsPQzj7HaqA7gw0Gx+eU4u6ZOfyvMVEEI
         dNOA==
X-Gm-Message-State: AOAM532ZtMj2O5ufOx3hKzefJCMlbtGtr9hpdhUzQCd2irN7FxB04oCs
	/dZwAlYVc/ptKV5Eu08t/CW2KJMlRgxfyw==
X-Google-Smtp-Source: ABdhPJyVVDHT9jRRI1Ru0FMNGyIiK94reS7BOV1Ft0CAv6caC5zUuNjQMPJ7n/6ji95QY+DMeXLThA==
X-Received: by 2002:a17:906:2932:: with SMTP id v18mr33413331ejd.144.1605900471359;
        Fri, 20 Nov 2020 11:27:51 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf38a20090712d62a3c43517.dip0.t-ipconnect.de. [2003:cf:af38:a200:9071:2d62:a3c4:3517])
        by smtp.gmail.com with ESMTPSA id cw26sm589584ejb.47.2020.11.20.11.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 11:27:50 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [meta-oe][PATCH] imagemagick: Add NOTICE to collected license texts
Date: Fri, 20 Nov 2020 20:27:46 +0100
Message-Id: <20201120192746.101003-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ImageMagick license requires that attribution notices contained in
the NOTICE file are distributed along a derivative work. Thus it makes
sense to collect the NOTICE file in the deploy/licenses directory.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 70cb237d9..ac81fc75a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "https://www.imagemagick.org/"
 DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
 editing raster and vector image files. It can read and write over 200 image file formats."
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=41b4fa9af60c88e61484b02c0561181a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41b4fa9af60c88e61484b02c0561181a \
+                    file://NOTICE;md5=a2aa6e41f8a40700196a9ce301693e34"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
-- 
2.25.1

