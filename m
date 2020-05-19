Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.12934.1589899416877853791
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mYZ25hCD;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id p30so499067pgl.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EpnMqcnw4f7kdC7Ywq85Q2/uivfnBhXUDxve/I/bDME=;
        b=mYZ25hCDQQiuHrJ1vDW6h+LSKbYF8igvc8lZGgK2cqlSXvF/CETq4PwWxkaM9KfSf4
         s9YC6fxPy180Aldui3ModKaM3yBG2TY9Ah/KsTih/OC1IWpB0k782NsmLGYMKJZSc8mq
         sWBLiQaGPBX4f3abJJNZKDdaN3yD2vBsAOrpgY3xfAPP5qaG6DZ5/uKEF+EZIKjmcIbP
         pqc+6l79DwMSCMILy9RfqFzmH/TVr0BSqhSehs4D9sC5iL/xIy/VoQNjDsaXmdIUwtfp
         y7rRq2LH4YIYqRbTIdOc9ct3jx2p3jgFlYzEZZvo03E+NJpilsXUDhh3YyN0D8CFDyuK
         ZkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EpnMqcnw4f7kdC7Ywq85Q2/uivfnBhXUDxve/I/bDME=;
        b=KSXvk6opqcbMVRlUQBqlb1/9+xWf9nuiwKplNBc4IUQzGNRus+vRJFvxyLYMFMG8un
         hwaAP19PEPxb5sd0RZlabyOfj+hOcF0RggiPfstMUXBKJcnFqLmJwJu0K3ie+5/0KpXE
         48U11gjkICat3pZ2DhGPLzTWgIka8FQwhbDx9WKVQhebe2VBh/8Djj7q3bDEM+soiV1G
         wJKwD+pNqmsBW9v+p0tYJ/V65iJPsww6QvncsqmJ+JhB62PlhC7OTlYh2OhmoEAV47nD
         BaBbKj2F2fcxcVpHbcykvMZwiZLAZm8kXApV73ZEYFrEYRgbQl2yELFUno4QQsuYTibz
         FvWg==
X-Gm-Message-State: AOAM531+Xogmor3Af5eEv8d4NtU8TbTiaGt1S7HQhOJmcMkB62ZPlvqg
	a0TqStDhp5XpsystArDIryGpQf7x
X-Google-Smtp-Source: ABdhPJxTxepfVHbrsjFtgkOrKXotuL4HDvUpOd/WS2z6oXZCsrIlIUhBdcrEjHvonIxCmzZ0vXD01w==
X-Received: by 2002:a62:e104:: with SMTP id q4mr19054693pfh.280.1589899416267;
        Tue, 19 May 2020 07:43:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:35 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 02/18] v4l-utils: upgrade 1.18.0 -> 1.18.1
Date: Tue, 19 May 2020 07:43:16 -0700
Message-Id: <20200519144332.12822-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a23d4e0458d954c93f1ce0ada3f6e79fbfae3934)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../v4l2apps/{v4l-utils_1.18.0.bb => v4l-utils_1.18.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.18.0.bb => v4l-utils_1.18.1.bb} (93%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
similarity index 93%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
index 9cc2a8e5b4..193335deaa 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
@@ -24,8 +24,8 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
            file://0007-Do-not-use-getsubopt.patch \
            "
-SRC_URI[md5sum] = "18996bd5e9d83d47055c05de376708cd"
-SRC_URI[sha256sum] = "6cb60d822eeed20486a03cc23e0fc65956fbc1e85e0c1a7477f68bbd9802880d"
+SRC_URI[md5sum] = "ff2dd75970683be9a301ed949b3372b3"
+SRC_URI[sha256sum] = "25fc42253722401f8742f04dc50a444dfa9b75378e7d09b55035bcbb44c5f342"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
-- 
2.17.1

