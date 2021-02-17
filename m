Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.7943.1613570988816958755
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 06:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jJK4UCWP;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id a17so16274149ljq.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8R7WHZLxumRt9uPNXnZSTikFeG5Mpu6GFV/J+jJ4zXI=;
        b=jJK4UCWPBqOTc6SwBQyZ6CuLE8uI7REVugpC60LSrql0sfVG/8y8NqTvI1sUT+CAtK
         7F0vet1xeS/QD52+kxrXfi9FXHtLmHEFyn5LzoQUfwQ5oauIaLx1mc7EVjpEL4U6TkI7
         S3P+cBudISQ6HMkpL3g4/r9euTeA7GCuCFXdXASTvgWdmRyblAV0TP6ay4T7UBMkmWHe
         uZNZ4QwSS1iGQzv55BLpbDJb9gZEurMvp6G0YGpkueKtEd1MlCW5b+DZiInEsx9B1M3a
         XcPOK3dwJ3yOAWOMjvQnCWlteC30w93cDqI8zk/ugYloFw1VnPcgik7MJofMNvqHr5tI
         1DFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8R7WHZLxumRt9uPNXnZSTikFeG5Mpu6GFV/J+jJ4zXI=;
        b=RBZs6WZmLgWLfLbjLWjwRELzbx1/TyB+0G/FR+9UcELF0zTOlMOVXHb5a7WyuuDfgz
         wjvxDXEiVe/sAhGQGG724QjH/vIGLuvPzcNwD22W0yvAsezdoboIGEfaCbSGEiXKVJl1
         36KRLLOj5EFuLAzhdKoHHtHAr1xfmgwyqL8dCT6g/gDgSH6Dh5zEnu82e/kckfHc32bv
         8L/XdcWaJR82ped/bGtfK0WpEIah5Cv40Et18r/lTh1KFTe+TVBYlmdKc5ZUuvvK9e9B
         sUDT7Jn2UUguxyWMPjCFso3175sSD6x/GfDQDMISTL+uxLnDfEZDM2rOOXEO5QqSIMYO
         FU4A==
X-Gm-Message-State: AOAM530NGvqyRs1nD6SA9lL8SKKjKVLgJMYJN//e5xx0ranIakzCWJxs
	2Vr2QfNNDYJx6bxAzlbbLdNB5aRmMWw/Hw==
X-Google-Smtp-Source: ABdhPJw19XDuB1BtnyKfiW+UDLun1sSJPbSKcvc3zc6DV6RLbkUZ6u4zWkmPWh9EffH+A4CkHWpqkg==
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr14638276ljj.208.1613570987035;
        Wed, 17 Feb 2021 06:09:47 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.215.157])
        by smtp.gmail.com with ESMTPSA id q26sm253363lfc.254.2021.02.17.06.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 06:09:46 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: yocto@lists.yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	sergio.prado@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-security] [PATCH 5/5] ima-evm-rootfs.bbclass: avoid generating /etc/fstab for wic
Date: Wed, 17 Feb 2021 15:09:29 +0100
Message-Id: <20210217140929.987752-6-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210217140929.987752-1-liu.ming50@gmail.com>
References: <20210217140929.987752-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Or else wic will fail without "--no-fstab-update" option.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-integrity/classes/ima-evm-rootfs.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-integrity/classes/ima-evm-rootfs.bbclass b/meta-integrity/classes/ima-evm-rootfs.bbclass
index 4359af0..0acd6e7 100644
--- a/meta-integrity/classes/ima-evm-rootfs.bbclass
+++ b/meta-integrity/classes/ima-evm-rootfs.bbclass
@@ -28,6 +28,9 @@ IMA_EVM_ROOTFS_HASHED ?= ". -depth 0 -false"
 # the iversion flags (needed by IMA when allowing writing).
 IMA_EVM_ROOTFS_IVERSION ?= ""
 
+# Avoid re-generating fstab when ima is enabled.
+WIC_CREATE_EXTRA_ARGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ima', ' --no-fstab-update', '', d)}"
+
 ima_evm_sign_rootfs () {
     cd ${IMAGE_ROOTFS}
 
-- 
2.29.0

