Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780AFC54737
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.2057.1674324085724780259
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SsPb9zxJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z20so5993269plc.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34nGtaPKs8By/umZcvzCM4+cizu4UgHT1CpJZi0rLjo=;
        b=SsPb9zxJCm7NdWpO9LrQ7n8D5L4GbWsucco9waaCRypedrMkMJd6dbf+Os63UGjZ+W
         yC5b6S8oScI3FsWmlucF6bmOqOdThqO3SKvDZooVdsNqgqC/hl3dxR5zUWQ2zTSq2ufq
         b6IcWBQCfhWf+kxbLa+vZKXagCITuRCrbV4OzlyQz5Vndl+GxhM+J1z432h57a80Jijb
         joPZnVpMktL7IkaX07wYm9QB6DqLcg23gDCe6XWQ5qwllc+/VFnlAqSHEzLV3k9IPVLT
         OV/FQ6ftxqWSNvQOdPfWuhAiqgcfOYqfvoHemGx+pErHv0YF2G+q2KqdcFRM4CU591el
         4YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34nGtaPKs8By/umZcvzCM4+cizu4UgHT1CpJZi0rLjo=;
        b=xftYF4cU32Kxu1VSpz8iVXX92YRwPjBp2uTwmZGPMvVFUFZP1NCi+N/tDGznLBJ8oF
         ZUOSUBdRB2zP5298Awv+hl4jDYm0qPXEaWVqVY/OxI7VbdIQ6jgpvxwez9of2QQUFFOT
         XKo+ikb/OervawYyw6nzc7kkd4122tPF0JrXKyGcnS5AMKo12Kz0O/KHOrEhoIkN5LtZ
         Vcv6zS5bQosaz+xof2zXpTUIeSyjL5N8foqT4xfeGRq2Ijk2pnNlxqYfW4wghctP0lBq
         Hfwrr4EIEPRGwImilr6JOOENrjrPD3AzcpitcZ0OFrUNCUXlMQL0qOAMUaj5vio7B55h
         g73A==
X-Gm-Message-State: AFqh2krN/LdYuaLfvUpBbGqfXArbfjUgjRGkO0QnpHN79UZfTY0ZT3ir
	7E6LGegLiAYJaTMvaZaBMu1PPeQbjsuEyA==
X-Google-Smtp-Source: AMrXdXtQVIbt+IZUyd1PGusiM2pjxNG3/XI4WCZV4knLhwWar3EKTjRhX5hZxPExTbDJ5GFge6wtAQ==
X-Received: by 2002:a17:90a:1d6:b0:22b:b282:a9d7 with SMTP id 22-20020a17090a01d600b0022bb282a9d7mr6485667pjd.20.1674324101847;
        Sat, 21 Jan 2023 10:01:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 22/30] espeak: Drop using 'register' keyword for storage classifier
Date: Sat, 21 Jan 2023 10:01:13 -0800
Message-Id: <20230121180121.1229895-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100689

Fixes build with latest clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/espeak/espeak_1.48.04.bb  |  1 +
 ...ister-keyword-for-storage-classifier.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/espeak/files/0001-Drop-using-register-keyword-for-storage-classifier.patch

diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index 0dc61c1c30..147a8069fa 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://License.txt;md5=cb7a20edb4c9f5f478de6523dcd7362c"
 SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
            file://0001-Fix-build-of-shared-library-on-architectures-needing.patch \
            file://0002-tr_languages-cast-string_ordinal-init-values.patch \
+           file://0001-Drop-using-register-keyword-for-storage-classifier.patch \
 "
 SRC_URI[md5sum] = "cadd7482eaafe9239546bdc09fa244c3"
 SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
diff --git a/meta-oe/recipes-support/espeak/files/0001-Drop-using-register-keyword-for-storage-classifier.patch b/meta-oe/recipes-support/espeak/files/0001-Drop-using-register-keyword-for-storage-classifier.patch
new file mode 100644
index 0000000000..d9c0d08ec9
--- /dev/null
+++ b/meta-oe/recipes-support/espeak/files/0001-Drop-using-register-keyword-for-storage-classifier.patch
@@ -0,0 +1,38 @@
+From bad6131463275bd8013a82c28fb0b27e882bc801 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Jan 2023 16:07:35 -0800
+Subject: [PATCH] Drop using 'register' keyword for storage classifier
+
+Its gone from C++17 and newer
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/klatt.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/klatt.cpp b/src/klatt.cpp
+index b15f77c..9c51bc5 100755
+--- a/src/klatt.cpp
++++ b/src/klatt.cpp
+@@ -167,7 +167,7 @@ Output = (rnz.a * input) + (rnz.b * oldin1) + (rnz.c * oldin2)
+ #ifdef deleted
+ static double antiresonator(resonator_ptr r, double input)
+ {
+-	register double x = (double)r->a * (double)input + (double)r->b * (double)r->p1 + (double)r->c * (double)r->p2;
++	double x = (double)r->a * (double)input + (double)r->b * (double)r->p1 + (double)r->c * (double)r->p2;
+ 	r->p2 = (double)r->p1;
+ 	r->p1 = (double)input;
+ 	return (double)x;
+@@ -176,7 +176,7 @@ static double antiresonator(resonator_ptr r, double input)
+ 
+ static double antiresonator2(resonator_ptr r, double input)
+ {
+-	register double x = (double)r->a * (double)input + (double)r->b * (double)r->p1 + (double)r->c * (double)r->p2;
++	double x = (double)r->a * (double)input + (double)r->b * (double)r->p1 + (double)r->c * (double)r->p2;
+ 	r->p2 = (double)r->p1;
+ 	r->p1 = (double)input;
+ 
+-- 
+2.39.1
+
-- 
2.39.1


