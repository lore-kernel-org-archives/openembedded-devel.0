Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885ECCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 12:40:45 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.14919.1759927243871329031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 05:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=edNnbt8o;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-780fc3b181aso4211850b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759927243; x=1760532043; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU7VrlT6zsqQIUys+m8H+SpLM7xvOuyo2vhEN/BJwA0=;
        b=edNnbt8obegysK4+/pR4SR3BwhFtTkBFZjWKnsQa3xe8+0VE29GgS27lxoyjWiPMjM
         DuVcoll+ePaLUkLxveC/63xh4POqrWVH07xLKbreyd7k4yNAkKAA1X+7V1+I4iY6PRCP
         Ca/0GvRwAPaQdFwXMlxYSHaAoZPmFxrV9ciU+UAPvxMGRL65LREYoVZ2980tSWkoG3nr
         3umub+WtoIkRhjOV2vFEWx32J2JvJOY3sH83lrvbJ8Yhgk1xSgKjivhSI2IDM+1vt/KZ
         mjBRrJyx8UDv0GnAgmY5MJY0AT8JPSMd8nG2Qq+QEJ8rBYORRi6L745B5zGu6aBK6zEP
         jENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759927243; x=1760532043;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GU7VrlT6zsqQIUys+m8H+SpLM7xvOuyo2vhEN/BJwA0=;
        b=AE3DdRDcdVOvearD/TdEbzsfc2VXVu5/BZpHjDtVsOavhy/9CvrshHmUa+opWiPIo0
         NiRfx4A6uFlRFfaGGFHW1EhO+kMjnFFIiGJqcFzn3boesAKqNUI3W9os4u2qxg7IopP9
         +yvVkxXkU7kJFCh9cUVQMy+/QOPHSsnDzp3kwoaxDf3DNl84ukauvAstqzRdwasP8U7m
         4gkv7DirfhWJ3DFdL1sI1/dpft1txGpQvp49dHvejDAanMTeCFgVkKy1h0sV5ZxMlba+
         6zcPZkIwbuAm5bYlKGWt+j4yD11suZmHM+SQVCRUbFdWWT+0os80SmmtptaN8Twe1Qct
         9XOQ==
X-Gm-Message-State: AOJu0Yx55bZ0pZLWDWZvfsfcVPu2wKZPtjUsyHeZc71uqi4Rf5xoANu8
	tgIfgskwQfvDSNuMUM+koYJ6UcriAN8tygGKep35udwvIaNup2HsHPCPYqF4lQ==
X-Gm-Gg: ASbGnctaTpLH6J39IIyEOkJvm6A3Q9RoEoNUiS8ZJNLGhmJm0Ptl1LtApcqd2U8ipHt
	/fs+bVLCi+BCd4cyU3Noqe2cBjePj6OmTtp4aoFsNNcqLtz0kV+Fmma3pysgsb0NRgRNg4abRsT
	D4AJyDmIZ55r3FipXZkcYt60d5A2fKijUkSxc/r74fMQwyE20NNmcvV1b/2qNb60/QgkL0Lbpjy
	R/0pi/60mcUbh1Kn7wakENZuoEtPT4SseSlxv+jGQTmc+ec2JLpf/LOcYJujuQ29F9oJ8Qj8/MQ
	niXhm9JloBh/15KGDK7xtRMXUR3TlBwEbZBelBvgSFkXFENRR2P+T2c22IlxEASvkBy1vQUsLci
	9I3KSKYOvAG6Fs5eTg+AqCbsArktS7SEVSSEFZNo0leO6f8wvZNEKFXGQrJmxn6JVlJqxroSVhb
	PIkpaQUzHglQ==
X-Google-Smtp-Source: AGHT+IFlgDEmExMhwGWYuo0qjBUl275zFYbAFGksufdcsRx29g69kvzDrcOE5Fxvx7rMSGT0mGVUwQ==
X-Received: by 2002:a05:6a00:23d4:b0:77f:324a:6037 with SMTP id d2e1a72fcca58-79385136137mr3657911b3a.7.1759927242758;
        Wed, 08 Oct 2025 05:40:42 -0700 (PDT)
Received: from localhost.localdomain ([223.233.81.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9dcb3sm18798535b3a.11.2025.10.08.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:40:42 -0700 (PDT)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: virendra thakur <thakur.virendra1810@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] imagemagick: Fix CVE-2022-28463
Date: Wed,  8 Oct 2025 18:10:37 +0530
Message-Id: <20251008124037.5147-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 12:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120365

From: virendra thakur <thakur.virendra1810@gmail.com>

Imagemagick is vulnerable to buffer overflow.

Reference: https://github.com/ImageMagick/ImageMagick/commit/ca3654ebf7a439dc736f56f083c9aa98e4464b7f

Signed-off-by: virendra thakur <thakur.virendra1810@gmail.com>
---
 .../imagemagick/files/CVE-2022-28463.patch    | 26 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
new file mode 100644
index 0000000000..36b0756adf
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
@@ -0,0 +1,26 @@
+From ca3654ebf7a439dc736f56f083c9aa98e4464b7f Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 26 Mar 2022 09:26:57 -0400
+Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/4988
+CVE: CVE-2022-28463
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/ca3654ebf7a439dc736f56f083c9aa98e4464b7f]
+Signed-off-by: Virendra Thakur <thakur.virendra1810@gmail.com>
+
+---
+ coders/cin.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/coders/cin.c b/coders/cin.c
+index e266e7f3c56..23fc17e0890 100644
+--- a/coders/cin.c
++++ b/coders/cin.c
+@@ -451,6 +451,8 @@ static Image *ReadCINImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   image->endian=(magick[0] == 0x80) && (magick[1] == 0x2a) &&
+     (magick[2] == 0x5f) && (magick[3] == 0xd7) ? MSBEndian : LSBEndian;
+   cin.file.image_offset=ReadBlobLong(image);
++  if (cin.file.image_offset < 712)
++    ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+   offset+=4;
+   cin.file.generic_length=ReadBlobLong(image);
+   offset+=4;
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index ce5489bb3e..fcbbd6fca2 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2023-1289.patch \
     file://CVE-2023-34474.patch \
     file://CVE-2023-5341.patch \
+    file://CVE-2022-28463.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.17.1


