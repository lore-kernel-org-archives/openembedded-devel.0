Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614C8E7E0DF
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45790.1770637152760368639
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PMCJd6XJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so40864155e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637151; x=1771241951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1UIdVEJyRcSD9cbibL1/EUhyYds/omvGlCTuGenQuc=;
        b=PMCJd6XJy+e7UhlhZtncGkHmjye0/1TuyW1D1nhn8juOJYYEmjFOng4TF+DaPrd5nl
         tSjjvPTvI88AsJnX4GSItBeRxQyl51xij8YNEW7qRIvi3qJhUOmQsAlyzxYRiXIyqCAg
         vYhSVV4q0b/hAQ9HAyf+4brOI91CBQvvlVC9qsbJRUjo31d4Fr6ArKbwgAGsPtEZ+zDR
         1OqVUvmLniByS3GN1liNgGhYGHrd8DNvidbpiYoQj0+OliS2t6bizzlWAL8AU3xyH1jt
         YaMR3lGAVbiYSVGyF6RSHl6C4rXCg2D75IXbNI6MefZz0dKiU7Zlv2sXLTeahwIph/ZW
         cP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637151; x=1771241951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H1UIdVEJyRcSD9cbibL1/EUhyYds/omvGlCTuGenQuc=;
        b=tkfoqg2kw5r9rB+GdxzF5FeGmO8G4aRozk6Ghi80oOEwDwNpcW3tyEZ1t2w3lhUOfo
         m29JpMarL2wY9BxTPqac3KJnswp+OEO8tTf5DMGwZiENgagrA+lUg8MwoISwcVksizud
         Uw623B6Wcejl+sFqIKKqdPICYidSDNVQhZ/nvLLOWS1dK+u9eivPTleZXyAEUosnBE16
         fZsY2NQzNdFprphoVJkW0cEBmx3idXm0VBiAfke+iHzbVFDFEH1WtraxWVzmL3JAWyIL
         /nhLC3MR+vKsxCoKeyVv2MtlVV/LX3822AatWspb3iVH+ltov50Ip3iC/N0InVd8iu0F
         MahQ==
X-Gm-Message-State: AOJu0Yya9HyPGALsCFmRBTHchmrsg8HXUDrrg9TdvcMD6q12Di8r5AcW
	dPdicPAnp3R7uXpVyd5bCclJF/br80k4BJUWD9m20eoMfWg2n7QMM+2aa3WA4w==
X-Gm-Gg: AZuq6aKdN0lQBs1vk33WNWHLVte/781Cr2oP4WmR0Fr7GW+mNTS8vtc9RX04gmW12PP
	Mk44V70/3kJGUGd72V1fl7JUt8/Oi12S+s7I/wAhy8egGVNW6tGriu9o8ZFtlguYMKORL1ZBxAB
	XHv8QnPLGlYsG7nbEseOTBUnNlJ63vP6EVHpoEz1Tq5jr9Zpr58LaQWeBfYBHjpVvEw5YQA7baf
	kIcoiz9Pt9Z0gP7X6UPWHbc8l4HIiSpTcCC84H1dLwpjqG5mzkmagkQji+H3NdKE2eBxt90T3u2
	mV4bRXPk+JFMXBI06UbvIA/Kl42yedelcfViODrrYNlq5+yFPUTfQZskV+N6jStVKQma1+Xf70i
	3iupAUHjxagyaoym5x16lAztiFbHbycn/NlGURfDYaRTpUL/HbpfHGM41aO5fsqPcE2rKE5N73w
	KLIyAxOVJ1
X-Received: by 2002:a05:600c:698d:b0:47e:e7de:7c41 with SMTP id 5b1f17b1804b1-483179218ebmr201777525e9.16.1770637149796;
        Mon, 09 Feb 2026 03:39:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 07/16] sox: patch CVE-2017-15642
Date: Mon,  9 Feb 2026 12:38:54 +0100
Message-ID: <20260209113904.3442496-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124303

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-15642

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-15642

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-15642.patch              | 35 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15642.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15642.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15642.patch
new file mode 100644
index 0000000000..c505919edf
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15642.patch
@@ -0,0 +1,35 @@
+From eb9b33dd01ae7b3cf50894e7d5044fc2db183529 Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Mon, 20 Nov 2017 11:03:15 +0000
+Subject: [PATCH] aiff: fix crash on empty comment chunk (CVE-2017-15642)
+
+This fixes a use after free and double free if an empty comment
+chunk follows a non-empty one.
+
+CVE: CVE-2017-15642
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/0be259eaa9ce3f3fa587a3ef0cf2c0b9c73167a2]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/aiff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index 240d2e1..11ddb54 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -62,7 +62,6 @@ int lsx_aiffstartread(sox_format_t * ft)
+   size_t ssndsize = 0;
+   char *annotation;
+   char *author;
+-  char *comment = NULL;
+   char *copyright;
+   char *nametext;
+ 
+@@ -270,6 +269,7 @@ int lsx_aiffstartread(sox_format_t * ft)
+       free(annotation);
+     }
+     else if (strncmp(buf, "COMT", (size_t)4) == 0) {
++      char *comment = NULL;
+       rc = commentChunk(&comment, "Comment:", ft);
+       if (rc) {
+         /* Fail already called in function */
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index b721d84332..68441b2534 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-15370.patch \
            file://CVE-2017-15371.patch \
            file://CVE-2017-15372.patch \
+           file://CVE-2017-15642.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

