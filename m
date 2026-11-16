Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.468.1794852902483843899
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 10:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=z1ydYGOJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b244fb7fffso4461128c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 10:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852902; x=1795457702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpksioRKUsFFJo7vnE7WgqrHaNhBuMvMuC1puOVP3G4=;
        b=z1ydYGOJqkUBx0WeIfyOldoJAVF75PKuUhV1RlGyCqrUclEaSNolleMw/HxZRYBQ11
         ohMqDWrTm/j4dzD+k+fprE0g6KpdZMV8ZvHBUPo5z8t2w1VWKmdxEBNR6meZpXeLB11y
         BRUQ/wWNsNFSOmrYHB+yyEtrUgFYtzmnjCj7KsozPxCmZTPkwBQT6x1YALXjeBX6qptA
         oq4GfmUL1EHZ6fTvQGzR5Wgc+gbuGr5rYLqcqo5CfL2878VuXn7cz49p5wc8LAn64S0e
         nsQk8Ts8gmqEYJLcJx/GGNefFkN16TI2RdjdyiYeJxU/AbbJoJ3zamAclxrFpU9TIhhS
         T52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852902; x=1795457702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpksioRKUsFFJo7vnE7WgqrHaNhBuMvMuC1puOVP3G4=;
        b=JAJubvOlLpBJ+hXTnOMnK5fASArba9s6Z/o8WmljByybIN2X4DtBEUbpZYlbo4luLM
         NtmLFbLgc2shkXDfQee1UPXbhk4UBDpgfWrYncB1fBcaM3xGlq6lmz2zifuKs7zBNfsY
         BxwXWxol672VEw018VBDu2mNoSlOXYCGqgd6KhfOMlAlwI4nJRzxCeLLqv70RVkLl1u6
         1PsKlCWkkwUXaJRAVb+uq9jLpmJ+l/hBYN8S1ojX9HpsBXUjvdJ4doVGMiB77AKm9ji3
         hsIX6Shp9dJ7O7pdgnZdO8p4muXQN6Go/WWz5wmOfQMtS9yrs3CDSCtz/43RYlKqsE4O
         ko6Q==
X-Gm-Message-State: APuU4Z8pmQzzYdEWa0OSbH/mtSmqWAkMLDnBOC30x8XHbsLxhGr2DIdu
	58sJy13aA8vWEjsi3WTZtfJgKMc9v55z8rkzI8n2kaOGMzH5J4K7T1PJfkbNI5aE
X-Gm-Gg: AYBFou0Q+bdTnr26EI0UWnLc3pHyhi9/6mIfcEkELyq2GivgebZYFCCI2eWVHD+T7d2
	TSaW3qH9djuvkhmRGCltNdzO5zAJud+gk8oP0I3YjtTK1Swiuh3n8/L3yMGKijmxutNvVV57WIk
	eVnyxpsFWuwsfjSPdqJyDQaoVt1nCnhz75P5dlW2hKXXPEp9HMy7krwsJgNNGjohZoGEy8nH9Vk
	pOdcM6/Nz1W+zUF0SMBqI3MlWo5TzriAEKRhz3UgcV/7W8NJ0rdAfdxzASoUZupiS0e4YzVQZbZ
	VRqlH2GoSSh1I5sgi6sXMRQ4D8GUQQCsK4516lzy7QuWFuCTy93M7twRexol0YW9VP/B2Rt3fQD
	FFY18nMFPbOgoukUtenWXwZwyYqf3kT9vhz3gPN+E7SP7fzFr7vBBFYuphLcFRT6dbAxuym6PwS
	yi5C0zMyz6H/YAEWL90tb2ojs0wdpjZ6oCB8kQ2pZI/EUPiIEEaNg+4ON1V4pN0bwRWQaVUXjT/
	vS8lkyhhwrYUMkumFAlOy5ly2zLvryMFvVaqgJ/4gc8ThiQsifnjQ04V178WQatuv2Kw9AWrLdZ
	z8VVV6RSVaag6slvuwqDEnBPVQJ5wRKDQFex5y1iPWfHJAPE8q91ohp4SyesSJeu4Dr/4OjR8dz
	/xo4psV2dWAE3L6t5C1OwVvgB5gU0JKpm+BbOXayjdrYiX4eZfWzZBDln49QC7DyZ+AweojRAD6
	v42NsXMSw8bLd5+dLsVEuG6DaGAU5b1MvyTzD11pQ7ar4NsyS7ztW8dJYJ+dGK7S6Nx4qjQg1lw
	t1rhjWJEHgCXrPcUACnJGuQQPqYS5q8MPe3Jb761R6BpsrPFJUQZMrtdu7wXmTQQ7jJr4lep+kt
	85EdPq6nqJq4fYSwcxaJ7xN/yw==
X-Received: by 2002:a05:7022:c46:b0:1b0:c224:5bdc with SMTP id a92af1059eb24-1b5030e703emr10948033c88.14.1794852901658;
        Mon, 16 Nov 2026 10:15:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm35841020eec.10.2026.11.16.10.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:15:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 1/2] libupnp: upgrade 1.14.31 -> 22.2.2
Date: Mon, 16 Nov 2026 10:14:57 -0800
Message-ID: <20261116181458.351824-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 18:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132562
Content-Type: text/plain; charset="utf-8"

Move from the 1.14.x maintenance branch to the current 22.x series.
22.x keeps the same COPYING, but bumps the soname to
libupnp.so.22/libixml.so.22, and upstream dropped autotools in
favour of CMake, so switch to the cmake class.

Upstream defaults CMAKE_BUILD_TYPE to Debug, which also exports a
public -DDEBUG to consumers, so pass Release explicitly. Keep
SO_REUSEADDR on the miniserver socket (replaces --enable-reuseaddr),
and disable samples, static libraries, tests and the FetchContent
dependency download. Add an openssl PACKAGECONFIG for the optional
SSL support.

The large-file CFLAGS are dropped: upstream now detects and sets
_FILE_OFFSET_BITS itself and exports it to users via its CMake
config.

Reverse dependencies gerbera and mpd (upnp enabled) build and link
against libupnp.so.22.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libupnp_1.14.31.bb => libupnp_22.2.2.bb} | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.31.bb => libupnp_22.2.2.bb} (57%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb
similarity index 57%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb
index 6ba21971d0..252f5cf478 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb
@@ -8,15 +8,21 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-SRCREV = "79ff958ed1012e60faba84981481f76cea43c7f2"
-SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x;tag=release-${PV} \
+SRCREV = "fac0494691434c35243131f66a0b27ea0c29f700"
+SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=main;tag=release-${PV} \
           "
 
+inherit cmake pkgconfig
 
-inherit autotools pkgconfig
+EXTRA_OECMAKE = "\
+    -DCMAKE_BUILD_TYPE=Release \
+    -DUPNP_BUILD_STATIC=OFF \
+    -DUPNP_BUILD_SAMPLES=OFF \
+    -DUPNP_ENABLE_TESTING=OFF \
+    -DUPNP_ENABLE_TESTING_INTEGRATION=OFF \
+    -DUPNP_MINISERVER_REUSEADDR=ON \
+    -DDOWNLOAD_AND_BUILD_DEPS=OFF \
+"
 
-EXTRA_OECONF += "--enable-reuseaddr"
-
-# Enable LFS support ( for samples )
-CFLAGS += "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE"
-CXXFLAGS += "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[openssl] = "-DUPNP_ENABLE_OPEN_SSL=ON,-DUPNP_ENABLE_OPEN_SSL=OFF,openssl"
