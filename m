Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27081C4450C
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:45:16 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1212.1783903515737480319
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lO5xN7gP;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca957432c7fso1791311a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783903515; x=1784508315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4yX7Nuozxd+fKDI1PlYYkgthVkwZn3vbHpy5pDAt4E=;
        b=lO5xN7gPT5EjrniFa9G4doLKQ9JLQ89Xh5I9gt++qL/iCEgSju7HUb5I+nQyI9LeEW
         4k2tjo8qwCkO2XkTIkM5NXwo0ElRW1ph0wMhG7in0NJLMd7g1ZRiWKQOppgHepkWaqmu
         Ya/zTtJG2ntcD62ZAXd+tObBRVu4e8Bhyb7lWWGef3xfyfatU0QI/LdhoBU7hD77YpM6
         OatXZKkLKAMHCT8lqJWd3yIK0jcITUsPtcZN0jrSXijY4HOqb4umhT3NfIAZnKsWDLiw
         pY+uXSOIXvHkb3eKjvL7f7sv6zK0B4DkQy6sn/yNkRd9Apj6VaS6THddPAluE6DAhU5d
         Fc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783903515; x=1784508315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4yX7Nuozxd+fKDI1PlYYkgthVkwZn3vbHpy5pDAt4E=;
        b=i8Za1pyYpl3wMA/HSPSMOYh4MdQKDuNPl6om2Y+8teH4ix9VYoe1rRZQHu1awHVNum
         YT6L1eUOFt3ifJO/uKdTGnZBcFma2/QkMpXiRw7G6pgMDRLvg1qBD5WrfzJNW+Zdz/Hj
         YoPgFOLnWCyk3Ws7rDXdV67kqyCZ6AP5USXLV8IF9vRElMmBrWM/QC2rRLIZf8MBdU1D
         W1N4zWvuXSktm6KsBjXAfCQo8DeHU5GMjgScd9UWBs2B+ejFpBuQifhwTjiRPf+xw7E3
         BOQrViVTtOyrdSWIaV6bld2S+Xumb1feplQXDFHlj8Sf6uS5g71Rtx5fLphC1fVul09N
         owtQ==
X-Gm-Message-State: AOJu0YyOlMGHcJYKp1E1ufvKN4W3Ohvy6tzFd6hVdGWAWz+mUqB0HfbQ
	VV8uR3xDNIX5egs7422lHrVVjiYE3PWPA7GRQJwBbWZiqfmMLmOGn7oUdnzGrbQsMVg=
X-Gm-Gg: AfdE7cm0KnKUEFYI1qtyIaZJcbfSyrxowBEc8lArQNw4sDmzw04rCuJ3xbMq75i2xCT
	zhI4b8xRaeVwG0jTFvw/gMwBbZSIonPSxMxqjeUeykvRJN+G3RlGYb0KUoayIFaYQPYFLrEnlW/
	HNJz8arc4/Cl7wYwwShEk2/TckqnT2BkLgmpgUx3gIdBiykSwwK2fVIHqnOyq4aZy1BKv+rT1zJ
	nSYFofLXTPKiEUtGO5y67AqdNLpQ+aFy+/FJwjzDi3gAFsGGVii7gs0ljtRlK2IKmZQYYcp5W4c
	HoWT4xbl2iMBcX5ail1fpcEKUeRM9JDBdjpYLt0MblZjBIq+fW2hJu727wbN3Uku00JV/HiJ9+z
	FHD0JZ+yyNMe4tZMVvjr+mxaqBjkBUpt2VZpSXG/OcmLuHGn98PA08JzqAhGMoWAHTvBiNRIGAW
	yy1LtDUtu84J8dR74lC3ybN1DAeKjFCya+70UJt9F1eb5ZXzPGNZnu+YtJarvafg8LP0xaamWS4
	MBDrTN42t/+NQPzyfvVbuQLTZHt+pJYyVzC3Y+YwcPJgF2c3s0m2bS/UpncAuWK0hVDJuVTnmY7
	3aPe3A07y910BiaRRpVg+M4emtZwCg==
X-Received: by 2002:a05:6a21:113:b0:3aa:c93b:625b with SMTP id adf61e73a8af0-3c110762fd4mr7527692637.3.1783903514992;
        Sun, 12 Jul 2026 17:45:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm71206990c88.7.2026.07.12.17.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:45:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 7/8] bpftrace: fix patch context so -fno-stack-protector applies to test object
Date: Sun, 12 Jul 2026 17:45:01 -0700
Message-ID: <20260713004502.716970-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
References: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128149

The 0003 patch that links the data_source test carrier binary without
the host runtime also adds -fno-stack-protector to the object compile
line, needed because host gcc toolchains default to
-fstack-protector-strong and the -nostdlib link then fails with:

  data_source.c:212: undefined reference to `__stack_chk_fail'

However patch 0001 (DEBUG_PREFIX_MAP) runs first in SRC_URI and rewrites
the same compile line to insert ${DEBUG_PREFIX_MAP_LIST}, so 0003's
first hunk no longer matched the tree and the -fno-stack-protector flag
was silently dropped from the object compile (it only landed on the
link line). Rebase 0003's first hunk onto the post-0001 context so the
flag is applied where it is needed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...cmake-BuildBPF.cmake-link-data-source-binary-without.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch
index 7a69d0f8c1..695f709d6b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch
@@ -62,8 +62,8 @@ index cb8cd68..8aa059f 100644
      OUTPUT ${ARG_OBJECT}
      DEPENDS ${ARG_SOURCE} ${ARG_DEPENDS}
      # See above: fresh compilation and the use of `gcc`.
--    COMMAND ${GCC} -Wno-attributes -g -I ${CMAKE_CURRENT_BINARY_DIR} -c ${CMAKE_CURRENT_SOURCE_DIR}/${ARG_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
-+    COMMAND ${GCC} -Wno-attributes -fno-stack-protector -g -I ${CMAKE_CURRENT_BINARY_DIR} -c ${CMAKE_CURRENT_SOURCE_DIR}/${ARG_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
+-    COMMAND ${GCC} -Wno-attributes -g ${DEBUG_PREFIX_MAP_LIST} -I ${CMAKE_CURRENT_BINARY_DIR} -c ${CMAKE_CURRENT_SOURCE_DIR}/${ARG_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
++    COMMAND ${GCC} -Wno-attributes -fno-stack-protector -g ${DEBUG_PREFIX_MAP_LIST} -I ${CMAKE_CURRENT_BINARY_DIR} -c ${CMAKE_CURRENT_SOURCE_DIR}/${ARG_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
      COMMAND cmake -E env LLVM_OBJCOPY=${LLVM_OBJCOPY} ${PAHOLE} -J ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
      VERBATIM
    )

