Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39F9C0218E
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:27 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.15106.1737828203716529128
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZtwmLh1F;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21675fd60feso71258845ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828203; x=1738433003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj4zYSKuvN+ZFCcUyzBsBEQw4vdg8o7veh1NIhsr9Xs=;
        b=ZtwmLh1FzGod2/VgEhr5V1/p+l4X3ASt1XopcdVpc9J0MhOBkQff+kjiSOGGdKpZ4C
         JkTN+Q0/FzExMF2znQukXgYavGvIZWYfh4B0HrlecK8g0JROgfCH9kkM5HlU1ROfCamY
         dsbMxIRzr91xbZZR6LswsrIKExDhDLh3f8RqpBbRsvdQ1oO/6uvRKHsd340jRMKe29ld
         pjShFw5xFqG2qNY9SkdACTPZpFWf+tOhjwbS09IeCLOqfKFtXLhxAb9OhcC51ySTI5Kd
         he3qSh5Wad0UqHWXDvIIU0PC+4NvpXGfM2eoXQjYFxNRkj3jsWBHHRT2XVP2fde90Lvm
         Dt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828203; x=1738433003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gj4zYSKuvN+ZFCcUyzBsBEQw4vdg8o7veh1NIhsr9Xs=;
        b=tva/qutdmJ1YGOP7f+bhcm0pa8Ck4mmD0nE6CrBaN6DcDDjAQ/ODp9MCSVIr/4jQNA
         LcxC+AoSbOsT5BpxVDDt3JONiTWSSxWjI/w6P7eJctvDaE4Kjmlnhp+lXvfdr+zZH/i3
         OnllffKOIlgTRBnBwzGkph7QP2zQAQhN5/Wo88i/IQTvMTmr1QkHnzq66Wq8op6gVO8M
         D2Ndrwkms46tNWp52IYP830fONOErSIQpmRY1HIIaquNWnxGa4ruithkWWno7LWgc8QA
         c52VdQXeYvUWgBCRlcZ+UeCy7XvA02EjV7Cpd8BwE/uYQywvWbVvKfg0klgUG9eeoubn
         1XqQ==
X-Gm-Message-State: AOJu0Yzd7MVMFyciPeAkxnbpsvh1i1e2J63Eq/JOErYlHTK+QMY0fCCB
	bGvpgdAM47IBgkpOyaCwz9Dl4S3jDHJqJQkdz6n0xlku/AXpTTK9iY2xgQ==
X-Gm-Gg: ASbGnctSU8qdoiWln3ZEg/l4tWLiRHLPzLIpMcpnV0dNxDCV+9OoKRKM2OAqOfM6OjD
	l/msMOKv48SI7TJkCzg0I8w+xOX9iVzufqywDhJGeKaG7kks/4wyTTGDdE2XN2GT+djA/ZmO+2Q
	I/F27sqU0YVH5p/bCFq311BGkaWEnpjDyGoa6TmbPyciCNEETaTEAs/kHYSC3NMSsIiokIgY3rj
	zKNqJOYzA/Sd75dlnmB8rRYhp8ikvrYlbjg1X/CutvjS+vW15zPo732aAchfSxB+ialxAvlmB5A
	6QuFsOmVmd9ADl9UoFfR/hc6ez4=
X-Google-Smtp-Source: AGHT+IFVp/zneKwGKPcIQo7eRa2js9B92TvFggMpd6IlMpSGiaAK2wBYZ38y4cr45S30RyFIGO/9LQ==
X-Received: by 2002:a05:6a00:b96:b0:72a:bc6a:3a85 with SMTP id d2e1a72fcca58-72dafbb6205mr46327873b3a.22.1737828202961;
        Sat, 25 Jan 2025 10:03:22 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 13/14] audiofile: patch CVE-2017-6831
Date: Sat, 25 Jan 2025 10:03:07 -0800
Message-ID: <20250125180308.7856-13-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115096

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/bd5f84d301c4e74ca200a9336eca88468ec0e1f3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9d668989b1447fb19aff55c1a47acdf8d4e8c5e2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ail-when-error-occurs-in-parseFormat.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 8aebe88f26..3d0ce3bfbc 100644
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
-- 
2.43.0


