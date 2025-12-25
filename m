Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85231E7AD49
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:47:30 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.138089.1766666843734510625
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jAm4TYmF;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so49244335e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766666842; x=1767271642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KrQk3v4kGqbChl8lwVU29NDp7/hImkTh4jeh8p8eYSI=;
        b=jAm4TYmFUaHxfxldrY3AfpVmvFj17ZEQhKL7ZsGtiSP0Vr6KkIIU9PNFTtroFTyttx
         +K1oM7Zk0jIo/rJ5frAN+zmfANRB8EzrE3ewZrm5zkp0JNtyJK5IJvtouWHwtjEVWDcW
         sbLBKBcwJ/CoGVhKgGLZP6bWWc/Kino/VH76cK6nhhe2XpPddD0e4qV7QcFunXAFikOH
         1owqaptGgUSdPFKIQUjZ/WjWZrtfbKTLhxyihbHzcQXNharK6wa9FSLW04beHb9hHqMs
         q1tiHvbYOruHwFoXQTJWZMEMZbPU+um1iXiQ7fRFmZKXetLN+cxpwdagiTCR+0QtIM6e
         oEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766666842; x=1767271642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrQk3v4kGqbChl8lwVU29NDp7/hImkTh4jeh8p8eYSI=;
        b=ie8KaiD8iOxA1UIJZ34ffbLQqIJKrWSGB/0/u0/9/TXOcpSSLwI+VoW/yCsTg3yQDW
         MViw6utZ8Hsdj1N+SCdHxMljfliRLIeOGLCqZqB0dG1rm5SC3dsx1xXlXNZrLdtH6mW7
         oDR7h9nsWEFmL+PLAGnrGfHqt0WEH4jPogqnp7zjsA2vhgnCj7aZfiAMQW8PSreoYf6e
         GMjsyRw5DOaI1KREBLzslTWSEeLr9Cytv+0UVJBblqK3LvCjDqsdf/KEPOCCsvcdBWVu
         tTBF+3Q7jnTebonpxG8gwfHoa1z7s0YY6jIFm4hUPeCW1xs4EUh3M8+KGI8OglSUf/Tj
         /viw==
X-Gm-Message-State: AOJu0YyYnT7G8KH6eCEw3Z8EEF7Qk+JVlYqLPimwm75gddLm4+N9BXVY
	6DSONBALfIkjJ5+F/NHAzUhjb/e5SJvyuWT7BpsOwtAa8B25uqStYg6UvEN6tg==
X-Gm-Gg: AY/fxX4vBJ1+6DnWzpbTADSH5MH8U2YMMCjJLeQY+dD7n56ePDYyvnigFVYSDK+xslq
	WbgjBYWFip5qC/7pN9bNpgapk7mD02xkmpIqR+xIHsnTuaSoML4ZRSBaiIWdL5o5DYXf4da2BCm
	45vM3G6xOT+ntQzVNTEHzUQdowpziyhm4sExHP4YWlJxViiRrCvqOEYksJHeFmyP0o8/yhhFCfn
	Jl5Ant8H6K+poWgwstjTVp/cGWrY0B7cYtKlgTW90ncamxq+fuY4huNrDpfWwEGMZumNiavLYXt
	xGZxcIS7sjK5A7+zS3eYqfajnAfPCUUGyQakDu3aHLgrSo9FzazWUY6lic9qoWhWHuUoZVAwdn9
	sgj/cWOHWItoT0czWTSUpRrFnCfW7DrT8bGp1ayVZbvCXmYGA3ccNnf6Z2S7fK8ZXC+nCNOVVjv
	62+yc3wb7z
X-Google-Smtp-Source: AGHT+IEY0PbmWBW4l0PX320R9gBI4KJlpDRKSY+bYM1hQJt6dRsDUt8YSDetUirgZV6PfvOHJxEa8Q==
X-Received: by 2002:a05:600c:3b0d:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-47d20021316mr206157765e9.23.1766666841670;
        Thu, 25 Dec 2025 04:47:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm465524215e9.1.2025.12.25.04.47.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:47:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] libopenmpt: upgrade 0.7.10 -> 0.8.4
Date: Thu, 25 Dec 2025 13:47:19 +0100
Message-ID: <20251225124720.2074689-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122911

Changelog: https://lib.openmpt.org/doc/changelog.html

License-Update: copyright year bump

Ptest passed:
root@qemux86-64:/usr/lib/libopenmpt/ptest# ptest-runner
START: ptest-runner
2025-12-25T09:29
BEGIN: /usr/lib/libopenmpt/ptest
PASS: libopenmpttest
DURATION: 1
END: /usr/lib/libopenmpt/ptest
2025-12-25T09:29
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libopenmpt/{libopenmpt_0.7.10.bb => libopenmpt_0.8.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.7.10.bb => libopenmpt_0.8.4.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.4.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.4.bb
index dececf7488..37264423c4 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.4.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "https://lib.openmpt.org/libopenmpt/"
 SECTION = "libs"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=829270a66f67187a1d08640df673249a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=979c86485a65d11403e9bf083b9a0812"
 
 DEPENDS = "virtual/libiconv"
 
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "093713c1c1024f4f10c4779a66ceb2af51fb7c908a9e99feb892d04019220ba1"
+SRC_URI[sha256sum] = "627f9bf11aacae615a1f2c982c7e88cb21f11b2d6f0267946f7c82c5eae4943b"
 
 S = "${UNPACKDIR}/libopenmpt-${PV}+release.autotools"
 

