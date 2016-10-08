Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E016A6FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Oct 2016 10:03:48 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b201so6409501wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Oct 2016 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AyGStKn6YvbgC0GpFxGdQBq6tHfCmDGx7OJCf1AYCzE=;
	b=yWljEhREc7bwbEOKaG8pP3M6o38FlhlpxEtM+BKX2ETdP5uvmq1yN9bnShAMGKrgly
	QqHW8887xdij4wRivX7JQqaHr8gphBs2RPQXzZ5zG8U3O69yCG7fL+mp0GO1I6XlLZD6
	H5gzTHzy920ue1ca4NWfzxV5flZZyDfkPhNdAXdzEUbU+hp+p3CkYBOzn4S/GQjgioX4
	BjSjUzMRyhFnNQXb0g2sHnKi6i8WoEgv4YoMr8kWrwgPjhrVhSZJ+w4X54KODyyvQWCE
	aFAp0tK7U541i/B69jPezk/GYAmswkqxrGE4q9JKPumv7m8smVn+phgoSfEaXWRr/uhP
	RiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AyGStKn6YvbgC0GpFxGdQBq6tHfCmDGx7OJCf1AYCzE=;
	b=JLhnXs15iVdGlVIPldCvHSgIHwxZNrOmdrEUlhH0lDSr7UJ9dvXmDOYkX3XEzxmGCK
	7lk+ZNwQ5LR7Z3pl7Xf9/mPfYi7MIy09O1jaLlXOK7i2xzYnG1hMQWxHbkVjQLSsySfV
	zjpfl+Ndgm9jTH/nsR9+U/BDpkF0kl0VYqiqk5yVOyLnpuP1ZriX6YcBdz8VPUB+UAzj
	DJUBnFNxWt9LoAa2fUzIy34mcvaEVbxwNo7Zr9aMCDXZaOy/ZYXgQhsxycHrtvto85O2
	0EBmWpm1ql0zT/276kFHv2KdtQLrEvZhZqP8drEclvidBx4/e3DGxtJeUYFdzYgyABQB
	Ej+A==
X-Gm-Message-State: AA6/9RkFX6a7LgXfrpNzu1nid/XtnJRW4XYSE/L8c/Yqnfv1yCcezi3cTc67cwYpBM7b+A==
X-Received: by 10.194.115.168 with SMTP id jp8mr20219765wjb.27.1475921029331; 
	Sat, 08 Oct 2016 03:03:49 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EC6.dip0.t-ipconnect.de.
	[79.223.14.198]) by smtp.googlemail.com with ESMTPSA id
	n7sm7509219wmf.18.2016.10.08.03.03.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Oct 2016 03:03:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Oct 2016 12:03:32 +0200
Message-Id: <1475921015-7131-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/4] jack: swap to jack2
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
X-List-Received-Date: Sat, 08 Oct 2016 10:03:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* works out of the box without modificatins to /etc/security/limits.conf neccessary
* neon support was introduced
* on RaspberryPi2 buffer sizes can be set to smallest accepted value without XRUN
  -> reduced latency

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb | 49 ----------------------
 meta-oe/recipes-multimedia/jack/jack_git.bb        | 33 +++++++++++++++
 2 files changed, 33 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb
 create mode 100644 meta-oe/recipes-multimedia/jack/jack_git.bb

diff --git a/meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb b/meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb
deleted file mode 100644
index 07aab53..0000000
--- a/meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb
+++ /dev/null
@@ -1,49 +0,0 @@
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
-DEPENDS = "libsamplerate0 libsndfile1 readline db"
-
-# Seems part of our code is shared with jack2
-SRC_URI = " \
-    git://github.com/jackaudio/jack1.git;name=jack \
-    git://github.com/jackaudio/example-clients.git;destsuffix=git/example-clients;name=example-clients \
-    git://github.com/jackaudio/tools.git;destsuffix=git/tools;name=tools \
-    git://github.com/jackaudio/headers.git;destsuffix=git/jack;name=headers \
-"
-SRCREV_jack = "1ff912463e5553c515ea45a411d136e775e32613"
-SRCREV_example-clients = "7fa089095c81e81dacd2554ae3184acc7f2d58ed"
-SRCREV_tools = "02ddc6ea2f16e41326c675b1bcfcd6335390b88e"
-SRCREV_headers = "07f1ecf1ce119d861ec631cb4a6a81a1ab1e5657"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??= "alsa"
-PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
-PACKAGECONFIG[portaudio] = "--enable-portaudio,--disable-portaudio,portaudio"
-
-EXTRA_OECONF = " \
-    --enable-force-install \
-    --enable-timestamps \
-    --disable-capabilities \
-    --disable-oldtrans \
-    --disable-coreaudio \
-    --disable-oss \
-"
-
-PACKAGES =+ "libjack jack-server jack-utils"
-
-FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
-FILES_jack-server = "${bindir}/jackd"
-FILES_jack-utils = "${bindir}/*"
-FILES_${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/* "
diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
new file mode 100644
index 0000000..34615b4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "jackdmp is a C++ version of the JACK low-latency audio \
+server for multi-processor machines. It is a new implementation of the \
+JACK server core features that aims in removing some limitations of \
+the JACK1 design. The activation system has been changed for a data \
+flow model and lock-free programming techniques for graph access have \
+been used to have a more dynamic and robust system."
+SECTION = "libs/multimedia"
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://common/jack/control.h;beginline=2;endline=21;md5=e6df0bf30cde8b3b825451459488195d \
+    file://common/jack/jack.h;beginline=1;endline=19;md5=6b736ed6b810592b135480a5e853392e \
+"
+
+DEPENDS = "libsamplerate0 libsndfile1 libopus readline"
+
+SRC_URI = "git://github.com/jackaudio/jack2.git"
+SRCREV = "364159f8212393442670b9c3b68b75aa39d98975"
+PV = "1.9.10+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+inherit waf pkgconfig
+
+PACKAGECONFIG ??= "alsa"
+PACKAGECONFIG[alsa] = "--alsa=yes,alsa=no,alsa-lib"
+PACKAGECONFIG[portaudio] = "--portaudio=yes,--portaudio=no,portaudio"
+
+PACKAGES =+ "libjack jack-server jack-utils"
+
+FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
+FILES_jack-server = "${bindir}/jackd"
+FILES_jack-utils = "${bindir}/*"
+FILES_${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/* "
-- 
2.5.5


