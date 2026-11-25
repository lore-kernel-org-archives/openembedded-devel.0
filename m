Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37936.1795594083569066045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TkP4kb1+;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385c497bf94so2109751eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594083; x=1796198883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KbhdmMXf6TKu218ZCeuQul7agRDPBUz8AtUIa62NkY=;
        b=TkP4kb1+d6LotYffXDQSsTif3ZoRa/D058Zbba4sJxaj0k/1j0KkMidK9Ha9ALtgLE
         ig2PVTc/j/6OjdBA/j9jZWoPCjDi6x99rhzKh5apVHjpLshZv0MMG/plTOib+sGYAD2w
         4fsxkRLbBau7B0LRDIybl4l9GNLT1CTy4FWKRBpafzoCp4Ae4rfIgENubfVaz9P328ce
         jF0bmEPbSteaJHUNL3p9WNGwhCSk8kUw0JirtBc1BtWnFcMXCpk9UCN9h5rrUgJGz3Fg
         1q96ixcPlDc8iQ6jlRl/L7d7kN7Yq/pQlnRMd4EayDfvc92QbzIHGO5iO++/tdHH96S6
         CpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594083; x=1796198883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5KbhdmMXf6TKu218ZCeuQul7agRDPBUz8AtUIa62NkY=;
        b=I/YPoYcY+OMNcuhjLxiA3WsaOTNwjA8/uP+KmVvQ2tisPC1PF9InM11vK0GNPEXm68
         6x3vYdu6B5AqCh5U9Msoss0wt3SfIVoRYiu/8S5pojUNwsUITPbca3CmFnGOZlN1EMNn
         r1R5xK3T/bSDH6gxTjF8WdQIJ3O+j5CZIEGd27IXw1Qanc61RgrDGNvGvN2UverlSeyE
         NVf1O3Wne7bdq7K7ShsjTp+uXeNB8Rl3WUyM5ZQ/8LWgEFPAfxwEK4gRGrp7Uz/BoXsU
         cmfSavItNWalJDRDf2lk23l1zOAC0hetuUNWyAHYm/0XDQMdB5vRDXbi2Sq2N6nXCvku
         n30A==
X-Gm-Message-State: APuU4Z8OQ9saPcagUA0SQVFfhSctQrph2aW7Gh/8XhOV7igzX3u2ApbJ
	plmLR3FZU9vRyjbOs4Vmvqw2Ed31DoIhStG+tvJMuREA2+SRej/O528c3C2I2Qr+
X-Gm-Gg: AZFdTZfADbWZZvtKP9zHpCdbNC84xczN/H45+K65W47HUOUSWrUQ/uPkecc/6kChHhO
	Kc5gJM20gGV9fG/KD9TzG/8IkAIahKqOz9MEPEJsdpi2xeD698Fyg36T6EpEWJt9C4mrvJWkyzG
	0sq0yrrmwHaDmp/LYtgkussL2pcQClgZjmBWjnZjLHVyjGYs9bhrSKzTgFZ06UDKaFNYa+y7XWM
	SbBzgabY0IvDskMhrZWjuHBmJ7Tv+D9zAiHgkB2svRe1Wv+tAksXzurf/RdhkxTRenVojimHrFZ
	OvpjBS92hLSPbGhT7/IdR5G1/u25+V9PdEVhzTUDSNkEdW+/L1gc4LfdRw4ZoBJ3eaOPvdYDiwY
	dRyBau50tEXFkcbuX7uvSVzj1iElUAtrk6CHlC28Zi8rwtrEiwDonlN152iHU2SoPVn8ZRQuWG+
	XK559eTcfZ9ZX9bIGwmXaHllrjUcSjh3Ltd/km/65FiO5ka7zyalIwbhWeueXBQtDfU8P+LQw+U
	/JxEGh/BViJooy+EqOA03sono8QBc5WkhACYkJwMwcKSX9vCeR/Ad4gb7gipagwb/9QPxoYX2Ku
	St4uVflOgXLoIXUOb9+rfltnB9eS6v90GjzrhlZlj9fHfDH2YpXjeVrsir5120Ky1wV27nrUUvH
	maD8ETlvN4tUeoa6Q9V+/bkrhXMPJ3I3cEIbzdihAifkXCJc2J8gvp7ENC8rTwftIIB84VC9Ay6
	0Oiw1QHw4csvqnQb0L5TVktGe4dPcwf0pj28GidF6n40Eie2FnznugieloxaUqzGzBcufFIAe4f
	XrDpIBgIH/dgKmMH4umdfByThaGDa0DxwsNdGLXv8rUZYD9gnZOvlwsKMUWPd02IHRbdTBnSXek
	GGsFgUw2g+/P06Uos/dKKPsl3A==
X-Received: by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3856e63b064mr19037795eec.11.1795594082825;
        Wed, 25 Nov 2026 00:08:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 16/55] sdbus-c++-libsystemd: upgrade 259.8 -> 262
Date: Wed, 25 Nov 2026 00:06:32 -0800
Message-ID: <20261125080732.2419614-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133019
Content-Type: text/plain; charset="utf-8"

- libsystemd: new sd-varlink protocol-upgrade helpers,
  SD_ELF_NOTE_DLOPEN_ANCHORED() in sd-dlopen.h, and
  sd_id128_from_string() accepts urn:uuid: strings
- libsystemd no longer links against libgcrypt; journal sealing moved to
  OpenSSL
- systemd-repart: supports Encrypt= combined with Verity=data, honors
  $SOURCE_DATE_EPOCH for reproducible images, and gains --cow= and -n
  for --dry-run
- systemd-repart: MakeSymlinks= expands specifiers in the target, and
  the legacy FactoryReset EFI variable is no longer honored (use
  FactoryResetRequest)

Require oe-core's systemd.inc so the recipe follows oe-core's systemd
version and sources instead of carrying copies.

systemd 262 needs libucontext on musl (as in oe-core's systemd recipe),
so add it to DEPENDS for libc-musl. The static libsystemd then needs
-lucontext on its users' link line, so add it to libsystemd.pc.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ystemd_259.8.bb => sdbus-c++-libsystemd_262.bb} | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-libsystemd_259.8.bb => sdbus-c++-libsystemd_262.bb} (78%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.8.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_262.bb
similarity index 78%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.8.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_262.bb
index 280bc39c13..1dabb33bfb 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.8.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_262.bb
@@ -1,3 +1,5 @@
+require recipes-core/systemd/systemd.inc
+
 SUMMARY = "libsystemd static library"
 DESCRIPTION = "libsystemd static library built specifically as an integral component of sdbus-c++"
 
@@ -10,17 +12,14 @@ inherit meson pkgconfig
 
 DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
 
-SRCREV = "6576434737de042cdd0f6e62f34f04818306c73b"
-SRCBRANCH = "v259-stable"
-SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
-           file://static-libsystemd-pkgconfig.patch \
-           "
+SRC_URI += "file://static-libsystemd-pkgconfig.patch"
 
 PACKAGECONFIG ??= "gshadow idn"
 PACKAGECONFIG:remove:libc-musl = " gshadow idn"
 PACKAGECONFIG[gshadow] = "-Dgshadow=true,-Dgshadow=false"
 PACKAGECONFIG[idn] = "-Didn=true,-Didn=false"
 
+DEPENDS:append:libc-musl = " libucontext"
 CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
 
 # Enable systemd's in-tree musl support (mirrors oe-core's systemd recipe).
@@ -46,3 +45,8 @@ do_install () {
     install -d ${D}${libdir}/pkgconfig
     install ${B}/src/libsystemd/libsystemd.pc ${D}${libdir}/pkgconfig
 }
+
+# The static libsystemd uses getcontext/makecontext/swapcontext from libucontext on musl
+do_install:append:libc-musl () {
+    sed -i -e '/^Libs:/s/$/ -lucontext/' ${D}${libdir}/pkgconfig/libsystemd.pc
+}
