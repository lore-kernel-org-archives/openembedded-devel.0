Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.3594.1618693605293126211
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gFPgjCf/;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id g16so7336598pfq.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DQvRYmUREBpJZUXB+OoEJLKu7WbbZpJOel5pYlDACnU=;
        b=gFPgjCf/KhYtzOMS6oZsrcBLEH4n/fmn9S3UVlv3LKzzjZgclEtiXdAqr+9+OiErnJ
         4alIJbZJw/O7RqNozdiAS2vk63gNEGODlN4wdtnncL7P8a9R9BuxSUGP7dr10XqcQvmc
         dL1Y+EH/S6Mv/7zpBfbRNnXfxD8WhlOTqf5U3Q25rzgj/YSd+pVQrASgAWDSK52IvGiC
         FcdKPLBDLdZ1dMrwV0mUcm20e0dimMScdcyeelitwDnQbRNU5mumkEXFpnJpplUn/lok
         efa8rcA1hoLK9AJq/lDPuXzYS56uPTe9Bo+GQccPoiiuHTLQ2BMt/jSRT6I7XZXzTUgJ
         Hr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DQvRYmUREBpJZUXB+OoEJLKu7WbbZpJOel5pYlDACnU=;
        b=InFPGoF2eeI1jVLmNA5TUGkQ1E2J46tVsbuvuQTVrjwICXDurS/E2b60koz5hJOrlC
         0+MnDJdHNbNM09dOBbGbUTWd7oMhfYVrUWb1vMMUqgEOH5rvVrWpkEWdGZYAcPEVmqMe
         A+YGCp+3I697TvTSa/80om3Wp5XayxvMSO5m7eaB+pFmpemsCPIR0mYYCLBBdT17dKCz
         p3ZLHrUNUiZ5K4psRDF5GOnYPwMP2Yuu8wn4dLq0nXK5+T3tfQbAxxs43HZZL6lOhAs/
         D7X3odb72vRvAR6MN4TYrQmegpy7iwb3XjG/DffhmTk0DbBK8SoFMU7KjeQVJhw8s/h+
         VAgA==
X-Gm-Message-State: AOAM532sd3khdVImDSIwGnI/9cThQXFIKYyKoJgwU3vjk67xyjLzkMe2
	8uC+7KhzWgyQ08+bAxumYiFe3Udrd08Zkg==
X-Google-Smtp-Source: ABdhPJzlR07flW5HIweotfSxEWYDav7v9OrmLSIX1sRn/LQNA8mjiZl+OIZgQKPzBhL6HB8ng3Ndgg==
X-Received: by 2002:a62:e418:0:b029:259:d26b:4fa7 with SMTP id r24-20020a62e4180000b0290259d26b4fa7mr8680344pfh.7.1618693604731;
        Sat, 17 Apr 2021 14:06:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:44 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 48/50] uftrace: Fix error on aarch64 when binutils update to 2.35.1
Date: Sat, 17 Apr 2021 14:05:57 -0700
Message-Id: <5bd3bf081d721668ee75b39fe7c087c2318a9e03.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1c894d6876c439e362e761176b09f863ee2c689)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...error-on-aarch64-with-binutils2.35.1.patch | 27 +++++++++++++++++++
 .../recipes-devtools/uftrace/uftrace_0.9.4.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
new file mode 100644
index 00000000000..ac17cf433f9
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
@@ -0,0 +1,27 @@
+From 0bc502989822506af308a559ac1cd52af82cac03 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 14 Apr 2021 09:35:35 +0900
+Subject: [PATCH] Fix error on aarch64 with binutils2.35.1.
+
+WARN: child terminated by signal: 11: Segmentation fault
+
+Upstream-status: Pending
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ arch/aarch64/mcount-arch.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/aarch64/mcount-arch.h b/arch/aarch64/mcount-arch.h
+index 69efe521..60c2c1ba 100644
+--- a/arch/aarch64/mcount-arch.h
++++ b/arch/aarch64/mcount-arch.h
+@@ -31,7 +31,7 @@ struct mcount_arch_context {
+ 	double d[ARCH_MAX_FLOAT_REGS];
+ };
+ 
+-#define ARCH_PLT0_SIZE  32
++#define ARCH_PLT0_SIZE  16
+ #define ARCH_PLTHOOK_ADDR_OFFSET  0
+ 
+ struct mcount_disasm_engine;
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
index a3d06021825..4b4fc831c3c 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
@@ -13,6 +13,7 @@ inherit autotools
 PV .= "+git${SRCPV}"
 SRCREV = "d648bbffedef529220896283fb59e35531c13804"
 SRC_URI = "git://github.com/namhyung/${BPN} \
+           file://0001-Fix-error-on-aarch64-with-binutils2.35.1.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.17.1

