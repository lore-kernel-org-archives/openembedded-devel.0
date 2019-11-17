Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9F87F939
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:13:14 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n1so17085931wra.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 13:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qrEEjq5xERJsA7Ui40QPtAQ9gLbZpAT0F4BoVMmPktA=;
	b=aNpuzeLKZAIZ0CJGx51q/xe2+LK0rAC4UN3gL2ifmmNmk2E2XLgcANrfmWsDbRjn5j
	SNqVKsdm+631xD1sACPTskwU0WU+2RfTjV4WGosXI5dVYoCtQKxHD1HiYLp5LsApF0Ks
	6PZZZraOjYbxRkeDYWO+nR/rzI24DvAgXHEvlYK9q0fj1GlFCD1Gzcd1MAZbpzap/ign
	TvrAWysaetC5Qp1MnrVO1CEnyBMycaxHnYar2xq5OdeW4rPboeiHF4vKINRDr0eBaMwQ
	bjDE66+oRdHe1u4W1Lw8E2DY/AegMsjKO3L1MGHcWposkHV87JVXyrhZK0qQz/Ej9aH7
	GedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qrEEjq5xERJsA7Ui40QPtAQ9gLbZpAT0F4BoVMmPktA=;
	b=j2dpiKyVyrhvWPb/989qdCQqHS0GpEuYxw1exyQs9eeuuYrUhxIiRLZXyz/RqSNeNw
	2qdFlm+kY9eVyPnhj1eRFe3b2zvlkZSSG+4Xtvt0dWDg9VO8Bw53mAD31Pdt96P6V9bd
	jlxL7SnHd3cLJnhd8bJQXSYoiPUL5m909rN/XKDEIiAyOcBbKsQMEej0J7TXQOhFNlPa
	H6LPMaoPVKQA1AVqjBi2x26/jqcZ6/fieKO2UUy37Kl3UlYpriKtZGlUH59TfcWpZyL9
	NTx70IR3lcKoSXNfAAuYOWGNiU2E2lhMjD2kwSNm6tVG9E+eWPURYUHwoZBhazkEk8Lk
	t5YA==
X-Gm-Message-State: APjAAAWJzcQU5DgP8j2xLzjMcFEw7/jVMvhbXN0C3hqyTc+1Vs18TU5i
	YvqMjPA1rBlX+4C/nk34idr9ZD7N
X-Google-Smtp-Source: APXvYqzc5FdNRNZwhaKtST1OpYUT5EHIPXXU7pidXBlUQViJrWlBtZbV6d7gh7yEPR0zzg2enzLZzQ==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr6250849wru.31.1574025195212;
	Sun, 17 Nov 2019 13:13:15 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F081983E6CF71012ACD6C9A.dip0.t-ipconnect.de.
	[2003:f0:7f08:1983:e6cf:7101:2acd:6c9a])
	by smtp.gmail.com with ESMTPSA id
	g5sm18564687wma.43.2019.11.17.13.13.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 13:13:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 22:13:01 +0100
Message-Id: <20191117211306.27233-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/6] fluidsynth: upgrade 2.0.7 -> 2.0.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Nov 2019 21:13:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From announcement 2.0.9:
* an implicitly declared function caused a pointer to int truncation in CoreAudio driver (#591)
* fix a stack-based overflow in CoreAudio driver (#594, thanks to @fkmclane)

From announcement 2.0.8:
* fix incorrect behavior of fluid_sample_set_sound_data() (#576, thanks to @swesterfeld)
* fix voices being mixed incorrectly, causing audible crackle esp. at sample-rates >48kHz (#580)
* make sure that defining NDEBUG disables assertions

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/fluidsynth/fluidsynth.inc            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index c4c623ad9..764ed375e 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,9 +4,9 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "62b38b1c66aec606f83b322bb03bd84810bbda41"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.0.x"
+SRCREV = "c2f4683bf57f61451d14d219fdb25cf9f29cb7fe"
 S = "${WORKDIR}/git"
-PV = "2.0.7"
+PV = "2.0.9"
 
 inherit cmake pkgconfig lib_package
-- 
2.21.0


