Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 61ADC60116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 17:10:44 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id w104so64999552qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 10:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yWTjgMvS6T7bx8m0AkmibUhB01DItXqs3jL38qxM0NU=;
	b=fetjlwPJNC/8xWbqYuWDdoEQJjbirRwziLhnQlszXSK7qK30WJBhDYVvl6V5GLzkZS
	GrzLAipC0z9xhy3Rik/YxcHCpycgarOT4jbpHpMlMjSAAFvGxXaZr74TwhZf1OT3VI2s
	1m4oYS4ZCUkmb30q9Z9huRUY6C0lPGCGAIDNGiH147zD4JUygzG4qDrEP55FfXpvcx7m
	D46sHC1vFWS+WEEND3gj7gl6fVJpocpFdAbcIl9ioZBjjNq3Q45zg3ucy6DPJbjiAZO9
	5aplt6gztKfGr54vh+Xz427rXXBdBmZMT9lxTpJ/WAINHLdJdp1ZzYfRDvnk47K80zbu
	mbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yWTjgMvS6T7bx8m0AkmibUhB01DItXqs3jL38qxM0NU=;
	b=SVZdYqnusKxjf7H7Vme5x+F7Rgw6g61lmD6sTtDfmwkBInBIO7Rozw7wd0n8e2bGlX
	FfOb9+9Y4Ne/+FLOgoJVqIuEp3kM+q6/fVBabrhe+yEq9vKuRLHiqvn64B7nw8DTanbF
	X393azdbPqV4IK19ORLwfk2ubUyuMy3xA74JhNUbCHc9EZwEyMcl0/9U6wt0BIByQtIY
	gX4mhw8IH7dXbDn3GeiHN/JskEH8tyCluYEgMvpHCnQWqI81e/a1SzjXY2aBeYuJglVJ
	m3toF1LPDkPhZYMZxb3lrYEap9T7PV208y02NIbPmW/CGttz21FjD1ium9U72na1jn7I
	preQ==
X-Gm-Message-State: AD7BkJIlaOhsoI1PDNNhVLIcHKxiPjOkPJduzRL6KiH81P6nkip3Cn8siileKOwxZpiBmA==
X-Received: by 10.140.236.72 with SMTP id h69mr18429593qhc.92.1459444245040;
	Thu, 31 Mar 2016 10:10:45 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	a66sm4309590qkb.20.2016.03.31.10.10.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 10:10:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 17:10:37 +0000
Message-Id: <1459444237-32552-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459444237-32552-1-git-send-email-raj.khem@gmail.com>
References: <1459444237-32552-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] rng-tools: Delete
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
X-List-Received-Date: Thu, 31 Mar 2016 17:10:46 -0000

its moved to OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/rng-tools/files/default  |  3 --
 meta-oe/recipes-support/rng-tools/files/init     | 49 ------------------------
 meta-oe/recipes-support/rng-tools/rng-tools_4.bb | 36 -----------------
 3 files changed, 88 deletions(-)
 delete mode 100644 meta-oe/recipes-support/rng-tools/files/default
 delete mode 100644 meta-oe/recipes-support/rng-tools/files/init
 delete mode 100644 meta-oe/recipes-support/rng-tools/rng-tools_4.bb

diff --git a/meta-oe/recipes-support/rng-tools/files/default b/meta-oe/recipes-support/rng-tools/files/default
deleted file mode 100644
index 7aede9b..0000000
--- a/meta-oe/recipes-support/rng-tools/files/default
+++ /dev/null
@@ -1,3 +0,0 @@
-# Specify rng device
-#RNG_DEVICE=/dev/hwrng
-RNG_DEVICE=/dev/urandom
diff --git a/meta-oe/recipes-support/rng-tools/files/init b/meta-oe/recipes-support/rng-tools/files/init
deleted file mode 100644
index 7cf7839..0000000
--- a/meta-oe/recipes-support/rng-tools/files/init
+++ /dev/null
@@ -1,49 +0,0 @@
-#! /bin/sh 
-#
-# This is an init script for openembedded
-# Copy it to /etc/init.d/rng-tools and type
-# > update-rc.d rng-tools defaults 60
-#
-
-rngd=/usr/sbin/rngd
-test -x "$rngd" || exit 1
-
-if [ -e /etc/default/rng-tools ]; then
-    . /etc/default/rng-tools
-fi
-
-if [ -n "$RNG_DEVICE" ]; then
-    EXTRA_ARGS="-- -r $RNG_DEVICE"
-fi
-
-
-case "$1" in
-  start)
-    echo -n "Starting random number generator daemon"
-    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping random number generator daemon"
-    start-stop-daemon -K -q -n rngd
-    echo "."
-    ;;
-  reload|force-reload)
-    echo -n "Signalling rng daemon restart"
-    start-stop-daemon -K -q -s 1 -x $rngd
-    start-stop-daemon -K -q -s 1 -x $rngd
-    ;;
-  restart)
-    echo -n "Stopping random number generator daemon"
-    start-stop-daemon -K -q -n rngd
-    echo "."
-    echo -n "Starting random number generator daemon"
-    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/rng-tools {start|stop|reload|restart|force-reload}"
-    exit 1
-esac
-
-exit 0
diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
deleted file mode 100644
index 34a3f95..0000000
--- a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Random number generator daemon"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS_append_libc-uclibc = " argp-standalone"
-
-SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
-           file://init \
-           file://default"
-
-SRC_URI[md5sum] = "ae89dbfcf08bdfbea19066cfbf599127"
-SRC_URI[sha256sum] = "b71bdfd4222c05e8316001556be90e1606f2a1bac3efde60153bd84e873cc195"
-
-# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
-# manually to avoid unnecessary postinst/preinst generated.
-python () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
-
-inherit autotools update-rc.d
-
-do_install_append() {
-    # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -d "${D}${sysconfdir}/init.d"
-        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
-            ${D}${sysconfdir}/init.d/rng-tools
-
-        install -d "${D}${sysconfdir}/default"
-        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
-    fi
-}
-
-INITSCRIPT_NAME = "rng-tools"
-INITSCRIPT_PARAMS = "start 30 S . stop 30 0 6 1 ."
-- 
1.9.1


