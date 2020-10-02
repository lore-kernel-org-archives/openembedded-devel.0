Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.254.1601656010675496992
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2020 09:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UaLOi1Gv;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id m34so1089235pgl.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2020 09:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zGAJHI15dh8BmcwESNYtwAICKDhoCB3SGSkRn8UFsa4=;
        b=UaLOi1GvHmTF3LlN5v5/+eO4rGnF4QOXeQg+ozLarjYvw+3SdWx7xlBDd734jvWciu
         c2B8li2DT5puy3wzhRgmcS47f3IjeAMTH+DYok3wSD8C3LJu0AMNzvUmyiRROD1tkpAL
         76f7OmigD3cQE+5ZFcUJgFdVI8K1XarLhm4Fhj7r8NuNS9TpJIToVQ2n70dPfx+m23qg
         e1LcAOon/2VJ75RqdgpKBIEsFWQ5hJlwZiV82wkmDTBa+DUKbfcpP6e+5ri/iiurOzLd
         XcAjO0iV3QN+NVDIgh0ciCI+U81qrkVtNomi7ERxNJqwVImM8Wj6oQmvZ3o95PqR6+8x
         P2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zGAJHI15dh8BmcwESNYtwAICKDhoCB3SGSkRn8UFsa4=;
        b=S93FWeUh/uG38mGZphDe71UQ24hdFbhfMZ5ZGPpAJy+o9onuS/75j/8nWyghcqzOm8
         ao+zzeX1TWn7IW3fmcEpFxv0pgdieiBWfDY17tyjMMkUK+PPEBL+meUhn9SdCjrKbg5v
         Vd11IszMuQKxXtwqI5N5dixgeUK1gmrRhbIWJJZNBm2/K6pQvsBpf0kZOmgu/XYMvgZU
         ZTC6xonRC0Rm49Pn0cHxwLP4EY9I2xiIZlSMTPNIx8On7Y7nG7DBEj6X5FYneBM78lRl
         TdEgWrCvne08Q8d5qayDrTCc4I25v99nauGUKFVBXQr9vIETEvBDtdhY4HdNXeVaSLUv
         ZGCQ==
X-Gm-Message-State: AOAM5339sf/pzIjZiIiH8fFs2SBBcqZ12Ki11uR3jP0g6blZ9buLF1YL
	MN5vCgEHbDDe5KA8ajAlvdY8DVjXGeVpHg==
X-Google-Smtp-Source: ABdhPJxcqLB/zlaCKejj7Osdkd9+gokzRWM0t6mZ+w09dyb2fLyaR+Utraj4T04VUQwidtI8zBbL0g==
X-Received: by 2002:a63:7d8:: with SMTP id 207mr2869765pgh.173.1601656009837;
        Fri, 02 Oct 2020 09:26:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0:923a:5c32:ada4:3e27])
        by smtp.gmail.com with ESMTPSA id p6sm2480131pfn.63.2020.10.02.09.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 09:26:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2] numactl: Link with libatomic on rv64/rv32
Date: Fri,  2 Oct 2020 09:26:47 -0700
Message-Id: <20201002162647.176613-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
riscv64-yoe-linux/10.2.0/ld: ./.libs/libnuma.so: undefined reference to `__atomic_fetch_and_1'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Also fix rv32

 meta-oe/recipes-support/numactl/numactl_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
index 75e4435db0..504fe03275 100644
--- a/meta-oe/recipes-support/numactl/numactl_git.bb
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -25,6 +25,9 @@ S = "${WORKDIR}/git"
 # ARM does not currently support NUMA
 COMPATIBLE_HOST = "^((?!arm).*)$"
 
+LDFLAGS_append_riscv64 = " -latomic"
+LDFLAGS_append_riscv32 = " -latomic"
+
 do_install() {
     oe_runmake DESTDIR=${D} prefix=${D}/usr install
     #remove the empty man2 directory
-- 
2.28.0

