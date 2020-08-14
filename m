Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.12380.1597383440161669064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kE9kQkSY;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d22so4017643pfn.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NfeUPcpGZwtGy/jx7EpVRwKGExJJ6sZhu8pUTpMisJM=;
        b=kE9kQkSYIZzwvUGe4yXeOyMUMgcSA250qtzd59b3+MrSxfH8gqLxt9xPlf07OwKFUL
         JVQD2k0sCjCYHblMoeBKVo5mujH3GiSv52wmM8BaTtKWTtY8NF0fM9W/YNmyyxEDQdK1
         L4v7sr8eNOFGEx1TIOvAB4Q+sqLtN5HArUskH0oubR7nkAaV0jHGPBSZADAs5zIaOcdJ
         4x6wwpKDhlxwgjiCDx3cAoSR+1KTlLio4bXFKvGAaw38zOg7cO1yOhFhIjPNvQepz+SL
         ZN08bWmJX9Ibvsd3FRLF1+usbFeYhlx480V1PUtisS1Z/SPTT2NXY/yVSrJC9zG15Uw+
         2Q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NfeUPcpGZwtGy/jx7EpVRwKGExJJ6sZhu8pUTpMisJM=;
        b=JWGPjaXuyD+dMvyBxCL556KzuYksD0TRRpHm7tO1v1jF/NGZjUnZcr75dix1JN/u4M
         BRU4m6Z5nrIL7ruUZU2cLCPxbdD9cVvPZsEFSjIy+hyYjcT5Ml2bOe6qVM+VmAYsyy8u
         +Hn/zupbYV1S5hXFrEsFdkXsiSIJsP1UXOulagm1jPa002+045mLU55gld6Ne+opFglr
         yTV2TSTSy9WZjC61/Q4FxOCbPPuD+DcyGSV+u2PBfkUbmsKLFDi8y5XT5t25aKb1UwIU
         +CCxDSHA51+EF3zJtR30qvXwJZlyw9pHjokq0WXuXIwJBQZlyiWdjUb7yxF16hdpwj8q
         602Q==
X-Gm-Message-State: AOAM530KVtuwmtLKNaHWCKXMElscdExg2d39Ipez4Efr0/A8+DQu3X/2
	2B67FVq6TX7tSeUuk1Xd4dAp6FfZ7+XGFA==
X-Google-Smtp-Source: ABdhPJyDo34U0O5fsNEcSEz8vLs9pJ63CPgZ//6rWZGOphFwQqzPl8XTJZRa/HvIYr8DI5hOHYuVDQ==
X-Received: by 2002:a65:5849:: with SMTP id s9mr745372pgr.145.1597383439300;
        Thu, 13 Aug 2020 22:37:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 19/21] opencl-headers: Upgrade to v2020.06.16
Date: Thu, 13 Aug 2020 22:36:55 -0700
Message-Id: <20200814053657.1701247-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Switched to Apache-2.0 [1]

[1] https://github.com/KhronosGroup/OpenCL-Headers/commit/35deb7576b83fd1244a3e0a89f896b787ed53818#diff-9879d6db96fd29134fc802214163b95a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/opencl/opencl-headers_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_git.bb b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
index dec1bea566..d262dd1479 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
@@ -1,11 +1,12 @@
 SUMMARY  = "OpenCL API Headers"
 DESCRIPTION = "OpenCL compute API headers from Khronos Group"
-LICENSE  = "Khronos"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dcefc90f4c3c689ec0c2489064e7273b"
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
 S = "${WORKDIR}/git"
-SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
+# v2020.06.16
+SRCREV = "b04034a17e214322772c19e7ccd2adf0cd306920"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
 
 do_configure[noexec] = "1"
-- 
2.28.0

