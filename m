Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.1668.1597283637968398702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 18:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KSRCCcrb;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id ha11so2020194pjb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 18:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2z4tchgqdqvVUDBoHN4vx2feJkRiBpdyGD6cPoE0nKg=;
        b=KSRCCcrb78W8wy+l6ljpUvYNyNWJKgIVmDUDStS9wLmRfXjkd+QpHRR7osmhuQ/ySF
         Hg+4NwgxCmIxrt0MX15r5TtiOhV2mHoKOfkMWfAP84aCxP0d5dkcueobPJ1kA0K4Wta5
         UMUgJRPY0qTZLsOiJbQ1cdQ4Z9Kfg5nThNmQ129Szqz6C4aNElGhfbeSz27QHmEqrzg+
         vIcKEr5OzPJCYIo5b+MeWauUIYUk5zX1LSBiQRw5Io5gr7AnVoM0B01e76vqnhAlqxsM
         rTng6S+1enRchk9ZZWUy5F3EktmMVCRtSwcff9huRAqscefgUVmIrxZEle+dsecCXz/H
         xUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2z4tchgqdqvVUDBoHN4vx2feJkRiBpdyGD6cPoE0nKg=;
        b=DPUNEKZ1hwnjmdcQezRwyRplBMMn7MJPfu1Ey8FA8krBZ3TNEwnFc7n2w9N0tczSxN
         +/ATmVrIDX23v+cKGTwzoEFOQjtdK1B4VRQjlSyWuBSdlfQv2gJQZmfbKSzeW6N9V5Ci
         YlrJsznWyIZua+05nEqK2oHrjpvv6bomn5Si4ZZyIEaSmdhU92i4N4OoxO6OT+JM9idX
         JZL9Y+CMGWeeonpYVNIDNW6kaeBnBJtt9oEEi0mD1fI7LMlE8tnzxkCKqNLwPLfLOH99
         cHlHVz+lF/8SW632IZC0Rfmr4ED3n9kKCeQ1cDXISM0lcJsGdFwpPJ5mRJSMjMcv2bd0
         8cpw==
X-Gm-Message-State: AOAM530iLZLqABK0Z75SZSY6RdF8xp3R1nt6u46y3tn2sqs4IKO878+3
	lIWOCnGOzxdpD1RQbHCkRz8xFGg+hAw=
X-Google-Smtp-Source: ABdhPJynkTDkShoXLBZ+IMkcrx9OaSbKtNcccITuwnKsi903nC1lPKwsa4Ifj/9JV/Nn7s9lQwznkg==
X-Received: by 2002:a17:902:82c3:: with SMTP id u3mr1977540plz.81.1597283637135;
        Wed, 12 Aug 2020 18:53:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id o4sm3453578pjs.51.2020.08.12.18.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 18:53:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/4] minidlna: Fix build with -fno-common
Date: Wed, 12 Aug 2020 18:53:51 -0700
Message-Id: <20200813015352.2318764-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813015352.2318764-1-raj.khem@gmail.com>
References: <20200813015352.2318764-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/minidlna/minidlna.inc  |  1 +
 ...ark-setjmp_buffer-extern-declaration.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Mark-setjmp_buffer-extern-declaration.patch

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index 04648a5d28..433388759f 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -13,6 +13,7 @@ SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
            file://minidlna.service \
            file://0001-Update-Gettext-version.patch \
            file://0001-configure-Check-for-clock_gettime-seprately-from-__N.patch \
+           file://0001-Mark-setjmp_buffer-extern-declaration.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Mark-setjmp_buffer-extern-declaration.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Mark-setjmp_buffer-extern-declaration.patch
new file mode 100644
index 0000000000..0a1e800c81
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Mark-setjmp_buffer-extern-declaration.patch
@@ -0,0 +1,29 @@
+From 1c6028f5f8bbfd3fd7327a43e1bb762c2c166167 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 18:10:54 -0700
+Subject: [PATCH] Mark setjmp_buffer extern declaration
+
+Fixes build with -fno-common
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ metadata.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/metadata.c b/metadata.c
+index 8a10c77..c114091 100644
+--- a/metadata.c
++++ b/metadata.c
+@@ -484,7 +484,7 @@ GetAudioMetadata(const char *path, const char *name)
+ }
+ 
+ /* For libjpeg error handling */
+-jmp_buf setjmp_buffer;
++extern jmp_buf setjmp_buffer;
+ static void
+ libjpeg_error_handler(j_common_ptr cinfo)
+ {
+-- 
+2.28.0
+
-- 
2.28.0

