Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA0DE7FDE4
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1615.1770066850121434227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DDl/5WAc;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d28870ddso3035511f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066848; x=1770671648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eaX0jysp4qXfmloCWXZmDDV2ZWVTGNDnnnDlFydAGI=;
        b=DDl/5WAc07Skz87NplcR2bPGe8bFja3ZItJMtTsxSvs8gqpRiHR87DgcSclG76TpTc
         9edflOoQ+KxSt1PGic8YD2czeqx6d/L2/+fVaoOg/O7wTbjd3gtEGLjr5P0wKGX66J9f
         eHKHId9AM0g2M7DQtPBavCbmICS2WaIQWbYJwqCs0joTc0ohLtbN/wudxwck94XuexvY
         1phACS141sDnYCZLMwQlweGxSIwxo0gAXDC2q/jpHyTBgDFSIihO3q7mbO0yA8eIsPYs
         juK5S7MNhGyqAfctWHUMEASnMS5sw3n7AL5W4MaNGK8chh5wtZWo3FFw8NHI+jhhcoBH
         GaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066848; x=1770671648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6eaX0jysp4qXfmloCWXZmDDV2ZWVTGNDnnnDlFydAGI=;
        b=pPioarT9PoA+PmEZrvNkEXb/fUmnf2kfS8Uh0mWjB5kzGVx3kXtwPodMyWnLWdMOtm
         +Wygz9ZKbniBSTgdGRxLFm/4yM5oWGKs5YeJ4I700Ugbr6f8J1QnL3G5finDDTdKZ78Q
         vRYkGv14NfmdomAaw/1fU7eEs3LA0wXMsH6SctyxFRQCSb2XFG2/G5u0BczRcTp7anMs
         YhL+ZNWlg/q6TkaTEx/qGORYOGJF1dNJotfUGJ55jn899vgY9KeFZ04Qm4nEo91W9jUE
         Lcr2686uT3P3aHJVsEZuhSNT7fDC5sUOszjT9bLm+7I2FXnpcAvq9TMP6zN4OBYTqpPD
         M6ZA==
X-Gm-Message-State: AOJu0YzTgq9L171FvbMbxcYZxJl8OTvK53AsEjuII+BGc/Z5PGKLpU4r
	aydXDN4Jjt/PGzs0hL5eEgrmHamqv1hoU97VVz8WHOhiZTyjQ6/SCnAg8u3heg==
X-Gm-Gg: AZuq6aL78oP33kIRsGwWOpRr1tKEJTl2anfbEQjz4HvpfOQ8doW8K1+CVduERGTJ9q2
	dTseiLFK0J1iyuBMKfHQRf9g/qqnH5j0eusTMhf1Ha4RLMQR+10oxQdHHxndgTfdr7XRFalZk7h
	YY+Z9O8ue0srRbO0l//jbWfGyIk6v6QM/3YGK8WKc6KZMou3LpnR9JzgFrYTKcJsrVh3ukZL+aW
	XYW78ZxnjFQSRHS5eRcJQJoxR63vuQcR3/uxNnge5lW8XBlEVE+lKR8Llgn3RUEyW7xGGAMYnT7
	6W4F843DHwKjbglbqeCeLuhow0y4hjtORKoy45QMJ54wz7fyG/FHfVpW2LOHMQm/xYsXKYmOft2
	i8QE9qTlXLBY5h6IdP4ixO8wWddS0KvNqsBL7DSa9cXP32Ja2JDyRDwjSMhMts1jbTeHkDc3UZE
	DGlzcPzHG8
X-Received: by 2002:a5d:64c7:0:b0:431:316:9212 with SMTP id ffacd0b85a97d-435f3a7c03cmr15232436f8f.6.1770066848352;
        Mon, 02 Feb 2026 13:14:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 09/15] imagemagick: upgrade 7.1.2-12 -> 7.1.2-13
Date: Mon,  2 Feb 2026 22:13:55 +0100
Message-ID: <20260202211401.1287664-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124082

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: change license url to https://imagemagick.org/license/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c2b4809fe8bb2eaa3ce99807dcafae7aaa880f4b)

Contains fixes for CVE-2026-22770, CVE-2026-23874, CVE-2026-23876
and CVE-2026-23952.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-12.bb => imagemagick_7.1.2-13.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-12.bb => imagemagick_7.1.2-13.bb} (98%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
similarity index 98%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index b804c64cfb..e3f4a96d6f 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://www.imagemagick.org/"
 DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
 editing raster and vector image files. It can read and write over 200 image file formats."
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2f9de66264141265b203cde9902819ea \
-                    file://NOTICE;md5=bcbf1f1897b40ec8df39700cb560e9ed"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1f56ade64cf079aff7232f7dbeaea992 \
+                    file://NOTICE;md5=3974428a57d34b981abb7acc416dde8f"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "bdd4fa561d7bf4c6afd40ee9c89e9f9e82b6e88b"
+SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"
 
 
 inherit autotools pkgconfig update-alternatives ptest

