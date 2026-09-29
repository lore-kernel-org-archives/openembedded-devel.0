Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48519CA5FB3
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:58:04 +0000 (UTC)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1477.1790722680626104128
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TA5Jl4S2;
 spf=pass (domain: gmail.com, ip: 74.125.229.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso7214007eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722680; x=1791327480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bTrqmyBpWHXda0bl73lhfeK7eDotD7ieUls5qJelfY=;
        b=TA5Jl4S2D303tjeEEzThIKU6AkLcJRY+5wgc6SpUpBeYWcXl3i53u8NOhoGFoC07zJ
         7BgQP59hOLs1qip/2GUQuInYtlnhiBb0wVBnTzirTDMCGNO1Y2K3aj4NmQKxtESRy6LY
         mGOqFJxnT2H3rDShQhPO5GujtOPx5fQXaqiO8jQkZEue+zvwSfpJPD+m964EsO/St0pA
         hDv6QfTlBOmswNDa6BK3qcehrKx+53HKYIb+jcHZkbDExPhN1QSm2X6VnFa63gIkCY/Z
         eCk0w8IQmPnOS8wUaURjD/gIcXFVP3HZEU70mjtNLlcGxa3mYPtkKi41RwzDAk5FdYga
         4Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722680; x=1791327480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bTrqmyBpWHXda0bl73lhfeK7eDotD7ieUls5qJelfY=;
        b=Tkx32wQqAehlN3L9d8aLHX7pVpO9VmWg6QmD+febernists+KbC9Ikx7zouZbZA2J3
         puxRbpmyG+f65l8sYOAxcU3YZvg/mBifCwgvmj9QBLvee6zrYkqy4yjyk9bw9YKn/IQ0
         0rcwnbZO8PKtMuJtoGAZPYBv9M1vmYgsK11//+AwmQ8B5ZLy5ZtFNekrmnGfbdU2rwmv
         7WU8Z0McUdSe41XZMoNTxicmfmtsBxtW0eDiALZ9TYJhGazpinlWOoMFXo4x0IKHQEwx
         sHG1w2bkapW3ROPK3cq4cLKDc8Gw2KQctp22IP5B/cqDDpcDS1gx0Ugb/9Ldyx2Id3Cl
         UaWA==
X-Gm-Message-State: AFq9FYJE9WhdTu0d5cxWUTuKmiShwfPpNK15qw/yrDMXu/rOYAIsM5jI
	wMA6rFAvxIdn+ffH2RayfC2zN7OSvhhkfoyyqb+CAkGG8Jv1LV/Ie4dSykjJWpDj9qk=
X-Gm-Gg: AYBFou2Fq8i/mYi51+jZkqHHbh+xyxJYNXZGb902LMGl8gIOPyzk2Lwko+GJqtJpfDO
	zUlDk8858TV1W0b+qkpcYsoX2hoqrVkJN5RCn/kU+bOod/hKcZrADZ5Go199HMSIy3bz3tZVET5
	d+7qKP++USkoIu9cCsr0E2E4gtYmMQf3qMVimbKpqG5iNklRyArGe1YXTJfPCph5MqYpMekv9wN
	DeBMqgDQrvxHFVNOaZPwRk+CZ3r86aT6H+fGf57dyOd1Hqw4yVdHDsx2PTa2VmM/Sy35npxuzA1
	jjunWiktZcLsFja1PPXVdWPbtmumf1o99qbdl8CJoRp8GUah2dFa30NAigMAIw/yaa4PMZAhrmq
	louCP2BZfhaj3p5GQk9Iqm9wDvySWN57kPhPW/xWtt/REsTspwkF6g/Q9c6H2fBXVVgkSabKgOG
	HVW7mgG3dekEYnhkhViW07Kp5phT7yDj31jNQgU3bWQt11zV1GOkQUwP8aM4btRG1cC2uQsoKr2
	C3pvXqe5uNE9qE1bWh1Jb/dCYBpI8Fv4xiRSmLYqi2cgyfiG9pCKjQEK340BWK63aJhe5EDWHXC
	9zrOLo580hLPxOv4md/V70OU0kKSAYw5vsNw2HIQ7J3+LgyWNBh3njev6DDHCAruLheOBZMaqE5
	cvIZR9rdHen2C7MOCBFo/PtdJKPtC29/C50eCDrgTtnWjU8uH4gYCbW7QKC0T6RM2iZISkS9EmI
	pmccPci6HjMmMeKBv+B6jKmQZpR77h/781tf2ojQ==
X-Received: by 2002:a05:7300:f58c:b0:32e:ca1f:e285 with SMTP id 5a478bee46e88-34c66c07388mr897513eec.14.1790722679806;
        Tue, 29 Sep 2026 15:57:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 22/26] perfetto: avoid getprogname() macro clobbering its own fallback
Date: Tue, 29 Sep 2026 15:57:19 -0700
Message-ID: <20260929225723.1046705-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130509

The bundled liblog/libbase compat shim defines a getprogname()
fallback macro and then immediately redefines program_invocation_name
using it in a way that collides with musl's own declaration. Fix the
ordering/guard so the two definitions don't conflict.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb |  1 +
 ...me-macro-clobbering-its-own-fallback.patch | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto/0002-Avoid-getprogname-macro-clobbering-its-own-fallback.patch

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 978a8611cc..f21b983a2b 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -27,6 +27,7 @@ SRC_URI:append = " \
            git://chromium.googlesource.com/external/github.com/google/re2.git;nobranch=1;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/buildtools/re2;name=re2 \
            \
            file://0001-Remove-check_build_deps-build-steps.patch \
+           file://0002-Avoid-getprogname-macro-clobbering-its-own-fallback.patch \
            "
 
 SRCREV_bionic = "a0d0355105cb9d4a4b5384897448676133d7b8e2"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto/0002-Avoid-getprogname-macro-clobbering-its-own-fallback.patch b/meta-oe/recipes-devtools/perfetto/perfetto/0002-Avoid-getprogname-macro-clobbering-its-own-fallback.patch
new file mode 100644
index 0000000000..20a06c4e19
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto/0002-Avoid-getprogname-macro-clobbering-its-own-fallback.patch
@@ -0,0 +1,58 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 29 Sep 2026 01:59:00 +0000
+Subject: [PATCH] buildtools: don't let the musl getprogname() macro clobber
+ its own fallback definition
+
+On musl, the recipe passes -Dgetprogname()=program_invocation_name via
+TUNE_CCARGS so callers of getprogname() resolve to musl's
+program_invocation_name. But android-logging's logger_write.cpp and
+android-libbase's logging.cpp each already provide their own
+"static const char* getprogname()" fallback for any non-Apple,
+non-Bionic target (which includes musl-linux). The function-like macro
+textually matches this definition's "getprogname()" declarator too,
+rewriting it into "program_invocation_name" and turning what should be
+a function definition into an ill-typed brace-initialized variable
+definition of type "const char*", which then conflicts with musl's own
+"extern char *program_invocation_name" declaration:
+
+  error: redefinition of 'program_invocation_name' with a different
+  type: 'const char *' vs 'char *'
+
+Guard each fallback definition with "&& !defined(getprogname)" so it
+is skipped when the build already supplies getprogname() as a macro,
+leaving the existing __APPLE__/__BIONIC__ exclusions untouched for
+platforms that don't define the macro.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/buildtools/android-logging/liblog/logger_write.cpp	2026-09-29 01:58:46.064186639 +0000
++++ b/buildtools/android-logging/liblog/logger_write.cpp	2026-09-29 01:58:46.065218637 +0000
+@@ -109,7 +109,11 @@
+ }
+ 
+ // BSD-based systems like Android/macOS have getprogname(). Others need us to provide one.
+-#if !defined(__APPLE__) && !defined(__BIONIC__)
++// Skip this on platforms where the build already provides getprogname() as a macro
++// (e.g. musl builds define -Dgetprogname()=program_invocation_name), since the macro
++// would otherwise rewrite this very definition's "getprogname()" declarator into
++// "program_invocation_name", clashing with musl's own char* extern declaration.
++#if !defined(__APPLE__) && !defined(__BIONIC__) && !defined(getprogname)
+ static const char* getprogname() {
+ #ifdef _WIN32
+   static bool first = true;
+--- a/buildtools/android-libbase/logging.cpp	2026-09-29 01:58:46.066054793 +0000
++++ b/buildtools/android-libbase/logging.cpp	2026-09-29 01:58:46.067074541 +0000
+@@ -62,7 +62,11 @@
+ namespace base {
+ 
+ // BSD-based systems like Android/macOS have getprogname(). Others need us to provide one.
+-#if !defined(__APPLE__) && !defined(__BIONIC__)
++// Skip this on platforms where the build already provides getprogname() as a macro
++// (e.g. musl builds define -Dgetprogname()=program_invocation_name), since the macro
++// would otherwise rewrite this very definition's "getprogname()" declarator into
++// "program_invocation_name", clashing with musl's own char* extern declaration.
++#if !defined(__APPLE__) && !defined(__BIONIC__) && !defined(getprogname)
+ static const char* getprogname() {
+ #ifdef _WIN32
+   static bool first = true;

