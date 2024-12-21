Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E79E7718D
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 22:57:42 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.15932.1734821862301750447
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Dec 2024 14:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eTcpl1Kf;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa67f31a858so540654266b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 14:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734821860; x=1735426660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOX6WB93I2D98Me2iHeua7ZIcf4Rqc9OesLTHZohf4g=;
        b=eTcpl1KfJ+3KLnlBPY7pNVe1h0CT+DzMBqcj1DGQZNJQ4lQLAzjtN2ZtNGO578WXNp
         ghJcyVcybhIZ1c5Vpg7ow6ZR+2AHfzw4CsY8UClO5O8tFPNUyTNXVMuvo1w1hm5TQoT9
         4zSGFRTvQDV9FabnDTCib2QB2GcW3QyIQ+Q3DKFwK1tcG7SsrFfVDELu6nzcSuFveOQf
         +giLAVu1WAwQbIXOuPBu5i/5EcGZR2OQC0swIKrghTr2eghLntFNCgGfNm06oPd5E0dM
         tC4zK9bJO4AJcueSUgpkwB/yWsL5Io5a02AHzCRu3Ca2uE8lbh3NvpK4cfKmFKMOFivX
         XnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734821860; x=1735426660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOX6WB93I2D98Me2iHeua7ZIcf4Rqc9OesLTHZohf4g=;
        b=o8ln5nGD9eQLzRYd0mdIMarhie+At2Dhwf6dKNq2/VrmHs3Xyq+yOOH9KWT4JsdPYf
         6iyT9YoUSIt5G07edahM+U0y8qNMm7qootIrqip5rbAuXsMLhjUAxL2Vq9hiyHLG9wbn
         4e2CKZ54n2MqfnX3SX9q8JDl9sbKKXCfpxX/bizGPYjtGph693ieyzK3/uFAwWmbYbCe
         m3dnaz6/9aVOUvoqvoSLov5oddawb6JMIFHvkhOJfsi+ji22S6vLxehdbX8j15aMEwmj
         xo3nrR7OxLpJQD4wc2+nhOpAsPtLPopPD/EHWBPEaQ9qI1m0CcSgHzPpoOrJMZFz+Txc
         vEEA==
X-Gm-Message-State: AOJu0Yw3YkI6wQKJP99rIVJQAAeIX2vLwddqAYIlVNcdwP6X48gyF3p7
	zTLzoLIrDBlVC6jNM6OFsHNuiCkJx5Jik+XKiJxhBk6+u4bLOiqYIaV4Dx//
X-Gm-Gg: ASbGnctjWzzsc2KZ8K1iNGhynemwfH0t+TTh4gtnI4C/hQ4P7UVUFHZzPqfP/2zjEsz
	xYFur03ISq2ITN68H7v/hgJxqDpWDSx+TepgVk/raMmp5VqEZw9NjhtWlQ+/cJGCGlTk2nXdnUx
	nyErMpUDmXh7LaKpJFuEFt2Ox98e6WKbE0EzSe3mrWkiMgGuShp68h1SJJMGEJ2TLfQEnpBXL7x
	AHdw1Al1uAwbZYnvaWbO5rBLPtR2cA0bSWRt96jdeYuk4bi6+Amfpa9Hfnjg2DP9trI2GnW7SVY
	1Mr5XhTE3HnBXfltrtxB6HHDh+3Yyjlz0lI=
X-Google-Smtp-Source: AGHT+IEJJMna5FGexzVM9KoEFsndsOVb6D+d0ZSeJ4kyfCbBn23/K7h9bmL2xuYjYRrQ0nW4tB2fYQ==
X-Received: by 2002:a17:907:1b86:b0:aae:bd6a:569a with SMTP id a640c23a62f3a-aaebd6a5d0cmr114741466b.2.1734821859788;
        Sat, 21 Dec 2024 14:57:39 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f858sm330717666b.21.2024.12.21.14.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 14:57:39 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/7] python3-pillow: upgrade 10.4.0 -> 11.0.0
Date: Sat, 21 Dec 2024 22:57:01 +0000
Message-ID: <20241221225704.2712991-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
References: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 22:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114452

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python3-pillow/0001-support-cross-compiling.patch     | 8 ++++----
 ...{python3-pillow_10.4.0.bb => python3-pillow_11.0.0.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_10.4.0.bb => python3-pillow_11.0.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
index 220c4edc3f..dbca66cee8 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 5b28d19d6513cc3eb3105d3f917df352283f3c5e Mon Sep 17 00:00:00 2001
+From de7cb754410dfff23746a74fb788d99462ab6ae6 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 11 Jan 2021 13:25:12 +0000
 Subject: [PATCH] support cross compiling
@@ -12,10 +12,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 0abfaaddc..557420a6b 100644
+index 60707083f..2f614d826 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -129,7 +129,7 @@ _LIB_IMAGING = (
+@@ -131,7 +131,7 @@ _LIB_IMAGING = (
      "codec_fd",
  )
  
@@ -24,7 +24,7 @@ index 0abfaaddc..557420a6b 100644
  
  
  class DependencyException(Exception):
-@@ -508,12 +508,12 @@ class pil_build_ext(build_ext):
+@@ -534,12 +534,12 @@ class pil_build_ext(build_ext):
                      _add_directory(library_dirs, match.group(1))
  
          # include, rpath, if set as environment variables:
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_11.0.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_11.0.0.bb
index a9cb903ac1..86e8dc6f6b 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_11.0.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://0001-support-cross-compiling.patch \
            file://run-ptest \
            "
-SRCREV = "9b4fae77178e827ab17118fbc89c739ffd6a0fab"
+SRCREV = "204aae6682fc936f5350b3fe70335776f81480a7"
 
 inherit python_setuptools_build_meta ptest
 
-- 
2.43.0


