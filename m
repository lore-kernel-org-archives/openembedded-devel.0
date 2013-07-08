Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id EC5526B176
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 08:41:35 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id c4so2657402eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=PCZtl02NBQdFBgW5DyIa36bc74R4LzBCn6u43aGU8JE=;
	b=a4MeXqz0nZoU8fpN7teweZeRfCJwH7a6gqx/5Bp9alMzgRfQu31WWZsFS4blJPgqRY
	335CfKxGNh+fYF/3+rSf5W0y1/PCXm4FmBR9h/+VZnvQhwObNRQLYVbpdDSjaiYjU4qZ
	hS5nXalv9xDYlUsWKuRSfJDRpTmR+n0eWfIXI2QUxKbssndf0EQo7SZoGHYG0N5rmX/s
	VTBQ1ZUorYObddWVJPXOA39G7kfmyE0CTzRf2u2Syg76MVy4PSyUEX/E7UqBbwmV3mJl
	zEGOvkDBNZ4geIE63St1rdMHD88zs9hlNKuUTFOaPaYg5XQR5UwIscjHteMjFBG3wm0s
	+2Mg==
X-Received: by 10.15.65.8 with SMTP id p8mr23944383eex.110.1373272896444;
	Mon, 08 Jul 2013 01:41:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm40294138eex.17.2013.07.08.01.41.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 01:41:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2013 10:41:33 +0200
Message-Id: <1373272893-26013-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
References: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] portaudio: explicitly disable oss, add PACKAGECONFIG for alsa and jack
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2013 08:41:36 -0000

* autoenabled dependencies on alsa-lib and jack are breaking espeak
  when it's built against portaudio in sysroot without them
  | ld: warning: libasound.so.2, needed by usr/lib/libportaudio.so, not found (try using -rpath or -rpath-link)
  | ld: warning: libjack.so.0, needed by usr/lib/libportaudio.so, not found (try using -rpath or -rpath-link)
  | usr/lib/libportaudio.so: undefined reference to `snd_pcm_sw_params_sizeof@ALSA_0.9'
  | usr/lib/libportaudio.so: undefined reference to `snd_pcm_hw_params_test_period_size@ALSA_0.9'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
index ced4b6b..454bd34 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -2,14 +2,21 @@ DESCRIPTION = "A portable audio library"
 SECTION = "libs/multimedia"
 LICENSE = "PortAudio"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
-SRCREV = "1387"
+
 PV = "v19+svnr${SRCPV}"
 
+SRCREV = "1387"
 SRC_URI = "svn://subversion.assembla.com/svn/portaudio/portaudio;module=trunk;protocol=http"
 S = "${WORKDIR}/trunk"
 
 inherit autotools pkgconfig
 
+PACKAGECONFIG ??= "alsa jack"
+PACKAGECONFIG[alsa] = "--with-alsa, --without-alsa, alsa-lib,"
+PACKAGECONFIG[jack] = "--with-jack, --without-jack, jack,"
+
+EXTRA_OECONF = "--without-oss"
+
 TESTS = "  pa_devs patest1      patest_hang patest_many                   patest_prime patest_sine patest_stop     patest_write_sine        \
 pa_fuzz    patest_buffer        patest_in_overflow  patest_maxsines       patest_read_record  patest_sine8         patest_sync              \
 pa_minlat  patest_callbackstop  patest_latency      patest_multi_sine     patest_record       patest_sine_formats  patest_toomanysines      \
-- 
1.8.2.1


