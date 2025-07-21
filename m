Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1161DC83F27
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 04:00:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.32562.1753070439265228160
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 21:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jQAFq2oH;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7426c44e014so3538224b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 21:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753070438; x=1753675238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9PSrkV/ln2HPludKi+8EYYhpEKuPOfNBxBxdVvgrQU=;
        b=jQAFq2oHWBK5yDW8sYEo5p9ZgztgIYTzNKx1u4psu8Rom84XLSIuVUYdzNlpnA2rsu
         eeYx45wyZ0c6tIwBQAAT+xDEpAQIy5f/yMHrQK0plVIYE3yCDoYZ1nlgntwF3dTMhNEc
         1ZerKjquMrjt1VT8lruIbDDSb4F3DYqtcIFyhM1TNUQ/wv9kYbYXyRZOf6H67O93kqfk
         4tAOYcB4eD2XaraMR0SPMSZlZRR4psYsPlqUoh6T6ez8D5HVRqVKGDQVbqir9L72QzIv
         w6NA5smNEHrw1uBIdrtPnTSRuLEGxzZKHB956D/xhaa5BL2rtphVcQYXXPzcV8+hirsd
         MV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753070438; x=1753675238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9PSrkV/ln2HPludKi+8EYYhpEKuPOfNBxBxdVvgrQU=;
        b=jPTxhWEavKUlKkdGPhIvfsbpwxXrZ2JJ6WuO/rQoRvwe0Rk8bzNdbZZP4bjEFKoiiD
         H0+Auy5emubpOfe3f7OoUO9nJzTbPE0wVDOuKjxybBisV5uvAaz2zs6zTllHnw7NJ/DB
         2IvkWP1Qgkd7gimMd1Qm6MlapkoPAVkiv6VCN6B8WvNbyPpyqyjybXtuu5CFrO6qItVi
         skww08/EIrsecjyx/xeFfH1EYmTkYnYcOZx1iBO/XL9GqTrNrv4A3x7dv0dsNDMGT9XE
         CVyKeiuPM7UzR7XPS03asXILl6aBajnsif2BsLa+a8BaijzAV2RSWXzW2XqHCNKFA+8D
         +98w==
X-Gm-Message-State: AOJu0YxdFfwxPyRrR3nFv8qTXrb0pzcfzBuOjg0hXK0B5CNL1wzGhKz3
	cnrnTHJXZnAKfj+QTdpA4vM0QuXV2LcxGR2GBLfWaRhz/wh7Tw+8W6qhNhHrOH9tMiM=
X-Gm-Gg: ASbGncuwGJxdVKsVNM2SEpuL2xL9rmLk6zfGNDpdd2DKJYqqaCMOwom2VpX+pw0iJDM
	ZZw1zUnn0r+HhraObMesDeO5FYC6jVPneweODYDyeHzfE9AgRz43NqFj+/FtjNTyoImU+EMkuNy
	njpcN+YRzYBs+t2i3HHgPjUHC9a7vHGLlIzIF4YzRq9G730j6007BG5E6aBBTr9nD4zfoZd29w5
	74qlZc6cvXVm94Zrl+c61FgnhNQWqJM7vZSZzvBZglBz86DMvmYeept/xQgMgV1q6XeRsFozCRs
	5gRuDkZxNYb+TTBX6sUUdZ5aDByQkud0KycWnvCKsg88dusEummM+PRbdrQqNVGfqqA6mXkS1Er
	lK1NdTonAaTmc7A==
X-Google-Smtp-Source: AGHT+IFnFYxJ8aHVWFffSdnqI1JLBB6n7L1HDkBO7dBMmbzvbWcCiAQKHNGk0kN6LDR3voMpn/kdrg==
X-Received: by 2002:a05:6a00:ac0b:b0:757:51d:9dd9 with SMTP id d2e1a72fcca58-757051daa11mr22173291b3a.17.1753070437933;
        Sun, 20 Jul 2025 21:00:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b985])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d5e73sm4812987b3a.59.2025.07.20.21.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 21:00:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 6/7] aufs-util: Always use libgcc as compiler runtime with clang on x86
Date: Sun, 20 Jul 2025 21:00:29 -0700
Message-ID: <20250721040030.641212-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721040030.641212-1-raj.khem@gmail.com>
References: <20250721040030.641212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 04:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118649

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 913b2c1d32..61ec508b43 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -21,6 +21,8 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 PV = "4.9+git"
 
+#i686-yoe-linux-ld.bfd: /usr/src/debug/glibc/2.41+git/stdio-common/../stdio-common/printf_fphex.c:123:(.text+0xdf): undefined reference to `__letf2'
+LDFLAGS:append:libc-glibc:toolchain-clang:x86 = " --rtlib=libgcc --unwindlib=libgcc"
 
 export HOSTCC = "${BUILD_CC}"
 do_configure:prepend() {

