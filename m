Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400BDC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 07:05:08 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.7182.1720508707138893743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 00:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SA+54eti;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c98189a268so549596a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 00:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720508705; x=1721113505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8c9fN7NRUcDEXB9gtvRRxOjcYoelvwzur9d0VofK4vU=;
        b=SA+54etiIUc2yHEC5ITjhwtGypoj1kUxblT6aQX0x1A1amxsoD5EXAA1REea7OuYIa
         2HDLZc61cgmYLcV0U3ZRB866h+OaDGj9DHNZeVaQAwKfK04fSlMEHm2pt2JEZhn0Jsf7
         Yx6o0qCIPn9S3XEZ9UkIVvdCQc7EYPmnFscIr5tXPrJ3VNzjzwA416EE/bG9nk431bpt
         W7iQfpxscfbR/5xevneZMX2mYRhiT0Qs0dsyFTwb7XlFxNosEpaSTi+G7mWmMxU0tPRS
         F2sshsbLcyOb+KcK9VU4qkr4X4Y1B606USMka1uFrMbcCcV49fvgVtgsjZZj/3zAYhjj
         wn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720508705; x=1721113505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8c9fN7NRUcDEXB9gtvRRxOjcYoelvwzur9d0VofK4vU=;
        b=rKLHAvSz0zZhiZxATAT8VjbrHT6OAI2w42IIizDqDBxS0jLson0PvaN7RTUXjUdCbk
         ulvKUkHe0kJDpkOiLAbl2cENk0GUSbjDI1znl0RWrBujUoAX2Mvmpc2JVCYCAcGOryYd
         sD1tv6AAqCe7FYPZQcKwYGvKxfLNV3j1EVNJ1TMDurymLuACmg+9/ObTTn8kBOAxEc6Q
         he8epL7+KOVFOlsukyHB8fForAAHaTnKmT2ISxQD8BBgMZP3qfvhNCb5PRHrQmnzGODM
         Xw74kv600XDPEX0zu1Y9DOZHSN8eI8buLxiWzwHZpSuMATA2/JZiG0Ya36gdUC6a8baA
         fBJw==
X-Gm-Message-State: AOJu0YwqMRHMzvgjSMs9QaMKnmYRYpxoj2MiCMgw8u1aUDYKdUjdLeQB
	g1pCTb0h9Ht1+hzzEfGF/q2gtINHtVnxpdKH/DzO5sF5+EHU1qi6PA8ynQ==
X-Google-Smtp-Source: AGHT+IHigLSUFEUsLe13S+Q/qjVhIsby9qM6re2M8oCvMR0rpA3LPo64vRGUxw5UwV+JEe7k/ZbCTg==
X-Received: by 2002:a17:90b:3b45:b0:2c9:6920:d2b2 with SMTP id 98e67ed59e1d1-2ca35be111emr1964523a91.1.1720508705494;
        Tue, 09 Jul 2024 00:05:05 -0700 (PDT)
Received: from L-18010.kpit.com ([116.74.193.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99aa61e30sm9247504a91.45.2024.07.09.00.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:05:05 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akash.hadke@kpit.com,
	BINDU <bindudaniel1996@gmail.com>,
	Ivan Stepic <Ivan.Stepic@bmw.de>,
	Armin Kuster <akuster808@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH] flatbuffers: adapt for cross-compilation environments
Date: Tue,  9 Jul 2024 12:34:56 +0530
Message-Id: <20240709070456.181309-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 07:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111278

From: BINDU <bindudaniel1996@gmail.com>

Flatbuffers contains a library and a schema compiler. The package
contains cmake files to discover the libraries and the compiler tool.
Currently, all of these cmake files are installed into the target
sysroot. However, the compiler utility isn't installed into the sysroot
(as it is not runnable on the build machine).

When an application that depends on flatbuffers gets built, it uses
flatbuffers' exported cmake targets to configure the project. One of the
exported targets is FlatcTarget.cmake which expects to see flatc binary
in /usr/bin of the sysroot. Since binaries for target don't end up in
target sysroot, cmake configuration fails.

This patch addresses this problem of flatbuffers' build infrastructure
in cross-compiling environments. By removing FlatcTarget.cmake for
target builds from the sysroot we essentially skip this step of
flatbuffers' configuration.

Signed-off-by: Ivan Stepic <Ivan.Stepic@bmw.de>
Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit b97dbaac6629e22138f71ae19eb421d041447619)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
index 183554e2c..3103fd009 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
@@ -23,6 +23,11 @@ EXTRA_OECMAKE:append:class-target = " -DFLATBUFFERS_FLATC_EXECUTABLE=${STAGING_B
 
 inherit cmake python3native
 
+rm_flatc_cmaketarget_for_target() {
+    rm -f "${SYSROOT_DESTDIR}/${libdir}/cmake/flatbuffers/FlatcTargets.cmake"
+}
+SYSROOT_PREPROCESS_FUNCS:class-target += "rm_flatc_cmaketarget_for_target"
+
 FILES:${PN}-compiler = "${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


