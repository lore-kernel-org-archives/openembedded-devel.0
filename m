Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71364C83F03
	for <webhook@archiver.kernel.org>; Sun,  6 Jul 2025 06:41:39 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.32423.1751784098615284906
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jul 2025 23:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJaijYDV;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1862848b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jul 2025 23:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751784097; x=1752388897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9eQenlsLIXTwG4J7w0cznqWGEQsureBzQqBJYh1ykJ4=;
        b=BJaijYDVGY1EGIhEOS7x1V+GB03oWxyA3WCqZDgEe9mfDqd4ETjdooHl/ZNmRtMyOD
         KCqcEOgQdvC8bWN116RnRE6VVa/jbmPQT7r8bvQhjVOTzw777UNmJcN7ApK2rMdIPAER
         8HJGxpzggIreq32JmMgH/LafiOHT1ZggKGdjQfLZ7RhkE//5tEAktg8XR7smbI+ZTHsn
         yHcMcHC4Iv63iMiM2J7L6CL3E5FfBnuX8lBTPQC5se5tcPDOuN1KemrtbeawzUhxFV4b
         FhWd6pmh6G46oGWQmH5FIscTn0qzaSw+bI9Wb6zIOKGtY0C9TVyUBysSRIQOD2WfVLPG
         +xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751784097; x=1752388897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eQenlsLIXTwG4J7w0cznqWGEQsureBzQqBJYh1ykJ4=;
        b=thrgJGf5A5xiNW94x8bCA0qRTCzVYhaw/0C5ReQnsuD0oqMbwoqfmTKiiX+Up2CYLH
         3aW5GZLcN0o6Vyk7MW6WFakohyAUHlZ7Y4MeTKP4DiW2OvykVdsHiOjJDxQBQCtAMeDV
         HcKiJQP7vJXGmXuMCUaFNtFmoywXPukWrg7+OrcFGe6vhZcEA6DDUM9Asa9k6XfnVeNH
         KM+NPlQK+Mzyc0RvdS0iMp89ck5nhkIJo2WMP9fYxChQjYkXcZAPrvIinb/WcJwniw8S
         t+dv9eyNz8J0x6qDbGQnZYB8Ec51TB+z6Yc+akwzlBg0JHhNEa6hlDnWh/Xct8wwYU7R
         bEhw==
X-Gm-Message-State: AOJu0Yx4bvfp5WR0FO7cwbes5tDRayUDjCsNLOyVSGYkJC3buXx+cHlh
	hFrcSG5sEud19LVFs9YY5xkXabvkdAFMZEMbM+fVxAao8l0/Q7GPd8cL7Ghmcw==
X-Gm-Gg: ASbGncsXOUhnXmOEexMkEjsm16i9lb1FpJACWTYdJFjPjsEy4y02CaZ+1kthCidGn2Z
	087Q+SE0JmCyJD/8m78QDN8t83tpLQZHUHcJtRqKUVvDthVglY1XXVfPUyZPGeXYvQ5hKmJJBW0
	xMdLOlNw37yCKRdXkP2jvkVvBgIYT+M9vmrBSbz5rodIB4PtAuQ0nMNPmudmB2HWuN3mrlXkgG3
	v4vpbXRw233E8aJLJHZWegEWScMh1ByIHV+v+CNyz30VkvZfoTCmcF3rWB/JlQnujshnpnI1qkR
	IP1v3vUbCEiiEtEOqvdRuoLzWTZtmdcU6/FwcfL1gB5a83/wE5W0NRi6P0nSVt3OwVyffm085yf
	vtfNmbu1ZCQ==
X-Google-Smtp-Source: AGHT+IF89OS37QLCOMwNRu7HOIHqWz3HDvnDrE5/zdBYtauj7dut3hQsa1nns6pWJlquEswjgsewfg==
X-Received: by 2002:a05:6a00:6ca1:b0:74c:efae:ffae with SMTP id d2e1a72fcca58-74cefaf0042mr8061721b3a.5.1751784097404;
        Sat, 05 Jul 2025 23:41:37 -0700 (PDT)
Received: from LL-3020L.kpit.com ([2401:4900:1c7e:bb80:c472:4f79:4eeb:feb0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42b8044sm6077158b3a.143.2025.07.05.23.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 23:41:36 -0700 (PDT)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Subject: [meta-oe][scarthgap][PATCH] imagemagick: Fix CVE-2022-28463
Date: Sun,  6 Jul 2025 12:06:26 +0530
Message-Id: <20250706063626.818120-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Jul 2025 06:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118239

ImageMagick is vulnerable to Buffer Overflow.

Reference: https://github.com/ImageMagick/ImageMagick/commit/ca3654ebf7a439dc736f56f083c9aa98e4464b7f

Signed-off-by: Virendra Thakur <thakur.virendra1810@gmail.com>
---
 .../imagemagick/files/CVE-2022-28463.patch    | 27 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  5 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
new file mode 100644
index 0000000000..c7730957bc
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
@@ -0,0 +1,27 @@
+From ca3654ebf7a439dc736f56f083c9aa98e4464b7f Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 26 Mar 2022 09:26:57 -0400
+Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/4988
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/ca3654ebf7a439dc736f56f083c9aa98e4464b7f]
+
+CVE: CVE-2022-28463
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index b8167f5a72..db786ea3a5 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -11,7 +11,10 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
 PV .= "-62"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
+           file://CVE-2022-28463.patch \
+           "
+
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


