Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05D7C55171
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 18:03:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18149.1785434581639889074
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 11:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Nn76ZOOS;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf50c6f235so1129155ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 11:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785434581; x=1786039381; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6apwJl9JDIV5XE7EMUs505Pj7iEl9jysGOE8QkmLLn4=;
        b=Nn76ZOOSCc+oyQED0R2XTMVD+8ArPfxT8dZi/mpSzoUPY59lk95W4fFD8uLmpcj+B7
         qzyJDNzpSgp6R6Cw8B7FE6KLduwfSEWhq3fpN//XlOgAU3b98FJ6aPi+nyzAC0ZIGa2Q
         H+CyPrncAe3BWWL/Jc9UYMC74tJz5HR6XeNws8CcwPgt/Ga2K2hBvjFhOgFeS2cEVp3T
         t4KjKFDxtCw7ApLHasPhORv/oDsVFD9Z6XSY3q2nR4d2Qc77y7Kh7jfFa1qaUQ9c1SDz
         JYHzdds/X5/ebf6zx30TaGsHFGxkhTGxzsrSfUgL/aVhWCUqGza7pCqsJVbK5TGYFSnZ
         Lg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434581; x=1786039381;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6apwJl9JDIV5XE7EMUs505Pj7iEl9jysGOE8QkmLLn4=;
        b=HmdbT4pq4MbXPdlw0rFBo3dcPbPaXIKg9XP3ppln4NJpAGr6l90s7wqC1RX9xIGVT9
         x+5DZv8k1usiKTVA4ciW/47m0JceMtml1fYba85YkvNQ1hX56bJW4MLnyqAosuDOCWBq
         NTfBTP+4kXEzrQwWk6nmO3xEmjF0pzP1ifsN6SLjkaX6kViZomPNhACSUZAo+bm7hVd8
         T9GPMvUIbpVdIlJXNSwWNK2e24AjkhX8MgJXpwGZ43pu42lQurKXlIa+WIaBbSRulmS5
         ciwQvq/4TerqNiiMoxTIg2gEg6PTwQqtO9wgcZ2rlsAISssCbJaCiE+1OUq3/+OHJzo8
         UDyQ==
X-Gm-Message-State: AOJu0Yw8pnFhW6VO+ztidwD7Qk1iuddKi1goe315/B/SjWBPlEvS7/TP
	hegswdJxr4NZSbsXtBKT8RDPOuQEAzxMkW00S045phOPiQNKIWp3bF2XkA76FOBg
X-Gm-Gg: AR+sD12WF//41fClpN5PmDG4/+7o2UNxw6B3AGhJfXCyk9pWehj/r2OeOq0cEUDm0V9
	HcdyVtixQ8spSyznsvIgV7dho6g+IHySjRCN3O8/VO4Ni5JitCJ9t7lF6ZNYc7tpw5vrpR7cvgI
	Ap4zDMyx/zPAoKGh8x+m7SXOzYS+IaB3uBM5EHkToJmdpZa9dLAGS7QjFUTgQf3W+hqysErGlex
	WUpLNrhP0EZBNlHDOb7cm8XyVyURnVLdZFWNuO4P3Pcwz34AM2h+XUFP2RtW/0Qwqr86O24avk2
	tGsejduzcj1uRra4cjT1/Edoo8UQwIzDeq6/4H37FpY861t3iI3lN6XE+VcYvTgFjv3exRX/D0f
	v8zWxV5vDROnhOa6yEzL//f8MD4mzl5z5WGq+J/YNPJAEDjoU691TiQYtB5LQOtpT8mMtObo2Qt
	s1w/AZ+mgmwjr9b/+JHEHuxfzX5wB0bScD063EAVdLLDkk5iH9phnfyOrD47Li8L9XMODcSpnRq
	GAdGXCJlfMOY0OpXr1LLKV9VL3CBaWqgA2RnawBCdpicImYiJ+pPDOzQk6vbHuQcUha7zKfRxvq
	TrRfgsMp7FcooHzVIpWEebLCasEBvMMD7ihRYu9M2BOkzIgTm7BFPuxdVxzwIyGnJhMjFDpT3se
	7iGZlECWX2q0wEg==
X-Received: by 2002:a17:90b:4acc:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-38fa7efea94mr852808a91.20.1785434580733;
        Thu, 30 Jul 2026 11:03:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265010esm24015408c88.6.2026.07.30.11.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:03:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 1/4] cockpit: upgrade 352 -> 364
Date: Thu, 30 Jul 2026 11:02:53 -0700
Message-ID: <20260730180257.3733387-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 18:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128573

Upstream changes (release notes):
 * 353: Networking - suggest prefix length and gateway address; bug fixes.
 * 354: Convert documentation to AsciiDoc; work around Firefox 146/147
   bug; bug fixes.
 * 355: ws - remove obsolete pam_cockpit_cert module; shell - add
   StartTransientUnit as a sudo alternative.
 * 356: systemd - allow editing timers created by Cockpit; convert
   license headers to SPDX format.
 * 357: lib - use browser context menu on shift; bridge - support
   Python 3.14 on old kernels.
 * 358: Networking - add Wi-Fi support; Cockpit Client updated to GTK 4.
 * 359: Bug fixes and translation updates.
 * 360: ws - CVE-2026-4631 (be more explicit when handling hostnames on
   cli); ws - support loading a custom login page.
 * 361: Remove all "Mount" actions in Anaconda mode; dependency updates.
 * 362: Fix arbitrary code execution via specially crafted logs page link
   (CVE-2026-4802); bug fixes.
 * 363: Translation updates.
 * 364: Bug fixes and translation updates.

cockpit 356 converted all license headers to SPDX format, moving the
LGPL-2.1 text from COPYING to LICENSES/LGPL-2.1.txt. Update
LIC_FILES_CHKSUM path accordingly (md5 is unchanged).

Refresh 0001-Warn-not-error-if-xsltproc-is-not-found.patch: the
configure.ac context shifted (-61 lines); same MSG_ERROR → MSG_WARN
change preserved.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cockpit/{cockpit_352.bb => cockpit_364.bb}              | 4 ++--
 .../0001-Warn-not-error-if-xsltproc-is-not-found.patch      | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_352.bb => cockpit_364.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb
index 6b1fdcaeb1..07e2b9d163 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb
@@ -2,14 +2,14 @@ SUMMARY = "Admin interface for Linux machines"
 DESCRIPTION = "Cockpit makes it easy to administer your GNU/Linux servers via a web browser"
 
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI += " \
     https://github.com/cockpit-project/cockpit/releases/download/${PV}/cockpit-${PV}.tar.xz \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
     file://cockpit.pam \
     "
-SRC_URI[sha256sum] = "72098a51f85c4a63f2e276af119920a5faca978b57652df562b409b5941b5146"
+SRC_URI[sha256sum] = "514cea072e1ef137323ab92bdb07a66bbb5106ecd584e7a046294cf0170cb690"
 
 inherit gettext pkgconfig autotools systemd features_check python3targetconfig
 
diff --git a/meta-webserver/recipes-webadmin/cockpit/files/0001-Warn-not-error-if-xsltproc-is-not-found.patch b/meta-webserver/recipes-webadmin/cockpit/files/0001-Warn-not-error-if-xsltproc-is-not-found.patch
index db583cfd29..b8e812f0ae 100644
--- a/meta-webserver/recipes-webadmin/cockpit/files/0001-Warn-not-error-if-xsltproc-is-not-found.patch
+++ b/meta-webserver/recipes-webadmin/cockpit/files/0001-Warn-not-error-if-xsltproc-is-not-found.patch
@@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 7 Sep 2022 11:12:28 -0700
 Subject: [PATCH] Warn not error if xsltproc is not found
 
+Refreshed for cockpit 364 (context shifted; same intent preserved).
+
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -11,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6896c19..2a1fb52 100644
+index 0d12145..36cb2c4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -182,7 +182,7 @@ AC_SUBST([systemdunitdir], [$systemdunitdir])
+@@ -121,7 +121,7 @@ AC_SUBST([systemdunitdir], [$systemdunitdir])
  # package as xgettext, and we find them by PATH, so just check for the one.
  AC_PATH_PROG([XGETTEXT], [xgettext], [no])
  if test "$XGETTEXT" = "no"; then

