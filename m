Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5B5C77B75
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 02:53:02 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.15426.1683341575328839901
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 19:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NAxH6nDh;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-24de9c66559so1771783a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 19:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683341574; x=1685933574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U7AeWy27BIHU8vvYvj3he0UI019I5fRjT7+cJGO0wuE=;
        b=NAxH6nDhmlDqA37txCC2mptOaKsv9fhle3e0oGjXPB5QTm6giWYfijsxzZ/Qg/fnZY
         WRZXB9Cra4UcypQNZ9jt79nlaaKAdj1FUf9ZbNjuucPmx2zQ6ZiTY/PWZR6BcSeY0KcM
         12p3wpEfxAK/O8pV73pq33naAAyXRwZWBlngG0W31gnR5rXjyj3PhLjF04UJ0Qei/9QW
         heVIYlrNhwWwrlkzWpdA77jXn49LFRJ+j/J3+lxCKXQE8wcpZDCfppXLgD2ShcDy1jAk
         HzfDYMbMvThT3JshjvMxscmLV5uBaLT97WNXCdpeqO6MNI14yw/0pkvWPs1PnmyhWNmr
         1tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683341574; x=1685933574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7AeWy27BIHU8vvYvj3he0UI019I5fRjT7+cJGO0wuE=;
        b=alSmqj4wJ96YXnVVBPxLZwybEdsm1x2mlkmPpU0U37scx2oHqdUBLqmLm+BVDkcLAY
         r0J0emEDtckBUwd5ueK72zODYqvGtPkHqVAcIY7fu8/PnCMRdOn2Yq2KRQmzOL2Lr7FF
         NllXqPFQtwxthL/ePrfl3DkCD0jvvjGBaEV5lm51VxZt3xAFyJL2Js13J+0/rJT1KMkq
         4uJJrf+IYfsjoRmJ0gfEU4b84yYYRl2d08T67ZntrItwrTPjHrTY5TzqVXrNgYdmpuy7
         YJrhq4vpX0NmW9x6lZe9affx9ZACFfGzuuZN3aAXIsQuhJ2smZKPQvFXWZRhBX4Tj0vM
         s/ug==
X-Gm-Message-State: AC+VfDxEbPSXZ0pt4QPtnQ1ADkVU1dalQ2rtcHqdmECO4dM787Ec6S75
	glHuIVEGSoOVLz0Rbn669B4tF7mR8M0UDQ==
X-Google-Smtp-Source: ACHHUZ6MWVDHn7/WVbsUwwhZLWouHVi7QRSysVC+OXJJko5khOMY80kNDIxVRJ3VsN8xVtf/ogquiQ==
X-Received: by 2002:a17:902:ceca:b0:1a6:5fa2:3293 with SMTP id d10-20020a170902ceca00b001a65fa23293mr3596996plg.56.1683341574042;
        Fri, 05 May 2023 19:52:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id b2-20020a170903228200b001aaffe15f39sm2464933plh.30.2023.05.05.19.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 19:52:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libftdi: Remove sysroot paths from .cmake files
Date: Fri,  5 May 2023 19:52:51 -0700
Message-Id: <20230506025251.3447219-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 May 2023 02:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102322

Fixes
WARNING: libftdi-1.5-r0 do_package_qa: QA Issue: File /usr/lib/cmake/libftdi1/LibFTDI1Config.cmake in package libftdi-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index bc5897413f..7f0cfa237c 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -27,6 +27,11 @@ EXTRA_OECMAKE = "-DSTATICLIBS=off -DEXAMPLES=off \
                  -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
                  -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
+do_install:append() {
+    # remove absolute paths
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/libftdi1/LibFTDI1Config.cmake
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "${PN}-python ftdi-eeprom"
-- 
2.40.1


