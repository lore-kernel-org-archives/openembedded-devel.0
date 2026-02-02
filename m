Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7878FE7DF08
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:37:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57425.1770050242847130752
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 08:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Et4qC8ZH;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so38347545e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050241; x=1770655041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeV4k0BbL18oICRxKEs3AyFncv6H5tjhRyfGn4OSYo4=;
        b=Et4qC8ZH9kssvjxXysKxBn56GHjnRv7rp/E2yIPav6IBf2EMqwKNSnDGM5JYUbVGM+
         r37OLPpdGX2hKQUTZvhkcCdNPH+tW5TZkLoHckJngodKIH4Ybpg75gYRfYd889/o3Isk
         EHenEP7Epbm+pNndb5WXXM4QsJ476IrNFa9PuqwzSj7p40aCFAmNQgmOzlRckP5sdohY
         l7aboFyumViwwwNzEWTCqEW+C4CxI4LZEXFLEu1jWfrs7LLs+EUUBFRyyBr915bB4K+p
         6XuP7+QKRLqwcM3rwGW4nm+0eHor/8UXE34SEHM5gUUBugbV1xDpcXoO49w/Z8l6lY8/
         cz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050241; x=1770655041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qeV4k0BbL18oICRxKEs3AyFncv6H5tjhRyfGn4OSYo4=;
        b=HJhZQ/QDmRcNHIzKSSPC4YXILrIDGk9qDtlNZ3riGZRBBvFIiTwVeJ903imMhHCV5L
         GhiT5LMAY53A0QZCHQQyrV4Q5i6javCLpv41gjSO4dllNpmTgRb42ziL4NIu8yQ5fBWP
         40o2cYB62ZzJpQKf+lSRGmaIMI+0vS2YWB2snk9dpvQCSQwxhG847/rq6qoMSXgmCbXM
         0u5FXj2V0nwk4JIsu5mP3gPfjdxuukdLdTDC2f1xfjtNs3a/sNs0uGfNJ6BYQqQUxlo+
         Y5cg/3DWu72gKKaOOki3EOi2ldZBtZKdMf3xtiJnK+rqKaoUCg6uNSUQLXKd8bQPeMui
         2xJw==
X-Gm-Message-State: AOJu0YzQWeosvsPBxB0ZiSoIQCEUsaLJW2nxdQSZVB/zADgUG71q1p8F
	bphop77OTpTCNQaLf+ENRRA7XytzcsjOQci6J9QiGqYoh3IhHxHtFYCRgkQ3dQ==
X-Gm-Gg: AZuq6aLiEG0LJN5D2Fi4amFRlt+DkzAT/0ZSjedLdNt13iI2j8m3hVRMAWER2zoT5qQ
	ST+dKJsf7Qii4/hWrqbK8Xb6fz9rxtCfU0ItY6xN3C2umSN72n7JpIZsX7Fx2AtWyrgslHBHivW
	sV96Us+RjKFz1fvoxmue4SfmUvqPAh1s3Iwxm9fgNJUHKuxW2i5mp6LtK+3oibYo2OX0RrmbOSD
	of8bu6A/Rzs7Trilb18oiRs+A2Hqk6xGR+FER/GC9UqzQhoRnXZWOyM3ryOY4K9kpxwfskyhRWz
	H6qaBPr0m3YHSWOq2crjRmWNYPhhxdfG8jZIGTS+SPGRGhXx+NptKwQdgguHDzZjbbXaCCmciAc
	t8GaN2yL1/trVHX/kmhvfdJwMoYxRtvaY0mqJQ/ogv02TqjAawK+shAu5Cw/Nd+eDxciH+QNE1R
	2E9QVym9/o
X-Received: by 2002:a05:600d:844f:10b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-482e31d240fmr121776965e9.12.1770050241074;
        Mon, 02 Feb 2026 08:37:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm451395e9.13.2026.02.02.08.37.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:37:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 9/9] xrdp: upgrade 0.10.4.1 -> 0.10.5
Date: Mon,  2 Feb 2026 17:37:14 +0100
Message-ID: <20260202163714.2359370-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202163714.2359370-1-skandigraun@gmail.com>
References: <20260202163714.2359370-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 16:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124070

Contains fix for CVE-2025-68670.
Drop patch that is included in this release.

Changelog:
Security fixes:
- CVE-2025-68670

New features:
- It is now possible to start the xrdp daemon entirely unprivileged from the service manager.
  If you do this certain restrictions will apply. See
  https://github.com/neutrinolabs/xrdp/wiki/Running-the-xrdp-process-as-non-root for details.
- TLS pre-master secrets can now be recorded for packet captures
- Add a FuseRootReportMaxFree to work around 'no free space' issues with some file managers
- Alternate shell names can now be passed to startwm.sh in an environment variable for more
  system management control
- Updated Xorg paths in sesman.ini to include more recent distros
- Add Slovenian keyboard
- xrdpapi: Add a way to monitor connect/disconnect events

Bug fixes:
- Allow an empty X11 UTF8_STRING to be pasted to the clipboard
- Fix a regression introduced in v0.10.x, where it became impossible to connect to a VNC server
  which did not support the ExtendedDesktopSize encoding
- Fix a regression introduced in v0.10.x related to PAM groups handling
- Inconsistencies with [MS-RDPBCGR] have been addressed
- A reference to uninitialised data within the verify_user_pam_userpass.c module has been fixed
- Prevent some possible crashes when the RFX encoder is resized
- Fixes a regression introduced by GFX development which prevented the JPEG encoder from working
  correctly
- Fixes a regression introduced by #2974 which resulted in the xrdp PID file being deleted
  unexpectedly
- Do not overwrite a VNC port set by the user when not using sesman
- Fix regression from 0.9.x when freerdp client uses /workarea
- Fixes a crash where a resize is attempted with drdynvc disabled
- getgrouplist() now compiles on MacOS
- Various Coverity warnings have been addressed
- Documentation improvements

Internal changes:
- An unnecessary include of sys/signal.h causing a compile warning on MUSL-C has been removed

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/fix-compiling-with-musl.patch   | 27 -------------------
 .../xrdp/{xrdp_0.10.4.1.bb => xrdp_0.10.5.bb} |  4 +--
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
 rename meta-oe/recipes-support/xrdp/{xrdp_0.10.4.1.bb => xrdp_0.10.5.bb} (96%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch b/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
deleted file mode 100644
index c716229ab6..0000000000
--- a/meta-oe/recipes-support/xrdp/xrdp/fix-compiling-with-musl.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-
-sys/signal.h does almost the same in both glibc and musl: it includes "signal.h"
-
-However with musl there is also a warning macro about this, which is interpreted as
-an error during building.
-
-Fixes error:
-
-| In file included from ../../sources/xrdp-0.10.4.1/waitforx/waitforx.c:5:
-| <...>/usr/include/sys/signal.h:1:2: error: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Werror=cpp]
-|     1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
-|       |  ^~~~~~~
-| cc1: all warnings being treated as errors
-
-Upstream-Status: Submitted [https://github.com/neutrinolabs/xrdp/pull/3678]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-
---- ./waitforx/waitforx.c.orig	2025-11-25 14:38:46.464337398 +0100
-+++ ./waitforx/waitforx.c	2025-11-25 14:38:52.007441093 +0100
-@@ -2,7 +2,6 @@
- #include <signal.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <sys/signal.h>
- #include <unistd.h>
- 
- #include "config_ac.h"
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.10.5.bb
similarity index 96%
rename from meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.10.5.bb
index 8203ada8e5..8d7c5807f2 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.10.5.bb
@@ -17,9 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
            "
-SRC_URI:append:libc-musl = " file://fix-compiling-with-musl.patch"
-
-SRC_URI[sha256sum] = "52eadf3e86c57be0de0b9d5c184b52a7946a070746d3eb04b5089dd6d42f8f5f"
+SRC_URI[sha256sum] = "9abc96d164de4b1c40e2f3f537d0593d052a640cf3388978c133715ea69fb123"
 
 UPSTREAM_CHECK_URI = "https://github.com/neutrinolabs/xrdp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"

