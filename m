Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.3046.1599324979433207677
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I9hOgIlO;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id c15so2563841plq.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FC5Kk2HmIbFwIqiDeogbD0z/9teVQzDR8LbZ4/QXlqY=;
        b=I9hOgIlO6o+uiWPlzawcjNBj11tr3Yq+oRCWag5NArWHafqRGsveUSQBJqHn8Ijmm+
         4lb+MLbUUmXQ9FKIsjeE0PxpEysUln9R2HxNh4P+G9/qyRhFECiFxtEcy8zl6IkEg91Q
         BpvR7wnZRSvDrjTAW/CJ3BXOFH3rp3zTI5C7aGjr5NVezukPcksYS4svUciwnN6EnqBT
         Ok9++ICjQqjnC4XRi5CMlcuPC7Z88IQ8n5ygkcFXt6uyOg7Jk1avNbnUeSUKg9PrkrdL
         JXKRQMxtCjUGwYukuZR4MUgJIPY5q3/wSOiq7voaZla4A7BLyFK0GYg6jTe1vkeVd/w5
         hJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FC5Kk2HmIbFwIqiDeogbD0z/9teVQzDR8LbZ4/QXlqY=;
        b=Z/kVZmA+mELeA/5X8JIY2eMyn6ZpYFVcUzDew0dBNBtTwOo1f8xmCNF7Oyyt043aud
         dxQ9IDvYvAx5+yZjIWVqoTWkgLwf2K+NYZ8aJb03cbmr8tyTuJ26e7MoO/47oeb737lk
         WvTWgACRnNgOyB5AEafQqdBFVXTqPzj+3/5yu7ezM3R6oOjHNszy2zFR/hb6LLbUaPTG
         RVPVAEvYvhMB+A5bWH14hUYcCx3RxhjN5L48HCGDjvdU9v+nSFPYtjF2WNVx8Mqpy/ii
         KnqptapbG1wOKrpnqVVFZdQ+DJiTVXvDs5M9nyI+NKO29/dCbSYNwDQz9AX4MP4nF4jM
         6Auw==
X-Gm-Message-State: AOAM533RUYvqONjGwQ5aXTUCXAloGTrjfc7XMQ0fBSGOIlp4YEw8vSSD
	79sweIBLqrs50ceELl3hnJzVjaQ+lso=
X-Google-Smtp-Source: ABdhPJyNypeMbHYpUUjIcMMARjM+mHpJupp3UHE5HrIKJ9LC5YWkLtnvkS3jEk2oK6NjLy4xEECGIA==
X-Received: by 2002:a17:902:16a:: with SMTP id 97mr13209981plb.207.1599324978818;
        Sat, 05 Sep 2020 09:56:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:18 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 14/20] lcov: fix lcov-native build
Date: Sat,  5 Sep 2020 09:55:57 -0700
Message-Id: <0bc6614b1aed4c01d1970b025741cc71309f90f1.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Martin Jansa <martin.jansa@gmail.com>

* there is no provider for gcov-native nor gcov-symlinks-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e82bb7efa8cf4c3b826b22761d5ba798bc134cb9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index 14718184bd..0cc8b31b3f 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -9,8 +9,6 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS_${PN} += " \
-    gcov \
-    gcov-symlinks \
     libjson-perl \
     libperlio-gzip-perl \
     perl \
@@ -46,6 +44,11 @@ RDEPENDS_${PN} += " \
     perl-module-tie-hash \
 "
 
+RDEPENDS_${PN}_append_class-target = " \
+    gcov \
+    gcov-symlinks \
+"
+
 SRC_URI = " \
            http://downloads.sourceforge.net/ltp/${BP}.tar.gz \
            file://0001-geninfo-Add-intermediate-text-format-support.patch \
-- 
2.17.1

