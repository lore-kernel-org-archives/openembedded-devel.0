Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A69777E42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:00 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 79so18583667pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9IyeBO63hq1q66d1UT2yEsgUJ6Ripv/I+oL1T5UEG3w=;
	b=npIS0VARAUsYYmNsWKl3ckrIu6GIwvJV7OQmXKb9wCqYXZxNPy/61KNLuUfCOpNegb
	kufw11nv6a7+OdEyphWTIHNz94EeJijb+HI2kPnXAMlk1YBDhV6gJsPgAueQe5PLaqsE
	NQ6pAcA12T3VS3ClnyxGsrrbLHw6QPezm60TMinDbiMAUp2UkEjHn4hJiJPPY3dFif/q
	GQdea1/GRNx8HACHh61jEZNYJdjeBnrMBIeIzhFCsnKhMHePzt2I3LXtGicLILzw3s58
	rdCbKzT5kxoJelaPTRaTCNIU5xYZtVBm+8Qlc/HvZoKlnm00qPZth/9FB7YJGK3zfRQK
	V1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9IyeBO63hq1q66d1UT2yEsgUJ6Ripv/I+oL1T5UEG3w=;
	b=MFtnA+1QFyH/LC6k0Z5FW30VM42aB44BTB9SbmKW3Tp0KmXNtqTJ/PjjsU3VKXmte8
	DK4h7MXt7D+w3EVSxwA/6lfZ4iPPaeC7A7MnNNxayOUaCUiPBtqkR68AOTxZ02Tt/A99
	XKLivpMTcSOU7LYrTvJ/9jz/DMDC6Zrj5PFe6XNAeTHdhspCdIKn67twvoqWq+B0tTDi
	GdNyx0c9n6cB2jyj9BbKyG4zka3aMlGaXB/VbOwIf7E8ZzXHob+zG9hHMk5VnSLO/okN
	5vP30ZM883SY33cVW2T+HZy0qkno9ySvO7io9aSNI7yuYU1rKJ/YVaJmDzXzUdS/OxaQ
	1XQA==
X-Gm-Message-State: AFeK/H3dzZOgDC/cBau9XH4hK2J4n0MshP8h9rHYbBv/DaV2UMLDL3zC0AB2bj/5IfjUQA==
X-Received: by 10.98.97.7 with SMTP id v7mr3642618pfb.161.1490978581677;
	Fri, 31 Mar 2017 09:43:01 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:09 -0700
Message-Id: <20170331164247.5052-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 05/43] caps: Use c99 int types
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:00 -0000

Fixes build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-basic.h-Use-c99-supported-stdint-types.patch | 46 ++++++++++++++++++++++
 .../recipes-multimedia/caps/caps_0.9.24.bb         |  8 ++--
 2 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/caps/caps/0001-basic.h-Use-c99-supported-stdint-types.patch

diff --git a/meta-multimedia/recipes-multimedia/caps/caps/0001-basic.h-Use-c99-supported-stdint-types.patch b/meta-multimedia/recipes-multimedia/caps/caps/0001-basic.h-Use-c99-supported-stdint-types.patch
new file mode 100644
index 000000000..1087b0e79
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/caps/caps/0001-basic.h-Use-c99-supported-stdint-types.patch
@@ -0,0 +1,46 @@
+From a5cea22294a9acb6eed955bd415f562a6cc36482 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 11:54:23 -0700
+Subject: [PATCH] basic.h: Use c99 supported stdint types
+
+include stdint.h for getting the definitions for int types
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ basics.h | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/basics.h b/basics.h
+index 643d96e..1dc2fa7 100644
+--- a/basics.h
++++ b/basics.h
+@@ -46,17 +46,18 @@
+ 
+ #include <assert.h>
+ #include <stdio.h>
++#include <stdint.h>
+ 
+ #include "ladspa.h"
+ 
+-typedef __int8_t			int8;
+-typedef __uint8_t			uint8;
+-typedef __int16_t			int16;
+-typedef __uint16_t		uint16;
+-typedef __int32_t			int32;
+-typedef __uint32_t		uint32;
+-typedef __int64_t			int64;
+-typedef __uint64_t		uint64;
++typedef int8_t			int8;
++typedef uint8_t			uint8;
++typedef int16_t			int16;
++typedef uint16_t		uint16;
++typedef int32_t			int32;
++typedef uint32_t		uint32;
++typedef int64_t			int64;
++typedef uint64_t		uint64;
+ 
+ #define MIN_GAIN 1e-6 /* -120 dB */
+ /* smallest non-denormal 32 bit IEEE float is 1.18e-38 */
+-- 
+2.12.0
+
diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
index 3e409e6eb..90a28360c 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://quitte.de/dsp/caps.html"
 LICENSE = "GPL-3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = " \
-    http://quitte.de/dsp/${PN}_${PV}.tar.bz2 \
-    file://Avoid-ambiguity-in-div-invocation.patch \
-"
+SRC_URI = "http://quitte.de/dsp/${PN}_${PV}.tar.bz2 \
+           file://Avoid-ambiguity-in-div-invocation.patch \
+           file://0001-basic.h-Use-c99-supported-stdint-types.patch \
+           "
 
 SRC_URI[md5sum] = "c1d634038dcb54702306c0e30cb1c626"
 SRC_URI[sha256sum] = "f746feba57af316b159f0169de5d78b4fd1064c2c0c8017cb5856b2f22e83f20"
-- 
2.12.1


