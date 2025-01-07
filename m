Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D3BE77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 14:00:58 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.20762.1736258448314082191
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 06:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=r+v8bEkr;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso250864766b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736258446; x=1736863246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNhAmaE4QlazZv4kfFdPyTkMri/nJvF6/0Ou3oE8hYU=;
        b=r+v8bEkrT0TrCtbGvyZyomZ8BAkS/bgRp9Qqp9W8WgjlfvRfPVltDpKJ+E2sQtlq07
         a5rPhlUPOdm99CSBvBL4u5v/0RUQYnx9RYgnQ2lIprO5/klt/6VDYMyoHa7JVNedLuv6
         aX64woIb6mbT26rUYwZvcd76rbpyLY2LHSUK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258446; x=1736863246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNhAmaE4QlazZv4kfFdPyTkMri/nJvF6/0Ou3oE8hYU=;
        b=NTUGdHAq7uN3p1YxInW/+wfHVhUPnVzx2VI/Ize+r1eNtfse001/xEPoMQQCoMDdAB
         8BYALNxINTckigjfwzgc771evSqvgck3qflYZLCSO1W5B31bcf8+xpFJ9blVB3oJeup7
         bjv6zlMdQf7wpusj0UeZABXiGky9KKu7VkhJADzBNdz4sAvaS0xPm8I7SobhsjPnDkYH
         v5V7Z4xnmpfYuactI1+ckyWUeNZToSvZ09IvIv2bzlNZhi2I2swCEun8gjUQpTF/vtxy
         sRKY07OhNlNv4R1b2onhd7F9BYl5VU5yyHOLHSyFfKsyFpo1wZUT3+jpzVJqrY0U9WQZ
         9ARA==
X-Gm-Message-State: AOJu0YzO1sy2fcYmWxO6atd3pcvyvEhaFAiH1IgMqc5IpudE/asnEpGV
	hiFW/9g7+wl0rYl2uLtpxA7KVjAArfwoslVNVTQUs1JT8TPsOA0GN3QPjPtsAiENHHwaxUNq8mo
	e
X-Gm-Gg: ASbGncuvrMZmWzxA1nddIB9n2ASheb8iwc2qNqLAloufG8slagkYQDhnJ+aeSIsspjo
	3zFEk+V5pnrXETo5CgaNvuhEL7YI2EtbdU44FOPbkYM+ndwq0UHO3qCs3wROEQlLvp4Z/EU1ldP
	99FpvySJTYVxW+bRdb7+ZA8hSrVAg28vfyayip2MEfuK73NWv3TWrnYT30RawiyM7U4fOjl7uO4
	5bjWXHr6rtwNfdzuX8kk/vMW874doEphNgl743t4D2ZPs1pDafwO7GX/7V+o2a0m95hQiM=
X-Google-Smtp-Source: AGHT+IFgd9rgzgvtINgAUtX4TzBYxs5Ccvy629ZGqVs5h+6H0kLldZlRiTeXZeuuSgVYsTRsH2XFPw==
X-Received: by 2002:a17:907:d92:b0:aa6:7c8e:8087 with SMTP id a640c23a62f3a-aac27026fdfmr5643454866b.12.1736258444958;
        Tue, 07 Jan 2025 06:00:44 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm2403422166b.93.2025.01.07.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:00:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-anyio: Upgrade 4.7.0 -> 4.8.0
Date: Tue,  7 Jan 2025 16:00:38 +0200
Message-Id: <20250107140040.3330151-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107140040.3330151-1-leon.anavi@konsulko.com>
References: <20250107140040.3330151-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 14:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114704

Upgrade to release 4.8.0:

- Added experimental support for running functions in
  subinterpreters on Python 3.13 and later
- Added support for the copy(), copy_into(), move() and move_into()
  methods in anyio.Path, available in Python 3.14
- Changed TaskGroup on asyncio to always spawn tasks non-eagerly,
  even if using a task factory created via
  asyncio.create_eager_task_factory(), to preserve expected
  Trio-like task scheduling semantics
- Configure SO_RCVBUF, SO_SNDBUF and TCP_NODELAY on the selector
  thread waker socket pair (this should improve the performance of
  wait_readable() and wait_writable() when using the
  ProactorEventLoop)
- Fixed AssertionError when using nest-asyncio
- Fixed return type annotation of various context managers'
  __exit__ method

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-anyio_4.7.0.bb => python3-anyio_4.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.7.0.bb => python3-anyio_4.8.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.7.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.8.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.7.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.8.0.bb
index 5f90ffbd55..c103eba46d 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.8.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2f834749c602966b7d456a7567cafcb309f96482b5081d14ac93ccd457f9dd48"
+SRC_URI[sha256sum] = "1d9fe889df5212298c0c0723fa20479d1b94883a2df44bd3897aa91083316f7a"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.39.5


