Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19F6C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 14:53:07 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.22335.1639234386820706029
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 06:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=eUZRaknF;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.176, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f176.google.com with SMTP id m12so17652107ljj.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 06:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+5lnfuD6A9vFp9n8GYLl0toMIU7Zbf2JgW6dvUdj9nU=;
        b=eUZRaknFkPYyK0tgO/sQ7WOSrXmdmwmVhmvk8vKC9TBcMima9eV5VdWjm5KTIYRQ8J
         dgp0pdNV0fW/E84gdmU1Kdj8idF3saA60NFKPV28Wsw25netGB+Fws7KUr+DB3MRGoSV
         1JtaSrRUu+nVX0VD1/rTSOrpsrAWjrtpkSH+HSP37rcF1S2Vy6fQErYrL4yaR/BuW8rR
         TekXGgR/JIxhL9kdi0nHulfeEds9n9dLkFtsxpg5eImQCqoZgW4agb3/dgvY3MpAuiR0
         iUcgf1medb/sjfSuG80/anD97XXc0YScAqWITAMiIffs1mageOl8CcWwxVKk8K7DW4lY
         nWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+5lnfuD6A9vFp9n8GYLl0toMIU7Zbf2JgW6dvUdj9nU=;
        b=Wu5wJ81kVImdrCZmNcgtKx43fuG/keSWWAsv6uB1OGysYkyvT6kb2gnT1f19Nc2VI+
         sIaCz1LNTJLuQztoug160+ECw7WG/rTNPJ1fQJce3alXLJLk+1jN7TAs5VJoHSHEIcSV
         Fg5SFEl60/OHiQC9qdf7Y10WA8uCI4XktHWe2z/yFrlnmpleZdaeb07swbSDP6lDzGyJ
         hTyekW2M1xRyXA/bmPVVRzNS6kgaLGWFRIUIuB5Swf1brhfGa9M7s+uY6ZI4q4fK53Kt
         Pid3vYxZq1v4UOGe9WAcUltKsHfh1vd4yLb95isn/2kiv8klwVtGWHXL1zWW20AVWBUy
         JZGQ==
X-Gm-Message-State: AOAM532AQL1Dsf6sQjst8Vclfd//ib3lyR+HztVL3xBOxJmKGqNbVoso
	Xg2xxR39J5KPxjJxOa+9vaZ40IvaveV2M+7M
X-Google-Smtp-Source: 
 ABdhPJxgugE1l2g0ihmis5TBXaIuDcFdEKZlEhuq40tDWhi89noQxpEShUB+HWd5swP8topP/jpstA==
X-Received: by 2002:a2e:a594:: with SMTP id
 m20mr18073075ljp.332.1639234384428;
        Sat, 11 Dec 2021 06:53:04 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id y2sm656968lfk.47.2021.12.11.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 06:53:03 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] soci: update to 4.0.2
Date: Sat, 11 Dec 2021 15:52:54 +0100
Message-Id: <20211211145254.3385758-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 14:53:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94284

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...hen-SIGSTKSZ-is-no-longer-a-constant.patch | 42 +++++++++++++++++++
 .../soci/{soci_3.2.3.bb => soci_4.0.2.bb}     | 11 ++---
 2 files changed, 45 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/soci/soci/0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch
 rename meta-oe/recipes-dbs/soci/{soci_3.2.3.bb => soci_4.0.2.bb} (84%)

diff --git a/meta-oe/recipes-dbs/soci/soci/0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch b/meta-oe/recipes-dbs/soci/soci/0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch
new file mode 100644
index 000000000..8e32ebb0b
--- /dev/null
+++ b/meta-oe/recipes-dbs/soci/soci/0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch
@@ -0,0 +1,42 @@
+From fae154eb209e068586e1adb589de5d273fcf4b4f Mon Sep 17 00:00:00 2001
+From: Denis Arnaud <denis.arnaud_fedora@m4x.org>
+Date: Tue, 18 May 2021 00:05:03 +0200
+Subject: [PATCH] Fix build when SIGSTKSZ is no longer a constant
+
+In the latest glibc versions SIGSTKSZ is not a constant any more, which
+broke building the tests with it.
+
+Work around this by hard-coding a typical value for it.
+
+closes #886.
+
+Upstream-Status: Backport.
+---
+ tests/catch.hpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/catch.hpp b/tests/catch.hpp
+index 014df2c5..85067813 100644
+--- a/tests/catch.hpp
++++ b/tests/catch.hpp
+@@ -6489,7 +6489,7 @@ namespace Catch {
+         static bool isSet;
+         static struct sigaction oldSigActions [sizeof(signalDefs)/sizeof(SignalDefs)];
+         static stack_t oldSigStack;
+-        static char altStackMem[SIGSTKSZ];
++        static char altStackMem[8192];
+ 
+         static void handleSignal( int sig ) {
+             std::string name = "<unknown signal>";
+@@ -6540,7 +6540,7 @@ namespace Catch {
+     bool FatalConditionHandler::isSet = false;
+     struct sigaction FatalConditionHandler::oldSigActions[sizeof(signalDefs)/sizeof(SignalDefs)] = {};
+     stack_t FatalConditionHandler::oldSigStack = {};
+-    char FatalConditionHandler::altStackMem[SIGSTKSZ] = {};
++    char FatalConditionHandler::altStackMem[8192] = {};
+ 
+ } // namespace Catch
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/soci/soci_3.2.3.bb b/meta-oe/recipes-dbs/soci/soci_4.0.2.bb
similarity index 84%
rename from meta-oe/recipes-dbs/soci/soci_3.2.3.bb
rename to meta-oe/recipes-dbs/soci/soci_4.0.2.bb
index c218b7151..fb67e0c54 100644
--- a/meta-oe/recipes-dbs/soci/soci_3.2.3.bb
+++ b/meta-oe/recipes-dbs/soci/soci_4.0.2.bb
@@ -1,6 +1,3 @@
-# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
 DESCRIPTION = "The C++ Database Access Library"
 HOMEPAGE = "http://soci.sourceforge.net"
 LICENSE = "BSL-1.0"
@@ -8,12 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SECTION = "libs"
 DEPENDS = "boost"
 
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz \
-           file://soci_libdir.patch \
-          "
-SRC_URI[md5sum] = "acfbccf176cd20e06833a8037a2d3699"
-SRC_URI[sha256sum] = "2c659db0f4f7b424bbcffe195c03c293a1dbf676189a27b077fb2aab4d53a610"
+           file://0001-Fix-build-when-SIGSTKSZ-is-no-longer-a-constant.patch"
+SRC_URI[sha256sum] = "34da2d2320539463da8a5131253246fa2671e0438ab5fd1e5119edb428f558a5"
 
 TESTCONFIG = '-DSOCI_TEST_EMPTY_CONNSTR="dummy" -DSOCI_TEST_SQLITE3_CONNSTR="test.db" \
               -DSOCI_TEST_POSTGRESQL_CONNSTR:STRING="dbname=soci_test" \
@@ -29,6 +23,7 @@ PACKAGECONFIG[postgresql] = "-DSOCI_POSTGRESQL=ON,-DSOCI_POSTGRESQL=OFF,postgres
 PACKAGECONFIG[odbc] = "-DSOCI_ODBC=ON,-DSOCI_ODBC=OFF,,"
 PACKAGECONFIG[empty] = "-DSOCI_EMPTY=ON,-DSOCI_EMPTY=OFF,,"
 PACKAGECONFIG[oracle] = "-DWITH_ORACLE=ON --with-oracle-include=${OINCDIR} --with-oracle-lib=${OLIBDIR},-DWITH_ORACLE=OFF,,"
+PACKAGECONFIG[firebird] = "-DWITH_FIREBIRD=ON,-DWITH_FIREBIRD=OFF,,"
 PACKAGECONFIG[ptest] = "${TESTCONFIG},,,"
 
 # enable your backend by default we enable 'empty'
-- 
2.25.1


