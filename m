Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2C8E78D74
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45585.1770637152247413386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Agp0GzVE;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4805ef35864so36899295e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637151; x=1771241951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIJtaoRYOiNXhSe6VdutqzDFVm/hCgb6dtBJzTxH9MA=;
        b=Agp0GzVEpHSDJmDxUU98PIDa63s2opbF6CR3j8qQgV/ms5tq4OnKo2aaKsAamt8ezz
         s4yVJA5ObLmNvQ2DEm6+FDUdcUYKrP7wq+1jockoksdKTGxkVNaW59A6Obu2SrEVWkKB
         lpxqkQWtbX8ReriGfhzAUWDx6+uABJm/gCXfyt/uJnUhKWqQpb+qlEdgvRLc5ie5/gA8
         IfhBPl495SqQ2xXOpbFHdgd/F6qHOIz86SpEzo4x02cuoEzvQWSgMV/3Q/PXIyH6CD1+
         Er2ELFpD4UuzMhBOy+nrgcXRd43BzRuAAEvQD6wHHWmJ1RupwZgU0tBoKhXS/NwL3if+
         /SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637151; x=1771241951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZIJtaoRYOiNXhSe6VdutqzDFVm/hCgb6dtBJzTxH9MA=;
        b=AVNwcZ9qxepPiJhBu1jCavvrtIvHuHOqDchLguxoru/frbH0GlXmMSsZ9AebOSvWQX
         laodmFwMiW7O2egmspRafio6PwU6AVjXw7dOSfM9lAAwu7mW89S3qWb+ZRtOVHlj74hv
         t+/MOALwXJPGDt1Dl4lVwBCNpx3/A1Go4wEl2CLCSSTivG00y3qU3bXUj+cN1uswDcyb
         vfBqxRLQTxc2IBWWwVS83NW7ZPVAD6D6OYAocNTqU+nt7gpy+Dc6w+1nvseRDHN2N3RC
         CQMCdoGFIyvKju5HKRuIsPKuJSpjscNBHA79fs6YmVTa4w1ggRrAYndyH83htxfR7tW3
         l+IA==
X-Gm-Message-State: AOJu0Yzr1EPeC0TkFG0csDLtoucrQGOZt1UrB6xzPvHBPYANADu8CWZ4
	PpZoBCZf0QxdkuFiRi77elgnzuLy/badHgZ4+EMmzUQ8kjBiMaZTsf04HK7x1A==
X-Gm-Gg: AZuq6aK40+YgL8uz1Kf1cnIbYbeh3GpuZKjPXGedPXDZchjRhFW3AEvwXMKA3FC8ShC
	jI8PHMRrWi0JpwlrzDmp0oW5+8BHaKqemsAXyXKHCueptxkG29eQzhw/xYu1v/7HlOgUiJTMc6l
	17UVLTA4w1wTbBmchiZ/SfQpjeRjbLfga4+yEeYTGhqwO7uKUqMwJE9wop8kuUhR5mJF6cHQ3oF
	1brrej+/ky3THuYjTK3Eyls/gqskOH7IqsKlshHwG4umTrJbJS4m5T5kapECKRCBeqLGz+9H4gh
	Wfxgd/6Y/jsAMMWUINjtbid3UvREkQ4y6IwGIRrnhwsb53UJsHi5TmwvFrlfQENRy6XDIbljqT7
	AhDasKd8KLprcQmcyqVpphmLCo/qannnKs5BXosms62ERsh8Ise1qrf3GuKf2xw/OagUpeuXEmI
	r+QTaPWB1p
X-Received: by 2002:a05:600c:528b:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-483201d61c7mr159784495e9.7.1770637150490;
        Mon, 09 Feb 2026 03:39:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 08/16] sox: patch CVE-2017-18189
Date: Mon,  9 Feb 2026 12:38:55 +0100
Message-ID: <20260209113904.3442496-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124302

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-18189

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-18189

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-18189.patch              | 34 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
new file mode 100644
index 0000000000..3ca829b230
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
@@ -0,0 +1,34 @@
+From c9e266bc77952c873a28ae320dac2eae5cbc9934 Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Thu, 9 Nov 2017 11:45:10 +0000
+Subject: [PATCH] xa: validate channel count
+
+A corrupt header specifying zero channels would send read_channels()
+into an infinite loop.  Prevent this by sanity checking the channel
+count in open_read().  Also add an upper bound to prevent overflow
+in multiplication.
+
+CVE: CVE-2017-18189
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/7a8ceb86212b28243bbb6d0de636f0dfbe833e53]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/xa.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/xa.c b/src/xa.c
+index 81a7677..9fc086e 100644
+--- a/src/xa.c
++++ b/src/xa.c
+@@ -143,6 +143,12 @@ static int startread(sox_format_t * ft)
+         lsx_report("User options overriding rate read in .xa header");
+     }
+ 
++    if (ft->signal.channels == 0 || ft->signal.channels > UINT16_MAX) {
++        lsx_fail_errno(ft, SOX_EFMT, "invalid channel count %d",
++                       ft->signal.channels);
++        return SOX_EOF;
++    }
++
+     /* Check for supported formats */
+     if (ft->encoding.bits_per_sample != 16) {
+         lsx_fail_errno(ft, SOX_EFMT, "%d-bit sample resolution not supported.",
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 68441b2534..917d1db1f7 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -37,6 +37,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-15371.patch \
            file://CVE-2017-15372.patch \
            file://CVE-2017-15642.patch \
+           file://CVE-2017-18189.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

