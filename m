Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2D0CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.18623.1759326780368873387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BzJ1EliG;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso2348619a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326779; x=1759931579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nm4wl737p5wXRIo9qntG3zInJweH/t06/6SObAflwro=;
        b=BzJ1EliG5jExJ8Zt9aD2KTC2XXw+zKF7CMZsbcp10iHfAT+sUigFT7if+DO0QmWDkI
         gS9PHGvKHMG53NHKa+xI/Bs1hYXgauxEP38Z2+OUbHhN219Dz98uiW0ayTIV2nwgXHSd
         jry/MclNpLAjwhTo12GICnmDwNVvAT+4lAV+90h4d91BrgjBvw8iohm/Dav15WGBJ8kC
         gXkPeQKosGhNKajH1IYAuwiYC+grg0cr+dGyd4NIEQgI6UsB9q9WKH9LqfuNoJUQX2bq
         5eAY7010DyJaZZ3544ZO9mrJIUlAPdYyxCtDDKkLD0PQ0hnk6lXVi/KjCB97dtGcgxta
         PzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326779; x=1759931579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nm4wl737p5wXRIo9qntG3zInJweH/t06/6SObAflwro=;
        b=G7GRaiUoPKZxtfsomMgtFJHWKyZb2MFRSImHyILV0fE1j9Yo6hUAmSHkRV+0scUAJc
         FOTwg19e9Yw76TA29aNFByzCvi2Vui/l5BiR60b5455PNJJKMydRY++VYHv8Xa4YxOcm
         hpYkl2KX1Y6Q/786ZCD32UM+yefL6eWr/n9SXFm50mNUlGXo/r1MSkmICUw9rXkE+qXQ
         hZZY+13vJN6H9PLyzy/qxRkOLkbP+2EQeiyNtszr/we4291+OvMxQ54nSye8sarttmcz
         8Sj30VVYQzrk0rzBIkAOUd0BQau66u6LWin0mW4TfJ2EJFgZjjxtjLPgriucjDda+C5v
         m7uw==
X-Gm-Message-State: AOJu0YwBqfyMe7/DwpAHpSoWSqA5hUnHCMqLkVvgz7YfUX+BtwAuRDjV
	uJNqbTwHDmdpA+F63U1F9tPhItKlsDiD+I5dXl4u8O+HTLKe+wLnqDsGIl7+xQ==
X-Gm-Gg: ASbGnct4EuZ1mubztugqnVwxspUZqLSb/Z2RTIorlG3Y1pGbOgZOv4fUlxmAkqyBY7u
	RccWr7H+wyG3JfLyOexOKi4fsk+CHirXtqjbsu8bw6QYzlSkwZAqz40ld/MjYJaTQk0Tib4fDQv
	4UqtDMl/5Fce+gtSsOBoZzr1NoVtuD+e+wbaytXog68C1N8fLSg4wGo623O/0shT6xBe1W95R0G
	LwJ0m1/TNXmnhIvQpgA67kq5d476ycBZloZmLq/5MGJqB84l6pRlVciXWNRf/EhgQxFMfGOCZvs
	QahPKvEDL9LybQefsBYdwXSTM4Iv89HhgEqjxajxjXbxMA4l0LbMUwX+/8A7XyhiVaEk9/OY7i2
	oShQZcHLdPkIrxyNs63cF4e8dCaizRE/G51u87lkP8BctciK5OejPPgA=
X-Google-Smtp-Source: AGHT+IFfeU6Rt/ZylEon3NCq0bxSyUhFoE6LA9/jDJwCfwCoT0Hnd4YHy9cjGdiklEiDrxLS2c5A6g==
X-Received: by 2002:a50:9ee9:0:b0:62f:9091:ff30 with SMTP id 4fb4d7f45d1cf-6365aae4d2cmr6767430a12.3.1759326778595;
        Wed, 01 Oct 2025 06:52:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 17/25] audiofile: patch CVE-2017-6831
Date: Wed,  1 Oct 2025 15:52:35 +0200
Message-ID: <20251001135243.1490753-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120132

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/bd5f84d301c4e74ca200a9336eca88468ec0e1f3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9d668989b1447fb19aff55c1a47acdf8d4e8c5e2)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ail-when-error-occurs-in-parseFormat.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 0ed3853553..4fe6657a97 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0004-Always-check-the-number-of-coefficients.patch \
     file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
     file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
+    file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch b/meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch
new file mode 100644
index 0000000000..38294ca200
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch
@@ -0,0 +1,46 @@
+From a2e9eab8ea87c4ffc494d839ebb4ea145eb9f2e6 Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 18:59:26 +0100
+Subject: [PATCH] Actually fail when error occurs in parseFormat
+
+When there's an unsupported number of bits per sample or an invalid
+number of samples per block, don't only print an error message using
+the error handler, but actually stop parsing the file.
+
+This fixes #35 (also reported at
+https://bugzilla.opensuse.org/show_bug.cgi?id=1026983 and
+https://blogs.gentoo.org/ago/2017/02/20/audiofile-heap-based-buffer-overflow-in-imadecodeblockwave-ima-cpp/
+)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6831
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libaudiofile/WAVE.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libaudiofile/WAVE.cpp b/libaudiofile/WAVE.cpp
+index 0e81cf7..d762249 100644
+--- a/libaudiofile/WAVE.cpp
++++ b/libaudiofile/WAVE.cpp
+@@ -326,6 +326,7 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
+ 			{
+ 				_af_error(AF_BAD_NOT_IMPLEMENTED,
+ 					"IMA ADPCM compression supports only 4 bits per sample");
++				return AF_FAIL;
+ 			}
+ 
+ 			int bytesPerBlock = (samplesPerBlock + 14) / 8 * 4 * channelCount;
+@@ -333,6 +334,7 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
+ 			{
+ 				_af_error(AF_BAD_CODEC_CONFIG,
+ 					"Invalid samples per block for IMA ADPCM compression");
++				return AF_FAIL;
+ 			}
+ 
+ 			track->f.sampleWidth = 16;
+-- 
+2.11.0
+

