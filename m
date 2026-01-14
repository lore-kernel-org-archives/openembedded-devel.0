Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01499D2A013
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:15 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9342.1768395669043695348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SPS8iEB4;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81df6a302b1so4668244b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395668; x=1769000468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0oKauuB9B3ug3sr24XeAa7d1wkPLVBu5Z3+3NWR+IiU=;
        b=SPS8iEB4qURO8DUG05w34DtIZCh78DRGxUet6NiWITTQTTlIJvmAwnksAIAT7QKyhZ
         7DoVNy29YdWRT8US2JKWi9ejHEDwT63pzEkZr7x1YYlZtqdJacX73PKvizge3lH0x/w3
         K4Dr4wPhAQyaRzepbNGRdfanmwcW+MWnOHLAmqc/PuN7raop7qMglEMRIt5iyW/zX7MT
         3myYUujJVmb5JVpYaDcGj/FVm7ymI2JEpEhg8riTJ6U1dR0eH4AjpoXYb5CqsUjtCAkZ
         xlJEo+smDig7/s72sNLYeF2fOpgf2c6ucXqaKJ0zJoxCijf9zy37Ge3LWUhfKsJ3NV1x
         DnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395668; x=1769000468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oKauuB9B3ug3sr24XeAa7d1wkPLVBu5Z3+3NWR+IiU=;
        b=G6jlJf4a11l5JJtTr3ew1Ed5uBe6clBnKoPAAVYMra429gnxMdsHD5z6P1KjqAtD/w
         l0spG/bjRNsfNVQuz6x81zdJNw65X3MXM3l63FwJBwqkVqCLNqA2OBaYzCxw1wFJ9ul9
         8QyTNcfblB5fX1UduIV7L42gs6i7HIT36naQyWpuEFCguLr3h3r1wi57XjQerj6aht0c
         AfVc50botWMlXrexzkcLsvfPh+ecfOGRHoXD8Ii9tpVM5nh7JXsbffVF0eQVXSrupE5j
         ioaKbghKIUQuHnjhaoGTlt2ijGaYFW6Ky79UWrLjsZ32iHF30iYZjEyhCQgWQRfJq6y8
         lZ7Q==
X-Gm-Message-State: AOJu0YynDjIgYewzZCvr6tTch5kZjtsDBg0iP7Y8MeGRtCMGZJuzXo6i
	g8fV3MnJae5pgxHwL5OAnTge8W2B1YP/4hlQ5rC67OYS93LVLr963jFiNlhb0A==
X-Gm-Gg: AY/fxX4vWgZDeSJnXCL98ZCNOs2Gkj8Pi6UUw7USPEezbBGjDLvX82bwRtypZkP0Qaq
	G9EjjMe9kgaOs5V1I4RXtfDSxQuiFVVVilGPGlRi1lZJEVfMXggyWEP/v7EQPeE9VG4AwCbKHjm
	BH3dUalL1AfZcbWKZtyJyYolrpvRskVKLkffHfVSYVDMb6SoinaAe+EaICG8YX/lEZFy3CQ7gT5
	j4YwRefxI+q61OSYTxfVRDiPdP+YjpYwKkM/MXHCrUHEfosyowZffIPsLHU8tlvrt1sVB8LgZ31
	zjgJlLIe8DZwpqhZU8W1MRv7yQe23zSoQq0V4YUTw6+FqP9A6nlqC2vWADY1oON2+pTz1W76nXA
	dUoF53ZH6Ffrc9u4r2fUMzSWft/msD0V2TJ9LMs9Zsq8x2Xt4YSfQNz4OnGX+MJsetTh2rnmPdn
	G5WknCWrX3h30dBeNcxUvh9hw=
X-Received: by 2002:a05:6a00:8c13:b0:81a:7be3:9e6a with SMTP id d2e1a72fcca58-81f81ce1f01mr2334849b3a.7.1768395666998;
        Wed, 14 Jan 2026 05:01:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 01/20] python3-aiohttp: upgrade 3.9.4 -> 3.9.5
Date: Thu, 15 Jan 2026 02:00:38 +1300
Message-ID: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123454

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Bug fixes

- Fixed "Unclosed client session" when initialization of
  :py:class:~aiohttp.ClientSession fails.

- Fixed regression (from :pr:8280) with adding Content-Disposition to the form-data
  part after appending to writer.

- Added default Content-Disposition in multipart/form-data responses to avoid broken
  form-data responses.

https://github.com/aio-libs/aiohttp/releases/tag/v3.9.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-aiohttp_3.9.4.bb => python3-aiohttp_3.9.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.9.4.bb => python3-aiohttp_3.9.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.4.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.9.4.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 1cfed0d7a4..57adb1eeba 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "6ff71ede6d9a5a58cfb7b6fffc83ab5d4a63138276c771ac91ceaaddf5459644"
+SRC_URI[sha256sum] = "edea7d15772ceeb29db4aff55e482d4bcfb6ae160ce144f2682de02f6d693551"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi

