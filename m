Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30703.1792964613905950088
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 14:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BOaYGtuI;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso1666314eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792964613; x=1793569413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZTg1vsQUlb234VingCkHdB456kEEdiGZyXsamCyZfM=;
        b=BOaYGtuI2ULWHPY+fsmU1K2GA1f7aiHbDyT5h61xOJYcREL0JwjX05KfQRZx+A5OiV
         QBIj8S8tahvECZr83cNtpLHyyZv9AgnNMXoVkpFIY3qs46r/iPMZ/X+eIOyWUndRmtHn
         rX/+re3gLKTWRyryXenm8A4PFYUANwk8jItyJWgzxcoSg8umytu4FvzTxKcTMb8K/i+M
         8UcDGWpIduPIn/YlCkBse2XRs43cGmeiwGj9UkKqtK4NIMUVw+4Hzkc9RBzL/Bpd2Ey3
         OznoPqH7TQvu9hlPAd81SvmuwqeZ/Ubiwi/jC7lKxBqUK8OZUSD/w1Ow0Ri9CBtLmNWq
         hUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792964613; x=1793569413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZTg1vsQUlb234VingCkHdB456kEEdiGZyXsamCyZfM=;
        b=Zc1ehO1+lwTLJUWuWxugTk/kpO6KgHvDSyybXZwIF4uhR0deuYI4b/VS26rftmhDpa
         Z1hide/GrcOpOB3Ti3KFk/pKhuJYGWVqVFbU++33JhJ0BSHgI2Tczx90Xp3a30Sek3Yl
         8blfr1TSacGwWBzs/P0OZSmtLBAJv9fppPbFGsZr/VoJ4XFf2zHBgp4brT5/ti35z7gb
         Blq9jQlk8FBCYcsn+TgGegvBwWf6f6RKty3671aitwyW2PGkU0wwXd6botEe7UJmvUY9
         ZAR9EVug7QKcg6DQjYELzB5RApCVG5wxSKqkWQYUSKTS8oPaAoujuokUDmHEmikfnTDE
         eTlA==
X-Gm-Message-State: AFq9FYIWZcXjQzGs5BP5jSF08ym1Tf7Sxtc1q/6nsjiIOqVJqBbaCmkA
	msnxNi7CeugEnV+cW9L6XzqYq+sr/fCbkFqoP1ke9Brh8Glrh2FJeMvDvNgniQ75UMY=
X-Gm-Gg: AYBFou0vWOp3ZWqNOCetTKycyfME2oOlz1AHRVplVu0R7IhBNO+brTNYKrxHSrQ8Si0
	Tbuw335hiq8fVP6KqQwCCAV6saJC1ca84YXurZU5ATKXdjZxPN2m7F4+3tKZkwSJ5UwpbHJZNhA
	BbaZy03HERZM+4hHXZrWBBkvCDah69VyBRaCmQHZqDuLnUnBUtLIHHzs33sEOvpBvogUQecyk4D
	ZgeJKiKa4HTqe+mP2qW6dKwaNO/TT5wwdMR0dAN5nTUj61wPa4e8QPL9z0TixKAg14/vXbCv+4s
	m0buUxtAjx6mNNSVQMoeUKiUJkqIBiUfdvqC2r58m7TVPsqJrk09oFA9lburyeyASOUdPZe77Ki
	sa7oCGXfxMePSGhC8iH0k/a591yG0+uCvga/x3oRcJ6yYB/YBPZowDi2EJBLE268X62JxUbTL8Z
	3yaLVf7XC+8nIgbwsYskxjq/AHRcGmjsyEubA4FfbIBc3PL3zI2AjXhEgKHMvFqb3owQJxMrg5k
	8dJALb6VmuP/dIrilWDM4aoYsKUaEqR26TSwsjdYELvw2XwucgliyoInJlbEdkH+QE8zz0Lr3V/
	TM8eR8xkxM0XTiPAJJhVui18V38rAnqmKE05u5obWS3/VKY7s9VT6/NuUjlZpOSrFmLNMnwhNvn
	zYf2N7PoKsEmeCNBoC4vhefYuMc7J2VU+ZfauyeusruU0ECHtpsW+Z1ZoeLLIj38+S8QnyrD0Ky
	i7sgpX0Xf1NdyzfGs80w+91o0i9ECZ7kyDS/DJQCmG0J07r9bqDnaC9VnnS7xf4tgMrp+jRnj/d
	Cv7genprPbzLa1+CztI+4gU8d46CWc=
X-Received: by 2002:a05:693c:240d:b0:369:ffa5:1fab with SMTP id 5a478bee46e88-369ffa524acmr1899309eec.22.1792964612988;
        Sun, 25 Oct 2026 14:43:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm4451403eec.14.2026.10.25.14.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:43:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/6] fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE
Date: Sun, 25 Oct 2026 14:43:25 -0700
Message-ID: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 21:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131406
Content-Type: text/plain; charset="utf-8"

musl defines CLOCK_SGI_CYCLE, so on aarch64 cycle.h uses
clock_gettime(CLOCK_SGI_CYCLE) as its tick counter. Linux returns
EINVAL for that clock, every measurement reads as zero, and
FFTW_MEASURE planning loops forever, which times out the bench ptest.
Skip the SGI clock on Linux.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch | 43 +++++++++++++++++++
 meta-oe/recipes-support/fftw/fftw_3.3.11.bb   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch

diff --git a/meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch b/meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch
new file mode 100644
index 0000000000..ce23ac4377
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch
@@ -0,0 +1,43 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Oct 2026 18:30:00 +0100
+Subject: [PATCH] cycle.h: Do not use CLOCK_SGI_CYCLE on Linux
+
+musl's <time.h> defines CLOCK_SGI_CYCLE, so on targets without an
+inline-asm cycle counter ahead of it in cycle.h (e.g. aarch64), FFTW
+picks clock_gettime(CLOCK_SGI_CYCLE) as its tick counter. Linux dropped
+the driver behind that clock id and returns EINVAL, leaving the timespec
+uninitialized. Every measurement then reads as (nearly) zero, so
+X(measure_execution_time) keeps doubling the iteration count and any
+FFTW_MEASURE plan never finishes; the bench --verify ptest hangs.
+
+Skip the SGI clock on Linux, which makes musl fall back to the same
+estimate-only planner glibc uses on these architectures. This also
+avoids the duplicate ticks definition with --enable-armv8-cntvct-el0.
+
+Upstream-Status: Submitted [https://github.com/FFTW/fftw3/pull/430]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kernel/cycle.h | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/kernel/cycle.h b/kernel/cycle.h
+index 83438bb..960eb90 100644
+--- a/kernel/cycle.h
++++ b/kernel/cycle.h
+@@ -437,8 +437,13 @@ INLINE_ELAPSED(__inline)
+ #define HAVE_TICK_COUNTER
+ #endif
+ /*----------------------------------------------------------------*/
+-/* SGI/Irix */
+-#if defined(HAVE_CLOCK_GETTIME) && defined(CLOCK_SGI_CYCLE) && !defined(HAVE_TICK_COUNTER) && !defined(__ANDROID__)
++/* SGI/Irix
++
++   Linux removed the CLOCK_SGI_CYCLE driver and clock_gettime() fails with
++   EINVAL for it, but musl still defines the constant.  Using it leaves the
++   timespec unset, so every measurement reads as zero and the planner keeps
++   doubling the iteration count forever. */
++#if defined(HAVE_CLOCK_GETTIME) && defined(CLOCK_SGI_CYCLE) && !defined(HAVE_TICK_COUNTER) && !defined(__ANDROID__) && !defined(__linux__)
+ typedef struct timespec ticks;
+
+ static inline ticks getticks(void)
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
index e33d12af10..699ff56979 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     http://www.fftw.org/fftw-${PV}.tar.gz \
     file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
     file://install-bench.patch \
+    file://0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "5630c24cdeb33b131612f7eb4b1a9934234754f9f388ff8617458d0be6f239a1"
