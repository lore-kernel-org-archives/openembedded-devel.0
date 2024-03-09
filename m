Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF21C54791
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 18:55:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.18644.1710010499905071557
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Mar 2024 10:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eBDcrZiw;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e676ea4e36so841252b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 10:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710010499; x=1710615299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GwoI86hPpevRR9WIoh0QSix/RmbXmRukeSgbjayJKs=;
        b=eBDcrZiw1MpbTdDHyjnmrhVYbJ7bzO0NK7AQTdqBRcVyxisa3XxRhQwQ9aAYCfCTOb
         F6s2ROhwC1M5gIJMb2ciFw7r4MXm/7Qde3FhQD4oZjgZv+atlOFStEBVZKiucYfQZzrS
         5tBG2m2MzdBP4tSfLWy8h9ImRSj7R7j/5rYd1cjhjhKPEhba4tLL5/1B6aQk6spImNAA
         nQAHLrfucVywW6G/U+m0L4Q3z0RJzj20zK9QL9txXsijPdXkVTFZ4iOmm30JpJF+J0n7
         uePqNn7KWaVqnPEHPXcjR0hs/NP1I8GGGS4ApUEmGLsZNDTn+r9YywX/YIiDO0OiwoBi
         kmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710010499; x=1710615299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GwoI86hPpevRR9WIoh0QSix/RmbXmRukeSgbjayJKs=;
        b=AwzYHqtZ/rwp+mkQ6puVpSMq2DSfvxOgbKM56sxwnPmDRkIulLK9sn8jgWDqyW9KSF
         yRqZ01I+34FAcGAcsoxpl64YNLB73sYwnxSUUNgVpvZgzzS2VQm6/3hBfDGGwjHW7fmh
         zRwGWAXOievNIKBKjI0MAPGYGFPRqE2WXFOXCyxf52F83W9CnSIC4AMDz8hkDgdPuhWw
         rMPFq7geT6f8Ehquwyj2gZi739ug0lJBi5vRw2bvXubx/6yN/UUQ0wbCF+HKVhlRxmrh
         zmR/cAYmJKGYcw64trwC5OkAeILtsuzOmUsH2TTPEuQiGujDHokEzp9c7BdTL5Ner/i/
         hP5w==
X-Gm-Message-State: AOJu0YxgJBTf3BtQSG/CFLOfO/VQ2s9DCy4ObK6tVZEnR2ezbAgt8ytc
	SQTA7bygeb0A77csU6W1V/UOA9NyzNINocdYw/4k4l3p/ndsNQaw47Djhhfd
X-Google-Smtp-Source: AGHT+IG5UixeqL2gxz8g3E+U4TQ78OgdF0jAGwSddu1/YIN3pUDRLqZiFDeEv7nrrSzfAFCcHGUPsw==
X-Received: by 2002:a05:6a00:244b:b0:6e6:2cde:a3d9 with SMTP id d11-20020a056a00244b00b006e62cdea3d9mr2065893pfj.10.1710010498798;
        Sat, 09 Mar 2024 10:54:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::419b])
        by smtp.gmail.com with ESMTPSA id j21-20020a62b615000000b006e650049472sm1534304pff.123.2024.03.09.10.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 10:54:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] netcf: Fix build with latest gnulib
Date: Sat,  9 Mar 2024 10:54:56 -0800
Message-ID: <20240309185456.1771096-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 18:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109247

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nulib-read_file-fread_file-signature.patch | 83 +++++++++++++++++++
 .../recipes-support/netcf/netcf_0.2.8.bb      |  2 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch

diff --git a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
new file mode 100644
index 0000000000..b188248fff
--- /dev/null
+++ b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
@@ -0,0 +1,83 @@
+From af256680926e166ac21bc0f11172ea6c077a9b55 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Mar 2024 10:40:48 -0800
+Subject: [PATCH] Adopt to new gnulib read_file/fread_file signature
+
+It now expects a flag parameter in latest gnulib
+see [1]
+
+[1] https://public-inbox.org/bug-gnulib/87tv01c1z2.fsf-ueno@gnu.org/
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dutil_linux.c  | 4 ++--
+ src/dutil_posix.c  | 2 +-
+ src/ncftool.c      | 2 +-
+ src/ncftransform.c | 2 +-
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/dutil_linux.c b/src/dutil_linux.c
+index 742153a..eb72eb2 100644
+--- a/src/dutil_linux.c
++++ b/src/dutil_linux.c
+@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *ncf,
+ 
+     xasprintf(&path, "/sys/class/net/%s/operstate", ifname);
+     ERR_NOMEM(!path, ncf);
+-    state = read_file(path, &length);
++    state = read_file(path, 0, &length);
+     if (!state) {
+         /* missing operstate is *not* an error. It could be due to an
+          * alias interface, which has no entry in /sys/class/net at
+@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *ncf,
+         FREE(path);
+         xasprintf(&path, "/sys/class/net/%s/speed", ifname);
+         ERR_NOMEM(path == NULL, ncf);
+-        speed = read_file(path, &length);
++        speed = read_file(path, 0, &length);
+         if (!speed && errno == EINVAL) {
+             /* attempts to read $ifname/speed result in EINVAL if the
+              * interface is ifconfiged down (which isn't exactly the
+diff --git a/src/dutil_posix.c b/src/dutil_posix.c
+index 1313514..b9884f0 100644
+--- a/src/dutil_posix.c
++++ b/src/dutil_posix.c
+@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const char *const *argv, char **output)
+                        "Failed to create file stream for output while executing '%s': %s",
+                        argv_str, errbuf);
+ 
+-    *output = fread_file(outfile, &outlen);
++    *output = fread_file(outfile, 0, &outlen);
+     ERR_THROW_STRERROR(*output == NULL, ncf, EEXEC,
+                        "Error while reading output from execution of '%s': %s",
+                        argv_str, errbuf);
+diff --git a/src/ncftool.c b/src/ncftool.c
+index f1b5642..c878cb0 100644
+--- a/src/ncftool.c
++++ b/src/ncftool.c
+@@ -351,7 +351,7 @@ static int cmd_define(const struct command *cmd) {
+     struct netcf_if *nif = NULL;
+     int result = CMD_RES_ERR;
+ 
+-    xml = read_file(fname, &length);
++    xml = read_file(fname, 0, &length);
+     if (xml == NULL) {
+         fprintf(stderr, "Failed to read %s\n", fname);
+         goto done;
+diff --git a/src/ncftransform.c b/src/ncftransform.c
+index fbabfc3..4c9a56d 100644
+--- a/src/ncftransform.c
++++ b/src/ncftransform.c
+@@ -54,7 +54,7 @@ int main(int argc, char **argv) {
+     if (argc != 3 || (STRNEQ(argv[1], "get") && STRNEQ(argv[1], "put")))
+         die("Usage: ncftransform (put|get) FILE\n");
+ 
+-    in_xml = read_file(argv[2], &length);
++    in_xml = read_file(argv[2], 0, &length);
+     if (in_xml == NULL)
+         die("Failed to read %s\n", argv[2]);
+ 
+-- 
+2.44.0
+
diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index 59ce3e9991..c68974f9f0 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -10,7 +10,7 @@ SRCREV = "2c5d4255857531bc09d91dcd02e86545f29004d4"
 PV .= "+git"
 
 SRC_URI = "git://pagure.io/netcf.git;protocol=https;branch=master \
-"
+           file://0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "release-(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.44.0


