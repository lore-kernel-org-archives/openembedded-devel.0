Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.3687.1615708032555892014
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 23:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V4ZlhUVm;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id z5so13838091plg.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 23:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dCRtw8kVDH/ZwBkC7T3lRJjv7FHTSPeClXT4YMuKRF0=;
        b=V4ZlhUVmE0K0zGwVU68C28WMGKgwq64JwSS43hasqJiTlU4fiFIn67LMkkxsTQhCdG
         EEvOcEeI7GWy69rSkuhifOI9FAMUWA51lzvvmKbmu6EQlEX3lZKzfltUippRwoevntah
         uwv01q2QmR+UURddxDMt7u3D2bRESpYOGKDRoHayw+HCm9M/zID+nRLTTO4japD+6C10
         /tBA8ZZX8DeOuLHGzUATdL/Xf+6BiqWI9y6GvW/8Ka/VR3pAHE5C8GKSKwjaULHPqgkP
         jzieSSi2oruRuSMgwlbPCCCqOMd7ubD+owyWPfCZ7FMhMRWmEc/1np+WOACGBM7f0u1z
         v4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dCRtw8kVDH/ZwBkC7T3lRJjv7FHTSPeClXT4YMuKRF0=;
        b=ufbq26blcBiWLUyTRNMvSCT4lWR0tQ2OEnz/EX4K5MbLZZh3WnGH2vahqhp90uwPgQ
         Md7s5PgQEy0znd0UTnftjuvw9fA2idq+MOCrIswEaOUbn3OM7GOpENkl+DT1WibnblKX
         HHp9HUFwN8Py2M7cG6AF5LHkSCfh2n3+2HgnAx3UfsYC/rZosJilE2E6ItbcwtHlCgMe
         DSPbaM9z3U44AvR88IUToFm8sBhYYr4y0G31GRJKEioYmEo8IgCUyO2+Upv+m1LJvwJg
         mtW+hz54sQSD37QQieCgDCQyiCuU5hbE6HW3q+ib1ynlg/7wkxbRzaMgj4Qtjg1ctTj9
         SqkQ==
X-Gm-Message-State: AOAM532y7khdufTHyq+k/qty63XVdVqz1OtdE3xSbexMEDn2BKnCSrih
	kKG0u14Jazt00kFcL9ENgMG4tIYu3Zvgmw==
X-Google-Smtp-Source: ABdhPJyAUiKxY5KIqqlpxH8Jc2cIOHGUrvv/VqAABq4V4wnt0ceodN3oCVLCgu7zza+o7Dw1SfbwCw==
X-Received: by 2002:a17:90a:7e4:: with SMTP id m91mr6651964pjm.46.1615708031447;
        Sat, 13 Mar 2021 23:47:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id mz11sm7100630pjb.6.2021.03.13.23.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 23:47:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 3/3] kexec-tools-klibc: Use SITEINFO_BITS to construct includepath
Date: Sat, 13 Mar 2021 23:47:07 -0800
Message-Id: <20210314074707.302060-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314074707.302060-1-raj.khem@gmail.com>
References: <20210314074707.302060-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps getting rid of per arch overrides

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index c49b24f52f..656162fb1a 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -10,7 +10,7 @@ PV = "2.0.18+git${SRCPV}"
 
 DEPENDS = "zlib xz"
 
-inherit klibc autotools
+inherit klibc autotools siteinfo
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git"
 SRCREV = "5750980cdbbc33ef75bfba6660295b932376ce15"
@@ -66,17 +66,8 @@ EXTRA_OECONF += "--without-zlib --without-lzma --without-xen"
 
 # fix purgatory/printf.c:2:10: fatal error: limits.h: No such file or directory
 # fix include/limits.h:42:10: fatal error: bitsize/limits.h: No such file or directory
-COMMON_CFLAGS += "-O2 -I${STAGING_DIR_HOST}${libdir}/klibc/include -I${S}/purgatory/include"
-CFLAGS_x86_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
-CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
-CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
-CFLAGS_aarch64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
-CFLAGS_mips_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
-CFLAGS_mipsel_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
-CFLAGS_mips64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
-CFLAGS_mips64el_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
-CFLAGS_powerpc_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
-
+CFLAGS += "-O2 -I${STAGING_DIR_HOST}${libdir}/klibc/include -I${S}/purgatory/include \
+           -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits${SITEINFO_BITS}"
 
 do_compile_prepend() {
     # Remove the prepackaged config.h from the source tree as it overrides
-- 
2.30.2

