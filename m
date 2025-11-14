Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB68CDE02F
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:24:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13530.1763108694129730709
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a4sPR2e6;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so18788945e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763108692; x=1763713492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eabQXPSIesa9YAPEomivrFrSw55M1dPcM9oPHGwpng0=;
        b=a4sPR2e6v0oWzHesL9n7876SBQ5yGT4iwiXZW++qAc5W6CIawJOLVcDNk3z9HFyBIO
         XoIIiM4OsBvswcUVNvFlgGzB5q/wLlMzIICI/aGCpoIhbqyTMVaIkFglQPqA5uDWCvN6
         gzwLG5K51qtpfjRGINxeO3Vcx/51A+enTq6mCwlcPFNWRvcNGzjgSYA0OPRmb8lwr9Kj
         Flr57bb8e5PDTZWc0vq9mewzre5n22VeHwDxSmHS/v8Y4pmkjN4lLSW0Uf3geAGlTVmZ
         0Os4ov2FuGTyXrBMySHJnEHnVsbRpF0RD1YPO3pX+Wm3xH5ms8VuFlQphHdFFnpokA7w
         q6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108692; x=1763713492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eabQXPSIesa9YAPEomivrFrSw55M1dPcM9oPHGwpng0=;
        b=TvwbRZups2yOuB84zyoa6Iojlg+6D/99+rUKwu3GDKhJlV7dS68OKDOo7V+A4Fm1Dd
         p6wCSdWVDDWGxdWQzb19mlu13v2XVA45tSINdDijN2VVMzC2Uq2aQrWc0ztE3GVVBMYx
         2aeK4LW/fXwXOykfPMf3QLpxyZl8Wjo8Rndah0O/uiTEOuWqt6V5dtGZpW3fJyCcRD9N
         vteaOF/LRJj3/XSNH0m/t8exv0Ezo/ynpX/0kHHw2y9464+PK6P5FNCd6unSh21r0CE3
         OWvpEAzPx9w6byCiZrkROQ5QF6c7ggqLisTEl6ccoIjqvrZ0mJj482T4e0gSbRBQoed7
         km+g==
X-Gm-Message-State: AOJu0Yw4ew0enRMKXSjFjWxqSG0T0NBJ4RnPN0LwnGb6M6ToptbrA9/8
	nWHPyqNR9J5w82lHl/R4NxKd4ReFHbrS0oBeEHSAUPlKYyLwkbRF7EggN6SFlIVW
X-Gm-Gg: ASbGnct7SzJKnpMNbA853fPaCcgF9pKkGynQN3fR4LjjBLOOFrxN5Hs1zuNajyWjnga
	S9VK5dkbKTdMf0AUZ9+blsSXI5aZ3brMaZYjxpau84/YmfDxZuxp5+0FdWBceRjf8gKhEbTqTKA
	U7XvOR5l8/ClGchI8ervcAGZr4xjCoV6knKl3EyCebcX24EAf087IDrsLKvRr1cGV5Uee3bobKo
	NxBJVKySFXBJTe5qD7BKPF8iw0YySizX3v9bLBewMOUDuQRyTlsGkFzcSwv4YrkSdNOkD7aLT0b
	OkU2Y9Kg2oqZ+Sqb9Lm8LgcYutY8aAaqS8ZswTsk0gaR7fIdQQ2bq06zTSO/rOdkNSXfJAkW7MD
	OWyDV/ViiD9QuWK3y1hepwYw/Ddipy3CX/FiwTT9WRP+WCJ4GT5m1ZBcJlLJxF77rk8YlQHwggA
	==
X-Google-Smtp-Source: AGHT+IHYJeQlKuZBOjMgrRetiERtfO1bCr69wY9pcj5h8i08RDtePA7DokIhiJUp3XqqxtuuSAkd3g==
X-Received: by 2002:a05:600c:4505:b0:477:5c45:8100 with SMTP id 5b1f17b1804b1-4778fe9638dmr15520765e9.24.1763108692417;
        Fri, 14 Nov 2025 00:24:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm53838325e9.5.2025.11.14.00.24.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 00:24:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 3/5] audiofile: backport test for CVE-2015-7747
Date: Fri, 14 Nov 2025 09:24:48 +0100
Message-ID: <20251114082450.2720967-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114082450.2720967-1-skandigraun@gmail.com>
References: <20251114082450.2720967-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121696

This is a backported patch from opensuse, which contains a testcase
for CVE-2015-7747 (which is already patched in ths recipe, but not
tested explicitly).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change
v3: no change

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

