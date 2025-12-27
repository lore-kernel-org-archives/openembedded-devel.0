Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F096BE8FDD5
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 06:56:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4535.1766818601412953436
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 22:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fvO+1Szg;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so4023377f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766818600; x=1767423400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AF4FKnevlzcHNdxw+vvnYk2zcNexe7a6AT08Qb3VdIM=;
        b=fvO+1SzgKf+c0zGwvQJRZfljaK6hr6vMgL/Rh3jmIaCoasDFICQewMEHrDbZCDbyg1
         fRDM1nTBTjg/sxlYwvLbXaVmETw8k1FwZgR8dg3hTEFg2hkJ2I6pORrEhDk6epe8XBfA
         Inkzn2Y7SDyoVJFn0I4H67iehM4BiDL2q0/ZIoKGB8fCkRqXWDu5mMZ7MTOrwS7c+FCx
         Qh9MaBCd5JSxVcco/1L52maCZJWhYqfe7K7rhcaMla8V0Sqtsb1jUsZhCOqSlUnp0XdD
         b3cD3ci8Iaf+Xj1aedQQoj9hNzW423a6ZmO2IPW6M2EMCkAttwldka6X01nXhWN5K5Y8
         saeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766818600; x=1767423400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AF4FKnevlzcHNdxw+vvnYk2zcNexe7a6AT08Qb3VdIM=;
        b=xDnMKfIzBbTcrxY85C4atqz/N1hxFvdJc6DB9MNtOqmGWxIiKrLUJt2UFIl588i28g
         cyEmRWHwve1aDg2fhRbM/mj4eKBvPoWXUgE88l6eqgz2wGeWeAY/ad8nNMnWj1h32Eug
         sOIv7BVKIYbDUGcIoTejRTOtWTSMWcEmhTg6WeKSmFEv7MA1JO7oHf9XcVGJ8c2bv8b9
         Qv35zY1hfJNS73/9zwresxRLjKjxY8Ooj5Yr8zclGTJ4dO2dn/2LKYyk5Lj6yBxgR07x
         GEv/PK3EubC3fCI+NwG47pT/IgNW8WovXNKeqjkCBxxWbZvB7MdQGsNUjPOE1hH+TREZ
         +80g==
X-Gm-Message-State: AOJu0YwiaDZYBQx0IQEc2Bq8WcAA0XsBipKxNDwv9JoS7dDwKyXoT8S0
	pnCnOeuoZIVoHsSuVHUVhGeZEBNE5OsterLYs3hgMtVgqG1ytEsL0WhtxTHkMw==
X-Gm-Gg: AY/fxX6P25p2Bx450O2Z6ynqbDsYrCU3ZLelzM1MlpydEcnHRYk67sblkRP3N/qd0Dy
	4nghQ+Ayb2lbt1eJUWCaV5KvgNEKI2lPmHW5ToRMfjCnCDFEG0+Z7mKu7Inu6jVxF26IHOgcqmj
	yF75gBxcoXyrEEJ2c+vcIKN419yiAah447ozmg5ZDTF2aagRboxGsItFBSVMgTvpAKHafXQ+SZp
	z2l/Kp6Y408M7CQuGdDDhvNsZtw1vJcbi+hvzC2jjrvx49A+j7X3JcC0ft6SMAermpwGmsrZwB7
	99ER6jgKshesoQwckGmKnWpDd2YpGYr8hjqGR7xgsb09TySOZZ7/kmBBsK+L3rhPDtr7AUb7VEs
	7s9qDkVrV8SqyJ3iVQv6PUFqAuFPQxRhyPQ0v0H/CCEOMzgZxpSYXiSiz1lyfxfCMuO2dzceaBy
	jsHmDHZcA4fovLRfhIOtQ=
X-Google-Smtp-Source: AGHT+IGJi2KHnMKoFp7fZxebwvhHmGqNi2wvMcSbu8V0+7ANMlsm2rGalMW7Ht259bYglzEqnA1veA==
X-Received: by 2002:a05:6000:430b:b0:3ea:6680:8fb9 with SMTP id ffacd0b85a97d-4324e3ec0b2mr32926662f8f.3.1766818599548;
        Fri, 26 Dec 2025 22:56:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm48902371f8f.31.2025.12.26.22.56.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 22:56:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 2/6] exfatprogs: add ptest support
Date: Sat, 27 Dec 2025 07:56:32 +0100
Message-ID: <20251227065636.3144581-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227065636.3144581-1-skandigraun@gmail.com>
References: <20251227065636.3144581-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 06:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122945

It takes about a second to execute the suite.

Sample output (the "ERRORs" are coming from negative tests):

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-26T20:19
BEGIN: /usr/lib/exfatprogs/ptest
Running ./bad_file_size
-----------------------------------
exfatprogs version : 1.2.6
ERROR: /dir_01/bad_child_01: less clusters are allocated. truncates to 8192 bytes at 0x206060. Truncate (y/N)? y
ERROR: /dir_02/bad_child_02: more clusters are allocated. truncate to 8192 bytes at 0x209060. Truncate (y/N)? y
exfat.img: clean. directories 3, files 9
exfat.img: files corrupted 0, files fixed 1

exfatprogs version : 1.2.6
exfat.img: clean. directories 4, files 10

PASS: ./bad_file_size
[...many lines...]
PASS: ./bad_num_chain
Running ./loop_chain
-----------------------------------
exfatprogs version : 1.2.6
ERROR: /dir_01/bad_child_01: more clusters are allocated. truncate to 16384 bytes at 0x206060. Truncate (y/N)? y
ERROR: /dir_02/bad_child_02: cluster is already allocated for the other file. truncated to 8192 bytes at 0x209060. Truncate (y/N)? y
exfat.img: clean. directories 3, files 9
exfat.img: files corrupted 0, files fixed 1

exfatprogs version : 1.2.6
exfat.img: clean. directories 4, files 10

PASS: ./loop_chain

PASS: 17 of 17
DURATION: 1
END: /usr/lib/exfatprogs/ptest
2025-12-26T20:21
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-filesystems.inc  |  1 +
 .../recipes-utils/exfatprogs/exfatprogs/run-ptest    |  3 +++
 .../recipes-utils/exfatprogs/exfatprogs_1.2.6.bb     | 12 ++++++++++--
 3 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/exfatprogs/exfatprogs/run-ptest

diff --git a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
index 3dc6986d6f..26917a93c9 100644
--- a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
+++ b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
@@ -8,6 +8,7 @@
 
 PTESTS_FAST_META_FILESYSTEMS = "\
     e2tools \
+    exfatprogs \
     unionfs-fuse \
 "
 
diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs/run-ptest b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs/run-ptest
new file mode 100644
index 0000000000..337f2029dd
--- /dev/null
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+cd tests
+./test_fsck.sh
diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.6.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.6.bb
index 39411b4cee..8e7d86f307 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.6.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.6.bb
@@ -11,14 +11,22 @@ SECTION = "universe/otherosfs"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://run-ptest"
 SRC_URI[sha256sum] = "89d05b7a9537f2413079b724ec8d02d7a2e291c29c52e7256303e9456200fb0f"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
 
-inherit autotools
+inherit autotools ptest
 
 RPROVIDES:${PN} = "exfat-utils"
 RCONFLICTS:${PN} = "exfat-utils"
 RREPLACES:${PN} = "exfat-utils"
+RDEPENDS:${PN}-ptest += "bash xz"
+
+do_install_ptest(){
+    cp -r ${S}/tests ${D}${PTEST_PATH}
+    sed -i "s,Passed,PASS:," ${D}${PTEST_PATH}/tests/test_fsck.sh
+    sed -i "s,Failed,FAIL:," ${D}${PTEST_PATH}/tests/test_fsck.sh
+}

