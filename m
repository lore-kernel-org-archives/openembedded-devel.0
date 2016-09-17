Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C61E773166
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 10:04:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w84so14355wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Or7oEvKWJe/e76wDjymTeTojvkoI0AWV+MJVKKllzfs=;
	b=ZCw/5y5TJCTGL8I4fBgdSRfzu3CPuh7dos46kpsK8qVPI6r1o2dztUgdDuW0FkwlJE
	wM+We/fraUt54i6IwO3UZMPcnU0f05StXmQ8uMI7M7Mrc6169PX+lA59IRtfpCya+LZa
	RWGV5tXnAi+fKUM9s4Sbtgw+kw1K3bp1HjPAhkuFXBoqPuFWE8j0OKCqiwQkTme5vYjR
	G2G9IEkNEvVwoSKKpYgkzigS+ZMBneu6e0Uvd30O9zr7e1Obyf0L+GEOJ7H8NUSWZg8v
	8d5LCZsKcacALKpjLo3APp9zYT6q8IcqXeppX3mid54EF8l1uMnn9n01ep54RWhdM0gs
	VTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Or7oEvKWJe/e76wDjymTeTojvkoI0AWV+MJVKKllzfs=;
	b=VIuFrJjiee3wmPWNl3HGZhhVzIDvif30Te/RWP5xlUyY2TJTUzzFTL3gz9VmCEDZTI
	CK9jjPcM9wpJmj1rWOhWkMLdTiALsUMkQYhmsWk835Ee7kI/DdubfDJ0lvZHlpJu9YCF
	wTFKwJWx2tLRIMIqG7dD2sC6w9d4IvbJvyZ/vhlUd/drLkFfFeKO8cnGh2LuIqkdMf5c
	1CsNxVWmmPPEhk4Zievj4VFZoXlTlN7jPZS/VYixNeqSvGfEHjSqzrCtCPZIOeQfXpnw
	JSMOlh1dkydSpr1cGzHGrZuTEexEZygHrBHa2GG1UZLnlCZkv1VMsmV21coY0rOA4SJ3
	QRuA==
X-Gm-Message-State: AE9vXwMJTn8Go8LXqFzN263nQYZheVqiJRQqfvqsigIYrZPiE+UcbZNjyRCpreKJwuGJgg==
X-Received: by 10.194.178.130 with SMTP id cy2mr16014124wjc.138.1474106697423; 
	Sat, 17 Sep 2016 03:04:57 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0635.dip0.t-ipconnect.de.
	[79.223.6.53]) by smtp.googlemail.com with ESMTPSA id
	o2sm12473330wjo.3.2016.09.17.03.04.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Sep 2016 03:04:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Sep 2016 12:04:37 +0200
Message-Id: <1474106682-20512-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] jack: update to 0.125.0rc1
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
X-List-Received-Date: Sat, 17 Sep 2016 10:04:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* put neccessary sources together
* add PACKAGECONFIGs for alsa and portaudio
* remove magic and unknown EXTRA_OEMAKE - have no idea what it was for
* remove TWL4030 specific patch - this is somthing a bsp layer should do
* replace patch for checking if already installed by config --enable-force-install

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../jack/jack/jack_fix_TWL4030_alsa_capture.patch  | 31 ----------
 .../jack/jack/remove-wrong-host-test.patch         | 68 ----------------------
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb    | 40 -------------
 meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb | 49 ++++++++++++++++
 4 files changed, 49 insertions(+), 139 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/jack_fix_TWL4030_alsa_capture.patch
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/remove-wrong-host-test.patch
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
 create mode 100644 meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb

diff --git a/meta-oe/recipes-multimedia/jack/jack/jack_fix_TWL4030_alsa_capture.patch b/meta-oe/recipes-multimedia/jack/jack/jack_fix_TWL4030_alsa_capture.patch
deleted file mode 100644
index 77337ff..0000000
--- a/meta-oe/recipes-multimedia/jack/jack/jack_fix_TWL4030_alsa_capture.patch
+++ /dev/null
@@ -1,31 +0,0 @@
---- a/drivers/alsa/alsa_driver.c	2009-05-06 06:36:08.000000000 +1000
-+++ b/drivers/alsa/alsa_driver.c	2010-07-28 21:02:57.238101024 +1000
-@@ -2388,7 +2388,7 @@
- 	strcpy (params[i].name, "period");
- 	params[i].character  = 'p';
- 	params[i].type       = JackDriverParamUInt;
--	params[i].value.ui   = 1024U;
-+	params[i].value.ui   = 256U;            /* TWL4030 capture. */
- 	strcpy (params[i].short_desc, "Frames per period");
- 	strcpy (params[i].long_desc, params[i].short_desc);
- 
-@@ -2396,7 +2396,7 @@
- 	strcpy (params[i].name, "nperiods");
- 	params[i].character  = 'n';
- 	params[i].type       = JackDriverParamUInt;
--	params[i].value.ui   = 2U;
-+	params[i].value.ui   = 4U;              /* TWL4030 capture. */
- 	strcpy (params[i].short_desc, "Number of periods of playback latency");
- 	strcpy (params[i].long_desc, params[i].short_desc);
- 
-@@ -2518,8 +2518,8 @@
- driver_initialize (jack_client_t *client, const JSList * params)
- {
-         jack_nframes_t srate = 48000;
--	jack_nframes_t frames_per_interrupt = 1024;
--	unsigned long user_nperiods = 2;
-+	jack_nframes_t frames_per_interrupt = 256;      /* TWL4030 needs small number of frames here. */
-+	unsigned long user_nperiods = 4;                /* TWL4030 needs 4 periods to avoid XRuns. */
- 	char *playback_pcm_name = "hw:0";
- 	char *capture_pcm_name = "hw:0";
- 	int hw_monitoring = FALSE;
diff --git a/meta-oe/recipes-multimedia/jack/jack/remove-wrong-host-test.patch b/meta-oe/recipes-multimedia/jack/jack/remove-wrong-host-test.patch
deleted file mode 100644
index b41c98f..0000000
--- a/meta-oe/recipes-multimedia/jack/jack/remove-wrong-host-test.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From be5f1439a1f36c0bc714411d20186045bd3e9539 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 12 Jul 2011 12:48:14 +0200
-Subject: [PATCH] remove bogus check for host-side jack installs, we are crosscompiling and don't care about these misguided checks
-
----
- configure.ac |   45 ---------------------------------------------
- 1 files changed, 0 insertions(+), 45 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0a7e6bc..4033c21 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,51 +3,6 @@ dnl $Id: configure.ac 4467 2011-06-23 15:10:03Z paul $
- 
- AC_INIT(jackd/jackd.c)
- 
--
--dnl
--dnl Check for existing JACK installs
--dnl 
--
--AC_MSG_CHECKING([existing, conflicting JACK installs])
--not_overwriting=0
--installs=
--for dir in /usr/lib /usr/local/lib /opt/lib ; do
--    if test -d $dir ; then
--	if test $(find $dir/ -name 'libjack.so.*' 2>/dev/null | wc -l) -gt 0 ; then
--	    if echo $prefix/lib | grep -vs $dir >/dev/null 2>&1 ; then
--		not_overwriting=$(expr $not_overwriting + 1)
--	    fi
--	    installs="$installs $dir"
--	fi	    
--    fi
--done
--
--if test $not_overwriting -gt 0 ; then
--    echo 
--    echo
--    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
--    echo "You appear to have at least one existing installation of JACK."
--    echo
--    echo "Complete or partial JACK installs exist in:$installs"
--    echo 
--    echo "Installing this version will leave at least one of these"
--    echo "existing installations installed and this will probably break"
--    echo "JACK on your machine. "
--    echo
--    echo "Before building, you should first remove the existing JACK"
--    echo "installation(s). "
--    echo
--    echo "Alternatively use ./configure --prefix=... to force overwriting"
--    echo "the existing install."
--    echo
--    echo "WARNING: ON ANY DEBIAN-DERIVED DISTRIBUTION (Debian, Ubuntu etc)"
--    echo "CHANGING THE INSTALLATION PREFIX WILL NOT PRODUCE A WORKING JACK"
--    echo "INSTALL. Please contact the distribution packager for JACK and"
--    echo "ask them to fix their packaging."
--    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
--    exit 1
--fi
--
- AC_CONFIG_AUX_DIR(config)
- AC_CANONICAL_TARGET
- 
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
deleted file mode 100644
index 7b33927..0000000
--- a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "JACK is a low-latency audio server. It can \
-connect a number of different applications to an audio \
-device, as well as allowing them to share audio between \
-themselves."
-SECTION = "libs/multimedia"
-
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c030468238b2cf89925a57f2780396a7 \
-                    file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LGPL;md5=e77fe93202736b47c07035910f47974a \
-"
-
-DEPENDS = "alsa-lib libsamplerate0 readline"
-
-SRCREV = "91a688c602b7ce1711d8ad10fb07ebcf2e530a64"
-SRC_URI = "git://github.com/jackaudio/jack1.git \
-           file://remove-wrong-host-test.patch \
-           file://jack_fix_TWL4030_alsa_capture.patch \
-"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--enable-timestamps \
-                --disable-capabilities \
-                --disable-oldtrans \
-                --disable-portaudio \
-                --disable-coreaudio \
-                --disable-oss \
-                --enable-alsa"
-
-EXTRA_OEMAKE = 'transform="s,^,,"'
-
-PACKAGES =+ "libjack jack-server jack-utils"
-
-FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
-FILES_jack-server = "${bindir}/jackd"
-FILES_jack-utils = "${bindir}/*"
-FILES_${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/* "
diff --git a/meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb b/meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb
new file mode 100644
index 0000000..07aab53
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "JACK is a low-latency audio server. It can \
+connect a number of different applications to an audio \
+device, as well as allowing them to share audio between \
+themselves."
+SECTION = "libs/multimedia"
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c030468238b2cf89925a57f2780396a7 \
+                    file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LGPL;md5=e77fe93202736b47c07035910f47974a \
+"
+
+DEPENDS = "libsamplerate0 libsndfile1 readline db"
+
+# Seems part of our code is shared with jack2
+SRC_URI = " \
+    git://github.com/jackaudio/jack1.git;name=jack \
+    git://github.com/jackaudio/example-clients.git;destsuffix=git/example-clients;name=example-clients \
+    git://github.com/jackaudio/tools.git;destsuffix=git/tools;name=tools \
+    git://github.com/jackaudio/headers.git;destsuffix=git/jack;name=headers \
+"
+SRCREV_jack = "1ff912463e5553c515ea45a411d136e775e32613"
+SRCREV_example-clients = "7fa089095c81e81dacd2554ae3184acc7f2d58ed"
+SRCREV_tools = "02ddc6ea2f16e41326c675b1bcfcd6335390b88e"
+SRCREV_headers = "07f1ecf1ce119d861ec631cb4a6a81a1ab1e5657"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "alsa"
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[portaudio] = "--enable-portaudio,--disable-portaudio,portaudio"
+
+EXTRA_OECONF = " \
+    --enable-force-install \
+    --enable-timestamps \
+    --disable-capabilities \
+    --disable-oldtrans \
+    --disable-coreaudio \
+    --disable-oss \
+"
+
+PACKAGES =+ "libjack jack-server jack-utils"
+
+FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
+FILES_jack-server = "${bindir}/jackd"
+FILES_jack-utils = "${bindir}/*"
+FILES_${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/* "
-- 
2.5.5


