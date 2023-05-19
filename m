Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66245C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 19:23:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.344.1684524187414161024
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 12:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sTa6ovqe;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2533d3acd5fso3318095a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 12:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684524186; x=1687116186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hodDLhikVrJs+UJouDbaLCpphoJb+bxaAzFWrFdPbJU=;
        b=sTa6ovqeyJZ3fT8Fvw/qCsnbOyd6lz14PmCR17DbnjjgroCP8MBuNnL1YvQA7huVKu
         +mvuxrUdsH4fMRJyIgMAA3C4yQM3q/+4Howh9YLpvmoHIo3FDakQrRM59bYThV625N2s
         gpAqWgDqHjnQkoCPGrjk7vi7FiL0+PjIoSt3F5qQWQElE/3sapXYXEQbWfm7kJvq/2SI
         d4MiAK5X99XfFgcOz0/q9RkWGAa+M3i4BqufzH+koI+IjeLPPcrz0sElk5iNSpSBDEMw
         OggubhvFsyAZsJxbtPb6yLMYxpLeM+ofXwsljAnSa4fm/bK38CQ/7mz4hxzvRLAwTADY
         zmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684524186; x=1687116186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hodDLhikVrJs+UJouDbaLCpphoJb+bxaAzFWrFdPbJU=;
        b=Tg2J5o3iq2vQS2YJ77iC7Z2C3dKF7Jwmf3tsysoMRSXiuswZt7w7Pd5yRxboptpw4j
         kkD1YXmJQ7Pt2krA6U3utUUr0s9FBi4a7UwtqKglLZzoRP7dllEanB8fnZcz3w6bhsiI
         1pIVqweacp3vlOsQ0p/ivoZ2/YV7bOn/1Z3U9HW9Q+PVXvbHtybX4sYQqw0RcmQULaL0
         8zDGoXYoL9apLPvPfZO1ReRJPEJRoTRdBc0ZtqMHun7CsQlRvz2rsmIy3sQZi+JOpfdk
         UZRj3uDduMg2NyRjdKO8qIPud1h9WpEMtndk07Fk90aRO+NWMcO4KMONfP4tnUoQX9wD
         sTaw==
X-Gm-Message-State: AC+VfDxSuSqn9AE/VXPuz4x36Nrc6C+rUIOQsKHB7mW11GMFXeMp7qlC
	oeGZiU1xwfd3qNUKdUrb4+CZHL03SnQ=
X-Google-Smtp-Source: ACHHUZ7bzU6S/CcChd5K3yNo2WjookYLx7kxyioB4HUeV6oupRFx2VEW66cO11gB4VRpSaVEqSakCQ==
X-Received: by 2002:a17:90a:4a07:b0:247:2874:a6a6 with SMTP id e7-20020a17090a4a0700b002472874a6a6mr3157938pjh.2.1684524186439;
        Fri, 19 May 2023 12:23:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id gd18-20020a17090b0fd200b0024e1172c1d3sm5597pjb.32.2023.05.19.12.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 12:23:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] libwebsockets: Fix reference to TMPDIR
Date: Fri, 19 May 2023 12:23:04 -0700
Message-Id: <20230519192304.188560-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 19:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102688

.cmake files encoded absolute paths, fixed thusly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Edit the .cmake files instead of patching

 .../libwebsockets/libwebsockets_4.3.2.bb                  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
index 67269b05af..5e6069fb81 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
@@ -36,6 +36,14 @@ EXTRA_OECMAKE += " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 "
 
+do_install:append() {
+    sed -i -e 's|${STAGING_LIBDIR}/libcrypto.so|crypto|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
+    sed -i -e 's|${STAGING_LIBDIR}/libssl.so|ssl|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
+    sed -i -e 's|${STAGING_LIBDIR}/libuv.so|uv|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
+    sed -i -e 's|${STAGING_INCDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
+                                       ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
+}
+
 PACKAGES =+ "${PN}-testapps ${PN}-evlib-event ${PN}-evlib-uv ${PN}-evlib-ev ${PN}-evlib-sd"
 
 FILES:${PN}-testapps += "${datadir}/libwebsockets-test-server/* ${bindir}/libwebsockets-test-*"
-- 
2.40.1


