Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88354CCF2DD
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 00:41:36 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24763.1792370490901242983
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 17:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QjiUjLEu;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35943f55c06so2310589eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370490; x=1792975290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJusS08ibbYtBs9kvzgZZxpt4131wEDec3WelMWTY+4=;
        b=QjiUjLEuvKzpdsojGNA+kRnjZNfiT/cMuLCjNmrTWl1dw9sLgFq5JaRSII8YOun/KN
         G2iMtOY5vtd8eb+YZM+pMCl/yxvpG6XdeYlGZePGs20R2ps4AcOV9cNhkEgmpEBftS35
         U/v5cRS+m6sq0ytoHTf0v2u0ReVrYrlzdW0AEVjG0dT9s8S7fw/VO/9glqzgqw47GJuz
         iBly+5PPa4DLCU0/WqQ0qXM9wmUSl002HSkEEDl/LI9zf6qNXg5AvK5KvT5VTDEx+vI4
         tlDJDs3xiPHgYyfre3RwU6oi99cFaAY5xQjX9wRHGHry8aCh8eH4FyZ2tWl2Dl2C4AjO
         4u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370490; x=1792975290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJusS08ibbYtBs9kvzgZZxpt4131wEDec3WelMWTY+4=;
        b=erNBtmuWvA53/RpqAO5G/qJCGi7XrWXFcHABqXhyK6GV5ZwMYfW7iaCs2ibEWA+m76
         MrHG3DjndYa8wcf3LUIORGHc6AVEa3LnJxB3DWDIcKdAAhO/is3GfFy/8fDUuDdeAD9z
         Lo9UfEtQ+LQHo5RcMKGRE5brdNXtP+eA5FQWAXitEG31WrMViOEvsWZmEnLKLJ1U0qQG
         oRWDgnhKmzRJuWvtuTm9mARGwXJLwZmtlgoIwdst5PjoRH0NxGRCltIJkGd8ln5J8W24
         fTCdBPs97Mwe9Daq3aMWyUo2wkvA5RZPqhl34g79PoIlyN64VPEVp6MPf0IYgU+fZtJc
         udqA==
X-Gm-Message-State: AFq9FYJIDpOpIsujQehayV+pa101pjuO6g6Pg/1XLSgfAQ18HYZ52sdq
	g9/zzI0zfTy5fc5e1A68qcnKJbd39lmj1RPI4gOPBVsCuhSKjjbOVp4T0meJ5a6M0I0=
X-Gm-Gg: AYBFou1UBZwq6p5xG6WJJbSCS+EHKMSGePVxodGKiPWmuBUhkrR9NEgC0o13VulurOt
	V3Pfhc0AWcFe4NSgP0EI4VBgjVkxDI77t6XdwLwb7PxftnefZEEpDKFAmXiEuewtaMuZLiV8hXM
	pyka9a5G5Nm6jsVzpd9lHFzqub8RljvW3dLEOXFtfmmZr9Ae0/y4u8nSDxIpI8D9HizfMbj+dHC
	LDlNZBQWZBZXcc5pFRDCrCCqa2fUXVcAh4hvblCnBUXQYmmWtnxEuFyWBARVmvV/HCAbMvlmEUs
	+qJCFJD+NM2gMx+EzlG2ys9HUS49uuTS2o84fCaQR7JV/qcCvziR6OOQpY2yQZyKP/9bDPUlImG
	tL3gleaIT1me4o4J/kwFthefvpF9DC23iWBpHYfcW4ao94YU+g3Q74jQIaTSUp6dYdn9pUg6/WR
	l+WSlYKu+kofnySYkuLhkdqAMWN1UEBWCP/RAXzekL+c0iZFNQnIry5aOOztuKY8GmWSvXS3KQ4
	e35/lQeFYiNfc0VLAzT5gyhBYz+L589xWHHnEZ/VCHx9EMo0/nIMFOVaE2CGWZPWPGJy1/BI8KN
	B8p6KsKtn3xCjS5FF76dP0xFZafeuZmO6RvQiD0M9ofJ5Rk8h91UEi3+46qRdLiIFuWb2OffI78
	yZv0UkX3it0eu/MrzWmewJstocFHEUQYerJ3GDpZU5V3YywlTneqPZEfAONBKmedS9u1nYxzgQm
	qIJG03LwYzaKnLcBHwil22oufl/fzhOlROVU/puE5vfZ6FEQ==
X-Received: by 2002:a05:7300:3aa9:b0:360:aeee:9b8a with SMTP id 5a478bee46e88-360aeee9f90mr10649873eec.8.1792370489991;
        Sun, 18 Oct 2026 17:41:29 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm45211774eec.28.2026.10.18.17.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:41:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 5/8] clight: Fix build with musl
Date: Sun, 18 Oct 2026 17:41:19 -0700
Message-ID: <20261019004122.2475327-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
References: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 00:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131104

log.c uses open() and O_* flags without including <fcntl.h>, which
glibc pulls in indirectly but musl does not, so clang fails with
-Wimplicit-function-declaration.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nclude-fcntl.h-for-open-and-O_-flags.patch | 27 +++++++++++++++++++
 .../recipes-multimedia/clight/clight_4.11.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h-for-open-and-O_-flags.patch

diff --git a/meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h-for-open-and-O_-flags.patch b/meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h-for-open-and-O_-flags.patch
new file mode 100644
index 0000000000..0faeb84402
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h-for-open-and-O_-flags.patch
@@ -0,0 +1,27 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 18 Oct 2026 17:05:19 -0700
+Subject: [PATCH] log: Include fcntl.h for open() and O_* flags
+
+open(), O_CREAT and O_WRONLY are declared in <fcntl.h>, which glibc
+happens to pull in through other headers but musl does not, so the
+build fails with clang:
+
+  src/utils/log.c:33:14: error: call to undeclared function 'open'
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/utils/log.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/utils/log.c b/src/utils/log.c
+index 0ec38a5..8d46b90 100644
+--- a/src/utils/log.c
++++ b/src/utils/log.c
+@@ -1,3 +1,4 @@
++#include <fcntl.h>
+ #include <sys/file.h>
+ #include <sys/stat.h>
+ #include "utils.h"
diff --git a/meta-multimedia/recipes-multimedia/clight/clight_4.11.bb b/meta-multimedia/recipes-multimedia/clight/clight_4.11.bb
index 6280bd21b0..6f797ad601 100644
--- a/meta-multimedia/recipes-multimedia/clight/clight_4.11.bb
+++ b/meta-multimedia/recipes-multimedia/clight/clight_4.11.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

 SRCREV = "6a5ad96ce7643c433ea2f6bd597bc52dcc744120"
 SRC_URI = "git://github.com/FedeDP/${BPN};protocol=https;branch=master;tag=${PV} \
+           file://0001-log-Include-fcntl.h-for-open-and-O_-flags.patch \
 "

 inherit cmake pkgconfig features_check

