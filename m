Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317B1C54791
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 20:34:58 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.20729.1710016495859504550
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Mar 2024 12:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TUWJMf/F;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c21a3120feso880129b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 12:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710016495; x=1710621295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9xjgetFhekftw4qhwZj+gANZzw+X5ifOz4OLzIhrS8=;
        b=TUWJMf/FHJPjCyca6r3QXsE6QCO4l7ypY9v4D5cLUrqPoXekRP7me20O8HHqGxab8X
         yAnzi32Aj//pFNkwbALfY3YzG2nvGZG0642aBXpKi2O+1gnbKo4mbu94bOEBNZUrPhMF
         eiaGZLxsAxsEXQGl8X96OWKxOH+k0aFyQ/JdJCCtgUiI3dLuXjBXp9GIQSvljioAoNY5
         QRcOz4jBYxzDv8neQYU//flufFLSeSVBqkr/zpW+/7xBxqk5iehyX7z2U4a4/lAOGcc4
         4vYZl+3tJWihKRNoxOMDGDH3ht+hcSswpqQt3QQbMaoCngq+PQ79n1KkJRBDu53akU1h
         +NCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710016495; x=1710621295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9xjgetFhekftw4qhwZj+gANZzw+X5ifOz4OLzIhrS8=;
        b=ijblCHJONNkuCMvA3QpzKSZYC4q4JbjpvXvbz8HDyv8pI2NvIw3+kkihoB8lnO6Lri
         0jSOe/VH2BFyxN8qmVrbpMEDGyn3dB9ge7Wnem2HPWoymR/Cp77sWOcthdi6kg2Coxwe
         ElpMmhLSMqiX8oimpNccGatuw5bdjyr/MBqAfSkYcrwD+U8lUzMVXZvy4x4oSsxzvgE4
         yG/MQqiutOJaSO/nPmEluXdmYyYtCQX+wXFZT8tlJ6DL+1auCxxixfnZLbGv1YH/d0Hj
         4aUHjSoQ0yD+gErfhGWGx/XpiWthAADsizBLHBRzPDVJVzlmksN4lK9ucBGeoal9JwHz
         6wQA==
X-Gm-Message-State: AOJu0YyZ7sWjfUqB7Qnoo9zkHtMG2bmkrmslr96qgdW3T29vq+DgQiVA
	UkmJuF0sVcgzx/BD8GhepoKaic5g3sj6Cs/aqbq4ROhjn1tAjI2y4h3Gchqz
X-Google-Smtp-Source: AGHT+IGaDFtBEv0MgoHT2vGrq6i9ctQyCDPqvjjC1ZQvm11pGVHlr3vDSqSimGPBqxtt4FetSm26Pg==
X-Received: by 2002:a05:6808:1452:b0:3c2:d22:8e0f with SMTP id x18-20020a056808145200b003c20d228e0fmr4193258oiv.12.1710016494797;
        Sat, 09 Mar 2024 12:34:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::bc23])
        by smtp.gmail.com with ESMTPSA id h1-20020a17090aea8100b0029b96ab89bbsm4546868pjz.10.2024.03.09.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 12:34:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] vlc: Fix build on 32bit x86
Date: Sat,  9 Mar 2024 12:34:52 -0800
Message-ID: <20240309203452.3530947-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 20:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109249

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-taglib-Fix-build-on-x86-32-bit.patch | 50 +++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_3.0.20.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-taglib-Fix-build-on-x86-32-bit.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-taglib-Fix-build-on-x86-32-bit.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-taglib-Fix-build-on-x86-32-bit.patch
new file mode 100644
index 0000000000..2dff9b63ce
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-taglib-Fix-build-on-x86-32-bit.patch
@@ -0,0 +1,50 @@
+From 5b921009b0db2c5c15aef7ce241d3c81f9c272c9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Mar 2024 12:26:39 -0800
+Subject: [PATCH] taglib: Fix build on x86 32-bit
+
+While compiling with clang, there are errors seen such as
+on function override signature mismatches
+
+meta_engine/taglib.cpp:240:10: error: virtual function 'tell' has a different return type ('long') than the function it overrides (which has return type 'offset_t' (aka 'long long'))
+  240 |     long tell() const
+      |     ~~~~ ^
+/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/vlc/3.0.20/recipe-sysroot/usr/include/taglib/tiostream.h:156:22: note: overridden virtual function is here
+  156 |     virtual offset_t tell() const = 0;
+      |             ~~~~~~~~ ^
+meta_engine/taglib.cpp:245:10: error: virtual function 'length' has a different return type ('long') than the function it overrides (which has return type 'offset_t' (aka 'long long'))
+  245 |     long length()
+      |     ~~~~ ^
+/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/vlc/3.0.20/recipe-sysroot/usr/include/taglib/tiostream.h:161:22: note: overridden virtual function is here
+  161 |     virtual offset_t length() = 0;
+      |             ~~~~~~~~ ^
+
+Upstream-Status: Submitted [https://mailman.videolan.org/pipermail/vlc-devel/2024-March/143639.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/meta_engine/taglib.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/modules/meta_engine/taglib.cpp b/modules/meta_engine/taglib.cpp
+index f371485008..129fdf55f1 100644
+--- a/modules/meta_engine/taglib.cpp
++++ b/modules/meta_engine/taglib.cpp
+@@ -237,12 +237,12 @@ public:
+         return;
+     }
+ 
+-    long tell() const
++    offset_t tell() const
+     {
+-        return m_previousPos;
++        return (offset_t)m_previousPos;
+     }
+ 
+-    long length()
++    offset_t length()
+     {
+         uint64_t i_size;
+         if (vlc_stream_GetSize( m_stream, &i_size ) != VLC_SUCCESS)
+-- 
+2.44.0
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
index 85af2f9bbe..d25a20ae01 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://get.videolan.org/${BPN}/${PV}/${BP}.tar.xz \
            file://0005-ioctl-does-not-have-same-signature-between-glibc-and.patch \
            file://0006-configure-Disable-incompatible-function-pointer-type.patch \
            file://taglib-2.patch \
+           file://0001-taglib-Fix-build-on-x86-32-bit.patch \
 "
 SRC_URI[sha256sum] = "adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5"
 
-- 
2.44.0


