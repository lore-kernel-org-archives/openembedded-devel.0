Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13377C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 12:24:36 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.78379.1705321475270847240
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 04:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I1/Qj/1d;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cceb5f0918so90458501fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 04:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705321472; x=1705926272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I03Xcq6tCuUDGvVoPYu4GXIv6Q0zTu+paCW8VryP3Xo=;
        b=I1/Qj/1dTxRk92eZtA1X5kcRVRZYKciCCVUEm4Mfl3LMb5EnrlMj7R7+jrY0wG7QZa
         sxYEsPcHgY//NF42Kq384pHy+ybNdHVDQ2oJOiWQ1CsmURxaNK15iTPjMj0DTy71iR+H
         ckATEHIwSn11UI0E3g8Ql0kvSQ105y3jEteYHN6ZFUpjtqinEkLFA0LWBNiwy5Gwf8Do
         IIe2YYjeyY3qo6lP7tUebx11QsZqeXnYW9K/2zuxTdhvvwKPCAjMiXax4xPI/5/1kLrs
         RTHJKsiQmUksqruL90wo1w1YTbn7eQ++BpzS7T4rTlVLIDTZX1nN1RbMmLS1Y6nVbxnj
         giAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705321472; x=1705926272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I03Xcq6tCuUDGvVoPYu4GXIv6Q0zTu+paCW8VryP3Xo=;
        b=Cmf6M5EwpXYbHE3bXNK7D7BvClNRI8poGwZfElELtL3H233XAB1Wxyh6mc+rjmOMYu
         kQ4rDuHx+LsGIKB2/pru4g8D1RZHPO7EPNie+cvRM8NY5FjYF3JRouA8N0wABH9uNf3v
         skhDabOl4joNtxVStcgZZIRgNNTNEfsOhEiOEibORnnUDKbgBuYe9189QfcFHp20KdBT
         6UfqOtUj8YwEviaFv8omB3TLP5u1sCDJI40b2nkGYa14oZtFtLgxLEQgxe7rC2j5dZEh
         4BEu4dCwukhghJDd32y1RUHdeSrciO/ubLcJGuQphsy9tk3pCWBgwcM88armvKDRXdYp
         1ABQ==
X-Gm-Message-State: AOJu0YxSf5oIEj7zntlQTQ2sypRF67L4UExNv2Z87O9EPAiIWb7eVzn+
	h2SQc3eVO7Vu4L8tSYYplOsrkYjoy803uQ==
X-Google-Smtp-Source: AGHT+IF3v9IyASnlgRnU2v1Z+tcCygMFlVcpLoUXSI5Mnjd7NiYWpcYlB7THmFoZ65KQM7HDIhcTzw==
X-Received: by 2002:a05:6512:34d3:b0:50e:ea33:7596 with SMTP id w19-20020a05651234d300b0050eea337596mr1333039lfr.181.1705321472160;
        Mon, 15 Jan 2024 04:24:32 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id xo16-20020a170907bb9000b00a26aa5c5a60sm5301196ejc.19.2024.01.15.04.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 04:24:31 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] spdlog: upgrade 1.12 -> 1.13
Date: Mon, 15 Jan 2024 15:24:26 +0300
Message-Id: <20240115122426.766281-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 12:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108285

Dropped SPDLOG_BUILD_TESTS and SPDLOG_BUILD_BENCH from EXTRA_OECMAKE because already OFF

License-Update: Use upstream's LICENSE file instead of Poky's MIT license.

Changelog:

Enhancements

    Qt Sink: Allow for darker colors for light backgrounds
    Set CMAKE_BUILD_TYPE only for single-config generators
    Provide spdlog_header_only in build directory export
    Add SPDLOG_TO_VERSION to compare spdlog version
    Support async_overflow_policy::discard_new
    Make syslog_sink.h's syslog_prio_from_level protected
    Fix OS availability check of pthread_threadid_np for iOS
    Add .git-blame-ignore-revs to ignore clang-format related commits
    Match SPDLOG_CONSTEXPR_FUNC to FMT_CONSTEXPR

Bug Fixes

    Check fd_ is not nullptr in file_helper to prevent possible crash if disk is full
    Fix encoding issue in qt_sinks
    Fix wrong thread_id (TID) in systemd_sink.h
    Update example.cpp to fix the vector issue in bin_example
    Fix MSVC compile flag for no exceptions
    Fix bug in circular_q::size()
    Fix link to fmt license file

Maintenance

    Added and updated various tests for circular_q.
    Removed obsolete part from CMake configuration files
    Removed policy_max from cmake_minimum_required(..).
    Updated clang-format to google style and updated various formatting scripts.
    Bumped to catch2

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../spdlog/{spdlog_1.12.0.bb => spdlog_1.13.0.bb}   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.12.0.bb => spdlog_1.13.0.bb} (58%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.12.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb
similarity index 58%
rename from meta-oe/recipes-support/spdlog/spdlog_1.12.0.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb
index c7d8ff8f3..c6a0881db 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.12.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb
@@ -1,17 +1,18 @@
 DESCRIPTION = "Very fast, header only, C++ logging library."
 HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
 
-SRCREV = "7e635fca68d014934b4af8a1cf874f63989352b7"
+SRCREV = "7c02e204c92545f869e2f04edaab1f19fe8b19fd"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
 
-DEPENDS += "fmt"
+DEPENDS = "fmt"
 
 S = "${WORKDIR}/git"
 
-BBCLASSEXTEND = "native"
+inherit cmake
+
 # no need to build example & tests & benchmarks on pure yocto
-EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLE=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
+EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLE=off -DSPDLOG_FMT_EXTERNAL=on"
 
-inherit cmake
+BBCLASSEXTEND = "native"
-- 
2.25.1


