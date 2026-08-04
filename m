Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D27AC55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:57:26 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10575.1785823045052316852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TnRCj3ot;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cace91f112so47116975ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 22:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785823044; x=1786427844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1fRo7bZVnmnlfE9IVcjVTBOJJLr/H/a9uTjg02t80k8=;
        b=TnRCj3otA6m0cK5Smqf4gSefVyVUaHhGLeceabTNnurruHMHsyKMLJAMXWcAxewxgb
         0HuVtFgdNhLxyzxvChVG7rbqq25wMFNC8JzRB1AuTQ6h9r/JeHsqXOgq2sCnmR8g/gEu
         7r/WV5ni3Dfb7vJ82vlqt1N2aY6WXy35z2B+z/r9VHZjg2xMKC3xU+YGd5O3jhmtT92L
         fAosJ8Cld73Uf2OnWfLoF+Stlj88xc/Tv/FaFcEIl2J5QWTgo1a5sswZPGPbMMIQ9e/Z
         6qzl3smqkFxQtjrYZcjmLOQQKZtcZKBHdeEU/KxKS1mn9NxMrRMV7bOILDb9ERhlogYD
         N90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823044; x=1786427844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fRo7bZVnmnlfE9IVcjVTBOJJLr/H/a9uTjg02t80k8=;
        b=ARhtjZqpRwoiPix+GbNSIAwqe28FWfJqK5Qp1aQ8iihETalbuqcLAultqTXauPpSNl
         GO1UaZ0tEgL0vU7Y83E2jq0Cy6ocmEU3uLZ9ZsWUxUlznhXAMSBK+BtZ02rzZ3WFeXUr
         szi9mXuELX5j3m1iTTMP2m4eIHAqjDswgWwocokTKQj3SBY0nbD3A717ZdEjyjZ8yr7v
         VxzW5YDzSfmz5SPF5YuONPw3bOB9HKsLL4ArJAPARsrZhqj3YSDY43bIJSe6iCdG8/gC
         bKDHLPwupiehLLkvf7Z+429/9UeBJlxTvtNrMr9u0ssgvvOSf+9BazzifJ5Z3rVsyffc
         WR3w==
X-Gm-Message-State: AOJu0YwdnHGv9PvX+r6m4rB+SYQDeYlNB40OnAyb2Jgk8dWry1G+tuKq
	DV55eg+xsNhbUgoJZPdw0VrTJdGr+R3CJSEdrKZaAtGhW70CXDrbQxnNzq3VodZd
X-Gm-Gg: AR+sD12LHmA9P5LXYHPcBa/SZCjxa4QRqPwpE4fc9h9m+L468KpMwziNcZbkvhEgqFF
	8PTfSF8fDmeAeGdKkOLkCk6cVuuQUbLY+cMmlcIO29wZ3TnUMjz41vbm76pxGDdCcwzEvHDWvRt
	A9lunSQ98fuqV6wIURGFUp54fmfmhY4LAUp4R9MVANRbeBxRd+R+/UCD3yxIJ6KCbw4Icy6zC8J
	0EUMBm9ktAMfWQzex8o32IlA8yUkysHeL7nwvi9CzfcOtImJUG2TGea1zh8etMB1+xIL8l0VQS5
	WXfY9qpsUr76C8yqYWqW54MjGVvN1KFAlGTA8e+Pgzuja7CqBbukvAl0CAawSdddW01E0/kx/h9
	LSvZ7pt/TqenHbJxc9yuDmW6TtZ2am3O+9irQeoHo+JHZK+fmOY0wo0/SR6yNqPQtDa3p99vbSI
	NOVj3TEsjWX0Sp5EEjZeEA9e3QQVwj2ZT7okTAwHLl6YQYcqhdBI/ZTBWE3v+hlGIFr7aCs30sa
	1p0rba1Jy8QURJiP5btvxp6EoZHPEGfHwsKxYIR4tsAa8xdZaz/hP5PJ/Vy71tlx2XrWXQXMdgN
	sB1bGAQVo9e7weIrcWEV/X34UP4xlZ5txYqdcsijOK564NHggHJdg6R1RMptqNXEFNuNo8O2c2c
	sXQ==
X-Received: by 2002:a05:6a20:938e:b0:3c3:b6f1:13ef with SMTP id adf61e73a8af0-3c92a8f5958mr14725365637.62.1785823044294;
        Mon, 03 Aug 2026 22:57:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm37527156c88.13.2026.08.03.22.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 22:57:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH] librav1e: Drop need for a dependency on libgit2
Date: Mon,  3 Aug 2026 22:57:21 -0700
Message-ID: <20260804055721.1733701-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128734

rav1e's default features include git_version, which pulls built/git2 and thus
libgit2-sys into build.rs -- a *build-dependency*, so it is probed and linked
for the build host.  cargo_common exports LIBGIT2_NO_VENDOR, so libgit2-sys
probes pkg-config, which points at the target sysroot, and the host link then
picks up the target's libm.so linker script.  That script names absolute
target paths (/usr/lib/libm.so.6), which only resolve on the build host when
host and target architectures differ enough for ld to skip the script as
incompatible, so this breaks on aarch64 hosts building aarch64 targets.
git_version only embeds a git hash in the version string, which is
meaningless here, so drop it and keep the rest of the default feature set.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
index 740918bd18..13f417008b 100644
--- a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
+++ b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
@@ -7,7 +7,8 @@ inherit cargo_c pkgconfig cargo-update-recipe-crates

 require ${PN}-crates.inc

-DEPENDS = "libgit2"
+CARGO_BUILD_FLAGS += "--no-default-features --features binaries,asm,threading,signal_support"
+
 DEPENDS:append:x86 = " nasm-native"
 DEPENDS:append:x86-64 = " nasm-native"


