Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 82B887F20D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 18:59:46 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id m30so26037401pff.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qaBg2p+L4Ery/9cj7VWcHz5jDoDT6nfEAZ4FxfOFpG4=;
	b=KNxntvvc0C9MJgDrsF3dylDRAPN9TG/UI6w54ye/zqhF2xb7rvxZt89WXGlJmud4KD
	C8Aypfbaj1tYqub0v+Sy4eAhqtPAgVRY0xzrzvRlpNogml87OsgHBpfV50z0X4c6GXJO
	0BqwWvjeMmi7TwEYsjCkNlnSgrYTNSRlk/AVPlrP3QPdqGuuDMoGd5ozpbqRC+2s30Ij
	e8lzjg6KL5uoCe0KNOgWa2vvGBjipihVZxBwQswI+KyrmNBUYovAU6b34csQGQGK2yli
	zV3W7Qkrk6EUKmeMBAzWG+6wZgK2u/UEMN8W59+4IiK3xFIfLQERnD/btt6DZEEV+JPi
	JX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qaBg2p+L4Ery/9cj7VWcHz5jDoDT6nfEAZ4FxfOFpG4=;
	b=M5cdbQc7cRjnaNYsYIwre8aQ3HVF02VJtvml5BZCkkC6eD+rWoy8cQxZXxtmM5nmvB
	JDe2iKbM/AjkZB++T7NqlyKd0VcwZGCTvY/88o8CGG3xQyMZMm0by1sAPhfLsMvEOLdC
	Bykq2jOV7Uh+j/VE3RcUV7PF+ReOB0+GrAADrTdwXhtNExvCrEHvBvymUYP7wjOhBwKG
	t1+1VTTZiwvSWfS40rTHbP8IANOW6VR2lV7oKVPgflG8P7GqrPUMafijv13S81/n6DdH
	fYF+K7w727rIfdjE+rp8ft5jDb2d86ArBdgOvnNHlXgMwSru6XaXsF9VaAE1AxmRqpr2
	qR5Q==
X-Gm-Message-State: APjAAAWDOhQp25aSWkgly75A5ja4xZS8HW/GupMy6z2GoJIHy0+BIKLl
	AxFOrwwvJKsPUN/sBmyw3VyCQpiByQc=
X-Google-Smtp-Source: APXvYqzns9Z1ablvsUu6AAQ0Wb/sD7dtexqSPvi6h0BqB8uOqaSxub6lUHDAgXtrFVAnALqHJ4B5kQ==
X-Received: by 2002:aa7:8651:: with SMTP id a17mr28317239pfo.138.1564253986970;
	Sat, 27 Jul 2019 11:59:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k22sm60178333pfk.157.2019.07.27.11.59.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 11:59:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jul 2019 11:59:36 -0700
Message-Id: <20190727185937.29832-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727185937.29832-1-raj.khem@gmail.com>
References: <20190727185937.29832-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/4] opensaf: Add configure time check to detect gettid API in libc
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
X-List-Received-Date: Sat, 27 Jul 2019 18:59:46 -0000
Content-Transfer-Encoding: 8bit

Also fixes build with glibc 2.30

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-configure-time-check-for-gettid-API.patch | 67 +++++++++++++++++++
 .../opensaf/opensaf_5.19.03.bb                |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Add-configure-time-check-for-gettid-API.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Add-configure-time-check-for-gettid-API.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Add-configure-time-check-for-gettid-API.patch
new file mode 100644
index 0000000000..2b03b1800a
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Add-configure-time-check-for-gettid-API.patch
@@ -0,0 +1,67 @@
+From 91c7362834ccd88d1432b3e6c5c51748b72b10ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jul 2019 07:21:16 -0700
+Subject: [PATCH] Add configure time check for gettid API
+
+glibc 2.30 has added syscalls wrapper for gettid
+it should now be checked during configure if C library provides
+this API then do not define local function
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac         | 4 ++++
+ src/base/logtrace.cc | 3 +++
+ src/osaf/config.h.in | 3 +++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 22ab936..90f3da4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -480,6 +480,10 @@ fi
+ 
+ AC_SUBST([localstatedir])
+ 
++#############################################
++# Checks for functions.
++#############################################
++AC_CHECK_FUNCS([ gettid ])
+ 
+ #############################################
+ # Checks for programs.
+diff --git a/src/base/logtrace.cc b/src/base/logtrace.cc
+index 8908c1f..fe87e8d 100644
+--- a/src/base/logtrace.cc
++++ b/src/base/logtrace.cc
+@@ -31,6 +31,7 @@
+ #include "base/logtrace_client.h"
+ #include "base/logtrace_buffer.h"
+ #include "base/ncsgl_defs.h"
++#include "osaf/config.h"
+ 
+ namespace global {
+ 
+@@ -58,7 +59,9 @@ std::once_flag init_flag;
+ thread_local LogTraceBuffer gl_thread_buffer{gl_local_thread_trace,
+   global::thread_trace_buffer_size};
+ 
++#ifndef HAVE_GETTID
+ static pid_t gettid() { return syscall(SYS_gettid); }
++#endif
+ 
+ /**
+  * USR2 signal handler to enable/disable trace (toggle)
+diff --git a/src/osaf/config.h.in b/src/osaf/config.h.in
+index d1f6d1a..0a3f27d 100644
+--- a/src/osaf/config.h.in
++++ b/src/osaf/config.h.in
+@@ -18,6 +18,9 @@
+ /* Define if experimental code is enabled */
+ #undef HAVE_EXPERIMENTAL
+ 
++/* Define to 1 if you have the `gettid' function. */
++#undef HAVE_GETTID
++
+ /* SAHPI_INTERFACE_VERSION == A01 */
+ #undef HAVE_HPI_A01
+ 
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
index 0cccebdfcd..505c087f17 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-configure-Disable-format-overflow-if-supported-by-gc.patch \
            file://0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
+           file://0001-Add-configure-time-check-for-gettid-API.patch \
            "
 SRC_URI[md5sum] = "4dd1497ccd82d275735853bf0db5c510"
 SRC_URI[sha256sum] = "de42c8dd850990716ca494ca598165cc7a23b5b7f2bc21af5d71a3d971ddd595"
-- 
2.22.0


