Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.9432.1592925859523913288
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 08:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OLcE5B/h;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id k6so9243847pll.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2020 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=OnB27C66WtFl0a/RlCTia/SIHfPUBRIIUtGtC+rJyuI=;
        b=OLcE5B/hOpqPOz8AzFh7+i93cJXOY0kao9jOMTPwo2dl0GqzdPznLe1CBR341zq0pi
         PawJwEGGpfQgfkBE0bNL5FdBcgBUJDSGFoReOpaG/dDcyGnjwWProPSKK8mG51J9rBw3
         q0jIR3pvKtkhOjmBVYcclNuICRcZCzZXwBIwEMAmoWmZb9CwdCafVmFqDL31SIPXKqmO
         MeJ41wKikTUWCbjHdBZ2U+vskufIgzN5qQSFGOmrrgSqHgRDSzyISW0EtiZDfHY2uE4B
         3RNkj4LpjxYVIvG0gK7/XvE70L9C9CnGjsSGzNYofI95vdTpUuY5EUADZPdnfHqZ3QgR
         /uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=OnB27C66WtFl0a/RlCTia/SIHfPUBRIIUtGtC+rJyuI=;
        b=ktxo+3u0y9YeJj0hQT3SbqhMu5CDtBcDe9fHlxL3CEUpYQEljFr6xRkglR7i3W5jZE
         WWt2LBiUDgGqluDLI9QqRstXD4JBYpLbIBuqDsLeCoyQqHyZrBKa5fcfZKXWy10ICw77
         O6c0oPkrE3a33qqxfJJNdbZFnVHRushkWd3gKPCkGam9ItSk0olB0fRVYo81q8Zs9Y1e
         W+88AHK6F4/bQ8/rxqE9i5huYENhSisniP6yYL07ssUBlmvrWVAALAZCWA1vVT2Omr5f
         FEMaXP5+4kLTCJ8nagNUKKFlq6YOQ5Wf7J/UjkpzNKzT1Fw64wjn9jMmK+q0xl/b1Oy0
         6cRQ==
X-Gm-Message-State: AOAM532FRRO1XpmmkjyPCJO4oLc+oBiWM7/RW+Nn/DUsmxawQRFHYm9q
	q21G4IuYpaYnh1f0eqiD/DeEHuBZ
X-Google-Smtp-Source: ABdhPJwLGMCPaKQNLWYlbS36mIcXsmoibDoaXHsv60ThthJcWoGMzEK6dCmbx9W6chTqTEO+eqoftg==
X-Received: by 2002:a17:90a:e387:: with SMTP id b7mr24855984pjz.176.1592925858613;
        Tue, 23 Jun 2020 08:24:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:c1ba:4891:8c10:1401])
        by smtp.gmail.com with ESMTPSA id d6sm2813119pjh.5.2020.06.23.08.24.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 08:24:18 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libuv: pkg now in core, remove
Date: Tue, 23 Jun 2020 08:24:17 -0700
Message-Id: <20200623152417.26406-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libuv/libuv_1.38.0.bb                     | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libuv/libuv_1.38.0.bb

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.38.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.38.0.bb
deleted file mode 100644
index afc9b2f2ea..0000000000
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.38.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
-HOMEPAGE = "https://github.com/libuv/libuv"
-BUGTRACKER = "https://github.com/libuv/libuv/issues"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
-
-SRCREV = "1ab9ea3790378f9f25c4e78e9e2b511c75f9c9ed"
-SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
-
-S = "${WORKDIR}/git"
-
-inherit autotools
-
-do_configure() {
-    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
-    oe_runconf
-}
-
-BBCLASSEXTEND = "native"
-- 
2.17.1

