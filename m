Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.167.1593141283159859389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 20:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NE8sceD5;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id x8so2845710plm.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 20:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rFTS6bBWVGmIslvzE7IXw4IK4VNnPjBzdos+6G/kLpY=;
        b=NE8sceD5/hNKFGaBSW95mqQsLTpA5gxqQWC9cVrss1GbZE/UEZA/HNX02MJnr41Q7q
         pjO4fMDFTWPm9wh0RINP1njM2El0S9KWhaMnlHnRYqBcwDueJK9iH3FUkU62WXx/aiAe
         +jbloqv2JRHvMpn/BUAvo0KK7TCUkymJ2zIa3owsGFz3wVDCZbssyYZh0b3BYqcSwmgk
         QK/AXARK5nqkxJ6FpXEgy/npP7EK68c56rJDIFVTb2uekJZ7Vmls6InDVWLwRvQ8aOM4
         bGU2/8Qn5M1kibzE2+AjEoDGaURNes5P6ryDTuMm6TS0stCQix6WE7rwx38ZR4KZq0Pv
         Gfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rFTS6bBWVGmIslvzE7IXw4IK4VNnPjBzdos+6G/kLpY=;
        b=J4WBTlcPcuLRWnP8JZbrYb+AGQSDffTD3lgcYgO4/2NdSOe1SyD4410bcM0RqZ+Odx
         NLT3mxb+lQ4qQZNXhqtDlRIjwYF2oXwEDL78dQidL6DDH/KS2cnwTnJsvH5BBunoewze
         GSvLeUi9NftVpPwPezLlf9oHfa3enYqh4ccy+vU+ld6GD9qeCz4mZeW+1sWbaRtLyEST
         OdKjyRWgDWtx7015vurl4pX84S4fJcE09w+IpgOXVLRazHy8zROSW8r5wzdlf5QdD8ZN
         P5rhv7odH4nRi9/dOhlEpEp9Du/9mHpj3LSOBoE63xGL5n8DwVWU1cEpJUPZy/P2VaQ+
         2Hnw==
X-Gm-Message-State: AOAM532u8U6b232mo0PLQhbeey2NZsowakJ4KjXWOSwk98iy4EMVaCqa
	srXzNw0nfaCsk0qHmE8MkB3HcVQB
X-Google-Smtp-Source: ABdhPJyT4ApMT8PoscsPaDAgBzECMxXq9sVoEIA9viFWmYcud+A/DZyF0kUfJQw5ObwEdNg2jPixkQ==
X-Received: by 2002:a17:902:8204:: with SMTP id x4mr798365pln.153.1593141282516;
        Thu, 25 Jun 2020 20:14:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:acbe:8216:8a55:1b44])
        by smtp.gmail.com with ESMTPSA id z1sm24506070pfr.88.2020.06.25.20.14.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:14:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [zeus 1/6] gd: fix CVE-2017-6363
Date: Thu, 25 Jun 2020 20:14:33 -0700
Message-Id: <9aea795890af4de0b8e6587f1f2778109446736d.1593141198.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593141198.git.akuster808@gmail.com>
References: <cover.1593141198.git.akuster808@gmail.com>

From: Haiqing Bai <Haiqing.Bai@windriver.com>

Backport the CVE patch from the upstream to fix the heap-based buffer
over-read in tiffWriter.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/gd/gd/CVE-2017-6363.patch | 35 +++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.2.5.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch

diff --git a/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch b/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
new file mode 100644
index 0000000000..25b5880ff9
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
@@ -0,0 +1,35 @@
+From 8f7b60ea7db87de5df76169e3f3918e401ef8bf7 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Wed, 31 Jan 2018 14:50:16 -0500
+Subject: [PATCH] gd/gd2: make sure transparent palette index is within bounds
+ #383
+
+The gd image formats allow for a palette of 256 colors,
+so if the transparent index is out of range, disable it.
+
+Upstream-Status: Backport
+[https://github.com/libgd/libgd.git commit:0be86e1926939a98afbd2f3a23c673dfc4df2a7c]
+CVE-2017-6363
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ src/gd_gd.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/gd_gd.c b/src/gd_gd.c
+index f8d39cb..5a86fc3 100644
+--- a/src/gd_gd.c
++++ b/src/gd_gd.c
+@@ -54,7 +54,8 @@ _gdGetColors (gdIOCtx * in, gdImagePtr im, int gd2xFlag)
+ 		if (!gdGetWord (&im->transparent, in)) {
+ 			goto fail1;
+ 		}
+-		if (im->transparent == 257) {
++		/* Make sure transparent index is within bounds of the palette. */
++		if (im->transparent >= 256 || im->transparent < 0) {
+ 			im->transparent = (-1);
+ 		}
+ 	}
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
index 35f9bb2516..dda2e67d6d 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
            file://0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch \
            file://CVE-2018-1000222.patch \
            file://CVE-2019-6978.patch \
+           file://CVE-2017-6363.patch \
           "
 
 SRCREV = "8255231b68889597d04d451a72438ab92a405aba"
-- 
2.17.1

