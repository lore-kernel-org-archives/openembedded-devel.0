Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F61C021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 05:43:57 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13505.1739857430159030290
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 21:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GcmZ6O5b;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220d28c215eso71429135ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 21:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739857429; x=1740462229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzJBGy3BN+dzVHLYgo7Pjf07BOYF2d2IlVMwqBvZ+QI=;
        b=GcmZ6O5bgfJaG9pfS6AVJxtFKwlf384288L0AC2NGn2r3VSo8aNfsPKN9AQwTX8nX2
         87gSPBnnLglZxuwo+oCXb9IfD4mnQe589iohsN03DFqbSgpJiXnmi4kAwhVBAWiunBWQ
         ImcogUx2v3LQIfApZZtKMXSSdcUgxl/YET/iKMhfGcX2OqnYwRqGVMLl0R8QKxGDyWpw
         0cEWwxkQwbR+6Un+oDKWLubwLGc57xcC5I8oPMorfzNwHo9PE3+/e1a2s0nhrAIScS+E
         TX38TYXoiHGmd/v9+KdbirC/sNqv3x39HJFhiUgg9wJBRFcL2oCni/6LvY7gGhecvyJB
         dPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739857429; x=1740462229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzJBGy3BN+dzVHLYgo7Pjf07BOYF2d2IlVMwqBvZ+QI=;
        b=oT+vvifj4CR1vAfih5WEOnkgvi3z2GuEM/TrQCb91tj7PNL7CCH8QVw+fgOsb7JOu/
         xHA8nY91BGCVgfTZyrtm99A7aZxpIbipG9FTDdu+EyPcxEDmClVrgsKCPOOHrluryV9l
         aXCBMD4GvS5uqfyKIlFI1CaomuuT6bMeLWQZsXhyKPpqBohIy+OYLO3aHAQdXf3JOkRi
         OO6TIDgnNm7H8+AOomXJ8NYXlUJkjOtMVcXiEHYlFgqakZlW4I99HXiWW0itulrrYb6F
         dAmdb4Cw9T0rYWfrxaGNZAr7ddvmFaROYvJK1BJq8Drb9HT3Fou1uNLPvHrUpWHfpJrP
         PLnQ==
X-Gm-Message-State: AOJu0YxM4GF+oNVPSbLutza8Lp3mjr6pORiiYj32x7zibcuJ4WQJ/jsr
	c67/mKHy6DEmi4Txe0L12oVcu5i9fZdtbeRGJlzuiY1pTbM93Ca3akra1iun
X-Gm-Gg: ASbGncsasRMBoU3dewFt5kM8bV0iq5Jqa37DJBUybESP7mN0Q4JNQZj1p/pQIW9GdyH
	y8wARsiEMWPsM4qHEhEkKqzZxoxiknjkXndB9EMe7WhnwZogEVj9DTu8LMMRtFW3afHm5UdKUXv
	W/OQMFYJRMVwcjAhOMag4gD0FXaN1iPkSjT4cHwnZK0Ho2PA/ANNk6uEfprzlt2Kx+/8QiyTIrj
	+BwIRlzOyRqq8pivyhB1lvt/QsLlZIy7CJd3xBHEsYZOGcisNbO64eNZ9jhPEYx/DXT0nELVyWB
	QCQjuIE=
X-Google-Smtp-Source: AGHT+IFZuEs1nbsU+dbKG6aR7VbWLYQej3e2dsldIHVYi8uYCVvqvmE2v0nYNwRvELW4bas+57Z5rw==
X-Received: by 2002:a05:6a20:c797:b0:1e0:d5f3:f3ed with SMTP id adf61e73a8af0-1ee8cb485dfmr18507433637.19.1739857429202;
        Mon, 17 Feb 2025 21:43:49 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::dd76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73285a7bfbfsm2276217b3a.154.2025.02.17.21.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 21:43:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] mctp: Fix build with latest musl
Date: Mon, 17 Feb 2025 21:43:44 -0800
Message-ID: <20250218054344.2476688-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218054344.2476688-1-raj.khem@gmail.com>
References: <20250218054344.2476688-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Feb 2025 05:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115519

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mctp/0001-mctp-bench-Adjust-headers.patch | 38 +++++++++++++++++++
 .../recipes-support/mctp/mctp_2.1.bb          |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/mctp/mctp/0001-mctp-bench-Adjust-headers.patch

diff --git a/meta-networking/recipes-support/mctp/mctp/0001-mctp-bench-Adjust-headers.patch b/meta-networking/recipes-support/mctp/mctp/0001-mctp-bench-Adjust-headers.patch
new file mode 100644
index 0000000000..4ff9b09299
--- /dev/null
+++ b/meta-networking/recipes-support/mctp/mctp/0001-mctp-bench-Adjust-headers.patch
@@ -0,0 +1,38 @@
+From 166b2251a156a03a80318533440178ac0b913945 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Feb 2025 21:29:41 -0800
+Subject: [PATCH] mctp-bench: Adjust headers
+
+bits/time.h is not be included directly, instead use time.h
+since poll.h is included there is no need to include sys/poll.h
+
+Fixes
+../git/src/mctp-bench.c:2:10: fatal error: 'bits/time.h' file not found
+    2 | #include <bits/time.h>
+      |          ^~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/CodeConstruct/mctp/pull/65]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mctp-bench.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/mctp-bench.c b/src/mctp-bench.c
+index eeb6fcf..60b3bb0 100644
+--- a/src/mctp-bench.c
++++ b/src/mctp-bench.c
+@@ -1,5 +1,5 @@
+ #define _XOPEN_SOURCE 700
+-#include <bits/time.h>
++#include <time.h>
+ #include <err.h>
+ #include <errno.h>
+ #include <poll.h>
+@@ -9,7 +9,6 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <sys/ioctl.h>
+-#include <sys/poll.h>
+ #include <sys/socket.h>
+ #include <time.h>
+ #include <unistd.h>
diff --git a/meta-networking/recipes-support/mctp/mctp_2.1.bb b/meta-networking/recipes-support/mctp/mctp_2.1.bb
index 5bd7039529..c76fc09af3 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.1.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.1.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
 
 SRCREV = "dd944cf5b5a8b834f3685bcb2017190258dbcd0b"
 
-SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https"
+SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https \
+           file://0001-mctp-bench-Adjust-headers.patch"
 
 S = "${WORKDIR}/git"
 

