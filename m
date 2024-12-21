Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F8EE7718B
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 22:57:32 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.15914.1734821842714382391
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Dec 2024 14:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RtvLqrxp;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso442847166b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 14:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734821840; x=1735426640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqg34bHG5cTGIALktMTs6F0g0BHYeQJHOUHDehPZGsU=;
        b=RtvLqrxp0VnTg23joUob/QmEHQxfgYEfZUt/BY5RS2rMRaN6/RTdIAYswAtMZiVZf4
         /fDgOXjx55XYTgYlkWUIS5ZlfmF+7cpQ6SSUrbJnGdUB7efbqpEzNxBPiBGCzUvVwjrc
         16Zzfpp7+gkIrBhdNap/Vki1zTGbFHDnM9mptApCQOXmjrpNFKclewVoCYd2gBnx3FqB
         PpY38sRexZskYgQB2Axt2K4PXcIZPmQ45Wbw8NhKFA9G2ZKusE+bi0rH8kLko7uLCFA/
         8Tjx+OTeIRRtubKenyF/iNu7RzqFFI9QuDdJTSqrzKNeyF7eQ4yqOZDUZs7vanTy8dXa
         Ogvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734821840; x=1735426640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqg34bHG5cTGIALktMTs6F0g0BHYeQJHOUHDehPZGsU=;
        b=dzjdMI3wo0tc3AqHY3W/SQozjfUaKNnNeb7/nOhMNqxGEKPa2dDW8N0UH7A71PQTGc
         JTQI+GoIuI0Yc9lZwzUHvtSEz3uLcUmHTCcSJKZfQSKSP8j2pmt7kFmnwEAM4U0U9YZ1
         uinapIskI4jR0zUC5VY4i8t+apt7xkVABgJnWkTA9iU/3su6yC1C6IKgXZeLZQE18DMX
         Ep+MUMZV2629L5SHotzsquP6jdaFfA1ULHRosuUkLYZDNRANwAR1OjN7cTgWW+Q/m4OP
         mzx1xqd0h4DqP8+osC0lkQX0Xs24AoPT/zNlAGxzeQEuGt/q8You8gzmaZERnTIoBTiC
         YVRA==
X-Gm-Message-State: AOJu0YwuijWhu5QWmkS09fssOV6ZkYORMC1ey552a8nkMRrfH33IqhvC
	qBJ7Xos1ChtM2fI1E3xARH5n+clhGGQQNEDVuJy1WrY6fo0KvDbyH5hBvVdb
X-Gm-Gg: ASbGncskDnLlk153l4SjvtV8rS2oYLALhqK9d2xARLRx9MA5fQf50OMCYGQ0AbYiQ7q
	pG0jU7IkKv3dYHW3bcXN8xUCo5GQGXJMkBdkN6P8SBWnxJ3ampXXn30Hy9fIxkWL46d2R0O6ZE6
	opgUqyCi0exhVVTtQVayGKPhkMFGnUKDjyli8SBBpuow3kZb3RvUA++L5WXUhgemF/DfowX5WVw
	xsbBheH2+R/kT3PwJLOCLS+AqGM6OXrCqy2D4En74jXriDaH1XhccW9ZUOWZGA8yNycs1yLfcxf
	S5E+aOuXLyfNLxuo0++mWFrYOw8/J5zG4pM=
X-Google-Smtp-Source: AGHT+IFkOAx81vPFqI2L1Z7IPotLhhhLv9dqKPm733Rf2+DyLdZf6cLlLX0DPHbyLRE6mBW7K14YmA==
X-Received: by 2002:a05:6402:2087:b0:5d3:da65:ff26 with SMTP id 4fb4d7f45d1cf-5d81de1c939mr16875603a12.31.1734821840065;
        Sat, 21 Dec 2024 14:57:20 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f858sm330717666b.21.2024.12.21.14.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 14:57:18 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/7] python3-aiohttp: upgrade 3.11.8 -> 3.11.11
Date: Sat, 21 Dec 2024 22:56:59 +0000
Message-ID: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 22:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114451

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../{python3-aiohttp_3.11.8.bb => python3-aiohttp_3.11.11.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.11.8.bb => python3-aiohttp_3.11.11.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.8.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.11.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.11.8.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.11.11.bb
index 9c4720daf2..3d4cb75e6a 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.8.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.11.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "7bc9d64a2350cbb29a9732334e1a0743cbb6844de1731cbdf5949b235653f3fd"
+SRC_URI[sha256sum] = "bb49c7f1e6ebf3821a42d81d494f538107610c3a705987f53068546b0e90303e"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.43.0


