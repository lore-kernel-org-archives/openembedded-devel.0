Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.7962.1631714132826039890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OCiOKHEr;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id k23-20020a17090a591700b001976d2db364so2290905pji.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JFvMzqv2Q7ftlaVAV5Zk55OAEG0mZvDH6G0Lp5vqEOI=;
        b=OCiOKHEr2eSGavl2cAN5XCgAhMAhy1u7KgpUHxW+NFbF2nOFQrCLDtQ0d5d5qjs5e/
         yR9RTOJO/WjwUqmAOo++7cZYnorLParO2N12LJMUBq7ZC/SybiulZB8OM8kRvk1Xz4/r
         fOaqoLWkrNUkm2z7onXhgv4KxefGH4/l0L1ISAS6VNEAzgoOXAWnPv+qws/6gb1G/+YK
         cDm6t0PjQLz9LZDKRl07/pQ9k0obYQJbZKXyVFP2BjfiD/NKoJ/LTgX8bonVXa+SB2n4
         GzDWqdM1jDzXKg54xJhfDYFe2EoYJdjn5Bl9Ag1CV4D6K3DCkkS5u94xG7FwqPdi33p0
         A4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JFvMzqv2Q7ftlaVAV5Zk55OAEG0mZvDH6G0Lp5vqEOI=;
        b=3LKW0y8Ox0nXmPmLjedFwUZXhjPoAwPZZi9xqy9D+aAORnLTpKDUcr4wheTxSAu4n4
         Dw/7FzXAIFyf2t+WS3gdpwzUhKlUeUEYKBYa3ufAaA/fpnPw27QHMbuY3Mplq4tNFNIw
         qqYPYAiNZ/uO4aW6iRUWEVJ2pgEvK2yYV4dMZF7LffLOaB25scOT7yEnnYKRTzXT7DaB
         hKwfR8rkyykQ9knfOxU98BVJSiqW6i7SUvMjvESw9wK4tI1YmENhy19AGLZ+42Z2pDjb
         VwP2qF8M0brp9CAmek32K7+HgL6Q2BvUKbJx6HPOE+njVQM94eGtSII41lYTb5LV2VUr
         MUZw==
X-Gm-Message-State: AOAM530pC7xXguP5dWqdhGReGLXUAElsgdm4qrCfWYFidZoMprmzs7RM
	L1+AlnMoWl5yS+JuEkNyiXdKRigC13Q=
X-Google-Smtp-Source: ABdhPJx+xHAdCrCASOGlyt9X+E8wdI/BrCsjFq3Z0Pjtfd08O0UJlD6HlRDQSoLDUcspY+njiSBTcA==
X-Received: by 2002:a17:902:e752:b0:13b:7e90:af8b with SMTP id p18-20020a170902e75200b0013b7e90af8bmr18748845plf.12.1631714132206;
        Wed, 15 Sep 2021 06:55:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:31 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 8/9] vboxguestdrivers: Remove __divmoddi4 patch
Date: Wed, 15 Sep 2021 06:55:19 -0700
Message-Id: <355e47cd858809cb2470a7bf9e769c5a3d5be756.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631713963.git.akuster808@gmail.com>
References: <cover.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This function has been added upstream as well, therefore the patch is no
longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>
(cherry picked from commit 552269da69d3c7d366ca3ad7340de715f06005a5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1

