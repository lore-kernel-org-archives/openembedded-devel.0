Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B90CDE020
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 07:43:47 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12995.1763106224559225885
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 23:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=grhYBrv8;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3720e58eso1472243f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 23:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763106223; x=1763711023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72FQUXKEC+/N5M9Mut38WSaWdS09e2AJ86ea9s1LBtw=;
        b=grhYBrv82Yuf3My8SK9LQjzLXV1G5zK5p6uVpqpk34/U47phWN8lmy6PEm+0PBEZq2
         8QcT5twxhE24XnfaEx87j3IdXKR7X6gY4tCVmWGeEeDYhp+1Ei4EZ6POYIG0VoLqGbH4
         hBh+n57r3seSU+mGyMvXTJbH4IUJ+42WmYqcX7ve/Y+DdQxdhzpBHqedF+8XimNAfLa3
         rCev3+z2ZTZmhluSuJqhlvvqYz3YtDKJ8QgVM32sQBfEpbu63DHfli0/Vt77Bz5HZlK1
         rtVqm+h8Oi7gEwvvYXZQB3iQH7KJIGGFp04Jq/thHOwatCmra2SN6TAYWiabxEdJ0M13
         7Ejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763106223; x=1763711023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72FQUXKEC+/N5M9Mut38WSaWdS09e2AJ86ea9s1LBtw=;
        b=UuItm2QhcsmJJipXtndAe8kCSn+dj3BsQT/I8rrxFGEed9InTFY3CYtHz+fJEw4XKv
         km1ijNsp+dwxZTgvYekZyBMK3Za6mBKGuWIo9yRxgK3paD4TlIto086reo7ysTdzE9RP
         bwY4rz8HTorcanvhxioCCOOUK6tI0oKw+KRN/YVx50Og+sv4LqK4D4XDHJJbtg2u4b91
         HTKYP7YimQ843tcMHPMY/fJ60DVquCS9bB+ZOUXfoj40WrV0hyG7rTdiuFkfm5wqn/De
         +0OygzZ94IaoyjqKN7m+ar7RgDJ9NFav14BNx/k9vSfpc9Bd873yyPFDwu9hbF62e7EM
         L1YA==
X-Gm-Message-State: AOJu0Yynwi7eG0U23ZwsyUFqSi+nAFG7aREvRaMnmAIvamGMbnJQV+fa
	0JZAhy12ur2gtRXt7wquS2LoFuFbuwiJQX4B8k9bT8LbRmy4MSuEVjDrgU3p6KhM
X-Gm-Gg: ASbGncu5MvierQR5HhY0dHgHbd0Szcapy7YmGeXWZO+1+DdQ9FEqhdz5AhY3vg57F8p
	Ij69RNR6YThzw4DFMnaOmEk6QmMgLT3yOI25oYNlisbc9oUSZ/fDGdHQtxdqv4BWyXqIczFdc8t
	lhcmGrNbNfAIxPK1nvcmY54+bzbgS1oh4zt2XCJU9lzv47lmJ3ouHWN5+m4d1s0jzYqHMS8vJb8
	9LZa6hY3arvjGAeerAZSpAXPJErFVtBZ/Ik5N8HJLWWauHgq9jwbiWA3V3t2PrldzUowtu4R1j7
	5Ux18BsLho/dhBea2VgMUK4RmpBSMYWbXRj4k6JId1b2+UfY6LTuJTdJn4k9+q25COm4RpZpm4l
	pb1uKDgNb37HaWYxFPdo93ULOaajT2jbHoT7WDfzv+OQZza/F7NNkVf+AAP7rYI4ugiMD4TAvcj
	yvrG7Ttkee
X-Google-Smtp-Source: AGHT+IGAIe3Nfw0kaIzzbSqYxkz0pfejyIOyDoctG0PWt19SjC+VH8WK3RtOs/Ka5UJNXDril3nHmw==
X-Received: by 2002:a5d:588d:0:b0:42b:4069:428a with SMTP id ffacd0b85a97d-42b5933deeemr1977882f8f.12.1763106222830;
        Thu, 13 Nov 2025 23:43:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b622sm8090954f8f.29.2025.11.13.23.43.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:43:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/4] audiofile: backport test for CVE-2015-7747
Date: Fri, 14 Nov 2025 08:43:39 +0100
Message-ID: <20251114074340.2716135-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114074340.2716135-1-skandigraun@gmail.com>
References: <20251114074340.2716135-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 07:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121687

This is a backported patch from opensuse, which contains a testcase
for CVE-2015-7747 (which is already patched in ths recipe, but not
tested explicitly).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change

 .../audiofile/audiofile_0.3.6.bb              |   1 +
 .../files/test-for-CVE-2015-7747.patch        | 166 ++++++++++++++++++
 2 files changed, 167 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/test-for-CVE-2015-7747.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index f734a41dfc..b14b4792b3 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
     file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
     file://0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch \
+    file://test-for-CVE-2015-7747.patch \
     file://CVE-2019-13147.patch \
     file://CVE-2022-24599.patch \
 "
diff --git a/meta-oe/recipes-multimedia/audiofile/files/test-for-CVE-2015-7747.patch b/meta-oe/recipes-multimedia/audiofile/files/test-for-CVE-2015-7747.patch
new file mode 100644
index 0000000000..a62cc7589b
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/test-for-CVE-2015-7747.patch
@@ -0,0 +1,166 @@
+From 1debf51f3a89d44c0bd46e7bc45c07342087dd7c Mon Sep 17 00:00:00 2001
+From: Fabrizio Gennari <fabrizio.ge@tiscali.it>
+Date: Sun, 4 Oct 2015 01:14:00 +0200
+Subject: [PATCH 2/2] Add a test case for conversion of both sample format and
+ number of channels
+
+This patch contains the testcase backport to version 0.3.6.
+Author: Stanislav Brabec <sbrabec@suse.com>
+
+https://bugzilla.novell.com/show_bug.cgi?id=949399#c7
+
+
+This patch is from opensuse, to verify a CVE fix:
+https://build.opensuse.org/projects/multimedia:libs/packages/audiofile/files/audiofile-CVE-2015-7747.patch:
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2016-Aug-30]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/Makefile.am                    |   2 +
+ test/sixteen-stereo-to-eight-mono.c | 118 ++++++++++++++++++++++++++++++++++++
+ 2 files changed, 120 insertions(+)
+ create mode 100644 test/sixteen-stereo-to-eight-mono.c
+
+diff --git a/test/Makefile.am b/test/Makefile.am
+index 7bbf8e4..d311719 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -27,6 +27,7 @@ TESTS = \
+ 	VirtualFile \
+ 	floatto24 \
+ 	query2 \
++	sixteen-stereo-to-eight-mono \
+ 	sixteen-to-eight \
+ 	testchannelmatrix \
+ 	testdouble \
+@@ -143,6 +144,7 @@ printmarkers_SOURCES = printmarkers.c
+ printmarkers_LDADD = $(LIBAUDIOFILE) -lm
+ 
+ sixteen_to_eight_SOURCES = sixteen-to-eight.c TestUtilities.cpp TestUtilities.h
++sixteen_stereo_to_eight_mono_SOURCES = sixteen-stereo-to-eight-mono.c TestUtilities.cpp TestUtilities.h
+ 
+ testchannelmatrix_SOURCES = testchannelmatrix.c TestUtilities.cpp TestUtilities.h
+ 
+diff --git a/test/sixteen-stereo-to-eight-mono.c b/test/sixteen-stereo-to-eight-mono.c
+new file mode 100644
+index 0000000..0f14636
+--- /dev/null
++++ b/test/sixteen-stereo-to-eight-mono.c
+@@ -0,0 +1,117 @@
++/*
++	Audio File Library
++
++	Copyright 2000, Silicon Graphics, Inc.
++
++	This program is free software; you can redistribute it and/or modify
++	it under the terms of the GNU General Public License as published by
++	the Free Software Foundation; either version 2 of the License, or
++	(at your option) any later version.
++
++	This program is distributed in the hope that it will be useful,
++	but WITHOUT ANY WARRANTY; without even the implied warranty of
++	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++	GNU General Public License for more details.
++
++	You should have received a copy of the GNU General Public License along
++	with this program; if not, write to the Free Software Foundation, Inc.,
++	51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
++*/
++
++/*
++	sixteen-stereo-to-eight-mono.c
++
++	This program tests the conversion from 2-channel 16-bit integers to
++	1-channel 8-bit	integers.
++*/
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include <stdint.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <unistd.h>
++#include <limits.h>
++
++#include <audiofile.h>
++
++#include "TestUtilities.h"
++
++int main (int argc, char **argv)
++{
++	AFfilehandle file;
++	AFfilesetup setup;
++	int16_t frames16[] = {14298, 392, 3923, -683, 958, -1921};
++	int8_t frames8[] = {28, 6, -2};
++	int i, frameCount = 3;
++	int8_t byte;
++	AFframecount result;
++
++	setup = afNewFileSetup();
++
++	afInitFileFormat(setup, AF_FILE_WAVE);
++
++	afInitSampleFormat(setup, AF_DEFAULT_TRACK, AF_SAMPFMT_TWOSCOMP, 16);
++	afInitChannels(setup, AF_DEFAULT_TRACK, 2);
++
++	char testFileName[PATH_MAX];
++	if (!createTemporaryFile("sixteen-to-eight", testFileName))
++	{
++		fprintf(stderr, "Could not create temporary file.\n");
++		exit(EXIT_FAILURE);
++	}
++
++	file = afOpenFile(testFileName, "w", setup);
++	if (file == AF_NULL_FILEHANDLE)
++	{
++		fprintf(stderr, "could not open file for writing\n");
++		exit(EXIT_FAILURE);
++	}
++
++	afFreeFileSetup(setup);
++
++	afWriteFrames(file, AF_DEFAULT_TRACK, frames16, frameCount);
++
++	afCloseFile(file);
++
++	file = afOpenFile(testFileName, "r", AF_NULL_FILESETUP);
++	if (file == AF_NULL_FILEHANDLE)
++	{
++		fprintf(stderr, "could not open file for reading\n");
++		exit(EXIT_FAILURE);
++	}
++
++	afSetVirtualSampleFormat(file, AF_DEFAULT_TRACK, AF_SAMPFMT_TWOSCOMP, 8);
++	afSetVirtualChannels(file, AF_DEFAULT_TRACK, 1);
++
++	for (i=0; i<frameCount; i++)
++	{
++		/* Read one frame. */
++		result = afReadFrames(file, AF_DEFAULT_TRACK, &byte, 1);
++
++		if (result != 1)
++			break;
++
++		/* Compare the byte read with its precalculated value. */
++		if (memcmp(&byte, &frames8[i], 1) != 0)
++		{
++			printf("error\n");
++			printf("expected %d, got %d\n", frames8[i], byte);
++			exit(EXIT_FAILURE);
++		}
++		else
++		{
++#ifdef DEBUG
++			printf("got what was expected: %d\n", byte);
++#endif
++		}
++	}
++
++	afCloseFile(file);
++	unlink(testFileName);
++
++	exit(EXIT_SUCCESS);
++}

