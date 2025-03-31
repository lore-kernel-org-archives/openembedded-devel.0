Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B15C36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:37 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.3933.1743454895558261758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDsjyB5C;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso987575866b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454894; x=1744059694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HagABCmd/3UHm9XVaoRl9rL+ozmOThwMngIa1iZLTM=;
        b=nDsjyB5C86HDHx8B8eBnpyU3sc9qZCed7fxGoQSX8oGhRMwkeYtxynKLi81QdDmWFj
         SVzS4yyIbvfPdgXwYxuQVCD1zLZpgpJU+f2tDJoisBf0G4tcaVmq8QQ9nik9SKtYRvUr
         jiG8c7a3+k3J15h5TZvAEfdHe6zRQcfYfxS7vaIcoWgNaDNXOOz6c8eAYah+ln56ejrw
         HZsDmGxNXNU52x3ruMKZUmZCjGNz6jGSwaFYAMVi88dqVa7VPkxIwlRAyBHi7cB3LcJ8
         8jaXN8SKmjBiD3JohV3LfUS2a0Q8OqSBgGUbp8FewjyejF3eUKiJmEOT9H/Hq0R+/AiF
         Zj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454894; x=1744059694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HagABCmd/3UHm9XVaoRl9rL+ozmOThwMngIa1iZLTM=;
        b=tQZ2/C+wAIxMaqybPWp05Lvb716OYWgw2r9K6PJw8Rol6r+ZqTGLMcUlTNBT+0g2Eh
         l4buWfFFmVAHZneAzS4eU7vYAi/o/cm2E+tgzDfwLkMg8WaZSgLjJL9/0UeNvXugtS1J
         g3IPFCwKGThbhvixhAgzNes3ue5LI1AaC8wuG/d6CKpscDO055NscIQT9KzYk+mNgTPJ
         h3rrZqqZnd8zQwvr/vHnWFjRIG8dHXDKY/EzFoW5YCJqH4fWV6RT+j4KsG1WY8pbOWvt
         wWcmq+NC5Iu61Tf9DzyT3JHZAIOcgSD9BoMUiFz4pABaHIkQYTkXDUgGmm/0wWmgl/N3
         HEoQ==
X-Gm-Message-State: AOJu0Yy2SqvAYSpPw1gZeYdRADB2xJQQTWKwr4Tc9WoBcqDaZqZ+mp2m
	MUf9Y1z7fuvUobjNEVCA5etctb5KkE2WAWqltrSMZMdzG+6EuwqY3RmNI4BB
X-Gm-Gg: ASbGncsO2xwh7otmepz5HQr/ZKi8/RA6EoUIDajuyEH7Ywr43ybDYPLZ2JVtgFJV5UN
	KNkYZLVxRaLJFKOcXzlepp7TdFZ10eP/+K+JNEXkr2r0xqy1KcdDbp7vuvnvS1b4xi3KyHJv2Yk
	sFxSwcb/riXVd5A/ajt5a+dtx3GQMuS5TB3HspLJQBU86mp3z0OGhek899sNn9f3rLW3pz7ckCw
	0V9/vXpqn/upZjYW81L9avprySFEWXvSgpUzNCEuN43gocam5NwPYL5L5PCkg6bovQ7R4ituRxy
	dnOB9IGxxYB7iJ5dcK2Dr3dfxRo+Hy5KU7w0hopAQxkbpU/meyGQvmvKHw==
X-Google-Smtp-Source: AGHT+IFQqXgmQ+JlS1ujq2cfWwvNDJ/ZLjcHCcZtxLpXLjlUWriRW1/0Oz5i16WvhboVhxBNmA04xg==
X-Received: by 2002:a17:907:7d8a:b0:ac2:af42:4719 with SMTP id a640c23a62f3a-ac738a02c0amr827113866b.21.1743454893772;
        Mon, 31 Mar 2025 14:01:33 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71922bf79sm668624566b.35.2025.03.31.14.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:33 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 20/21] e2tools: Fix buildpaths QA warning in config.status in ptest
Date: Mon, 31 Mar 2025 23:01:00 +0200
Message-ID: <20250331210101.3460858-20-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116456

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/e2tools/e2tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
index 1fa5e01874..a0d194cae0 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
@@ -67,7 +67,7 @@ do_install_ptest() {
     cp -r "${S}" "${D}${PTEST_PATH}"
     rm -rf ${D}${PTEST_PATH}/build/config.log ${D}${PTEST_PATH}/build/autom4te.cache \
         ${D}${PTEST_PATH}/git/.git ${D}${PTEST_PATH}/git/autom4te.cache
-    sed -i -e 's;${RECIPE_SYSROOT};;g' ${D}${PTEST_PATH}/build/config.status
+    sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
 }
 
 RDEPENDS:${PN}-ptest += "bash coreutils e2fsprogs e2tools gawk make perl"

