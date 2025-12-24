Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A5CE7848B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:34:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127035.1766604880704019727
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2RtwO8U;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so2995015f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604879; x=1767209679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThPOP1OQafPH5tRzKfkj50KTvYCW3y0+dALhCUOSv5M=;
        b=l2RtwO8U4FY73Qc4aiaK5/CvjDvZBevL3T5zo9X7zmq1jqSAlgPgSzoxpLD9PxJeJZ
         KzVM0Tx88s988MNiYvnywbOx9uLzy7wApfbYZZsOLyG/OsMECOE5UthfsQqYTaLSPLC3
         K/U9qPq9IzthCuuaz5y9JIVFCcbqF5C7JvbOT01OCzxlVbFGJx4f0CUcID7L9hPnzyXk
         8064WsoFnTFefa5wOJd+sM/Ggl0+tE71wr9UJD0fegOssQYu4TSjQ5Hm354BY09hNeSl
         sRt8DXGYQyGKcNDWtMGaly6gGhL6MUU/wOlrFfTKRq4ctKtXB4mV4XZNNCzHa7KZh2oF
         +Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604879; x=1767209679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ThPOP1OQafPH5tRzKfkj50KTvYCW3y0+dALhCUOSv5M=;
        b=mi3fLcQzjnws6Sh83hEWhmx6BdwDG1Zopac6WVZhYGGvoPpRjvevbijahjMpe/5tnb
         wJyajjHM7IhF3uEkyeV0pU3qJV7Y5PWDKo5GDDSkpTT3a6vno1Qvl/QUPWaKJo0mMGB3
         EpLep7yAG0IZc/B1+H2UJH6E1BtENCzi+yXtxxeJ95mwHX/ncUjGnIyQpzF8e0cE9OvL
         OpNL5i9nNv0WpFQTTGCjMexZ+mRnXR+DdGs/Nnv+lPAZVan6AaCc9MhPcPi8eL5swZpl
         hxRvjhrk2b4AC+sGqoDmOSIUB3KxAJBfAuhpAwAXROf2Lx8oLvcK0PePPmUhf58pDnSI
         zxCA==
X-Gm-Message-State: AOJu0Yxk6TNyDZR8/FAB5rt+HUMd06XTn1JcMZGX5NwUNuNSY3Q5VMzz
	O0OiGpJ1GQ77xYQxwTF98YKllBv5m6Ne87KMMVgCxgU1gz43vq3TT56GLFNH9A==
X-Gm-Gg: AY/fxX4sVa07ePO5uLl1c0uLF9d2ctAiJHuXhoyCe9q3SOvwrASkHLGusgMIibw9hiE
	Eduf+zmzftVDj5VKFPtVEZv5xLfDZx4isK3LDSUepL+GQSodqxT/xfk4UXd4eTK4yCyE6yh0DSq
	fdUUBasYREHqKg4lZxx7XY5OpWB36+QPixao3ZhT/Xr2vQxm6/ZJSn7le2d3SHw6jVFaNJ5CgLU
	DD2FSJXde6ED/XWdmlAWTX27QaVe93HM7Ig6wJT28M7w4hRgu3E6rZU/u9pltTWEK1hD1HLivZO
	c36ksq/cFsarrxiYkoF0mJrsbmici9W/Qbnv7qgPk1y9z88Hzuxb3dyp/Mh4ZDCbyhe0YGSqB3G
	HqvbDxGOSBCu/CuknJLV/YWlsLWKdDYeYyCxqKlZhMmPjVT2L0WnEb9u+vlL5hHN8eyTtvIUpgk
	ZPXB8sVI56
X-Google-Smtp-Source: AGHT+IGwIRZHfuVpDz9HDEpfKBUfpQUIvXA215BjLg99w7ErHxjxCkO5C/JkB+tplT+SlrI3zZualQ==
X-Received: by 2002:a05:6000:4202:b0:430:f5ab:dc83 with SMTP id ffacd0b85a97d-4324e4c70cfmr22994071f8f.11.1766604878966;
        Wed, 24 Dec 2025 11:34:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm33750665f8f.2.2025.12.24.11.34.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:34:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] imagemagick: patch CVE-2025-65955
Date: Wed, 24 Dec 2025 20:34:31 +0100
Message-ID: <20251224193434.2631122-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224193434.2631122-1-skandigraun@gmail.com>
References: <20251224193434.2631122-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122893

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-65955

Pick the patch referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/files/CVE-2025-65955.patch    | 25 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-65955.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-65955.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-65955.patch
new file mode 100644
index 0000000000..57fb1c1bf7
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-65955.patch
@@ -0,0 +1,25 @@
+From f4e53579d8906c939e4169b9e14c5fe867e2b6b8 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sun, 23 Nov 2025 09:17:29 +0100
+Subject: [PATCH] Correct incorrect free (GHSA-q3hc-j9x5-mp9m)
+
+CVE: CVE-2025-65955
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/6f81eb15f822ad86e8255be75efad6f9762c32f8]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Magick++/lib/Options.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Magick++/lib/Options.cpp b/Magick++/lib/Options.cpp
+index 9d2a5904b..14b06a724 100644
+--- a/Magick++/lib/Options.cpp
++++ b/Magick++/lib/Options.cpp
+@@ -308,7 +308,7 @@ void Magick::Options::fontFamily(const std::string &family_)
+ {
+   if (family_.length() == 0)
+     {
+-      _drawInfo->family=(char *) RelinquishMagickMemory(_drawInfo->font);
++      _drawInfo->family=(char *) RelinquishMagickMemory(_drawInfo->family);
+       DestroyString(RemoveImageOption(imageInfo(),"family"));
+     }
+   else
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 350b504400..83e9ff2fd0 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -46,6 +46,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2023-3415.patch \
     file://0011-ImageMagick-Fix-CVE-2023-34151.patch \
     file://CVE-2022-1115.patch \
+    file://CVE-2025-65955.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"

