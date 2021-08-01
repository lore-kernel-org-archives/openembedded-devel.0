Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.7810.1627829183541404679
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 07:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NpxqSrsH;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id e5so16697447pld.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Aug 2021 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V86wau+Gko/t/xN5s2Yqvy8Ahz+NXZP1Zk9x/7/gBmU=;
        b=NpxqSrsH5uEFQiAeQ9OaWvEsWaajfBW24uoP7dfdfnfskdCVCQ8ifSpmQ1tTkZWT/T
         pn2oC7gbJx7hqco4hwAEgLPmCf5LoE5FsKgiLiFo8/4MW+jolUKsgblT1IeTqPYxjjpd
         AsRs6wCO9Nz5uEs7YkcmdVFwfKZDRkOhaLAmaPph82U3gCrf1BBTfPKIACGmSrPCUToT
         UUXV/NlxQ5dgGXpVkIMfTcJAAUuA8A4K6an8hIfaBCb2KiEcLhjYNa2r1/U4hoTvasC6
         xIRTlzqpY6HsrUoUmHPwYH8j58LUhALuE64yybTobM5IFzheBsozi/zDbbfneIFXD5JV
         HKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V86wau+Gko/t/xN5s2Yqvy8Ahz+NXZP1Zk9x/7/gBmU=;
        b=Lj1nK7qec2LtUnXwcddZPlljgddJmQUP8vtq8nIy7FUe4fZQH398+79Yq6EqI8t/qH
         WES9i0RbvC5mWaFcBSo/E9bjTO1/GanFHYOK1oQalYiPwh2opJiYwOlgmqIhew9SKRGM
         iA7NT0Oy5AxhJQfLQyvDIUAgHi/uvBhYTaSeYoLxegnNXbXHIFl4x3lbX7XEuof26at4
         C7IP4mxMrJY/m+dP14z984pw1apB+CMWnnTrlIX+RIRIQIm2PU1ug7xyv7mWGNiW0hXo
         R2xt0KcpAi7hZRKaFIWez6q+s6XSjii0aY0AHMzJeSLUp4QM6b7v0SYUUcLUlH6BQvO0
         tKgw==
X-Gm-Message-State: AOAM531V1an8K56zbgarBLU56BmjfUcuJbjZfMWZ3wxiOp+nrsM/sady
	Hsa1Ehn7PDfE00xOMfD/5gjKEOg3uqHWgw==
X-Google-Smtp-Source: ABdhPJyj5UjEckcviNBPYaNcYl3fQ6YuCTmpVqy0jLgD/t5p+kfV6ygD3s6fwOhTOQv3gyzAedaxog==
X-Received: by 2002:a17:902:db0f:b029:12b:32c8:c097 with SMTP id m15-20020a170902db0fb029012b32c8c097mr10548000plx.25.1627829182783;
        Sun, 01 Aug 2021 07:46:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id h25sm8561274pfo.190.2021.08.01.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 07:46:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: Remove __divmoddi4 patch
Date: Sun,  1 Aug 2021 07:46:20 -0700
Message-Id: <20210801144620.2463290-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function has been added upstream as well, therefore the patch is no
longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../vboxguestdrivers/add__divmoddi4.patch     | 36 -------------------
 .../vboxguestdrivers_6.1.26.bb                |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
deleted file mode 100644
index 8dd30a20ef..0000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-add __divmoddi4 builtin
-
-GCC 11 will generate it in code
-
-void foo(unsigned char *u8Second, unsigned int *u32Nanosecond, long long timeSpec)
-{
-    long long i64Div;
-    int i32Div;
-    int i32Rem;
-    i64Div = timeSpec;
-    i32Rem = (int)(i64Div % 1000000000);
-    i64Div /= 1000000000;
-    *u32Nanosecond = i32Rem;
-    i32Rem = (int)(i64Div % 60);
-    *u8Second = i32Rem;
-}
-
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/src/VBox/Runtime/common/math/gcc/divdi3.c
-+++ b/src/VBox/Runtime/common/math/gcc/divdi3.c
-@@ -68,3 +68,12 @@ __divdi3(a, b)
- 		uq = - uq;
- 	return uq;
- }
-+
-+quad_t
-+__divmoddi4(quad_t a, quad_t b, quad_t* rem)
-+{
-+	quad_t d = __divdi3(a,b);
-+	*rem = a - (d*b);
-+	return d;
-+}
-+
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
index 1b2fb44036..d1e42a4d7a 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
@@ -13,7 +13,6 @@ VBOX_NAME = "VirtualBox-${PV}"

 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://add__divmoddi4.patch \
 "

 SRC_URI[md5sum] = "fce04bbef244b4df1a50e53d132d3e6f"
--
2.32.0
