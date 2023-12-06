Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD3BC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 12:18:27 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.30203.1701865097185005308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 04:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JpzdN5py;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54cdef4c913so1639226a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 04:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701865095; x=1702469895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9//hWTJkSjB3VRM0qkKUCrWppz88YSSSDngKCvhBWV4=;
        b=JpzdN5pyA15O5AcTZ4MbBRHWebfHSeTc3/XALnJpiHjNv81y7bc662GZEK2Sl1zExj
         bNm1JpAwQgBRHmI67oei5+OaqbgvUJapu0tnVTe75+IJEpZ9ovGtDKAl3KdwjvIRg2dQ
         6M9/jUToe7E7wvAlbriaeyPJURHC4V7oyam4OsLtNQENeh5rvmsvK8ANI768JthZbHSU
         d8fxN0NPE+rLNQHDO1a9gWpM05eSJQ+ELeIAcHvmrucQOD/8kZXgg2KU3Bw3PV29xruI
         ZZWhYJHe5JA1Sl1riBLMlqGtPu+UrJTyWcePiVb3YhdXRm5nJqrya6KKDOfWIqkUbqmp
         Q3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865095; x=1702469895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9//hWTJkSjB3VRM0qkKUCrWppz88YSSSDngKCvhBWV4=;
        b=dkoYvpR8qos2IQ3B4tq7zVTsrSaWQZ5+cc4tfZX/DZboijSl6MuPoz4lEeww7cSRo7
         3tOmacff7AvKRE7lfWB9Z9CrkCvOvPgIng7gQcxUb8NC4kCyRk6vNRPOOXkxjf66ij0y
         2YJ3PVi8UxsEBDxjBILTgnIvwMYAgkadAmXhg7i4j6DRfKzq+MDbZOjCWdjtmO9dOuL0
         G64ZbrCG+/eb+j2mo+yiegQQ9FzPhWEV5GYxDZ1CC6sm0rg8qzDEhZnnzO6W8dR5zAPo
         yfTOyfU5c+noSlCVaTC3fo31xLzkK1UajdLGQhpRFC150lVpmYT9cxNfxwxwdn48Oc06
         4Rdw==
X-Gm-Message-State: AOJu0YzJHcki6/7RlMKQ6/wNgSv1orfCENVOToF+hM0WBAv5qjfOhXi+
	Oo4+EqSMc/5tVipaCYJhw7ofaKITN7QeHg==
X-Google-Smtp-Source: AGHT+IGulHRmZ4bmECSeLv1uWj/R01SSef6R7vWX9MHiC4jYcEQ2o3+mprdlxpuVfzz+0XHtj+CVlw==
X-Received: by 2002:a17:906:220f:b0:a1c:c2f9:980d with SMTP id s15-20020a170906220f00b00a1cc2f9980dmr2873916ejs.27.1701865094827;
        Wed, 06 Dec 2023 04:18:14 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id a24-20020a1709064a5800b00a1ce98016besm1879959ejv.224.2023.12.06.04.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 04:18:14 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xcursorgen: upgrade 1.0.7 -> 1.0.8
Date: Wed,  6 Dec 2023 15:18:07 +0300
Message-Id: <20231206121807.269194-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 12:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107242

Changelog:

* Resolve -Wsign-conversion warnings from clang
* Handle -Wimplicit-int-conversion warnings from clang
* premultiply_data(): Mark png argument unused
* Build xz tarballs instead of bzip2

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xcursorgen/{xcursorgen_1.0.7.bb => xcursorgen_1.0.8.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xcursorgen/{xcursorgen_1.0.7.bb => xcursorgen_1.0.8.bb} (64%)

diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.8.bb
similarity index 64%
rename from meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
rename to meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.8.bb
index 936d71b10..f177e8a84 100644
--- a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.8.bb
@@ -3,9 +3,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bd1fb9ee90eead85f7b171807b3ab4f2"
 
 DEPENDS = "libpng libxcursor"
 
-SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "25cc7ca1ce5dcbb61c2b471c55e686b5"
-SRC_URI[sha256sum] = "35b6f844b24f1776e9006c880a745728800764dbe3b327a128772b4610d8eb3d"
+SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "b8bb2756918343b8bc15a4ce875e9efb6c4e7777adba088280e53dd09753b6ac"
 
 inherit features_check autotools pkgconfig
 
-- 
2.25.1


