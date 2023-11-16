Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1DFC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:31:06 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.2809.1700123463692680616
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nmINmPjQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9e1021dbd28so74937766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 00:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700123461; x=1700728261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QfANcZAMCKBs0KqIdPB9Q3FlkVGI2ENPZymthRLeKJI=;
        b=nmINmPjQ7fL8AZIAmCq463MBMsXQJ77NSuZScSU6W3aKtrGV7eA4btotcaq1vY5/Nw
         lyEazoBtWGxKbh6ntQxSsWwFgXYDEXOd2vv+s+6rV1Q5NRUxRN3zx3hkNhoLY0mLpM1u
         G9mZa4lEWUpX5IzOvsMy3lcGTPTyUqymTBOXnTbq8B1B6Z+L8awbbUxbLQwkP7bcLcRt
         0SjlVEx70Z7YxlxgTZi3aO0BF/3URnpadeBVZ8DP3UOinsRyNluPRuHxpngloHw3ihUF
         VqR1AEPyPz919+OD8+Hlzm3PCsDmMmf7NBp/do0umxqDzen3m3I4bPaeT/09/eY/PBUU
         4MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700123461; x=1700728261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfANcZAMCKBs0KqIdPB9Q3FlkVGI2ENPZymthRLeKJI=;
        b=K56GG6/RgSY4aS3l5y9IKLLLNCwqbtVFjXBOxt4MqkHdmgCEOj4GNFhSlmAZMhpkWJ
         wAVpJc75sdPmxaUEb/v/CB0luu8Tn4REz4Lxh2IKBd1EDw0E5ipKXfJ2ywVrbVgMu9DJ
         pL13gMVBB22mLU5oZB4uVT399hY4gJLXbIrJokxlv0rIHRaQU1vy7J35mBmAG1KYj4FG
         8mVh6ND3qwabvxwaNF4ZlpZQwyK2H3OulPwVzMUgjmf8Ih6VWq8J4cQmq4QahGr36Hoa
         njS/uJKuVnaquuPhP0dBA10LLs5RcULInGqMhFwwytyHYR0RNrTIRP9NOjvOLXp/KepV
         BP2A==
X-Gm-Message-State: AOJu0YxeS5TEcUhgF+J3KhaVfqdaMfOCUTykU+3m38JWjwFij3RcXUWR
	HKfKpDIuDJMphzWBUYzZFQbIvpNHNEKPsw==
X-Google-Smtp-Source: AGHT+IHYswIX0azPvBRZEliX9BW8ZkuUFBXXZa/EVIDsTPxSuDwht4rUesMQfAXPmwirYjSi8OvDJA==
X-Received: by 2002:a17:906:3754:b0:9c8:f128:2fdb with SMTP id e20-20020a170906375400b009c8f1282fdbmr12255872ejc.13.1700123461195;
        Thu, 16 Nov 2023 00:31:01 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id g13-20020a170906348d00b009a1dbf55665sm7984801ejb.161.2023.11.16.00.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 00:31:00 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] ledmon: upgrade 0.93 -> 0.97
Date: Thu, 16 Nov 2023 11:30:50 +0300
Message-Id: <20231116083050.132470-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106797

* License changed GPL-2.0-only -> LGPL-2.0-only

  - LIC_FILES_CHKSUM changed COPYING -> COPYING.LIB for LGPL-2.0-only
  - Changed license headers in required source files.
  - Changed copyright years to 2022 in modified files.

* 0001-Don-t-build-with-Werror-to-fix-compile-error.patch removed because fixed in the new version.

* libpci was added as depends following this error -> configure: error: Package requirements (libpci) were not met: No package 'libpci' found

* pkgconfig added as inherit following this error -> PKG_PROG_PKG_CONFIG: command not found

Changelog:

It can be followed here: https://github.com/intel/ledmon/releases

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...ild-with-Werror-to-fix-compile-error.patch | 30 -------------------
 .../ledmon/{ledmon_git.bb => ledmon_0.97.bb}  | 17 +++++------
 2 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
 rename meta-oe/recipes-bsp/ledmon/{ledmon_git.bb => ledmon_0.97.bb} (71%)

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
deleted file mode 100644
index 09f4993a2..000000000
--- a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Subject: [PATCH] Don't build with -Werror to fix compile error.
-
-|   550 |  _dump_sgpio_amd(&amd_reg->amd);
-|       |                  ^~~~~~~~~~~~~
-| amd_sgpio.c: In function '_write_amd_register':
-| amd_sgpio.c:558:18: error: taking address of packed member of 'struct amd_register' may result in an unaligned pointer value [-Werror=address-of-packed-member]
-
-Upstream-Status: Submitted
-https://github.com/intel/ledmon/pull/48/commits
-
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7bc20f8..7e01bd5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,7 +22,6 @@ AX_AM_CFLAGS_ADD([-Werror=format-truncation=1])
- AX_AM_CFLAGS_ADD([-Werror=shift-negative-value])
- AX_AM_CFLAGS_ADD([-Werror=alloca])
- AX_AM_CFLAGS_ADD([-Werror=missing-field-initializers])
--AX_AM_CFLAGS_ADD([-Werror])
- AX_AM_CFLAGS_ADD([-Werror=format-signedness])
- 
- AC_SUBST([AM_CFLAGS])
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
similarity index 71%
rename from meta-oe/recipes-bsp/ledmon/ledmon_git.bb
rename to meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
index dbfd1e7bc..158342dbc 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
@@ -5,28 +5,25 @@ DESCRIPTION = "The utilities are designed primarily to be used on storage server
 "
 HOMEPAGE = "https://github.com/intel/ledmon"
 
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-"
+LICENSE = "LGPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "sg3-utils udev"
+DEPENDS = "sg3-utils udev pciutils"
 
-inherit autotools systemd
+inherit autotools systemd pkgconfig
 
 SYSTEMD_SERVICE:${PN} = "ledmon.service"
 
-# 0.93
 SRC_URI = "git://github.com/intel/ledmon;branch=master;protocol=https \
-           file://0002-include-sys-select.h-and-sys-types.h.patch \
-           file://0001-Don-t-build-with-Werror-to-fix-compile-error.patch \
-          "
+	   file://0002-include-sys-select.h-and-sys-types.h.patch"
 
-SRCREV = "1d72f9cb5c9163b2ecdf19709935720e65f5b90e"
+SRCREV = "b0edae14e8660b80ffe0384354038a9f62e2978d"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${WORKDIR}/git"
+
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
 
 # The ledmon sources include headers in ${S}/config to build but not in CFLAGS. 
-- 
2.25.1


