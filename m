Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1ACFF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 06:33:55 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37324.1777271626842294871
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 23:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d329S+o4;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: nmjain23@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so6420875a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777271626; x=1777876426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/5FEy7f8K64+SNjWy++/p3S6LfTGGzXrIJOowVppdo=;
        b=d329S+o4CwLdPiRcjXNZTHASyRJYst11rutQO/PYSVCuT7YLWh+UHOsQyB/ypCFYzZ
         GKPew7jtC6QTA7/4DkmCJh5gFg8n7bp51CZapRSUPJOtVXyo30FM1THINaz+wWh3jp1O
         8OtuKoWOnsSjJuzgiRe1YmDQtHcBmyek55lfnvttZxRmnNHBH9tOSa1Xylk7YJyalCKt
         G1cD8G6uiX2xhlVdacjKraEsdiQxuSaYkORWZ+u/gyxIKQ4JuDMsvu5HCno3sj4NqdHm
         SFowmRToawcLBeZUuZ68p40z4ylj3h8BiBTtDw9K0iCrfYxDc1k/gOzFIs+dt5Be+OC0
         q2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271626; x=1777876426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/5FEy7f8K64+SNjWy++/p3S6LfTGGzXrIJOowVppdo=;
        b=Dj4mwEUDE8qULTfmAPOCoX/Dg+yiaP2PsVv9RBSlkPdJareYnbkuzmifFd10o15fwS
         aI13N/ImclHks61M7aPddH3uKv0nXuIwwBDBV8LG8puQevKhoXmSHnXoVgzwDa7fwpnW
         aThZTh3nQRU3HuopVcDzjEX1vIqSYnZsXUF2UqnINfeq1/pSRg5cnVtIvCTsSTiJurzl
         HUR/Z3BgajKTZXflAbhNnUcbFH6ztjRDSgo6iogigvaOLe1tyuRPMBz7sEmONhwrFkOh
         fVzf0hIzmPYZo8vxZ+sbBp30CIVh7iI0VtZJNfHiCujGiTCdo7RAun051E6e3SpthLEW
         kVzA==
X-Gm-Message-State: AOJu0YwD36NhRqYVuTSijPrRPr6mVRDXFWP1scgYKR5p6T6bRfyvMLnG
	E8rt3zxLmSFvIVOTUJuNZDL0rpqwH9I1zkMCIdOqkGJge6ijt17Oc87z+4LKqA==
X-Gm-Gg: AeBDievEa0TMK2Za7huoIY9fOr9/IMXNR29oR02FO5DqlEPLrHA2tg10TgEsh0yLm5V
	R7QSs3Z6+/Sqq/Mzs2SS3QJdS6DjEUKHFN6WSA5eEEYdMLJS4C/u22zXjHxsHHMlcRJusWIs0xo
	P+9/8uiuNlBlsMK1rkLJGft0mobX8NmqzEXt+vMJl42Mhfg35ZkxtjAiii5UvwNVxsTADXQdcph
	WjNQjeX3Xwtw4bUsAERH/d49tEe2zi92OuBRSMM7yVs8ybppVEUXYIlIk4tvpcA995GcM8PMGSh
	33m3Bcd1NNRoZHz2iRVFBD4fTLJqDDEW1mbWQ5jOaHQEx5GKmwvZTtWB9W6+5iXtmcftTotpQY7
	p0TjZ1v8DMXL+o4lQTaDmzIu6v6AWZ4ugFbU77k5FfH+nL71E7Fl90ioBX0j1BXgcj9fH5PT1wc
	Ttd+OQWGTpqIsy2gO5aALNKsxTE9wIzCo4qhb1Agmj9D8BmzeSx3zw6/KTuN67wJeErASpg99/7
	LgUNpA1/AE=
X-Received: by 2002:a17:90a:d40d:b0:35e:27ec:de0 with SMTP id 98e67ed59e1d1-36140462a99mr42425043a91.13.1777271626038;
        Sun, 26 Apr 2026 23:33:46 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc593bsm38126863a91.1.2026.04.26.23.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:33:45 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Naman Jain <namanj1@kpit.com>
Subject: [PATCH] imagemagick: Fix CVE-2025-68950
Date: Mon, 27 Apr 2026 12:03:33 +0530
Message-Id: <20260427063333.117465-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 06:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126632

From: Naman Jain <namanj1@kpit.com>

ImageMagick is free and open-source software used for editing and
manipulating digital images. Prior to version 7.1.2-12, Magick fails
to check for circular references between two MVGs, leading to a
stack overflow. This is a DoS vulnerability, and any situation that
allows reading the mvg file will be affected.
Version 7.1.2-12 fixes the issue.
This is a minimal patch required for this cve.

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../imagemagick/files/CVE-2025-68950.patch    | 24 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
new file mode 100644
index 0000000000..f839884994
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
@@ -0,0 +1,24 @@
+From 204718c2211903949dcfc0df8e65ed066b008dec Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Fri, 26 Dec 2025 11:22:12 -0500
+Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-7rvh-xqp3-pr8j
+
+Magick fails to check for circular references between two MVGs, leading to a stack overflow. 
+
+CVE: CVE-2025-68950
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/204718c2211903949dcfc0df8e65ed066b008dec]
+
+Comment: Refreshed the orignal patch based on 7.0.10-62 version of imagemagick
+
+--- a/MagickCore/draw.c	2026-04-09 13:26:27.935293000 +0530
++++ b/MagickCore/draw.c	2026-04-16 11:52:23.007277997 +0530
+@@ -5545,7 +5545,7 @@ MagickExport MagickBooleanType DrawPrimi
+               clone_info->size=DestroyString(clone_info->size);
+             if (clone_info->extract != (char *) NULL)
+               clone_info->extract=DestroyString(clone_info->extract);
+-            if (*clone_info->filename != '\0')
++            if ((*clone_info->filename != '\0') && (LocaleCompare(clone_info->magick,"mvg") != 0))
+               composite_images=ReadImage(clone_info,exception);
+           }
+       clone_info=DestroyImageInfo(clone_info);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 9bc857b715..1dc1005aa7 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2026-22770.patch \
     file://CVE-2026-23874.patch \
     file://CVE-2026-23876.patch \
+    file://CVE-2025-68950.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.34.1


