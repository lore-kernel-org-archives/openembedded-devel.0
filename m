Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4DDC4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:12 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11410.1784590748595952512
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H7D2547B;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccf2360620so66284985ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590748; x=1785195548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MO36ns8U5AgDN8C7WD34HupSNr9lGQQ8JXOgbPXve2E=;
        b=H7D2547BJo80wMdhzy9Bp3kB2uNqK0ie2Nvy3qS3P/W6pK/ftsu2a703ToNbrouMZJ
         MEc8rsrb+cLonDO8p6F9R8p5Bg+m2C/dDu1opAs6egtjORVLvNumg+KhckzQBn/VD+I8
         e4zX6ddVo5shpn2p2pRTs2/xjBi9voIG6P5zji1MKmXR0euxpM0nXD5MGovGQR0K4DCy
         lqU7NTRUE9D93iV7AQLB/U2tYjB2ZP+ALv8veSFOEZBgiGO/YMGYg5mTUoPeJlj9sAEd
         nyIJrdnboKcqAUprabCbpFP1nY2RUBXr1YVxXLl1uV1lVEXMoEx09wbWF1ngJ7TCnmSy
         DBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590748; x=1785195548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MO36ns8U5AgDN8C7WD34HupSNr9lGQQ8JXOgbPXve2E=;
        b=if1bVICPZ1RSiww0BAPS+RwMCIxLmUG1JJPP3VVcO2CLRxSRKDacyoCgDjk9HwzS/f
         DKwg6e4vuJUpzPvXO5PEwt1JziDfCd6TRvonyPoY3UyV4eUWNsT0vF9a4VeRbqM1AefV
         6v3wfh55RDe3NBCBB6+nViELCwgbiOJwDSK8iDyrV0cQE7xHdho/13s2S5FPmEY8hrtq
         4nbzWest0U6E65PlYpY6kbwupWO9r/90GROSDig45LsbGPEzrmpNw/TfOJR9I4uJQPU4
         XHWgHlRz8GiA40JTGybFqjvm25KmLfn6a/2UXbB8j1qi4JgKmF+isPQ3TBtSGLxNIFIa
         JWUw==
X-Gm-Message-State: AOJu0YzzFM78AyRqUVr8Q8I1w2YdXq9yEVDazJOiZmffoRWCiDJRKNeU
	+9ubQMLwWXa3ULHla6Z4FkF2K6ymP3U04VeISAsWuQnEfPPFj/fmiSQcFsZVVg==
X-Gm-Gg: AfdE7cmPXwTY17iysGqu2OtQeS2pihKqfKpFpQjNM0FnpLyJie2U0EFjE1LvQlhKV3e
	pyvy7kH0FCGVmBMZVijus7X+qUEDQb4Fq4dshZBuAvbZr+er/EX4ifX3g4N0xljaMvA9xNCfYBl
	FqZFabHmBY+SoJnJPTWruZfehqoiJ9pQYa+hFMKQy+zZAuyjFkueAxG66cgYSBoSo9kmU7dEB76
	xCbRnvMaO9VPTMNChluHYGWXOovflQmiSh5xtSF/3MX1BeeSTmlqY//A/jDYDkNRCOvAXRIhOUk
	LMhrwPKEOHx0IMJrs9wmAHIlKsSxuuoLOUG3Sg0rU5q4hE5BIzMIGRJztyfQ1JrQdU1T4b7mm2L
	iQcHTePw5VvVi9BbFxuykPPgXW4TbsI020CfKTjvLaITl847uNgivmVBwCkh5c/CXDvwF79ChAx
	6T48Bp5F3dgjm8eok=
X-Received: by 2002:a05:6a21:48f:b0:3bf:7994:ddca with SMTP id adf61e73a8af0-3c3ad85f59amr17722137637.29.1784590747984;
        Mon, 20 Jul 2026 16:39:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 17/30] python3-socketio: upgrade 5.16.2 -> 5.16.3
Date: Tue, 21 Jul 2026 11:37:58 +1200
Message-ID: <20260720233811.2324493-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128318

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Catch all exceptions in redis and rabbitmq client managers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2ffa73965f8f883d0b11e33f37c468c5e3d0c4d6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-socketio_5.16.2.bb => python3-socketio_5.16.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.16.2.bb => python3-socketio_5.16.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb b/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
index 97a378b879..be352876a8 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python_socketio"
 
-SRC_URI[sha256sum] = "ad88c228d921646efa436c0a0df217e364ef30ec072df4041484e54d49c15989"
+SRC_URI[sha256sum] = "89b136f677ae65607a84cecda9b4d6c5377b40a97582c504c25df89af16d520e"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"

