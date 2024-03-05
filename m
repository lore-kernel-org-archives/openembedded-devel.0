Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B49EC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:07:50 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.1547.1709665668909627595
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 11:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DAEfDLoU;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dca3951ad9so1517475ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 11:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709665668; x=1710270468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiByJM51rXWsOc0juBAlujg2QbqlilzPgm1cAzVKqYQ=;
        b=DAEfDLoUDmmHNbVV1/s6FS2Yk3OFkxyNhGFzruvFwb9E+dG4NCIgaq34sNMRH8Zfj0
         A2n7kUYOD4ZDFEnPDSlSow7rF7R+zXDV93XwPoiYRN27WIn+v5XDTkk9FZEuqSr1zixr
         hJluk57xs1U1OAbZt4UaDzVFgVbijO2IX3afbUwrJn2i3RjYhgNep7lzJX7OxF1MdODg
         Cp3lGMrGCYbFrO57t1vBfIF0phxSaVb4OYTN9H6fQRFUNtqGFbRNGD7es557QT+z4AV/
         osr9qNzC/NbgwzVxdrZ37F7JmtWUGqRG2KcZHmxpkkwILrcBeZmen8NeDwGxaOgsEvrK
         y0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709665668; x=1710270468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiByJM51rXWsOc0juBAlujg2QbqlilzPgm1cAzVKqYQ=;
        b=IEabnKJ7U7KdrKWIiZNjFCQ30pWYUfRjKmDsT5LQC5mxQ3b4b07pZgclOjDxCDT66O
         73JN50ppuEsu3P4TXIf3SIC8zSA6ZQEADmnDbA+AM3U6Z0gRsOIcYYcvMetCqTSb91RE
         n4nSkQmY/WBBKq/N3s5dqV74X7JbMrX/z78VyiIsdtq/ucucs/W0bt/pF50epZglENp6
         d8gEneoojWDMas3FHE6tDv0iwEfyg/VpCbB2wFDmAy3dfzxBr/PSu5FfRl5kiS4aQ5Da
         jVruKnK9ZY4vjiU8R2KIMBq4y3HrPPCqLSlck+Ed5FT9I/Qr/VbEsusrwoewNCwPWymn
         MJIw==
X-Gm-Message-State: AOJu0Yz9pBocFAed6+x/ZntwbPED2dE3wcVvEakKX+bUTMjYtOq2weg2
	YmvMpyOe9FoPq786R/IlpVCaSgpoGNRRaLoRzNTAIgytnmnMFq+LaU/J696Y
X-Google-Smtp-Source: AGHT+IEVW7U/WhJkp5iA5RSryQCA0Ifd1vLd4vmQwMZVbjRqExAIyGq484OqJmSYAG8ny0Tt8npfuw==
X-Received: by 2002:a17:902:da92:b0:1dc:cf38:3a92 with SMTP id j18-20020a170902da9200b001dccf383a92mr2728699plx.8.1709665667874;
        Tue, 05 Mar 2024 11:07:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d3a5])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902a3cf00b001db3efca159sm11104411plb.132.2024.03.05.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 11:07:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/3] pgpool2: Upgrade to 4.5.1
Date: Tue,  5 Mar 2024 11:07:43 -0800
Message-ID: <20240305190745.3586645-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 19:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109127

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...own-type-name-fd_set-error-with-musl.patch | 33 -------------------
 .../{pgpool2_4.4.1.bb => pgpool2_4.5.1.bb}    |  8 ++---
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.4.1.bb => pgpool2_4.5.1.bb} (87%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch b/meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch
deleted file mode 100644
index 26f8afe4d6..0000000000
--- a/meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5d335b5ddd052f047759cae0e9b94ec49f9f3884 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@fujitsu.com>
-Date: Mon, 20 Mar 2023 02:03:04 +0000
-Subject: [PATCH] pgpool2: Fix unknown type name 'fd_set' error with musl.
-
-| read.c: In function 'read_until_ready_for_query':
-| read.c:53:24: error: storage size of 'timeoutval' isn't known
-|    53 |         struct timeval timeoutval;
-|       |                        ^~~~~~~~~~
-| read.c:54:9: error: unknown type name 'fd_set'
-|    54 |         fd_set          readmask;
-|       |         ^~~~~~
-
-Upstream-Status: Inappropriate [embedded specific]
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- src/tools/pgproto/read.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/tools/pgproto/read.c b/src/tools/pgproto/read.c
-index c7fb548..4efe641 100644
---- a/src/tools/pgproto/read.c
-+++ b/src/tools/pgproto/read.c
-@@ -19,6 +19,7 @@
- #include "../../include/config.h"
- #include "pgproto/pgproto.h"
- #include <unistd.h>
-+#include <sys/select.h>
- #include <stdlib.h>
- #include <stdio.h>
- #include <string.h>
---
-2.34.1
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
similarity index 87%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
index 5e6e00caeb..b127d69625 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
@@ -1,4 +1,4 @@
-SUMMARY = "a language independent connection pool server for PostgreSQL."
+SUMMARY = "A language independent connection pool server for PostgreSQL."
 
 DESCRIPTION = "Pgpool-II is a middleware that works between PostgreSQL \
                servers and a PostgreSQL database client. It is distributed \
@@ -12,11 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
 
 SRC_URI = "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://0001-Fix-build-error-when-build-this-file.patch \
-	   file://0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "4b379bbba8e178128a1cee4a5bd1ae116dedb3da6121b728c18f0f54c881f328"
+SRC_URI[sha256sum] = "8e14b0558a15dae8767c8e1acee3f2f6c7c08ebfffda66a359367eaaa56c3936"
 
 S = "${WORKDIR}/pgpool-II-${PV}"
 
@@ -34,9 +33,6 @@ PACKAGECONFIG[postgresql] = "--with-pgsql-includedir=${STAGING_INCDIR}/postgresq
 EXTRA_OECONF += "--disable-static \
 	         --disable-rpath \
 	        "
-
-CFLAGS:append = " -fcommon "
-
 FILES:${PN} += "${datadir}/pgpool-II/ "
 
 do_configure:append() {
-- 
2.44.0


