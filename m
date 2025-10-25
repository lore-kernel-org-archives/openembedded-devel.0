Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203F1CCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:34 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.956.1761363624412757785
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XwZvblln;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a28226dd13so1740244b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363623; x=1761968423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/tQKAfvBl4RKpenk43bL5NNS/D0ixXJOKI9cRBj9Pk=;
        b=XwZvbllnASTWmuwXnUQuS0efx+8z3UEV4SjV8lqSnBXxqFj1XPp91IRUjkL4S3Fdk1
         aV94RWz1lzvhHQW6fwcb314FUMVTI1ke9TY3OEHRNKWdXniJeBFqR58RNTuQWgtVQTwC
         jhSsSScvZueTdIe0tbl2b1YBE/wJ8ijXjp0/Hgxuz2RUkvQdomMlcQLxoBH8mnqZUjqx
         97EV313qAuWHTzYi3LrPIyup44cck678ZuSv6xmZOLpgldGBdccmS42tHdFFtmiTa7Wu
         TC1lN4llWg5SgAJ6in7PuKWqP7eFe/a5PXzLqvU5p+Vh0MPrUXQVZDL05Boz0j8HaAa3
         Pa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363623; x=1761968423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/tQKAfvBl4RKpenk43bL5NNS/D0ixXJOKI9cRBj9Pk=;
        b=RuYcqy2Z8dnjj8viZ0TGP8tp4ywlsfkRNWKxDVRhQBN1NPKl++wcEcY5KdcM+DNH4p
         oZQvzEpiZiI6jvuMU1oJn6BUBsedlb9uBXMqv+Yv2+uZQMQj8J7DTkACF1xkD+DLdS62
         JEjKG17LMexslyLLQyiZM+ofTNBUeb/+Svt3hRmBB4IpnruQXmBeZ9iQOL278yXa+O8k
         zZ+hyV73zbXgHIN5UgVXVwP4YObdcXvFk2b5GJq4RKUvwOtP90/BBc7dPcZed4lAzwRh
         qY+3ZB0g3uxi8TTFpBZgj2I0LIh6O8j7MRrq+G4PIlh/YLkrhmGtn1YUgqgn/meln8XL
         CQxg==
X-Gm-Message-State: AOJu0YxsHcGPVYaxoyayuW0wV2HzMjeRj+dcGH47N/JqoAnIWG6TVDCw
	6AZYPW0nHgoWOIGzgwnxd/+LyWXLGGu6o40CamFZC9Z1k4yoaR2V/SraN3ZV6d8y
X-Gm-Gg: ASbGncumprHXiKJvWpawq6vu2HkjrYwVeV+rFxM2BKBpeTO+Xdoss4rTg3CKt5d+n/b
	mqALlm4jo4eZYqgThSFeMjay0xOQNSy5DKnDT8+5iUG+cFlckTUrSr+ETAeAc1/6fyE5Br4ETLo
	YIoKrM5NJfaGJX0lkT8Ygca+LAdvvZPJWG9awJ2PbE9hmEVXId0VJ5/97wUoUYX9pOrjUrO61lZ
	g1URhHi6TyJmnakCM2yUQgIsd/eyOxiCd8Otsx66ykQfr1bXN6weAB1Mg/ndfjkHCLfcpmYm4to
	CFPRQLn6pEKnOT7mDuI63mpG/rdk2EVMIrfWx1BFAYZnGKU2xdJVCNL76pkRYZlC776bZlyLlUa
	HqMGExmjOsoKGEbVGfGenWFV2ReQfiFRKlta4xOqheCSSe5n714SAEtOVZreol5GXcVIZeqTHmw
	ZwwfioRXlR8yInwpzRhQpl9Af147+/5yWz8X4vUQmOvSaK/6m7fDV6tPNHvFBQgw==
X-Google-Smtp-Source: AGHT+IGyhboJ9hlPDjMufdDN4hMxe2UlE2pB60n8V5YZK5/LK3LFTL6XavRNVgmwV7pGIevQ8YQNsQ==
X-Received: by 2002:a05:6a00:2e18:b0:7a2:89a0:92bc with SMTP id d2e1a72fcca58-7a289a09a00mr4921499b3a.31.1761363623446;
        Fri, 24 Oct 2025 20:40:23 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/11] rocksdb: Link with libatomic on x86 when using clang/libgcc
Date: Fri, 24 Oct 2025 20:40:09 -0700
Message-ID: <20251025034017.2071643-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025034017.2071643-1-raj.khem@gmail.com>
References: <20251025034017.2071643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120988

Fixes
| i686-yoe-linux-ld.lld: error: undefined reference: __atomic_compare_exchange
| >>> referenced by librocksdb.so.9.10.0 (disallowed by --no-allow-shlib-undefined)
| i686-yoe-linux-clang++: error: linker command failed with exit code 1 (use -v to see invocation)
| ninja: build stopped: subcommand failed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
index 4b15f538ff..c6d5a0ec7f 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
@@ -29,6 +29,7 @@ SRC_URI:append:mips = " file://0001-replace-old-sync-with-new-atomic-builtin-equ
 SRC_URI:append:powerpc = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
 SRC_URI:remove:toolchain-clang:riscv32 = "file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"

+LDFLAGS:append:toolchain-clang:x86 = "${@bb.utils.contains_any("TC_CXX_RUNTIME", "gnu", " -latomic", "", d)}"

 inherit cmake ptest


