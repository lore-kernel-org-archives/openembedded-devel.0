Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED15C4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 08:24:01 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.26378.1699172632221571605
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 01:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gje+p55I;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3575c10421aso13359695ab.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 01:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699172631; x=1699777431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCqS9ZpId3G/gUrA+J+DrWWQEDPOd7ESUSkSg4GZkEo=;
        b=Gje+p55IyijfpThIvReQGJvhv7df1rnPi9idB1OjlzQnyTTRwGrD/5G4yZJQasGptY
         cnSvHJeDUEisMDGhHMp9AGW+Xpgczsk62dV0OjDw2py/hVcPaAVA927qfG3ngJJrEo1h
         vhxeI2iFbHyrCDs4D+W6Q1iGct/NzCSU+M4qsBZ/AbQ6hvLOhOGSOtaUyadvfmzRyuSL
         iOTlnIvGnjCbuL9hUiQOXmdkEA5gie4yOU7ijisV0v3f00AUqvsFCr7Ixhmo+UAIt46u
         yKTfiXIbSLsGNC7MpuLFiGgAdKb8Ffh5FLSQE6Z5GbCjmFvYo0XUoG+KbbKi1QdNVHwh
         eD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699172631; x=1699777431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCqS9ZpId3G/gUrA+J+DrWWQEDPOd7ESUSkSg4GZkEo=;
        b=XFuDKQXp1DTcVOCTyihMSOfpDeXTvwRbI3AihHF9SOe8DjBD/fU5s5aTOLgLR27I/G
         4vtO3sFMhxfqW1xvL70DtyZvFDC10CwNQONuDToGz4dBK/OUlYplvk+WBZd5rQ6sqQDD
         bTUrQEFiLuBOxu1Fd9PqEDAPReQIyDZmpYoFO1k/N+vANruOA6+d1DN1ZAkengoJRU+K
         /GcZWhQUKg1wbly4WIcxAod1XURyFRxflsdoQC/cWcVtNrvbWJOUupfZCPUeWpeL6FTt
         XDlUMXXICC36m8c22RIDXUnE5ZhdJQj0YNuudurQtBA2/vC7oe+aDYSrUi1fNHdj3I07
         KeHA==
X-Gm-Message-State: AOJu0Yz8LaeIybqGS/42NM5uYjpp4NqX7sO9ixY50gN6jD790Lxk7+xp
	5ZLk5CMBxJWrSZ1BhbIf1uEIG0EJH7809w==
X-Google-Smtp-Source: AGHT+IFVFo7jCvM68ycTpMj1wMAEE0LgR2fQL1s0qMQ8ayUirENWPuEhKYuAqxobnD52RMiHBmC7aQ==
X-Received: by 2002:a05:6e02:3088:b0:359:5b0:ee3b with SMTP id bf8-20020a056e02308800b0035905b0ee3bmr29777686ilb.17.1699172630896;
        Sun, 05 Nov 2023 01:23:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902bd8b00b001ccb81e851bsm2111345pls.103.2023.11.05.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 01:23:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] xfstests: Fix build with clang17
Date: Sun,  5 Nov 2023 01:23:48 -0700
Message-ID: <20231105082348.1075222-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 08:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106382

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...itly-use-int-for-return-type-for-aio.patch | 30 +++++++++++++++++++
 .../xfstests/xfstests_2023.10.29.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch
new file mode 100644
index 0000000000..5e9e9d9a79
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch
@@ -0,0 +1,30 @@
+From 0927d0def968ea7e19905c7e39182f65961c11cf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 5 Nov 2023 01:17:52 -0700
+Subject: [PATCH] ltp/fsx.h: Explicitly use int for return type for aio_rw()
+
+Fixes build with clang-17+
+error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
+
+Upstream-Status: Submitted [https://marc.info/?l=fstests&m=169917222008646&w=2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ltp/fsx.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ltp/fsx.c b/ltp/fsx.c
+index ee4b8fe4..c0aec23f 100644
+--- a/ltp/fsx.c
++++ b/ltp/fsx.c
+@@ -2581,7 +2581,7 @@ out_error:
+ 	return -1;
+ }
+ #else
+-aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
++int aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
+ {
+ 	fprintf(stderr, "io_rw: need AIO support!\n");
+ 	exit(111);
+-- 
+2.42.1
+
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
index 79775fcb78..b8880e016c 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
@@ -7,6 +7,7 @@ SRCREV_FORMAT = "xfstests_unionmount"
 
 SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=for-next;name=xfstests \
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
+           file://0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-- 
2.42.1


