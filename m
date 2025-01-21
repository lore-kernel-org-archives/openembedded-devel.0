Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B75C0218C
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 18:31:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.23205.1737484307710548935
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jan 2025 10:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FdBqedLI;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436249df846so41480045e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 10:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737484306; x=1738089106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTn2cuf4X0ah9FjJlrxsCkCkxrRKAUvV+9UeSHWx81o=;
        b=FdBqedLI/OAZS6fNEySnTuE0Q83aLpxAT2DeutqPMEwfaBlSDZ1vguKP361MNiGfAw
         Ay7Xn7B0r+lMOr0P7IpcAlnQ8NFPsN6kiEgkhl4EqGbDc4ZrfVY52VgoHDj2yTGvJ+Y7
         HEykYFL5dbqyO89T6DZbAc0oAmAlOJ7jmvA2LKIPqlqcAqa+6SIazO1V1AhQXYbXEEpj
         xJeTREWSC31iWKpftafaixqsPTgE0aH/Kc6Z43FSaQJn46iCWkUx3WMxNmiY3vBlEKN8
         KT7fJ2SVZrNPqxxkgiwQAjwcKtNoPbYr8Xtgwtw6HjdtbKn3cz0pYuU7jPrhnRoWcwJx
         6BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737484306; x=1738089106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTn2cuf4X0ah9FjJlrxsCkCkxrRKAUvV+9UeSHWx81o=;
        b=PnWPPBcsNcTeaiaf0emVASnucnukl+K4MfyXd8mLQHTCZK/CJQsHqOZZto2a6tviOl
         uKGew6lWUqQEaN/iv12SZ2XK/Rgm9DXc6l40citlGIXCNNLcTfBhS+QLTSntNVP6VgJp
         xm6GM9xQNVDxcRFp82x6yoLLj4t5BeL46jVFj7y7ggvRVfFwF/ZRydWKMGL5jE2YofJD
         0cr3Sy8d3hVThHeWtprBmxQJPPSvcKt2EqIc1T9JFwcT9mQRyC964CwB7vxdsm4lFoFR
         c1kyxGFQbOLC6w5GCKh82skjB7wYo7ZzsJ7TMonY9u4MDiuu78dq8ypL+A75kF3dZk/G
         aggg==
X-Gm-Message-State: AOJu0YwCiHyipvwXSfdrHfipe9SwAqGw2m2z7S8IWTAhQnexs1I2MFCo
	Dc/Mhw3TSvQkj/S8jVcfce73P+qQcq8Gk74d/LTvFwITihlBhWLpVpfSeA==
X-Gm-Gg: ASbGnctrRo6O5dU8ESNJnMa2xPCdr1QRiuyyCX/ulGSvg5g6U7iM4eA6M2C6WMnVk01
	0gLMg3YBj/lsNiEsdxweoBoypWgNik5/W7GDgRHUa2ZB01WD9O4PsMaKeaAN/fksWnSnIIBkgM2
	DtRjGdZ9dj5DAFbiMs12tL6iNx/vnY2OKPBrQZpg6du1Gfo2hzcqAf0dCQk7VZUWFX7A6GesueC
	icwh+Hx4NH8ABp3E7dSJ7A31tQGtZ4KjCMd3jc7o80MVZHo/A5BTd68upAlAw9S+WEcNXMUEhzy
	AxWtmeLd/BRW8B4EdlbOeehr6R0=
X-Google-Smtp-Source: AGHT+IFapZdp0LazwCSxdlibC84l8VuJb5q39v43HzX5qUhRP4Piaq+QLOtPKDDis0Vu9JopZVo2tg==
X-Received: by 2002:a05:600c:a03:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-438913ed350mr178462515e9.12.1737484305899;
        Tue, 21 Jan 2025 10:31:45 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38bf321508esm14312664f8f.10.2025.01.21.10.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 10:31:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: peng.zhang1.cn@windriver.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] lapack: upgrade to latest 3.12.1
Date: Tue, 21 Jan 2025 19:31:33 +0100
Message-ID: <20250121183133.23102-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121183133.23102-1-martin.jansa@gmail.com>
References: <20250121183133.23102-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 18:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115009

* adjust the list of .f files to cover also newly used .f90 files, causing:
  http://errors.yoctoproject.org/Errors/Details/840502/

ERROR: lapack-3.12.1-r0 do_package_qa: QA Issue: File /usr/lib/lapack/ptest/bin/xdmdeigtsts in package lapack-ptest contains reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.1-r0 do_package_qa: QA Issue: File /usr/lib/lapack/ptest/bin/xdmdeigtstd in package lapack-ptest contains reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.1-r0 do_package_qa: QA Issue: File /usr/lib/lapack/ptest/bin/xdmdeigtstz in package lapack-ptest contains reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.1-r0 do_package_qa: QA Issue: File /usr/lib/lapack/ptest/bin/xdmdeigtstc in package lapack-ptest contains reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.1-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../lapack/{lapack_3.12.0.bb => lapack_3.12.1.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/lapack/{lapack_3.12.0.bb => lapack_3.12.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
rename to meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
index 4845d34106..87a5747246 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
@@ -16,7 +16,7 @@ DEPENDS = "libgfortran \
           "
 RDEPENDS:${PN}-ptest += "cmake"
 
-SRCREV = "04b044e020a3560ccfa9988c8a80a1fb7083fc2e"
+SRCREV = "5ebe92156143a341ab7b14bf76560d30093cfc54"
 SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https;branch=master \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
           "
@@ -63,9 +63,9 @@ do_configure:append(){
         # for f in $(find ${S} -name \*.f -printf " %f" | sort -u); do
         # would be more reliable with other optional PACKAGECONFIGs, but also very slow as there are
         # ~ 3500 of them and this loop takes around 20 minutes
-        for f in xerbla c_cblat1 c_cblat2 c_cblat3 c_dblat1 c_dblat2 c_dblat3 c_sblat1 c_sblat2 c_sblat3 c_zblat1 c_zblat2 c_zblat3; do
-            sed -i -e "s#\(.*-c \).*\(/$f\.f \)#\1$(grep "\-c .*$f\.f" $file | awk -F'cd ' '{print $2}'| \
-                awk "{src=\$1; sub(/.*-c /, \"\"); sub(/$f\.f.*/, \"\"); obj=\$0; print src, obj}" | \
+        for f in xerbla.f c_cblat1.f c_cblat2.f c_cblat3.f c_dblat1.f c_dblat2.f c_dblat3.f c_sblat1.f c_sblat2.f c_sblat3.f c_zblat1.f c_zblat2.f c_zblat3.f cchkdmd.f90 dchkdmd.f90 schkdmd.f90 zchkdmd.f90; do
+            sed -i -e "s#\(.*-c \).*\(/$f \)#\1$(grep "\-c .*$f" $file | awk -F'cd ' '{print $2}'| \
+                awk "{src=\$1; sub(/.*-c /, \"\"); sub(/$f.*/, \"\"); obj=\$0; print src, obj}" | \
                 while read src obj; do echo "$(realpath --relative-to="$src" "$obj")"; done)\2#g" $file
          done
     done
-- 
2.48.1


