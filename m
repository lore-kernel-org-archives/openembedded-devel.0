Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451BCC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 06:25:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.16108.1703053538951142612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 22:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kTTkc0np;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so53687435e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 22:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703053537; x=1703658337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Y9ZBFbs4WHIkww8SmLJCCr8sNdQlCv9+5hZksyTaZQ=;
        b=kTTkc0npctynTBJkva/hZqUGQkeJxcJ8KHMHq9zq8cB4aYTLXAqJIfuP3i0qa1cuVp
         akOM89tVi29N14IqQsy+Zu5SpKHuR9PDgPTRCpgRYkXHw3H3vVcnUHXaSs4ndq24EX3n
         k9gbUSB9dqTDWWx8gdrHpPo1WU78jhKN6cXhuEt74IyuaIv1muKulVdHIR0pWdxqRfcH
         jwISFJcfMvmESDtQBgTT2SgOzYuJSrEzBYagBO2q/4gZaOpQDWD9ZO5B59ypTbdAWVmE
         NX/F6C97/yzjCEMLRIqnV5AHWQ5AxdNfS0+cXWbtRVfPJs6MDxdD6JWjE0qdzJHC+8MB
         us0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703053537; x=1703658337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Y9ZBFbs4WHIkww8SmLJCCr8sNdQlCv9+5hZksyTaZQ=;
        b=SICKgMog1EA96sg1YNvTIhkyAlHlUSw3S+TbharYRk+ft6V/g0Wy4ls6r++pr55DB9
         r5c/xggxUqGa02WYy4STHyvKSezfEVpnPiMgUUhRd0nAfwweZRmtCisNS7NjKlo1a53H
         2okQtkPz6QPZ94tezy3zaeghm1PIC3p2lu263UoXC6EMta9RYvgB9HQtfpRzwdZYlUoM
         2YX1Pn7RIgMxE48f3bCZGP7s+Uov5WLB9cpQQa1alHBWoiOJ9iPNq/zQ+wju+vqwhLiC
         eIFrsu8CWpFjdrEKX+PzdItSaclbsab4LbaCqvi1sY1eXrck4YgDppHobBFJmknectk9
         K81Q==
X-Gm-Message-State: AOJu0YyLVwRc86+TtzFGca3ux3fK1dMgqqzSQ4gcc8EqF+cN8rudIygH
	UIVP4O2rPyxmVIeG/o7h2sAtp9XOKJRYxQ==
X-Google-Smtp-Source: AGHT+IFHuG6NYIbhKFOqiNVE3GlmrxevoaW7Pi5/6uOBqylfG+bvgaPi2TDGk8O9hXI9rmOWQAWNoQ==
X-Received: by 2002:a05:600c:3acd:b0:40d:377c:3b7a with SMTP id d13-20020a05600c3acd00b0040d377c3b7amr137782wms.114.1703053536550;
        Tue, 19 Dec 2023 22:25:36 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id bh12-20020a05600c3d0c00b003fee6e170f9sm6004403wmb.45.2023.12.19.22.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 22:25:35 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] wavpack: upgrade 5.1.0 -> 5.6.0
Date: Wed, 20 Dec 2023 09:25:30 +0300
Message-Id: <20231220062530.21888-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 06:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107643

License-Update: Copyright year changes

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
 .../wavpack/{wavpack_5.1.0.bb => wavpack_5.6.0.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.1.0.bb => wavpack_5.6.0.bb} (63%)

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
similarity index 63%
rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
index 909612393..80671896c 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "WavPack is a completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=8c1a910e5c2a8b30ec8ffb2ffa63d9b2"
+LIC_FILES_CHKSUM = "file://license.txt;md5=bb5d037e3ad41a3c84c9f2d8bb65a7b4"
 
 SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https"
-SRCREV = "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
+SRCREV = "e03e8e29dc618e08e7baba9636e57ba1254874ce"
 S = "${WORKDIR}/git"
 
-inherit autotools lib_package
+inherit cmake pkgconfig
-- 
2.25.1


