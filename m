Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A904E83856
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 06:52:34 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7078.1771311153514621214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 22:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uqe9VE/+;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso2551145b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 22:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771311153; x=1771915953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uSs3a5CCNddVNUFgszf13QY/vGsIVMTQKLdqg9rcSU=;
        b=Uqe9VE/+hgn5z/Rfcp1dxmdvaUjGQ/kJEuoe7n9ZOB21w+nrmyDKue8xlDCE6Gbsry
         bATsw3LNX4OJoczsdvX6O2/JBegQpXSPn4i/5/QkT6HqxVyG3Ag1AkRZwYVKQfaIZRiQ
         2NiXXjBQ3iuaNQyLW6AiqsWkGDRGiHlxuk72mpsT58JDnfpaoomoe+IZbmorXvTVibqG
         LhVZNc6yeRcxWKdDc68Zp/ib8r803cKB+KTgHrqFfUiBvSEa6aFwaW5AgRB0rXx+1HHv
         bWwmABdRhDypxWU6Hph6H9jCwyb8cR9+ZPldlQXurzkEAEtxUOsIrk+Wg1BHntQauoyt
         X8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771311153; x=1771915953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6uSs3a5CCNddVNUFgszf13QY/vGsIVMTQKLdqg9rcSU=;
        b=Kp2pegSL+T/SFmfIb/NJn79m9Gx+ftNNufLqgCnT7Ca4aOwONiyPKOXkx3x9X4AzVr
         FBzNRKD576H4mCkJGUV/EV5JjPe7QRWJVrIsshRBIgttP9i/cMraT4tFQwxUbVSLgWTf
         PXyPMRfUW3IFlK0X3dwlbaKvdxCGdbF5R4JqgoAQ5sn06tLww435BiKwMFi2mssD7N5m
         mxJRBqPVKLCxHH747cWB/hJvXgdHHhXl+U25tflfa6pCOKDhUeZch0syyI9M+iTlw6a6
         7bs40XTEdGVf0YFleKq3UqHeKU3y8Pto/5ajMJ1hrYOi2pYmPjpMPzO3t4exK1WDkj4J
         5jEw==
X-Gm-Message-State: AOJu0Yz0hBXEg5TvzWFPcHw9vYAo22CMWD7XM9rhQztfgWvRnvUfCa4/
	JrbRZ9G0ChIpN6FwV6k85954dyPEY6ebf17rlI5b9MsNKXVBLTbx+60El6vQQQ==
X-Gm-Gg: AZuq6aIYllzOSaCEzZfXkOXJG1bpT4APIKCYLX6EEwt9yS5kwwysG1qqSVbdRUMYxH4
	sIMdrr7Dfao070lo5V+9SBLfT/cGtqPg0LcKfJDQSkPRkFQex8kyljH8GP0cfXcnMapFQ5D75aZ
	KJcztaOAcrbQ3Ms3e39KTvkVKw3RqxxDAUW7pH9hpFVEvkuznjmrF7XzZovO7vOs8cMHJhd6Mwp
	YBwSInBDq48Eg+OMmYSJvy2KadDdePcPXQ1cgoYzwqE3Gmh045GUiFRyMDbT2tMcWdcfcIMU5I8
	P6Pa7ILewuxehZ/DqGHtBF+8UW6vWeOTCPphUMmJqeMFf8CRvt/uIfULb3wQh9J0GgXqQ1LWOJM
	fOSgVbePOAmISKTD01cUcai46nohgkqJRc+7SdfSQXlveFYQIXt4sP32PHEuu0bSTrzD5B1oCDO
	C71gx9qmK7H8GRfAJQTd2K5pb2n68tKw==
X-Received: by 2002:a05:6a21:6f16:b0:343:af1:9a57 with SMTP id adf61e73a8af0-3946c9587c9mr10968383637.56.1771311152721;
        Mon, 16 Feb 2026 22:52:32 -0800 (PST)
Received: from L-12443L.kpit.com ([106.51.47.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a61cf8asm131561585ad.0.2026.02.16.22.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:52:32 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [OE-core][scartgap][PATCH 4/4] imagemagick: Fix CVE-2026-23952
Date: Tue, 17 Feb 2026 12:21:23 +0530
Message-Id: <20260217065123.1001038-4-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217065123.1001038-1-bhabu.bindu@kpit.com>
References: <20260217065123.1001038-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 06:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124438

Fix CVE-2026-23952 with patch provided by Debian from fixed version.

Link: https://security-tracker.debian.org/tracker/CVE-2026-23952

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../imagemagick/CVE-2026-23952.patch          | 57 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23952.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23952.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23952.patch
new file mode 100644
index 0000000000..d8eb44b44d
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23952.patch
@@ -0,0 +1,57 @@
+From 1eefab41bc0ab1c6c2c1fd3e4a49e3ee1849751d Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Thu, 15 Jan 2026 17:34:46 -0500
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-5vx3-wx4q-6cj8
+
+CVE: CVE-2026-23952
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/1eefab41bc0ab1c6c2c1fd3e4a49e3ee1849751d]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ PerlMagick/quantum/quantum.pm |  2 +-
+ coders/msl.c                  | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/PerlMagick/quantum/quantum.pm b/PerlMagick/quantum/quantum.pm
+index 1dd5921fa8e..74cc8168f37 100644
+--- a/PerlMagick/quantum/quantum.pm
++++ b/PerlMagick/quantum/quantum.pm
+@@ -6,7 +6,7 @@ package Image::Magick::Q16HDRI;
+ #  You may not use this file except in compliance with the License.  You may
+ #  obtain a copy of the License at
+ #
+-#    https://imagemagick.org/script/license.php
++#    https://imagemagick.org/license/
+ #
+ #  Unless required by applicable law or agreed to in writing, software
+ #  distributed under the License is distributed on an "AS IS" BASIS,
+diff --git a/coders/msl.c b/coders/msl.c
+index fa29764563b..5b182b5922f 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -7088,6 +7088,12 @@ static void MSLEndElement(void *context,const xmlChar *tag)
+     {
+       if (LocaleCompare((const char *) tag,"comment") == 0 )
+         {
++          if (msl_info->image[n] == (Image *) NULL)
++            {
++              ThrowMSLException(OptionError,"NoImagesDefined",
++                (const char *) tag);
++              break;
++            }
+           (void) DeleteImageProperty(msl_info->image[n],"comment");
+           if (msl_info->content == (char *) NULL)
+             break;
+@@ -7137,6 +7143,12 @@ static void MSLEndElement(void *context,const xmlChar *tag)
+     {
+       if (LocaleCompare((const char *) tag,"label") == 0 )
+         {
++          if (msl_info->image[n] == (Image *) NULL)
++            {
++              ThrowMSLException(OptionError,"NoImagesDefined",
++                (const char *) tag);
++              break;
++            }
+           (void) DeleteImageProperty(msl_info->image[n],"label");
+           if (msl_info->content == (char *) NULL)
+             break;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index abad1fe5d1..3917eed92e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-22770.patch \
            file://CVE-2026-23874.patch \
            file://CVE-2026-23876.patch \
+           file://CVE-2026-23952.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
-- 
2.34.1


