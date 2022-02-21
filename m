Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD107C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 00:53:38 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.5384.1645404817437902738
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 16:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iLCgVkJE;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id y11so7258806pfi.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 16:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dNNyZVq9KR1OC/P1KkF6KpEtQevX6Z3XNMVnUlBs7Mo=;
        b=iLCgVkJE3a1IVu35G76yTnBADKKg3aejoZMBBgWuuM4ZZ+64v/sxHrh2oCWi6QS979
         zy6W0+mjP02+QCakebVXlgzX1mpvO5Rt5IXaRXy5vdBcX9Fwjsa7wjub+ubt6FPKuRCS
         c0HaOx6jRWvSzIS6JI04iPDSkQEzxIkSmZUpyNqWc2uH2ou3oQP54o4SMxaB1YuqbbiE
         ODmEnfkJ7OI/tUWtSpNI2j71g0dmVZsOWDw5Dlvg1uuYj7x3+Z27jkgU0owyfqYD3qKU
         sHDZcxbO0hrU8amz68RfPRQfztrE77lOWgFk2QC4cepddFRJUca+HXPL64/jgQ7Q7a7/
         tT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dNNyZVq9KR1OC/P1KkF6KpEtQevX6Z3XNMVnUlBs7Mo=;
        b=rS4oJu4fIIaG+kAaP2AeIg6i0Cp7ji9cI7PEgBWsKd+8RnOMZjeJbiqX+iiHRuW8Ax
         XSmZ5KaFBEcpVTSzH19mzfj7sW94e42PuOvMI88Ed4+uSjIokzLxla4DEESL9IkIwYMb
         YUBSzujf+9GHGuk4OVPed8OSkgzJv5VVWP54WlN5FN8VZF9gQ87duJa/b/yT34gFaOgz
         v3nIAl1KjfOi5SX4D0dy3OrnZd+2olZ9xDqul6HhVQmprSSqlYmiGk9b8mJ5hKU2f+SX
         zwenWso+ypLFsPeKD5mRgCDXjSevdXBAon2hxluGhKViqlAAVPt5pXEgw4EQjm0nqFGF
         bKeQ==
X-Gm-Message-State: AOAM533iS4vKmThAgc4WGcFm7KaNtXFBfxzBbwb+1p5v3OO+MmTmWKkJ
	uaqvtrBSb7uv4DGjjImpiWMQTo4O8YGreg==
X-Google-Smtp-Source: 
 ABdhPJxiDUeZvcCz4n3mXHk3KA9/3LkdxpRKBIk4x+LWXJibaUe/neRY1pAVcgQYl6kevj+Wuz/dmw==
X-Received: by 2002:a63:d754:0:b0:374:35db:1a8f with SMTP id
 w20-20020a63d754000000b0037435db1a8fmr3508794pgi.489.1645404816540;
        Sun, 20 Feb 2022 16:53:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 s24sm16770546pgq.51.2022.02.20.16.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 16:53:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] iotop: Disable lto with clang for rv32
Date: Sun, 20 Feb 2022 16:53:34 -0800
Message-Id: <20220221005334.3125600-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 00:53:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95395

clang/rv32 is mixing ABIs because defaults are ilp32d for OE but when LTO
is used it pulls in ilp32 internally so disable lto for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/iotop/iotop_1.20.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.20.bb b/meta-oe/recipes-extended/iotop/iotop_1.20.bb
index a044c9b248..2900264f79 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.20.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.20.bb
@@ -13,6 +13,7 @@ inherit pkgconfig
 EXTRA_OEMAKE = "V=1 STRIP=true"
 # Fixes llvm-bc70b5.o: can't link soft-float modules with double-float modules
 EXTRA_OEMAKE:append:toolchain-clang:riscv64 = " NO_FLTO=1"
+EXTRA_OEMAKE:append:toolchain-clang:riscv32 = " NO_FLTO=1"
 
 # Workaround BFD linker crash with clang on arm
 # revisit when upgrading binutils and see if its fixed
-- 
2.35.1


