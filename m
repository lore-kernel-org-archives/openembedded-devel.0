Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7D8C35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:35 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.39882.1742165728283690681
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=D4ukzOco;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250316225526cbeddbad4734004cae-u0umvi@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250316225526cbeddbad4734004cae
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WXHR8juA2D/5a15b2BkBOGKyCHNzbLy2UO1bhaM2Qdk=;
 b=D4ukzOcoaD8uhDPwB5EP1iXyCJvk7tqcwrJNxVpVyDuitnqEkgB+ABBtDwB2WIHZVgTT1d
 xqJ+s5PqQLBeWzkYQIFrx9jmlV/BAJoDQ0kIMn240blPsz1jaVBrFqpiyCzLErnv7xeiK17Q
 g1owTwNAW4zO+As6i2HzjH46d0RuEjQomr7Ba8WqWYonuzCE5AFCPWy7h3aRx4A+sVEYXM2y
 V/X+sUXAWrlKuYZ7Mkm9gN3VW+XAJw4n2eBUsDN1N5LJZmI5f1Zc72e8FoJToFGu3pYKkW2/
 /PDwZtUg/oC2NxuR5ANKVVxcwJQ9S2eLf7dL28uVybUICCG9SP84Yc0A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 09/12] sox: patch CVE-2022-31650
Date: Sun, 16 Mar 2025 23:53:55 +0100
Message-Id: <20250316225358.2816208-9-peter.marko@siemens.com>
In-Reply-To: <20250316225358.2816208-1-peter.marko@siemens.com>
References: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116014

From: Peter Marko <peter.marko@siemens.com>

Use patch from Debian:
https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2022-31650.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sox/sox/CVE-2022-31650.patch              | 60 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2022-31650.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2022-31650.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2022-31650.patch
new file mode 100644
index 0000000000..41baad0e27
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2022-31650.patch
@@ -0,0 +1,60 @@
+From 3a8e783c58499bb52052c671b9161c43e011a508 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sun, 16 Mar 2025 20:08:04 +0100
+Subject: [PATCH] formats+aiff: reject implausibly large number of channels
+
+Source: https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2022-31650.patch
+
+CVE: CVE-2022-31650
+Upstream-Status: Inactive-Upstream [lastrelease: 2015]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/aiff.c      |  5 +++++
+ src/formats_i.c | 10 ++++++++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index 3a152c58..6de94f32 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -619,6 +619,11 @@ int lsx_aiffstartwrite(sox_format_t * ft)
+            At 48 kHz, 16 bits stereo, this gives ~3 hours of audio.
+            Sorry, the AIFF format does not provide for an indefinite
+            number of samples. */
++        if (ft->signal.channels >= (0x7f000000 / (ft->encoding.bits_per_sample >> 3)))
++        {
++                lsx_fail_errno(ft, SOX_EOF, "too many channels for AIFF header");
++                return SOX_EOF;
++        }
+         return(aiffwriteheader(ft, (uint64_t) 0x7f000000 / ((ft->encoding.bits_per_sample>>3)*ft->signal.channels)));
+ }
+ 
+diff --git a/src/formats_i.c b/src/formats_i.c
+index 7048040d..6a7c27e3 100644
+--- a/src/formats_i.c
++++ b/src/formats_i.c
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include "sox_i.h"
++#include <limits.h>
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <stdarg.h>
+@@ -60,9 +61,14 @@ int lsx_check_read_params(sox_format_t * ft, unsigned channels,
+   if (ft->seekable)
+     ft->data_start = lsx_tell(ft);
+ 
+-  if (channels && ft->signal.channels && ft->signal.channels != channels)
++  if (channels && ft->signal.channels && ft->signal.channels != channels) {
+     lsx_warn("`%s': overriding number of channels", ft->filename);
+-  else ft->signal.channels = channels;
++  } else if (channels > SHRT_MAX) {
++    lsx_fail_errno(ft, EINVAL, "implausibly large number of channels");
++    return SOX_EOF;
++  } else {
++    ft->signal.channels = channels;
++  }
+ 
+   if (rate && ft->signal.rate && ft->signal.rate != rate)
+     lsx_warn("`%s': overriding sample rate", ft->filename);
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 022a2d6b59..e66c10a56d 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
            file://CVE-2021-23159_CVE-2021-2317.patch \
            file://CVE-2021-33844.patch \
            file://CVE-2021-40426.patch \
+           file://CVE-2022-31650.patch \
            "
 
 # last release was in 2015, use latest hash from 2024-05-30

