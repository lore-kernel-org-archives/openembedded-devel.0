Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243B9C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:09:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.51485.1703167788804598440
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PLv/vwwq;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d3f2586d4so5466825e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703167787; x=1703772587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCxTPMLul6116m+2IFXUNk5dW5Ku65f9Y8npgBjtkik=;
        b=PLv/vwwq9aaVdzFWXMhcyTEbvJOWVFmKyu3mZFSgDW6Cx3BVSaDBb39DHucSv+rnmc
         sVqcSIQpNvz7ReQv+z8PNDsQ4Eq2qU8/AgUK9YHXpYDyzORj+2Qw/6USzs84tnTDxOGL
         HuMsjhJMQ1rZFdzUvOoSHPVgQDeeONC/9LdXE26c2rcO+TGAHcQza2AQK8mUyQpTfdqk
         JqEulQ5C5jkPb6lEfCs6fYYqpD6KQvFvN4eJdcpsYAqGAwfh9tdubpMyed41IaY0n1nl
         Y+UDR/QqvjyBcRL62Z5Y9XUTCnKgoMARFjDS6mxMGUy+5Ml5otcNbYXBOKmQBA/KSAp2
         JJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703167787; x=1703772587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCxTPMLul6116m+2IFXUNk5dW5Ku65f9Y8npgBjtkik=;
        b=owcP6BmtbAW1VlNfiijDPuoHxUj4ikWjASMpZqY2nyo7CjNEzK3bkHq+vhsDN65iOl
         CDL9BP/b5FOb2OQ7pPEgaFE1qEmf4x07rq9Odt0D9rx9T71IZnjFwgr+FmeI8WLEBDZW
         GV2NaixMzuQbVMxzOUAcjwESwA4PyY9HAGwoHBISECtHiwJNhOYuTCyl/GEfskSTwUkv
         L1soWLAlhXhdu5KJvikNr4ozTjP4tU2DuqZhR6ylYmPVj1QMJFQpOTowS52isJmzaL9a
         HR1lYiA+eYqD7lUPsYEi1tXR5O1+cTVqqW8RDJqA5B2ScWz3muZRUu2cIP4Q5Oo+KlPj
         BlcA==
X-Gm-Message-State: AOJu0Yx0/By4eT/mjO/NVMb1DX7P5myWOq1IemxtSfGeIP6VeilL4KtH
	AN+Pdmx8kqKX4otmEpyxNekNb+XMOj0=
X-Google-Smtp-Source: AGHT+IFJoaAQucJY7CjFRo0LEwAkxqQAXLrjQjaWr3riNoac/aLviCRRbY3h8b9fezPvfEpj2F6rFw==
X-Received: by 2002:a05:600c:3b11:b0:40c:610e:3c69 with SMTP id m17-20020a05600c3b1100b0040c610e3c69mr917662wms.36.1703167786389;
        Thu, 21 Dec 2023 06:09:46 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id s13-20020a05600c45cd00b0040d414b57e8sm1018612wmo.26.2023.12.21.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:09:45 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] wavpack: upgrade 5.1.0 -> 5.6.0
Date: Thu, 21 Dec 2023 17:09:37 +0300
Message-Id: <20231221140937.106663-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 14:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107712

* Added openssl as a depends because trying to link with native libcrypto in some builds -> lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: file not recognized: file format not recognized

* License-Update: Copyright year changes

Changelog:

* added: AIFF file import/export support
* added: WATCOM compiler and OS/2 support
* added: cmake support for mingw, builds Cooledit + Winamp plugins
* added: --force-even-byte-depth option for rounding up bit depths
* fixed: detect and report PCM files having non-zero padding bits
* fixed: possible crash when displaying long channel assignments
* fixed: big-endian-sourced "raw" files gave big-endian "wav"s
* fixed: numerous minor issues
* fixed: CVE-2021-44269 (encoding crafted DSD file triggers OOB read crash)
* fixed: very long filenames cause stack-overflow crash in all CLI programs
* fixed: the length stored in WAV headers not always corrected when using -i
* fixed: attempting to encode raw DSD audio from stdin sometimes causes crash
* fixed: DSD to PCM decimation: small clicks between tracks and tiny DC offset
* fixed: length update in library-generated WAV headers on big-endian machines
* fixed: sanitize custom extensions read from WavPack files to be alphanumeric
* added: accepting brace-delimited options in the wavpack executable filename
* added: "--drop" option to Windows executables for multi-file "drag-and-drop"
* added" "--raw-pcm" option to wvunpack executable (does DSD --> 24-bit PCM)
* added: "--no-overwrite" option to wavpack executable (to resume sessions)
* improved: build system clean-up including switch to non-recursive "make"
* fixed: potential security issue CVE-2020-35738
* fixed: disable A32 asm code when building for Apple silicon
* fixed: issues with Adobe-style floating-point WAV files
* added: -vv option to wvunpack to quickly verify using just
     block checksums (ideal for detecting corrupted files)
* added: --normalize-floats option to wvunpack for correctly
     exporting un-normalized floating-point files
* updated: Visual Studio 2019 for Windows builds
* dropped: WinXP support in official binaries
* fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448
      (no CVEs or vulnerabilities)
* fixed: trailing garbage characters on imported ID3v2 TXXX tags
* fixed: various minor undefined behavior and memory access issues
* fixed: sanitize tag extraction names for length and path inclusion
* improved: reformat wvunpack "help" and split into long + short versions
* added: regression testing to Travis CI for OSS-Fuzz crashers
* fixed: potential security issues including the following CVEs:
     CVE-2018-19840 CVE-2018-19841 CVE-2018-10536
     CVE-2018-10537 CVE-2018-10538 CVE-2018-10539
     CVE-2018-10540 CVE-2018-7254  CVE-2018-7253
     CVE-2018-6767
* added: support for CMake, Travis CI, and Google's OSS-fuzz
* fixed: use correction file for encode verify (pipe input, Windows)
* fixed: correct WAV header with actual length (pipe input, -i option)
* fixed: thumb interworking and not needing v6 architecture (ARM asm)
* added: handle more ID3v2.3 tag items and from all file types
* fixed: coredump on Sparc64 (changed MD5 implementation)
* fixed: handle invalid ID3v2.3 tags from sacd-ripper
* fixed: several corner-case memory leaks

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../wavpack/{wavpack_5.1.0.bb => wavpack_5.6.0.bb}        | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.1.0.bb => wavpack_5.6.0.bb} (60%)

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
similarity index 60%
rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
index 909612393..ebbc59dde 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
@@ -1,9 +1,11 @@
 DESCRIPTION = "WavPack is a completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=8c1a910e5c2a8b30ec8ffb2ffa63d9b2"
+LIC_FILES_CHKSUM = "file://license.txt;md5=bb5d037e3ad41a3c84c9f2d8bb65a7b4"
+
+DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https"
-SRCREV = "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
+SRCREV = "e03e8e29dc618e08e7baba9636e57ba1254874ce"
 S = "${WORKDIR}/git"
 
-inherit autotools lib_package
+inherit cmake pkgconfig
-- 
2.25.1


