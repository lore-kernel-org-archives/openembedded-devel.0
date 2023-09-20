Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F80EC04FE4
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 18:31:09 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.3189.1695234667326155470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 11:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-79d1bcf289bso7729639f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 11:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695234666; x=1695839466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl7jCsuvEZdJPZ3PM3jyJLXw59RmAvmbOQlYlaRv3rU=;
        b=FvuC14qr8O3yYt1ov79cFVwyYHszGnUmU1O52f3r2tDqZTzMIylgBUYUqyeHmTBC2T
         nKOTYY7i3+/IYNyHswifSb4YeqtzobcJmb6S28kLat0ktdz/wabT6w5VuGfvGnP83Fk5
         TgYxkcsgxcLL5I6V7NkNnb6K1eGSXMzniMqjaYVbIUkwtoDs0w5Eo6XDPVpJosawdjnR
         bKOM2uxkfFuDMLng54aJtH2MOXCrnoM/K64XQokj2OJNN2heJDL/wous6/KNdahr42Dk
         JUTxvjAdpnY1mSDl+9Yi9TEqkauA+WR+mOouyLrJOQErjBW6BCH9xQPGo++PeoH3y3pa
         UmVA==
X-Gm-Message-State: AOJu0YwE6NdEzBnZ7nQMighb7MbcZtWaRaKqi+TQnoCrDtChfrtZL4Nj
	xsnpJVGdqORaPuNTuZZmsT+LKOTz4RTZuQ==
X-Google-Smtp-Source: AGHT+IEat3CcQ/oaKPxXOz0Fp0pvcXyVH/1TFzlpL8HoCx2FWfDYbzdZyIMTU1nW991VHSwMvG5oCQ==
X-Received: by 2002:a5e:df44:0:b0:795:8805:137e with SMTP id g4-20020a5edf44000000b007958805137emr3679715ioq.10.1695234665940;
        Wed, 20 Sep 2023 11:31:05 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id q20-20020a5d8354000000b00777b7fdbbffsm4173504ior.8.2023.09.20.11.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 11:31:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cantools: Update version 38.0.2 -> 39.2.0
Date: Wed, 20 Sep 2023 18:30:45 +0000
Message-Id: <20230920183045.1320339-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 18:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105020

Update the inherit is use the poetry

Changelog
=========
What's Changed
Make cycle_time serialisation more consistent for DBC files by @mon in #592
User f-strings instead of str.format() by @zariiii9003 in #599
Add prog option to argparse for help messages by @jack-champagne in #600

NOTE: This is a major release change with the following API changes:
The initial attribute of Signal objects now always holds the initial signal value as a scaled quantity, unifying its semantics with that of Signal.minimum and Signal.maximum. Previously, initial used raw values for databases loaded from DBC files, while using scaled ones for databases loaded from ARXML. (The loaders for other file formats do not currently set the initial attribute.)
The machinery for storing decimal numbers without rounding errors (*.decimal attributes) has been removed. In its place small rounding errors in load-store-load cycles are now accepted. To remediate this, the resulting database objects can now be compared approximately using the Database.is_similar() method.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-cantools_38.0.2.bb         | 22 -------------------
 .../python/python3-cantools_39.2.0.bb         | 22 +++++++++++++++++++
 2 files changed, 22 insertions(+), 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cantools_39.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb b/meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
deleted file mode 100644
index 003573583..000000000
--- a/meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "CAN BUS tools in Python 3."
-HOMEPAGE = "https://github.com/eerimoq/cantools"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
-
-SRC_URI[sha256sum] = "93bfe6f4bd652f369763ea9162b027a62f424a8400f2423d41137918ce68c68e"
-
-PYPI_PACKAGE = "cantools"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "\
-	${PYTHON_PN}-can \
-	${PYTHON_PN}-bitstruct \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-textparser \
-	${PYTHON_PN}-typing-extensions \
-	${PYTHON_PN}-diskcache \
-        ${PYTHON_PN}-asyncio \
-"
-
-CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.2.0.bb b/meta-python/recipes-devtools/python/python3-cantools_39.2.0.bb
new file mode 100644
index 000000000..a87aff144
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.2.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "CAN BUS tools in Python 3."
+HOMEPAGE = "https://github.com/eerimoq/cantools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
+
+SRC_URI[sha256sum] = "24045c5575217bb5331543e6a55cee822c37ad811dc4a08c75aa2eee3c6d529c"
+
+PYPI_PACKAGE = "cantools"
+
+inherit pypi python_poetry_core
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-can \
+    ${PYTHON_PN}-bitstruct \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-textparser \
+    ${PYTHON_PN}-typing-extensions \
+    ${PYTHON_PN}-diskcache \
+    ${PYTHON_PN}-asyncio \
+"
+
+CLEANBROKEN = "1"
-- 
2.34.1


