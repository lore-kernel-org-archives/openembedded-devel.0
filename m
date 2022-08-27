Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FA2ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:15:34 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.51799.1661624128650784171
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BZDj4eZg;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id jm11so4319765plb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DpRfprXol4VhX+WHsLmDsGH3D9wPhXW4aLo5APW1+/0=;
        b=BZDj4eZg1aha4whbOt63RrclhiqE90dMV2pstDWOmjvic6Z2U07IwOYMrbQvzs4ACQ
         Q3CDQnRrvwkvXGn0oWiXszUZgYGAZ4smQxzIr8PMDXUDlL3jZsRNQAHKfobqMx0/90fR
         3SXUKG/pRD2iVXZ+M1NmR1eOZXg3wS3fZ6jI+GLCqj2qVv/vdh4yGiElmXw27dMZGDG/
         p/l4SPmFDS4lBOseXVBMUKyBwAJI7RjbMblat11M2Q0rfQSvoKgB8Arp9OGRFD+AXXyX
         DaF7SIfEHI8owxZ6vUpuRJJYR5e8FlJ/lBWY/Z+za4IvzimnF/FlJ2kF9WOnpFkpZ/hD
         5/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DpRfprXol4VhX+WHsLmDsGH3D9wPhXW4aLo5APW1+/0=;
        b=M+6D4z/dVsc5mV8eCzNrcEel5IyneSFhrV36OL07jv5wjRur/UF97WSrkHMqu518JQ
         UqjNMzoelB5GZgB9QDZk+g3wtg7btD7y+k9MsMAUmQNKObAAwHeCZX+YRKFl2ZY9zu3l
         ZFIuUKulKal+gtQIK/U4h5UQ3wn7k1LFyW3PHTfd/rE4wo+YdyMc2c5BViclAABNS5OK
         pl/LrrasPS1OWO2Srw3a5ptzVJZRkV9cHc0qdKaYNMJsmPIBOIs9dLeO33jEdrlc77CL
         IdJwETXwMsoWo4S3ZyAVPZM20K6KuXJ37y+dFLWvjtm8ocXxrulywcT5xyXlIiQMvaZ2
         pZHg==
X-Gm-Message-State: ACgBeo2JB/3n3u0Rg+8mUcfmwBcDMsseH5sw7lOm98DzQI1MXxvKhEmA
	R2UR18frmD5ygdd7rSnxdT45Y8D3x7BXGA==
X-Google-Smtp-Source: 
 AA6agR4EKeYqZWus4PXw4rhtZsDg1CBqIZrbuopE4fW+0SzTS63TLtkc7uj8OMxxal8eukY9aOmAhQ==
X-Received: by 2002:a17:90b:4a0e:b0:1fb:4c5e:9584 with SMTP id
 kk14-20020a17090b4a0e00b001fb4c5e9584mr10761061pjb.152.1661624127778;
        Sat, 27 Aug 2022 11:15:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 126-20020a620484000000b0053617cbe2d2sm3997477pfe.168.2022.08.27.11.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:15:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH 2/3] vorbis-tools: Fix build on musl
Date: Sat, 27 Aug 2022 11:15:23 -0700
Message-Id: <20220827181524.2847883-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827181524.2847883-1-raj.khem@gmail.com>
References: <20220827181524.2847883-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 18:15:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98495

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...clude-utf8.h-for-missing-utf8_decode.patch | 27 +++++++++++++++++++
 .../vorbis-tools/vorbis-tools_1.4.2.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch
new file mode 100644
index 0000000000..36a31a85cd
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch
@@ -0,0 +1,27 @@
+From 8c10181547c93438fc10f753e7164ee004add6d1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Aug 2022 10:28:47 -0700
+Subject: [PATCH] ogginfo: Include utf8.h for missing utf8_decode
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ogginfo/codec_skeleton.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
+index a27f8da..3ac13f6 100644
+--- a/ogginfo/codec_skeleton.c
++++ b/ogginfo/codec_skeleton.c
+@@ -25,6 +25,7 @@
+ #include <ogg/ogg.h>
+ 
+ #include "i18n.h"
++#include "utf8.h" /* utf8_decode */
+ 
+ #include "private.h"
+ 
+-- 
+2.37.2
+
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
index 290162127f..61a4aedb85 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
@@ -12,6 +12,7 @@ DEPENDS = "libogg libvorbis"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
            file://gettext.patch \
+           file://0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch \
           "
 
 SRC_URI[md5sum] = "998fca293bd4e4bdc2b96fb70f952f4e"
-- 
2.37.2


