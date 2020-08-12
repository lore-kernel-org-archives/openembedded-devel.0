Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.155.1597273705031227152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 16:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PgxZBRjV;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id y6so1787226plt.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 16:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uwm2VyNFLLxqjkFJtAEEblq6m8G6j7jXxklmaJNxL9o=;
        b=PgxZBRjVTGWXEA0F59ZV+PMgu3KVACsEP2KPrDSYZOPsquG0AGxRbIfk1B7oCq2zEo
         xwOlErH3kjmVbgAuaexvJuDtynP4S2vMSErm9fSp+5/RuqMeWMDeru5xCeO/qLVCeev7
         5s5ityQqnNHqHBsKQmFRW26FC+mMBkX79/jH8MdE7WILH5U4J8OqWcu0bIdnaHnzQueK
         hMV5nGnzcI98sQW0HJrP9nLWrXw43HXHW3/nvbfL8zrkSCsXQrpat77RpcLv3E7gH+Jb
         ks7F3Ezcx+Zyk+E+JF03IwZAWZIeHWAoN3AASw6FuhAmqcOEaLtty5skVuoMeq0l7AEB
         u1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uwm2VyNFLLxqjkFJtAEEblq6m8G6j7jXxklmaJNxL9o=;
        b=t2xCkZmM9A6dGYdJvmgxMulu7O21aaTiBmV8lLcovZCMdKeNNRFij+P8ZuKvvsJc/0
         Mgrydb3QH3bc69+YrcbjB9ckouQRcmOm5f6Xfy7eVOuicLc0KByOsKwFFW3oa5w99hvN
         +MKkp/9v+qsUmnVxD4knUUrFPfXXm+shA0ob6K+8Xk3NAxjl97Z64bXDekidFF+arjTu
         E1xio8ol8896eVdfytMFNApdUcdp2crq0AYCwZSrVZbRq5PhuPCO4QX1+DlOa49NDN0V
         NpwFtpPtoE6gt3hggOZVXDzT2xBk8oxoi/jBzcDVRdkuZ3guOpc+vPmaZwPC481IG0QS
         14Nw==
X-Gm-Message-State: AOAM531cgNtvivWTcYlcJ7LbZYCymmFskl1opMY6oGw1VvTK03apcltT
	p8bjB8HEDkxEbTRivBihEiTt8u2Zc6Y=
X-Google-Smtp-Source: ABdhPJxIIQbOXZFaQmzHabwNGCxhlBB1itoQAbfL0X9Ru6N70+AoPLmgYRaScg7AFHFO0vo6M1XEiA==
X-Received: by 2002:a17:902:7d81:: with SMTP id a1mr1467883plm.89.1597273703807;
        Wed, 12 Aug 2020 16:08:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id h19sm3112146pjv.41.2020.08.12.16.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 16:08:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-matplotlib: Use lld for linking when using clang
Date: Wed, 12 Aug 2020 16:08:19 -0700
Message-Id: <20200812230821.1802729-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

build uses LTO and for some reason it does not work well when using
clang-11

Fixes

| /mnt/b/yoe/master/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/python3-matplotlib/3.3.0-r0/recipe-sysroot-nat
ive/usr/bin/arm-yoe-linux-musleabi/arm-yoe-linux-musleabi-ld.gold: error: /mnt/b/yoe/master/build/tmp/work/armv7vet2h
f-neon-yoe-linux-musleabi/python3-matplotlib/3.3.0-r0/build/temp.linux-x86_64-3.8/extern/agg24-svn/src/agg_bezier_arc
.o: not an object or archive

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-matplotlib_3.3.0.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
index 2e88efb563..bc2054a4d7 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
@@ -23,6 +23,9 @@ SRC_URI[sha256sum] = "24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1
 
 inherit pypi setuptools3 pkgconfig
 
+# LTO with clang needs lld
+LDFLAGS_append_toolchain-clang = " -fuse-ld=lld"
+
 RDEPENDS_${PN} = "\
     freetype \
     libpng \
-- 
2.28.0

