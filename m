Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6331.1792499553240135321
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LkvOn7Qd;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso22208185e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499551; x=1793104351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCkVFB6USkJ/6if21GW1tKG8V6gNNFx0oFlEynzEfp8=;
        b=LkvOn7Qdx8AhxC588ltBrEToX2s6m0UwtCgF/KJtqvTH/dyRe0BpPO2CZVj0IraJzG
         1iXWQkhZnkAKlF/y5l0LCH4oxeg3Tk37xfjgj+s3bBKxRd4gyEqZPZqn7mlXRBP/vO51
         4QMCdYFh/srx45f1d1aip9lC65ENYVZSNC3Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499551; x=1793104351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SCkVFB6USkJ/6if21GW1tKG8V6gNNFx0oFlEynzEfp8=;
        b=0LXllSBBUQlVXsCnugaANOp4WCjP+sHxUor/tiCqQYG8Sm+qOWLyR0C1V0Zym/Gpfc
         CRulTJlSt82sdV0qYb12eal+tbyROtBRIlybLAdB/tZwHAUUFYtKhaPhuyKSbtJQBVn9
         p5JjL6yzBIHLAJ71gaqOeouqeeogQnvQOspdqg/T8TKOlFTpi/MX2MnJBBbHald9IA4Y
         xxi2hQqK/P/BZbhV0wj5yQZmDaL5Viml9GhU3mY9tu5zCLx6r2asz8wLpsuBNjkLA1ih
         6/2H63IC6BPmPGpRgkZGZ/VtcDjAyiyefs3YZAwXqBXmSbtxQ/6xxa49KvBK+o6383Kf
         824w==
X-Gm-Message-State: AFq9FYJ4rTWAmMcSzre24AWAtokZtwB7yldHxOooSdxgJOk3J4VXzyTv
	Q4k5UslcJ5AHzNWQuXAvQgA4eNz62cVq7/IZTchMKLTVT0DOfvGpuGnK3kRObG9cqenceT1xtcY
	+JKcS
X-Gm-Gg: AYBFou1I8siX7iCb4+qETz9D16TJgb9d/3UC7bFE+bbIhIzHZ+exCyIJF09pPSkrwRj
	+XWz2RKqpmiPSNZ+eQag3OGT0WgW9tHuoTCoMwCUAmdQ54MjB72+dxryi1GXFA0Pb2De9joj2hn
	1DfRQNl6fdGp//LUa7VmOkN+NZaJIobw4OrlF+xXorSa1HSlhCE4RWbspOjO2CQThwnlpvisFht
	YEYh80FSIyi0G5g6hrMihD9yw1vgMw2EnKNGFXo89lAkJdW8UFBG9gZYamOBXSTWcUPMGBbsRqK
	JQmR4oVDmm2nrbBpWtd+YGJYCk73gEVWwX0Lh2N2y8e3LhXq42PDatYZqGLEvovI/EJPB//jRf0
	X8y9ppMfUQKUUE7gNoyb9YYBgge+cOndKML06CJ4saRxrGFA4EAKRRH2VoRUu39o2LtK7ToTHRK
	4L8EljXfZ4JsjBJYXYUttpfOyeyYaYU4fy/TeJSTL4P1FCwNpcWORh856UiRNpnnVYRU3Jge/mJ
	zONbDtn9dUw7LipIoI+6LjeNYXNSwll5xXHF6Y3KXIzHOC4j3n7e6XS0c9tsKY/lNkbmkXFGZVR
	JTS5k4hw/Xz3LThNjRszfWHn
X-Received: by 2002:a05:600c:4684:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1d76001e9mr221695045e9.16.1792499551227;
        Tue, 20 Oct 2026 05:32:31 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/14] python3-vermin: Add recipe
Date: Tue, 20 Oct 2026 15:32:15 +0300
Message-ID: <20261020123226.4033600-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131161
Content-Type: text/plain; charset="utf-8"

Add a recipe for vermin to concurrently detect the minimum Python
versions needed to run code.

Release notes for version 1.9.2:

- Fix incorrect version requirement of __lazy_modules__

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-vermin_1.9.2.bb    | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-vermin_1.9.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-vermin_1.9.2.bb b/meta-python/recipes-devtools/python/python3-vermin_1.9.2.bb
new file mode 100644
index 0000000000..59ca917850
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-vermin_1.9.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Concurrently detect the minimum Python versions needed to run code"
+HOMEPAGE = "https://github.com/netromdk/vermin"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0303dc5537dcc0e24a5b259af6fc0bf4"
+
+SRC_URI[sha256sum] = "ba4e01ab817c6baadf5f057bd6ea691e1147bcaf00c1ac8db54df0e25c6d2c6d"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-wheel-native"
-- 
2.47.3

