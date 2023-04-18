Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F93AC77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 04:36:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.940.1681792559123866384
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 21:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SIPcfKk/;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1a6ebc66ca4so3586095ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 21:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681792558; x=1684384558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+MKr4PUedhv+rM9YcMd3BAQrZg8q901T9g5WZ4Vo6LU=;
        b=SIPcfKk/3iW0DKEYh4qgrA8C6tSOkv1Z0qIz7rL8NCsHnZrWpYK/GGC4E4puhNAEJh
         yHmFzNqb0N9pC1doOPX9YLnsHFuhg0LiUpSjqwB9+//MMrVRBsKWHdKyICLF96FQxk5F
         l35tJWcoo5Mn4AwdxGsgsl4PKKITTq8AZzuWPyrIcY1Gpdng/8iqQt7MQIcWwLUaF1Yr
         0sCTzzylPphc4vVGa+e9a60jn8YY3ygeEYquNYD2BMpriChW80D2ZTpN2pIzz8HbAYHN
         tcxCwk4EQwIKDXQ8wmj7vWM1Zodr0VWMdccj+Qa5bjTBKPlETbkj+OHjXFvF9sQZtGqN
         955Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681792558; x=1684384558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MKr4PUedhv+rM9YcMd3BAQrZg8q901T9g5WZ4Vo6LU=;
        b=X2Wk9oWKMDa4DDeVYJfZIK6xNqmE4mbD5CW3UoFoQmwzU0lSeSG9sCFUZvs2y6sPiz
         7cuzd5P60J2rvHCQ8mGRn0eGllZJEN0AiwSuYOBKd1FjYFe4VBErX9ivUTezmnWrsoG2
         RKKwCTAh/uG7+tiHAk5FkgxuhwE4fT3RJEoXcX89o+4RfO+F+mLZcpr9wxBKiIruNtfg
         Qenh10+ZNz6EOJUf/fE5b8o15MoS3IKbGoydZ6fTy1hOTIm9P0N1/lg97KLeLvNrQIYQ
         a66gmNsh619HIfwo0N4fqx9SXFfhmfeQCnL8KRM0uxWP190KufiDgj0UxlkAmLFGyeRq
         2liQ==
X-Gm-Message-State: AAQBX9fmwH499eJ9ByH7K6oOiJO3SYxmWzo0J49LUl+Qpi3rIlZvkaTi
	qK3/wokKqBj3SEScfSHhC2WP8W7/md4VkA==
X-Google-Smtp-Source: AKy350ZYOt6MeNeYtYrwwnhavcJUJn+DGKUt/0YswUziOjGR3Sgp+sw+ZDjOMNfNbHSXYonn4N9wow==
X-Received: by 2002:a17:903:2115:b0:1a6:87ae:542d with SMTP id o21-20020a170903211500b001a687ae542dmr703052ple.48.1681792557955;
        Mon, 17 Apr 2023 21:35:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902a60100b001a671a396efsm8508064plq.214.2023.04.17.21.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 21:35:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] xmlrpc-c: Upgrade to 1.59.01
Date: Mon, 17 Apr 2023 21:35:54 -0700
Message-Id: <20230418043555.1657262-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Apr 2023 04:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102131

Fix buildpath warning due to tmpdir appearing in xmlconfig-c-config

WARNING: xmlrpc-c-1.54.06-r0 do_package_qa: QA Issue: File /usr/bin/xmlrpc-c-config in package xmlrpc-c-dev contains reference
 to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xmlrpc-c/{xmlrpc-c_1.54.06.bb => xmlrpc-c_1.59.01.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/xmlrpc-c/{xmlrpc-c_1.54.06.bb => xmlrpc-c_1.59.01.bb} (87%)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
similarity index 87%
rename from meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb
rename to meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
index 0a7ad33c64..278db6dc84 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
@@ -9,8 +9,8 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
            file://0002-fix-formatting-issues.patch \
            "
-#Release 1.54.06
-SRCREV = "00870af80021aa0a66cc72c9aeb00587cbfde560"
+#Release 1.59.01
+SRCREV = "352aeaa9ae49e90e55187cbda839f2113df06278"
 
 S = "${WORKDIR}/git/stable"
 
@@ -40,6 +40,10 @@ do_configure() {
         rm -fv ${S}/tools/turbocharger/mod_gzip.c
 }
 
+do_install:append:class-target() {
+        sed -i 's,${WORKDIR},/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g' ${D}${bindir}/xmlrpc-c-config
+}
+
 BBCLASSEXTEND = "native"
 
 CLEANBROKEN = "1"
-- 
2.40.0


