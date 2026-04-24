Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B34CFE51FD
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 10:03:24 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17617.1777024999887048670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2026 03:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UbA4/qtE;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b941762394aso1042111966b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777024998; x=1777629798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOWdbZsDE9uSbA5I4Z2qv9tptB+zBfBHaBlfUDtxaeo=;
        b=UbA4/qtEx0gIl5VM0Zl/JmyetyZ24KYEQDOvMTN53YOe9zQjb9m9LyR5dtEzlM/DqT
         DqaTKJlYpDe025gVPqDOFKmI3/W3AS5VXDrCO4OfPqmvrGMljsXEt4mEsUPmKf6sCOPb
         FEa6KuShhh8T7pQTrySvwOOksXvHCdd+B/yDniY/Cw+ZwLYNbjoLuo1ZDoBKVGokooUC
         MJkMjjuTXS3lEsXc0diudg7j/PLfPmmYSYg3oztGdkczQxaSqlaKbnUEHihFAwTmT0Q7
         3iuNNXhcvgi++TBo9afgAqTSO7ZTs7ZM50sSj2Zx2xMBU4SsxLRthKpwfmht/LgArp3b
         7dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024998; x=1777629798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOWdbZsDE9uSbA5I4Z2qv9tptB+zBfBHaBlfUDtxaeo=;
        b=OH/TUabdlnxpfIXY2m4/7A8iFMGlHliF8DnxZtFJu4Rg3PV30bwWiSMAiaWuIWXz8x
         eXDUVi1Z6gOVSCHopmYU860t9hrWlkI2W3J9x1KdmKcTRWDJPe+nZwJig8Iwgkk4rnzI
         DQaxcRfXrzRHia74ioIaQ/QgYC+AJZQCJeQy0/iDeNTFbqpzh31yAj+BLfi+aGG7BtFo
         o6hrFoF8oaKBCj9NOWTnUsbbcG6zWgz3d8hTKQJmwXcVw7cDbEBrX94iTHcrV0aStCkO
         nVw2CrOQBWs3qdUbF6u3uaKRGEDZdqjq3P2jVy/2lzxP1ktjmHAB66ECEZcDsH+qdxrF
         GcrQ==
X-Gm-Message-State: AOJu0Yxnr3TKar97b7DE9rgpl8gANbHjis9sx4Gfy9DKUaSb1HmRsyCt
	bAUI6Ka95+NYZsav1t8k4OuDMwJjzJwF1rNdWYkiKAiHFOkY+uyHDR2Tp0m8aw==
X-Gm-Gg: AeBDieujlLxQJZKJYx8d5q7Zm5tAthwAlJeYqQ3XPHYQa/5/q1cw8sH3L+NroOy3VEk
	2i5R6uCowl/NYkmjKeCJKXDUxZSbpqPrKLM/3tLZcTaeq3n7zPW8enCr64RAewfhulsKIW09VY7
	2aOoVvmZxJAfLzAtc7TLEf2oN0X+/nkbule54aj8sHOFrPATPPd/FkaWKwFfEVaRflxcO8YxpW6
	TYMfr0X6QNeI4pfjnmibMS/U7QlRAHsPbqt66Z4yXjw+jQ5+sWYEz/ygs4ZJWb264xBdqRkzN62
	lPBhUssR93MPqoLL6E1Dueo+/t9CFgUS0TSsM39MRlzvbxfxqORq3GeSNOrkaWjU0AL3m97QEJA
	N5/G7p4JuiIwelg8y1ORnb409zSpKBNeZdCgZZR27ZkcSH6R3so3cFL3Y1x2he3GYIUGxpfCUqS
	uhvyzWlbuweXybK9cpUCPgKDI9CP7yZc59bZKxm8ZMWcx1zNxUXh35u6T4+A==
X-Received: by 2002:a17:907:25cd:b0:ba9:559:10c8 with SMTP id a640c23a62f3a-ba905591bf7mr976449666b.41.1777024997995;
        Fri, 24 Apr 2026 03:03:17 -0700 (PDT)
Received: from ws.taila4487.ts.net ([80.166.137.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm777815466b.6.2026.04.24.03.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:03:17 -0700 (PDT)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH] sqlpp23: add package
Date: Fri, 24 Apr 2026 12:02:16 +0200
Message-ID: <20260424100214.2986513-3-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 10:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126603

---
 meta-oe/recipes-dbs/sqlpp23/sqlpp23_0.69.bb | 38 +++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/sqlpp23/sqlpp23_0.69.bb

diff --git a/meta-oe/recipes-dbs/sqlpp23/sqlpp23_0.69.bb b/meta-oe/recipes-dbs/sqlpp23/sqlpp23_0.69.bb
new file mode 100644
index 0000000000..ad0d4c4e5b
--- /dev/null
+++ b/meta-oe/recipes-dbs/sqlpp23/sqlpp23_0.69.bb
@@ -0,0 +1,38 @@
+HOMEPAGE = "https://github.com/rbock/sqlpp23"
+SUMMARY = "A type safe SQL library for C++"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fe3abf7ac4f19dc926a8ab383003aaa7"
+
+SRC_URI = "git://github.com/rbock/sqlpp23;protocol=https;branch=main;tag=${PV}"
+
+SRCREV = "1c47ff3c7c3542aa6091266be77122c7ced031e8"
+
+inherit cmake ptest
+
+do_install:append() {
+    install -m 0755 ${S}/scripts/sqlpp23-ddl2cpp ${D}${bindir}
+}
+
+PACKAGECONFIG ??= " \
+    sqlite3 \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)} \
+"
+
+PACKAGECONFIG[sqlite3] = "-DBUILD_SQLITE3_CONNECTOR=ON,-DBUILD_SQLITE3_CONNECTOR=OFF,sqlite3,"
+PACKAGECONFIG[mysql] = "-DBUILD_MYSQL_CONNECTOR=ON,-DBUILD_MYSQL_CONNECTOR=OFF,mariadb,"
+PACKAGECONFIG[mariadb] = "-DBUILD_MARIADB_CONNECTOR=ON,-DBUILD_MARIADB_CONNECTOR=OFF,mariadb,"
+PACKAGECONFIG[postgresql] = "-DBUILD_POSTGRESQL_CONNECTOR=ON,-DBUILD_POSTGRESQL_CONNECTOR=OFF,postgresql,"
+PACKAGECONFIG[sqlchiper] = "-DBUILD_SQLCIPHER_CONNECTOR=ON,-DBUILD_SQLCIPHER_CONNECTOR=OFF,,"
+PACKAGECONFIG[ptest] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF,,"
+
+# sqlpp23-ddl2cpp is staged in bindir, and is needed for code generation in downstream programs.
+# Shipped only in the -tools package
+PACKAGES =+ "${PN}-tools"
+RDEPENDS:${PN}-tools = "python3"
+FILES:${PN}-tools = "${bindir}/sqlpp23-ddl2cpp"
+SYSROOT_DIRS:append = " ${bindir}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# sqlpp23 is a header-only C++ library, so the main package will be empty.
+ALLOW_EMPTY:${PN} = "1"
-- 
2.54.0


