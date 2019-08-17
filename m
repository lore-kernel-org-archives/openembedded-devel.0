Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1A5A47F363
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 08:13:50 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m125so5830934wmm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=q8nD9z0S/gQF3RzNcfPWEnktclaZfrBVX4wL7WAabLw=;
	b=eMMmyWh/GpYH3Yn72foNO+YhScya4ZbaJfhXSmP8tI1yHEe6AeJX9eK3KPLVIOv4jH
	O3wZ77dBs02jUzmw4bhGfLg8coqdCjEqeMPTvTCmOzjpY2FWoT2+JqFjn23M+7gkyzrt
	AMfr2ziHWI26BzsxNOcI7tkhp2JRnoFyWDScpmRzW3YKGtltLfr2hh9oG8ZVKB/cdDxP
	dC6RsM2vaAPgXKYHZubxBbgPaabJ/M8q5AukrTXPvTDeya1Qn3ZL4ME17qul71VG321X
	iaz9+SCD4btefYcPbpkfxHRXZJsnEsPz2sgh78w8zbq9gy9JaLFE1fpMm1MiG5PCqBlV
	nqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q8nD9z0S/gQF3RzNcfPWEnktclaZfrBVX4wL7WAabLw=;
	b=sC6AtRqCKJDDvLU5/oARTQzNBmVviQ5mDzKdwvbdYF9EC4V3X6qAZ83HXMB8EII85e
	/HINqohmMsQJAablUvHnSbvAi6M5nnQoW+tO2DkdIIQkQ7n32Rbj2waR4vKeYcedxPgT
	Z5hIPdydjgFZSCIyvCC71n23I1p4hudL7PHuwmiQPKFzmi2QgVfITEns8T0XIQfvvuxF
	Tkh6j7dYCU+asSj+4vmmZgMp7knxp+fcIwWLH3eGM+cJQ8qBN9p6W/wRuE4g0v943v68
	T3zSbodl42NrCA47ueQ5sBi6qWNBo7xuArYU0ubnZw6W7wmqsbyndreEWTs4PI1VZAes
	HUsA==
X-Gm-Message-State: APjAAAVnmygWz8BN8hZLIKfdMXGbtgCVPVoL663OaWaZWQc1qTfDTaaT
	2iRoiqfnfLOmiU3M0UvwufD0IZQY
X-Google-Smtp-Source: APXvYqwq/YCtLC//nPKBdil58/TLCG4+6ProyBSfAGKtUxKRyPhTRPLfzTfRBvfSZagGe19Det91/w==
X-Received: by 2002:a05:600c:22d7:: with SMTP id
	23mr11143167wmg.0.1566029630585; 
	Sat, 17 Aug 2019 01:13:50 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F2D875347F2BEDFD5FFA793.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8753:47f2:bedf:d5ff:a793])
	by smtp.gmail.com with ESMTPSA id
	q124sm7592567wma.33.2019.08.17.01.13.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 01:13:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 17 Aug 2019 10:13:37 +0200
Message-Id: <20190817081339.22253-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817081339.22253-1-schnitzeltony@gmail.com>
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Cc: bunk@stusta.de
Subject: [warrior][PATCH 2/4] vlc: Remove workaround and patches for problems fixed upstream
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
X-List-Received-Date: Sat, 17 Aug 2019 08:13:50 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../vlc/0002-glibc-does-not-provide-strlcpy.patch | 15 ---------------
 .../vlc/vlc/0005-libpostproc-header-check.patch   | 15 ---------------
 .../recipes-multimedia/vlc/vlc_3.0.6.bb           |  5 -----
 3 files changed, 35 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
deleted file mode 100644
index 3db3df34b..000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- a/src/input/subtitles.c
-+++ b/src/input/subtitles.c
-@@ -42,6 +42,12 @@
- #include "input_internal.h"
- 
- /**
-+ * Drepper's alternative 
-+ * http://en.wikibooks.org/wiki/C_Programming/C_Reference/nonstandard/strlcpy
-+ */
-+#define strlcpy(dst, src, n) *((char* ) mempcpy(dst, src, n)) = '\0'
-+
-+/**
-  * The possible extensions for subtitle files we support
-  */
- static const char *const sub_exts[] = { SLAVE_SPU_EXTENSIONS, "" };
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch
deleted file mode 100644
index 77a7d6173..000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-* Also look for postprocess.h under libpostproc/
-
-Upstream-status: Pending
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -2589,7 +2589,7 @@ then
-       VLC_SAVE_FLAGS
-       CPPFLAGS="${CPPFLAGS} ${POSTPROC_CFLAGS}"
-       CFLAGS="${CFLAGS} ${POSTPROC_CFLAGS}"
--      AC_CHECK_HEADERS(postproc/postprocess.h)
-+      AC_CHECK_HEADERS(postproc/postprocess.h,[],[AC_CHECK_HEADERS(libpostproc/postprocess.h)])
-       VLC_ADD_PLUGIN([postproc])
-       VLC_RESTORE_FLAGS
-     ],[
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
index 1ae213ff3..fcd321cb0 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
@@ -1,13 +1,8 @@
 require ${BPN}.inc
 
-# work around build failure
-EXTRA_OECONF += " --enable-libxml2=no"
-
 LDFLAGS_append_riscv64 = " -pthread"
 
 SRC_URI += " \
-            file://0002-glibc-does-not-provide-strlcpy.patch \
-            file://0005-libpostproc-header-check.patch \
             file://0006-make-opencv-configurable.patch \
             file://0007-use-vorbisidec.patch \
             file://0008-fix-luaL-checkint.patch \
-- 
2.20.1


