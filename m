Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DFAC6FD1C
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 07:08:31 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.62307.1678604908145672932
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Mar 2023 23:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d2Bth3Co;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id ay18so5959879pfb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Mar 2023 23:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678604907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XqpqrujUf8Kn7TjSX+qxZ7KD3C8Xe015BwpxYRZcjFw=;
        b=d2Bth3CovIJzJhVhJ/wqhVIIoh0Y6ZiZSCMlHsem5J+zJKeNywUlau0T5GRqR+qjAz
         4irQtGMKeGm/iAaswMSsw5+J12HtKacFa9nYxp8joow04BKmSEo0LyJcvrnKQakD3QcX
         sjF8OaIyvuMvj9DcpA/7gT7s1nMFYQM9GT7nYB95NkT7koqyDCol7oz7qMa6aduGsGKn
         RO3ypZ/rzRnlOYs0lDe647M0yKXpUeKwaBRXIQU2n/393Ys92h2aPp51BtPwTZy7bmR4
         1G0fktQqtsvGHp/vUSXhjyoBpI1UsRTRxN2VTupTkbF1Lsims42HIztvuHjK9AmY3FD7
         9u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678604907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqpqrujUf8Kn7TjSX+qxZ7KD3C8Xe015BwpxYRZcjFw=;
        b=Ire4QeY8TJS5KCw1fkyhh98DNKh5hchPTLSdORADpiORSErThAdY4T28toTyYWgs5m
         F7sPjdC+9oVbMgFoEL6KR/0gHtZiVgI5S14MRt3M7EeZ274my6HWitoXXhe3RO1kwV+W
         d1Wglfr7RvsjOvbGT57h9ugiFpMaj2cJYJn0YkTgMe6JsKRrlb7wWDBGqBWQwIypnJt7
         oVCxCp7Z8I5T6ObAElMen5QAQLpcMFWjaL0U0UMAs0iCXyigMRr1HW3ZqdlMAXzvZGz6
         bgDR0qZrf35+7rs1JEXVcM9PzQsFFb0k/OkDRxmxlufLycqJMHItynwKstWsEBVnlajV
         X+9w==
X-Gm-Message-State: AO0yUKWxk3plZ/iW67sFjHI9bZ2EaXA48kJBp+yL7KQi5gCpt4cnJLuU
	7pQ+GihsgEA1NmnXREBPBU9JirXyOug=
X-Google-Smtp-Source: AK7set89ASpIxaQamQqkNe7Kr/1J53lht0DVG4h5Kiv+/Tfuii3cE9aqVca9Eyj6xRYb16d0RcoXRg==
X-Received: by 2002:aa7:9814:0:b0:5a8:380d:7822 with SMTP id e20-20020aa79814000000b005a8380d7822mr25374311pfl.23.1678604907184;
        Sat, 11 Mar 2023 23:08:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::522c])
        by smtp.gmail.com with ESMTPSA id j11-20020aa7800b000000b005d503abc8fesm2281814pfi.218.2023.03.11.23.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 23:08:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sg3-utils: Fix build with musl
Date: Sat, 11 Mar 2023 23:08:23 -0800
Message-Id: <20230312070823.2502130-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Mar 2023 07:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101506

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-sg_dd.c-Use-off_t-instead-of-uint.patch | 36 +++++++++++++++++++
 .../sg3-utils/sg3-utils_1.47.bb               |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/sg3-utils/sg3-utils/0001-sg_dd.c-Use-off_t-instead-of-uint.patch

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils/0001-sg_dd.c-Use-off_t-instead-of-uint.patch b/meta-oe/recipes-support/sg3-utils/sg3-utils/0001-sg_dd.c-Use-off_t-instead-of-uint.patch
new file mode 100644
index 0000000000..317876f197
--- /dev/null
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils/0001-sg_dd.c-Use-off_t-instead-of-uint.patch
@@ -0,0 +1,36 @@
+From 9a8ede03ef61cdf527ce3a80771150a7452e4603 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Mar 2023 22:56:17 -0800
+Subject: [PATCH] sg_dd.c: Use off_t instead of uint
+
+uint is not available on every platform e.g. linux/musl systems. Use
+uint32_t instead to represent 'off' variable, Fixes
+
+sg_dd.c:2402:17: error: use of undeclared identifier 'uint'; did you mean 'int'?
+                uint off;
+                ^~~~
+                int
+1 error generated.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sg_dd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sg_dd.c b/src/sg_dd.c
+index 9d05c93..35e2423 100644
+--- a/src/sg_dd.c
++++ b/src/sg_dd.c
+@@ -2399,7 +2399,7 @@ main(int argc, char * argv[])
+             res = blocks * blk_sz;
+             if (iflag.zero && iflag.ff && (blk_sz >= 4)) {
+                 uint32_t pos = (uint32_t)skip;
+-                uint off;
++                uint32_t off;
+ 
+                 for (k = 0, off = 0; k < blocks; ++k, off += blk_sz, ++pos) {
+                     for (j = 0; j < (blk_sz - 3); j += 4)
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
index fe129b8ed3..1aa65e6cc4 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f685699d3ac82f108aa880043fa3feb7"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
-"
+           file://0001-sg_dd.c-Use-off_t-instead-of-uint.patch"
 MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.39.2


