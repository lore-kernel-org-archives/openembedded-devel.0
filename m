Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E42CD6E42
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:06:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22296.1763035576124838815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:06:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VK5LzT4o;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso620519f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 04:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763035574; x=1763640374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdCnUfcnIBjT1DMWrwIO177HmSI6tBUzbPjZ7oi+wn8=;
        b=VK5LzT4oUkUQZa7u2ZeV4u3iAm2E9MhfdmeqJdecWUUApixWkYTz+d+8flVkx4qgG5
         eG16mcIsfZCMPw49D5YVMBfy6vUzJXejAPyFP9y+1XEFgcMhX9kROqjzWjQkisDm+5YM
         64HlKE5OvrCMXqVRPpLp9mMLXOPwEjvAyIBZoStV6iLSoTtwaDMuD6VLuy2Vr6aJZftt
         euRzly+zO8xj9wFGaAKx8KsSxrolOmGFggJHMF1CL1pyhGCpod4JQo0YX+7jQqWLHwLD
         qD0S7gT/t0Jqn1VESqo6nHTiesk1KqyF64uxaq3sEX4PJ5SBQoNODO2e+2EHE7dMtLkZ
         P+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035574; x=1763640374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CdCnUfcnIBjT1DMWrwIO177HmSI6tBUzbPjZ7oi+wn8=;
        b=ehpWRr2aewD+B6Hg0I46i4ZmANLa/HHk6co8ftm3RgT6kMZc4YMNEOZFQTsIbKjm1F
         k3+j2jyMM5UOHnFyYEPlXN9L1OVZ394NagHOJFpwHN0OuLv5qPizz75V+jZhN7sTi9LJ
         kghjPnD4DUzfE6hPmFN10DcWm+3g53udpwW5a1iQze5IKfslUK4h8U/9P/ExhFkwyv7l
         uw90awIZErcsIFtcuGxcczCsC4cgxlgVFTW7uw8yn6Jb6KSfCrwWtK0JwPgGijg3m0NQ
         8dQ6JGVyZtF0eqKCileBTrJnDX2snDS+ZojhAHB4vCyrEA37T1dU6rZeL2r7bJxJ8Cal
         rdqw==
X-Gm-Message-State: AOJu0YzopUbrlCYajFSh0EG11et8gcrrPspFmqIfvZ/yTHqlo5Wb75K0
	j/f6bxPo7Gd8bsSygK0bpWL211xvQkN7/o+9OqsdJu+nhoAkNYztTCwjicDlTa3x
X-Gm-Gg: ASbGncvJdQUYlDVFXshCdXT7tsOJR/H7srUg0Uxp2xLjsQqcqG5rj+esKu/FBvgbut3
	vIA0FhoU43ZW/Wj6q0QRzTSWUdf3sKg9bZppyj1Un4HYZtlxlkCL7zbzOsbaJdf+xykxYXDi+ya
	l4FCmtOy0iHb/8z2S97yHH9e3Ch3YNw/vRdKZhXmq1UojD0wxBdZVsf7leSmrvPB85FM/dLhNWS
	2GYOfQI3CNrW9QC0yQbI2Vprt3k8+fDbZf2meOg6+nE8dk356vMVTQ3/p8E+DqQlcMQuEfujSJx
	1Kn8GrPntqjTsrkhlH+BHupj3kFEDpXygPH5CIUjr7WaN/atkoXRuZvCw2Wi4DsZJo3sZQMvEn7
	80YhzToFk2ziQO+mO5QBnWp0ECYYQKatPbLrN6ZTBtuTZlwRSRDTFFqRojVW/WrZIjINdwr0KRH
	nUXGpU18FT
X-Google-Smtp-Source: AGHT+IHJg3/zKCycYMovY2YbI0WWJ7jJ14llZWjJRXuFb1AfjbNIDEmKdGoUuZV3HIknMwngNo3e3A==
X-Received: by 2002:a05:6000:651:b0:42b:41d3:daf9 with SMTP id ffacd0b85a97d-42b4bb91210mr4691928f8f.2.1763035574292;
        Thu, 13 Nov 2025 04:06:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85627sm3974561f8f.16.2025.11.13.04.06.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:06:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] audiofile: backport test for CVE-2015-7747
Date: Thu, 13 Nov 2025 13:06:10 +0100
Message-ID: <20251113120611.2590707-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113120611.2590707-1-skandigraun@gmail.com>
References: <20251113120611.2590707-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 12:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121647

This is a backported patch from opensuse, which contains a testcase
for CVE-2015-7747 (which is already patched in ths recipe, but not
tested explicitly).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
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

