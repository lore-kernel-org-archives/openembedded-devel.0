Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978D1C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:56:11 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.12867.1647359770697735368
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nj2hPy9u;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id h2so16400928pfh.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVJ1tP99JGj7bOxFN+OV6DoRMOx/hgqyoxx+rF9ma5k=;
        b=nj2hPy9urg1WMnsFKSS1xyx5NVz1COtA0MP4dktDC4GqbaQjexOlgwqHB3wB5ceAIy
         4DM50foNrEUstxZVi+UDeFpN9IRLhOXYUoaUWUQucHNcQSAzUUCmK7dEQ3E8bKt05Qu7
         DKLS6o3hBQJE8g6cCwsx/qhHupv0imE47fKhB8bJtU3qN7je29aQig3Xo4Q/Q33uE2eS
         2/ylKTy/MdWU0E0mqXYiRFlhmCA6z2IcXaPcXQU2zqMgSTSn121JKYJdQniKqDPe7m0W
         I66SGp0owmOFQeNCGT4+QJLfzd9Cg407WCCB81KDFxXFR8EakG2/mOVpMrLYWUWebQQJ
         rThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVJ1tP99JGj7bOxFN+OV6DoRMOx/hgqyoxx+rF9ma5k=;
        b=fbiimmqD5DpanJXYVv3WFb0oBI9dMHp8M8A3HreQIaI0117U0cwcpqjwdSp1GpbPuu
         faXK67htZmG3NIvM5u1rfzL5I/7Kbdwdcw4QmDZpkioqBIfg5TWYM78o3kAZAxLR+S8x
         g8cKDVcNp84dG4TYtSBOpJvzhJDbqxFwbm+fxDX7T5sDIl9bPBmwjCOZvcGw3IOPrOYO
         VET/Jmjh8YgNKM6653dUYvTWdMtCvTyaMry+WK6U1Msry9FMy8w+2nFi5Iop0JAqWore
         CgWG6McqWGIIvuo3+nX3oNU9SD94yvN0EZcsrbpNvqcpuYBrYo+RpUj5t3vLGNsnCIif
         As/Q==
X-Gm-Message-State: AOAM5310aT8HKNrc3tF8j93H4k12jUZCphEjOhZ1X46MZwWOkwRE1q7j
	8JQ6vXROvw7eUNupwFVvjP1mRZMGDD0=
X-Google-Smtp-Source: 
 ABdhPJyQMhzxb3ypT+hQFK3NUcUu9bxulO3MrsonqPPMKcqbUUOvgy5oAf57HiseN2jKy/NETP6cmQ==
X-Received: by 2002:a63:4b62:0:b0:37d:ef91:d613 with SMTP id
 k34-20020a634b62000000b0037def91d613mr24817463pgl.465.1647359769817;
        Tue, 15 Mar 2022 08:56:09 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:4e7c:5db8:f14f:580b])
        by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b001bf50a8b468sm3912101pjb.51.2022.03.15.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 08:56:09 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-poetry-core: move to oe-core
Date: Tue, 15 Mar 2022 08:55:55 -0700
Message-Id: <20220315155558.969249-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315155558.969249-1-tim.orling@konsulko.com>
References: <20220315155558.969249-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 15:56:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95996

The poetry_core.bbclass (renamed to python_poetry_core) has been moved
to oe-core, as has this recipe, in support of python3-cryptography.

The recipe that needed poetry-core is python3-iso8601.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-poetry-core_1.0.8.bb       | 44 -------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
deleted file mode 100644
index f3e9b05521..0000000000
--- a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "Poetry PEP 517 Build Backend"
-DESCRIPTION = "Poetry PEP 517 Build Backend"
-HOMEPAGE = "https://github.com/python-poetry/poetry-core"
-BUGTRACKER = "https://github.com/python-poetry/poetry-core"
-CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
-
-LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=104d5c3c653aeededf4076773aa4c236 \
-                    file://poetry/core/_vendor/attrs.LICENSE;md5=75bb9823a2778b5a2bd9b793fac93ea2 \
-                    file://poetry/core/_vendor/jsonschema/COPYING;md5=6554d3a51d7cb0b611891317f3c69057 \
-                    file://poetry/core/_vendor/jsonschema/LICENSE;md5=2ecb81765361195731a6f72a89e449fd \
-                    file://poetry/core/_vendor/lark-parser.LICENSE;md5=b37b83a9cf129d92ee65aaa71c01ce72 \
-                    file://poetry/core/_vendor/packaging/LICENSE;md5=7a6e56c9d54ecd731ab31c52de7942f0 \
-                    file://poetry/core/_vendor/packaging/LICENSE.APACHE;md5=29256199be2a609aac596980ffc11996 \
-                    file://poetry/core/_vendor/packaging/LICENSE.BSD;md5=f405810d173a1618433827928768bcd2 \
-                    file://poetry/core/_vendor/pyparsing.LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a \
-                    file://poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=1211a1ac6eac40020d0f99c39b4e4270 \
-                    file://poetry/core/_vendor/six.LICENSE;md5=6a574656da93d9ef05431b45907e35b6 \
-                    file://poetry/core/_vendor/tomlkit/LICENSE;md5=be329e5ef9c9fe86738c9afe6ef3c11c \
-                    "
-
-SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118"
-
-inherit python_poetry_core pypi
-
-RDEPENDS:${PN}:append:class-target = "\
-    python3-compression \
-    python3-core \
-    python3-crypt \
-    python3-io \
-    python3-json \
-    python3-logging \
-    python3-netclient \
-    python3-pathlib2 \
-    python3-pprint \
-    python3-shell \
-"
-
-RDEPENDS:${PN} += "\
-    python3-pip \
-    python3-six \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


