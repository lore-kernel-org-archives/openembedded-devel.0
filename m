Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8548DC7EE32
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.13653.1684816023864752813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DBCBbWh9;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64d44b198baso2151685b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816023; x=1687408023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz7WpdI9LrRyQe7FFmt81T4RREWHH1YjaeYtHatWRlc=;
        b=DBCBbWh9StZaPVsWJ7kNsWzKfBlbPMBFfFqyxo3XVcG+MqZ8jjcoTxbsvFPxX5zUW+
         JBMmbVdzCiPSCe8WDSEdFNo7WxxxRUH72fPOsp/Uh87nbbCVwX8/D22FIphGvJ947aJH
         mJN35qWD2KwZiqrtuUQI5ud66zirMCeduXUwwLlTm7nKFV0/03UWm2feU9PU2cCpDW/W
         2/WnwYSWsTsVfnGQ/SHxG2EOvdwn5NCJ3uSuK7cUSc7+J3+4t1YEqOmdRtutjH/wUFI1
         P6AfjpfluH5JYes8SwnqMvomOkCe9vlT+KUmv2TAagy8l10+fAGOjS1Zf/OT7peXe0WE
         ScpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816023; x=1687408023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz7WpdI9LrRyQe7FFmt81T4RREWHH1YjaeYtHatWRlc=;
        b=Y46KHRPsnjKCflHqVCtVO1Q0jFmGdmtX2VGxkWvfTbNHWL0Z97PKEBOEuJnUJbIY5x
         NdIAAjrdmGeNXzZejZIZski8MTiuwtVz74/u1a7qhDxYfH4ATfGvdt80CqWhiXqS/LAz
         k5I1zbTuo435XyVNLgG+LYpvbPZGe2FwDNl54VekfQn1ZLNNm/UEZTu4lcd1m3E/+bP7
         zbRFtm4UFLrS24LWaqbu4LzJgOt0Rs/OLOk2EXZIjOkGDk7pHEd5RcRhUkxMsgljj+qa
         kumPEd0xFwlKXOjraAa8YhO27Wy8D6+/dx1ZINAFaRNJrTuI6RQWgpANJBqvYYsNvzUH
         y/ng==
X-Gm-Message-State: AC+VfDwWzSfqpCEoVpaBOGDqzY5sGddgzSyZ1WmLLOS0MfcpdQqs56U7
	u8vvtOTEeDkvgur3x5zF5+HihrLqBdI=
X-Google-Smtp-Source: ACHHUZ4Z1N07luf/qB4qRmz+jWiJXwpS0oXReQY96Eje/OSifmXpD5QK37OC9J0VGdGzgEoxrdLBNA==
X-Received: by 2002:a05:6a20:1441:b0:10c:4a13:a5cf with SMTP id a1-20020a056a20144100b0010c4a13a5cfmr1945600pzi.6.1684816022941;
        Mon, 22 May 2023 21:27:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/11] uml-utilities: Fix references to TMPDIR
Date: Mon, 22 May 2023 21:26:52 -0700
Message-Id: <20230523042658.4159559-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102720

Fixes
WARNING: uml-utilities-20040406-r1 do_package_qa: QA Issue: File /usr/lib/uml/.debug/port-helper in package uml-utilities-dbg contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cow.c-Replace-stat64-with-stat.patch | 39 +++++++++++++++++++
 .../uml-utilities/uml-utilities_20040406.bb   |  5 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch
new file mode 100644
index 0000000000..08296b97fc
--- /dev/null
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch
@@ -0,0 +1,39 @@
+From c4f85268da6c30b0aec3d9a0e951b2088887cff4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 May 2023 18:35:37 -0700
+Subject: [PATCH] cow.c: Replace stat64 with stat
+
+LFS64 is deprecated in latest musl and this fails to build
+therefore switch to using stat API which is same as stat64 these days
+
+Upstream-Status: Inappropriate [No upstream]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ moo/cow.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/moo/cow.c b/moo/cow.c
+index 3951642..739d5ab 100644
+--- a/moo/cow.c
++++ b/moo/cow.c
+@@ -161,7 +161,7 @@ int write_cow_header(char *cow_file, int fd, char *backing_file,
+ 		     int sectorsize, int alignment, long long *size)
+ {
+         struct cow_header_v3 *header;
+-	struct stat64 buf;
++	struct stat buf;
+ 	int err;
+ 
+ 	err = cow_seek_file(fd, 0);
+@@ -192,7 +192,7 @@ int write_cow_header(char *cow_file, int fd, char *backing_file,
+ 		      backing_file))
+ 		goto out_free;
+ 
+-	err = stat64(header->backing_file, &buf);
++	err = stat(header->backing_file, &buf);
+ 	if(err < 0){
+ 		cow_printf("Stat of backing file '%s' failed, errno = %d\n",
+ 			   header->backing_file, errno);
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 35ae5f777d..6533455d8f 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://downloads.sourceforge.net/project/user-mode-linux/tools/1/uml_
            file://unstrip.patch \
            file://0001-include-required-system-header-files-for-fd_set-and-.patch \
            file://0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch \
+           file://0001-cow.c-Replace-stat64-with-stat.patch \
            "
 SRC_URI[md5sum] = "2c1ccd9efacbfb39e42d482b89b2550a"
 SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cded9f41"
@@ -19,11 +20,11 @@ S = "${WORKDIR}/tools"
 inherit update-alternatives
 
 do_compile() {
-    oe_runmake LIB_DIR=${libdir}/uml
+    oe_runmake LIB_DIR=${libdir}/uml CFLAGS="${CFLAGS}"
 }
 
 do_install() {
-    oe_runmake install DESTDIR=${D} LIB_DIR=${libdir}/uml
+    oe_runmake install DESTDIR=${D} LIB_DIR=${libdir}/uml CFLAGS="${CFLAGS}"
 }
 
 FILES:${PN} += "${libdir}/uml"
-- 
2.40.1


