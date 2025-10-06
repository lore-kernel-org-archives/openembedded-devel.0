Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F975CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:58:49 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.34569.1759759126452532843
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m6yslzP9;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b2e0513433bso772573666b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759759125; x=1760363925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s1iSVbRi6rhTaNsinVJAR1W8UMX+bpFCX0uBRmLn8jQ=;
        b=m6yslzP9Zs603CRg7aoMH69Q1KSHLO8ZJ5XNC09lyMD4ISRr5XUsVd+acweBA5WU+r
         anNMkQIsz78d86EprVNWnQiCi0+GPNZ4Xhu3LQTHQ8YxjY2vUiC0KDOydFD7t3SaFeNk
         vp7mhrzQWhFIhxxr+PkobZa3tR4Tjb8HUMyiOTVec2eZkgznfFCDGLypazdVh+EX/1fL
         lf0MO+PIO3vDOxvmf9slEmkwOxUl6tl3ll3AAgJLftfU/BCuldsrtKL+s3zKX72ZZivi
         MNur8Fox68N+zTJebEUruLTHNpyBJECrZJFUMGvoW405Zo+8Sx9o4M3WL6Iwu7qJBWOF
         AO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759759125; x=1760363925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1iSVbRi6rhTaNsinVJAR1W8UMX+bpFCX0uBRmLn8jQ=;
        b=R1mR4YEJCB62id0V6Q9TvsfOeWyzC+rK+RMKluqYsBFeVqCZCN9tVw/SFsbhGeGxuP
         CW7i9WkrKC11FTjyBGXThPskE2ggtQ0kS27344vhMINmraRJm0CrxU6uAmtEjnpwE1cg
         3BZ8CFgSyB8inUxVRwT8yfWymVt+LGLXqK0b8EYyU6iNwji1pChwNABktIeNATOksDwc
         ARinDEkkvkxxg4am868zL/RVKSC2J7H4mVkGQAuQGej0JeHjy3Qap416Ck4GBMr1Xw7T
         zM2gScO/JCJ13plmVocqtUZkqh1J6isOLvbTIvA7FSU5n1b5FoeoL/clMxsx0Z5vaH9z
         mn0Q==
X-Gm-Message-State: AOJu0Yzr2OtvJw+YlQs61il4Rd2bB2p5E7RhoTKGyaCoFEI0uaKeE3aO
	+SyCd6P/ztPtC9VTmPnTyTnbAklgljFI9Z2hEGAHX7kl2eCkXeRqGqQrvz/BZw==
X-Gm-Gg: ASbGnct9kZgPZ204dMeasDn9w5s0/+pdfERvsZrtWgoEmt4vdeWJJlPxklbwJR74uI7
	k1FsMTaFiusD/SQ0l313+Yr+D4Opf/LibXhJjvoUW6n4GQZnpxrCmVfH0nq7g3rZGcWj2IeLSaQ
	Bb37zleQrDA8741fc3ySPKqFo/jJ2g7cYKVR/xJJHctlrTeTv+DCVtkVI6eiaeXV/krPU/zGKaE
	rCDBL84mMX+7tT2RO/5o0k+yL5lpUgzvSPp7fRhR87x6GygqNNyoHrFc/EK8izhJxpKfpaBBSGK
	Jw2Ogrtp+14XdgxMm4Bg6Y5wwsxEny5CtfkCVlYinq/w2rYbvwzUB6iz5jBkOyiEEJYIp3PdfXb
	DjL+drY851yRTpgr/nTkd+a434kFOwSxa6O2ccMkvBku5LcUm5MlODmk=
X-Google-Smtp-Source: AGHT+IH59UWOLSoV48g+ONSSl0DOGT7frrp4Rrnfxxf1hh5pUlVl+TkNM7bysk8GkYbqcFZMFUWj+A==
X-Received: by 2002:a17:907:2688:b0:b18:63b8:c508 with SMTP id a640c23a62f3a-b49c3d68a41mr1500304266b.44.1759759124465;
        Mon, 06 Oct 2025 06:58:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4d9f5sm1162446066b.66.2025.10.06.06.58.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:58:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] exiv2: upgrade 0.28.3 -> 0.28.7
Date: Mon,  6 Oct 2025 15:58:43 +0200
Message-ID: <20251006135843.1920906-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 13:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120290

This upgrade includes fixes for CVE-2025-26623, CVE-2025-54080
and CVE-2025-55304.

Changelog:
https://github.com/Exiv2/exiv2/blob/v0.28.7/doc/ChangeLog

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/{exiv2_0.28.3.bb => exiv2_0.28.7.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/exiv2/{exiv2_0.28.3.bb => exiv2_0.28.7.bb} (80%)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
similarity index 80%
rename from meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
rename to meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
index c0fb32ab79..e1f57ae8c7 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "zlib expat brotli libinih"
 
-SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x"
-SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
+SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${PV}"
+SRCREV = "afcb7a8ba84a7de36d2f1ee7689394e078697956"
 
 inherit cmake gettext

