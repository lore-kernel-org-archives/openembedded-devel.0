Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9A2D13C07
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18918.1769432714292207250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NdKUsWp0;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so34044115e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432713; x=1770037513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkFcWxrArZIIB2szhtlb0PmpIkIdsJBiH4DpQ93oaLI=;
        b=NdKUsWp062XjGAEkM3SbM9RUoRGWorbfbCtQLAzGKy5Mjkgo8RobTZ8rI47i4PAEF4
         MUHHm8IEdeSvxOEYMHQ2Es4O2CIGk07fWkhvwZvf0MYwtdF/J+NxkmhzMCdCnq39/+LB
         MxDQAbBpfzfatrurg5NPo3/7BXoZ4EClRTukECLullBO8acxHtfgfmNQS+rlhchxhj2u
         QNPuWBdjRgQ6MqiO8gFMtMa4FLRqGoBqR2GN7len4dVZ1lXg48bT1UtzcFx2hnAQTsS2
         ipjC7c3Sy0PRke+nBdhRpywGmVyQM61ADr9gDjt6/1qCDVZxAdPJjp+k7w1llNzNNa6X
         HQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432713; x=1770037513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UkFcWxrArZIIB2szhtlb0PmpIkIdsJBiH4DpQ93oaLI=;
        b=H8Jb621P99TgTTADiHdYE2OC7LO54ZSJPTmeiGxnXa9aq2LEE9XFVw1yU50SrTkoeG
         bd6biRfizhHI/9IHobGdf07nWBMX67IN8ZRHOSGIx675LtxdSbQ8cNdLzs9Y9RkMvjzH
         Nq+BI9ZGL4MAV4GYShYDfPxXsB+FliK+dK4unFmfQaXvZbRFkZABrtvvd710st7wD+Ns
         A6GqhkQwv+bxE4mSydZzwpqJsTifGfzhWmS6N07IxD9nRZAduPW+jcbx2eiIE/wKBYr+
         4wW5gPd+HswDppK7zV4qsnbiP0CCUNL2T6zd1gYU8JY135Yd1UTFBJlGXY1OOljiWTFD
         ux3g==
X-Gm-Message-State: AOJu0YzQMxBFTfMdD3xsPKMPoNlFB+lgELuPIqH2qtBHFm1kXDA8oeq/
	uf7Dss7FLB2AShPqTv9px4MM/soMlJSrh0aiYMwxM7ghyB5E8xXTLAEfDKns7g==
X-Gm-Gg: AZuq6aL7aH/o6kyyHoZXGwqQjpl3Tl4g+LUOH/wk4l9/KbHhT0ohccPAd3nBJFB/Mn0
	ft6WUU19aWDT2sbnZO2+5rP8rnyvzf7oSJqgOmynWdeHA9RnxUNrqYQVnztZqMOjXGvI0Ee1n97
	cLdMRooTHdWxBhQkSQLdEqOH79dcPj/ZVnBqXxbpco787OlmDP8dFNtQEs7C5H3qMLi6ukx29WN
	w18vV9cgLZ2vb9PpEAYG1ec/vwRV6x2Q5sW2Teqfm18euZflicai/4QrkO5LO6FXsuOx4PXWrFS
	GyvnIliu+e8IIDVyVBrfF9AekBwhKMhQ+XrwaeU2OSHhRLKm1zUjxVayJt+nHYTehRhuYgaB2OV
	zW3zYpfBurUVJk8v8aZJ6YSF6xAwcaqn5R5aWG47geYztNAIDXBOR/Djpq79HebU3sNjh+dFSkq
	KfcqGgeixT
X-Received: by 2002:a05:6000:3109:b0:432:c0e6:cfda with SMTP id ffacd0b85a97d-435ca051defmr6760214f8f.7.1769432712529;
        Mon, 26 Jan 2026 05:05:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 07/11] sox: patch CVE-2017-15642
Date: Mon, 26 Jan 2026 14:05:01 +0100
Message-ID: <20260126130506.82699-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123884

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
index 96d0543520..d49ac822b4 100644
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

