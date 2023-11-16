Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C413C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 19:49:40 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.16248.1700164177520316910
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 11:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vj/vdnrB;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-545ed16b137so1761384a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 11:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700164175; x=1700768975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qNOb/P3wMKGUHjVtDqSjuDAjIOMCX7L8P/cc/blLy94=;
        b=Vj/vdnrBI+BiT9DSmNB94jLBnhnPDv1VtJGH/c6K9Y2mBcAqUUlV0Mo0y43AdNqofp
         U75myRlaqFVR3eOEC089DXf8Bx3tBZK6pigTTFtvdLW08157BL7pLTDKV0TBMX9SLIY9
         BVWjMIdQNt+RVTMbRIMmE6eNwLIZWaIxHlXdWPIiH8m/Ou3W2a9p4v0dZIEEUBVbup2h
         YrE0D3ee/3SHp4zdfSUHHzny2AoglW+kuJE5vkDaN97cLxZt2e3xq3Gz1Wj8rFWdGimG
         13PWB2v1QWjBNN9s3e9lrUfD7i80cgvbEBFi9+uZOMhgiKuOErJ7MEUdWcrW8C09tV23
         3WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700164175; x=1700768975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNOb/P3wMKGUHjVtDqSjuDAjIOMCX7L8P/cc/blLy94=;
        b=Taow/PRYxy2kQaLrQGXkPsFkvdRU37QZAR+muM+YiGy7p2oAgrYYUMRCWlY1w4vxMv
         nSa0jYVjvhGbNEe4Y23pcT0BoaMN6WbPtFiugmUcPrWBUWofHmRtovkE9J1Xy1NQ6fMH
         AtHSQ/+9Emuveaw6+csCNu7unQ56Egyp9BS+CTygee4FuA9cEh4qmOO35Ts8h/Grc3FX
         lMfqyNSYnyZYi97q5+n0q7QaVQt2ky9LaKA5okV5e294opqaa0cgVqSrcfPqA2VwcKyW
         XuhuN77NJkb8RfUyL0wSGC6flj+TvQmkTttK5rElOYaQL3nt0mQaNerWfVuJzw0n8T3i
         JHmQ==
X-Gm-Message-State: AOJu0Yxp8GRppQLz+2uw9qCTQz1vpGa4+2AW4KdsWzcdkd3+Yr00QBPW
	3ym3NZ/VNxcfXlnSewcEV1EPwT7C1kaIFQ==
X-Google-Smtp-Source: AGHT+IH54m+0WQMusYvrtK0Aal/jjPnwgv9K4cZYInMXTBGn0RJS5pOSioQVReXCXtA2btFo9uXNVw==
X-Received: by 2002:a17:906:e86:b0:9df:bc50:250d with SMTP id p6-20020a1709060e8600b009dfbc50250dmr11437165ejf.54.1700164175092;
        Thu, 16 Nov 2023 11:49:35 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.108])
        by smtp.gmail.com with ESMTPSA id ha7-20020a170906a88700b009e603786444sm8872739ejb.90.2023.11.16.11.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 11:49:34 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] luaposix: upgrade 35.1 -> 36.2.1
Date: Thu, 16 Nov 2023 22:49:22 +0300
Message-Id: <20231116194922.1478988-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 19:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106826

License-Update: Copyright years changed

Changelog: https://github.com/luaposix/luaposix/blob/v36.2.1/NEWS.md

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../luaposix/{luaposix_35.1.bb => luaposix_36.2.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/luaposix/{luaposix_35.1.bb => luaposix_36.2.1.bb} (78%)

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb b/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
similarity index 78%
rename from meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
rename to meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
index a71bbebf7..1d27eb258 100644
--- a/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "luaposix is a POSIX binding for Lua."
 LICENSE = "MIT"
 HOMEPAGE = "https://github.com/luaposix/luaposix"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f81069e00c0cad249f20efe958276db1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f30d022f6ef53952fa87cc0b6fffb153"
 
 DEPENDS += "lua-native lua virtual/crypt"
 
-SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release-v${PV};protocol=https \
+SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release-v36.2;protocol=https \
 "
-SRCREV = "14043c5086ae738823a5dfbc9170d9e14193fbef"
+SRCREV = "5a8d8c768fc3c51f42cb591e9523a60399efc6a1"
 S = "${WORKDIR}/git"
 LUA_VERSION = "5.4"
 
-- 
2.25.1


