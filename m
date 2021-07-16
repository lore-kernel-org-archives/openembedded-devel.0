Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.96.1626452563603442719
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 09:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LGAs1g7T;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id cu14so6739594pjb.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oKg1Hu3ZQ7h4XWNxoSwNtjOmCeBGUDqtdGWYoDUtv7Y=;
        b=LGAs1g7TJDtaQgl4m9Ph0y8PGp06Fnj+PKZfk7C/jhplI4OqVc8V4H2PLUsunQ9xzA
         z9DNQ59NyiCL2/H1QXKkD31DSaWtw9eLRcUMmgKe1lwnafIN6q9FdCaLutf44bYKB7qh
         nrffj/dzFph+26fnM1mQqqU+tDALTY1bRQwXdqkZLQ+agKHF3/MnyVnJslJwte7J387d
         +106H8KikciXWekAS/Jr42NN3Lj3+gRVZKoi8LiLbuZyw6OgYU4wlkN8BZ8wwkEFJvK5
         03k9KO0GRWVVl1v7Sn4P44jgXmmEZ7YwI+DkYdlhhZ8hkojEkVYTCOApUfA1vj5kmJZy
         Jt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oKg1Hu3ZQ7h4XWNxoSwNtjOmCeBGUDqtdGWYoDUtv7Y=;
        b=UaDoTXhYFWpS//SygMM5hjuSEL+Fvc7+zVnlUmWGlX4pR4bJ7B8ZMdnp9wjSqeXQSE
         nI9jXJAOAGQv/+p7QWE07wgb1qjLjTO2V3d3EC6hIpgHgp2+u/uu5PXYCf9jE2E7sTuS
         aX0B9c6yGnORhsCsTZVDKITYWdQ82Zox58Ahjpd7fWdqnXibQR3A0xd3sWiR2MA8EBso
         KuoxxsG7smVNWiWhR+OnSdyBhB9zpDuEM8oVE0TkqhEJdNkMf/YQRpX3WqmEBlzU3bfS
         Shc9sOfMDcghd4iM51welLCYiXikTFtCfnMjVAkM+7tswddH62oF8CTdbsO8uu22BONJ
         tK9A==
X-Gm-Message-State: AOAM531OEH325weqtxMI//wP7c2duw4blJdA5IVhg/tMJS5Vk1Jg12KD
	vj3MsWI6/gK8aEyQhDMICi+kYvxPAI5aDg==
X-Google-Smtp-Source: ABdhPJyqCBslfA5u6dTxMJGjGL1gBYYr05TS8rfeq7B6ZehS8DxrWNjK3cyDUUlu3jfGTYuRqhdsYA==
X-Received: by 2002:a17:90a:7e13:: with SMTP id i19mr10503942pjl.23.1626452563051;
        Fri, 16 Jul 2021 09:22:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id f31sm11715868pgm.1.2021.07.16.09.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 09:22:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: David Sterling <david-sterling@users.noreply.github.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] can-isotp: Upgrade to latest on master
Date: Fri, 16 Jul 2021 09:22:38 -0700
Message-Id: <20210716162238.2650157-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716162238.2650157-1-raj.khem@gmail.com>
References: <20210716162238.2650157-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Sterling <david-sterling@users.noreply.github.com>

It is needed for 5.2 to 5.10 kernel

Can-isotp is now upstream from kernel 5.10 onwards.
Use kernel config file instead.  This is only provided for legacy kernels.

For kernel 5.10 onwards use kernel defconfig option for ISO 15765-2 CAN
transport and do not use can-isotp recipe. You will get "The file
/usr/include/linux/can/isotp.h is installed by both linux-libc-headers
and can-isotp" error using this recipe with kernel >= 5.10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index eca8dfc7b7..72d6757804 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -1,14 +1,17 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=72d977d697c3c05830fdff00a7448931"
-SRCREV = "b31bce98d65f894aad6427bcf6f3f7822e261a59"
+SRCREV = "beb4650660179963a8ed5b5cbf2085cc1b34f608"
 PV = "1.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https"
 
+
 S = "${WORKDIR}/git"
 
 inherit module
 
 EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
 
-PNBLACKLIST[can-isotp] ?= "Kernel module Needs forward porting to kernel 5.2+"
+do_install_append() {
+    install -Dm 644 ${S}/include/uapi/linux/can/isotp.h ${D}${includedir}/linux/can/isotp.h
+}
-- 
2.32.0

