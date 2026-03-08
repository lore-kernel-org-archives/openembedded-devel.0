Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88170EA853F
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 18:37:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45521.1772995023746194272
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 11:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4An6kM1;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439af7d77f0so6850957f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 11:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772995022; x=1773599822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsNIHkhtHtSluEN8J9PlnZWNwwJMWsdIm8OoxU1bOdQ=;
        b=m4An6kM17VJg2dqCH9mAoq4/XkzFqkrCVg5Hyk50ZDPtCTDM+drq9ThKyOXvygAmPK
         0MbDQP6Ms2Tjptz2+ENWmRJaGukIAdhOdVKlH5UEfbwFuKLWG5dIQ0p37xm8C3eYFfEo
         qC9xy0n4vJcZHZWTqHxqtloWjmX0bdQPrO2WLIYUo0qrmC6fkhb+RK2blC5QpNIFRg3h
         owrjW7GdV0njRWAu1LZlYDlrreCjdTuirz0hzz6jJ9g5ytV6jGf/qMW4SoBjp2AtBfCB
         3iJfwypudG0wfl82yvqxGTS10VBTC7LYGUwMI313uYuGVPfDBBqhdjzklO+My4tJ0aS/
         mRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772995022; x=1773599822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsNIHkhtHtSluEN8J9PlnZWNwwJMWsdIm8OoxU1bOdQ=;
        b=i4cVrVt5LF6fWEO+0ZDNddK9i/KZW6s6e5jkhp+Qen6vxWJR8Q+kTZHQZzrcfI3GRI
         fUymPblgsCuJyqwF4uK2CBa86YVElmcbXlhr47h5Idpz7bAzlg3S8VJKpuVBOv+hpxdF
         itq4ioQRffL9ZWD6xer8riRGdYH1QHTgv5Oet8xMG5kUPG0AI2Ap5sM8JmKdlDhIcmrA
         MoYHxkB+LVeEmuDP4g5FRD/Ih8+Qr+LBU5hhgYW3DrSJGAoMh4nhuCIk3BhPubmB0sV+
         XX33udo2tZKWjIRea0Ehc7WEh57xaFPnuHqnpfTMDLaFStSRhGXa8LX5WxVU089YPPeD
         I3lg==
X-Gm-Message-State: AOJu0Yz8XIswdZUINDApQhCV3Ub6oSNh4XkAQGoh3zfzqzqlmhhSa91f
	/Ur09VIEI4DNHvg9DTR6DLq0fwjMfmDn2Cp+TVemFNsTwvMsQu271++SBZHvsA==
X-Gm-Gg: ATEYQzzOypFd+Vv19uJyaSDda2B8cahrg7rRZ/bX0+lNAghIiuXGUNeHVXmVdEur7IJ
	g7fgDMZrEcyeZ74Lk4YEGWyUtEWR0474Zrons+xwJWC1UbM5BaIjfJZhy/Kg1xZFGPAFI2l/t0t
	1JRYmjPlsowNsGyo0ANQMPZx93h5QfGi8JCIbSDAKqWEq7aOuZ+u0nAG5O/TUrdIIy7y1Z+6gGp
	zLmjRdSrNKHXUAMDKGawyQ+DeHRBnLzgY3MUeSlA+PfYPLf6R+P2YJJpRX/HwFJA6YpawI/JSCp
	HpqzC6Wo9UTgu0Mpix3VNaYXfJ/SeawZKcrqQPXvPfCSk9siVkgGGRwNs2ctmSdiZS7cDfyjfpP
	j9HqPBV9EielLP8aiIWugvbyExH7jyLWTiTgO09OKFD1RAKyhOQjtPqfOF3ysal289MLG0RlcY0
	MBDGISwfI1UNTx6dzG70FE
X-Received: by 2002:a05:6000:4203:b0:439:b60a:b3fd with SMTP id ffacd0b85a97d-439da67c0admr14617906f8f.37.1772995021792;
        Sun, 08 Mar 2026 11:37:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadac2a7sm19918484f8f.15.2026.03.08.11.37.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 11:37:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] exiv2: upgrade 0.28.7 -> 0.28.8
Date: Sun,  8 Mar 2026 19:37:00 +0100
Message-ID: <20260308183700.16546-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 18:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124946

Contains fixes for CVE-2026-27596, CVE-2026-25884 and CVE-2026-27631.

Ptests passed successfully.

Changelog:
Fix leak
CI: update mac runner for 0.28.x branch
Add some new cameras and lenses
Make DataValue::value_ public
fix reading mp4 url box nested in non video/audio track
fix: do not add target exiv2lib if the target already exists
Add size checks to avoid large memory allocations
Fix size calculation in XmpTextValue::size()
Avoid calling std::find or std::string with an invalid range
Backport all changes in .github/workflows from main to 0.28.x
Fix out-of-bounds read in CrwMap::decode0x0805
Fix UBSAN false positive
Upload crash files when fuzzing fails
Remove nightly release
Fix regression in Canon lens detection
fix wrong timescale used to calculate fps
Remove nightly release vestiges
conan: update dependencies
Add Tamron 18-400mm on Nikon D90
Add Ricoh GR IV HDF and Monochrome IDs
Refresh translations
Add build provenance attestation
Add fuzz target for previews
Align some docs to main
Update README.md
add enforce to prevent integer overflow
Add enforce to check for integer overflow
Release Exiv2 version 0.28.8

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/exiv2/{exiv2_0.28.7.bb => exiv2_0.28.8.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/exiv2/{exiv2_0.28.7.bb => exiv2_0.28.8.bb} (94%)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb
similarity index 94%
rename from meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
rename to meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb
index 82ee232fdc..df0e72f5d6 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${
            file://0001-Use-automake-output-for-tests.patch \
            file://0001-Allow-test-data-path-configuration.patch \
            "
-SRCREV = "afcb7a8ba84a7de36d2f1ee7689394e078697956"
+SRCREV = "2cd987a731236037b6b78cbff897d08685a8ef49"
 
 inherit cmake gettext ptest
 
@@ -19,6 +19,7 @@ PACKAGECONFIG[unittest] = "-DEXIV2_BUILD_UNIT_TESTS=ON -DTEST_FOLDER=${PTEST_PAT
 
 RDEPENDS:${PN}-ptest += " \
     python3-html \
+    python3-json \
     python3-lxml \
     python3-multiprocessing \
     python3-shell \

