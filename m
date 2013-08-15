Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id B152E6B7F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:15 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so181065eak.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=l7pjlhfC66E3xbcgnWezu9MR75WVb7x/Ahj9NrSOipc=;
	b=Mrf9CXFe2iPH6YXVyagOurK2i0kdJyhAXMfZmp3r3Ab8Ou9/k4KeVCxjVCi3wKlzn2
	3I1Iuu/f3NMyop/+ASzWo2WjGJYnxhGhZ9TAIpUUeNjtrCA6/0OBp9YHXT8k/61QaduR
	Hg5pNikZCoUol0LUU0slVFnl4tt4TtD/rT9LCtWS0eC8nLVPfgFONT1KQjoAwa3rLNVk
	d9ivhXZ7Bwj++Lqo3X3e7VCD6u3UdQDcmOhChYarv1WPX21msk/X+zh1BnZSxzGa0Ld3
	lzPqG0gRulk9cUq7vXG5y8JDmukld6lMD6TT7xLm1A2u3OGtjBH2/8vrVNe1/W66QdwQ
	5yWw==
X-Received: by 10.15.24.129 with SMTP id j1mr20855476eeu.17.1376551156147;
	Thu, 15 Aug 2013 00:19:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm81999407een.16.2013.08.15.00.19.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:57 +0200
Message-Id: <eee1163d139f2c6f68b694203195f948b9d8aac8.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 17/60] portaudio: explicitly disable oss, add PACKAGECONFIG for alsa and jack
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:16 -0000

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
index b35d1d8..a2b25cc 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -2,15 +2,22 @@ DESCRIPTION = "A portable audio library"
 SECTION = "libs/multimedia"
 LICENSE = "PortAudio"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
-SRCREV = "1387"
+
 PV = "v19+svnr${SRCPV}"
 PR = "r0"
 
+SRCREV = "1387"
 SRC_URI = "svn://subversion.assembla.com/svn/portaudio/portaudio;module=trunk;protocol=http"
 S = "${WORKDIR}/trunk"
 
 inherit autotools
 
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
1.8.3.2


