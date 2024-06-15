Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A580DC27C53
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 23:08:23 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.23787.1718492898706397391
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jun 2024 16:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AlANNgrn;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-254a2d8485eso1540815fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Jun 2024 16:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718492898; x=1719097698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAgY/2ssOzPZeatfl5ZixpHn0cKp93tN/vcJpgH3SnI=;
        b=AlANNgrnCWX7VVwmyE4LESXshwWfuIDwDJbayL5Jugd9edYuQ1gFjJaz8xuAl1CRLq
         Imry5TJHuoBd/Rdw4v+J2NlLcap0sIg7c9PTSKwAd33vkLR7wjYxe/lyYklam8xSewCb
         FiFN32NxE77E6QM3dH3fbDxQhDWeK64VvVFvGKkPwxKye6k5dMBXmBp754sP3vEv2UJe
         XmGQKSBQZS9AwNS0o/nxd9xPo8KtBHd3zSUzrUYLkrVLhkFOEXanyW+xnA6sZvlGGUgF
         RgwtCGe5ATV4Gfdnt46qtzqX7VcQF7mw2ImhW3Tb1M0Vujt50OgKoM+KIwVNIW2fCoB6
         4yHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718492898; x=1719097698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAgY/2ssOzPZeatfl5ZixpHn0cKp93tN/vcJpgH3SnI=;
        b=BVfA23wy8lIhcyzYh7l3ScXKSedpUzxJaiCoeooRbXv2mP4F+du5mgRH/Rys9B13i/
         iPlJJ55qzN2lALmzjYo4lE3TV16k8TrfLUzPlcSWgncstdpW3+WCXS8Zjj/GYEr0kil1
         3wK/iWgprM6tfL7sLx31i/198WsWFv0/bwVwoJM+dnxm+t/6Q05pJJWnXGEvlm3N1eaM
         jDMV32Kqxccg3BbrYTbHQ+AzO3itMqYZBd3DumzlqXP8+aejHaVVCbFVBD6vcnOEYLsq
         GGE8rMOBIzV9g8F0o0oSB4YS527XgoSKSz6CWCzfLbAXVrntRW9WhN+Lv6PXrCYE2yB4
         HJMg==
X-Gm-Message-State: AOJu0YxFRjraGIICvv1wSQdr0nMdCSc5iSIfKKkL0kCZ7iikFyQ8vGgk
	ILg33vjlIkUU4hXhegWMTk6u3NdlbGEAmKqrGHEdMIfEcNS5IS2Y+JZE+g==
X-Google-Smtp-Source: AGHT+IHBD/Is0ypusCs/tFoRGCdIdRvzwkm+Muk5ytXJa5i5gDtanbLiV7UfJiVgp2YbQIVP6PPotg==
X-Received: by 2002:a05:6870:d183:b0:254:e89e:fc1d with SMTP id 586e51a60fabf-25842b836bbmr7087142fac.51.1718492897761;
        Sat, 15 Jun 2024 16:08:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::91d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc924ed0sm5176823b3a.4.2024.06.15.16.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:08:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fmt: Remove
Date: Sat, 15 Jun 2024 16:08:13 -0700
Message-ID: <20240615230813.40663-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jun 2024 23:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110914

This recipe has been migrated to oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb        |  1 -
 meta-oe/recipes-support/fmt/fmt_10.2.1.bb        | 16 ----------------
 2 files changed, 17 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fmt/fmt_10.2.1.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 19242ba545..8760810248 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -742,7 +742,6 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     exiv2 \
     libnice \
     c-periphery \
-    fmt \
     function2 \
     gd \
     gflags \
diff --git a/meta-oe/recipes-support/fmt/fmt_10.2.1.bb b/meta-oe/recipes-support/fmt/fmt_10.2.1.bb
deleted file mode 100644
index 1437eb4803..0000000000
--- a/meta-oe/recipes-support/fmt/fmt_10.2.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "open-source formatting library for C++"
-DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
-HOMEPAGE = "https://fmt.dev"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
-
-SRC_URI = "git://github.com/fmtlib/fmt;branch=10.x;protocol=https"
-SRCREV = "e69e5f977d458f2650bb346dadf2ad30c5320281"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
-
-BBCLASSEXTEND = "native nativesdk"

