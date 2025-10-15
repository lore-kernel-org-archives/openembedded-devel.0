Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B982CCD190
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 07:52:41 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.10454.1760514759556949809
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 00:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HjDSegir;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b57bf560703so4071514a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760514758; x=1761119558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXyhg5YEKefX87Hq9WAVu7fRoW023ctluaNE3qrEEpQ=;
        b=HjDSegirk3f1YmoNBmhESwnvCjrIA95lILYzuNlAwHbGa6694BmQpGFrh1LuMuFp64
         xnUVNc3A0eMhcYv2ku6AbOF0kYnY4040MiVpV7PdZQf2sn1tdSxYlp6X2N1QB3NhGIKm
         ah9O0+GRcKNxkRkQPG117p8rTn/B6WRnSs+kE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514758; x=1761119558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXyhg5YEKefX87Hq9WAVu7fRoW023ctluaNE3qrEEpQ=;
        b=jFXFp6C6hxGPSFNi3dzzQRbRNjU5IWj0JczvR4/u/ZQbchzTK0LlEYnAxMIF4++Iks
         5jF6FsoxjfyZHjEmtpnPRpUHbAybvp1lO7TRrP+SsPISr4iJdK23RYf+1PyHCdMBy1Uy
         PvcjlIPEk5F75KRiM8zFPWfnK2ZgDtkEND8EbTse0Kl+8q9bQ+3JBv8TfzSIBwrosGfp
         4oshYc26fFLrp0ZPko78PD1n9UBZhnIwuVGfiDoWEiGbwxUYJWPTZgoKzi2sH7geUgCP
         4FkSDpR7Kuue0zyZGqqpqHb5JLfC6MOBo5ZLa6Qo/XfUdhO9Y3xiU1NTf0iAxlZ/nN6P
         vz2A==
X-Gm-Message-State: AOJu0Yy5zzpReVW7pxgUySBGeVld27ocTzbh9AFzxKC9RRRyIyAPGEpp
	loBX6msUQdvyZXa1ni6z2ngl2EkcUcsvo0S+nRQacEBR8eDwk/jdzf/5n6gfx88XgDH4ImkgeK3
	5Du7lGmo=
X-Gm-Gg: ASbGnctCsDTIy/H3O2n+p4XuqgbLQp3fE+wNAeBn2HhV5OYV6yBPy0zrP0tpt3I+8uM
	St78ceYhNeEBpmqvWu9oio6JEf+TOZmqnoCbbkgiFQSjOTzEdJEzr9luf4g1AqrJGfKMT6fqron
	vrxUEiyYcpch/1zqCq9fE3GX7k9bF1S1LNBC5PJWZ3/x63tHp7gma4GOEfvxv6Qqpkl8Kwk0zpy
	+T375ZMJ4wtT1E9UMRW18DzOBtvbURQRT050fbvKx4sh4crfbruVJdfcxJXJqg1uxRRAtEhKoFG
	zPUF0cEZjZKRXkPa0z6sT9pbKODVU4vvwjaFdAfAkzsvqYlC41ImYiRknJ0bxlyoLtTBDTiDhNn
	CktQw97viSPGFq4ZlmiIclnMmgRIwAO//bGX3FnRUQCE1iKoIgN1YjjZw
X-Google-Smtp-Source: AGHT+IG3m03/Ynpg94EoxvyKt+qpCLhXsqvseTYiXNA2JNFEMbYCAxNptjxou6YB1bDwxtaneRkubA==
X-Received: by 2002:a17:902:d607:b0:235:ed02:288b with SMTP id d9443c01a7336-290273ed890mr323028915ad.30.1760514758198;
        Wed, 15 Oct 2025 00:52:38 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:3282:6d6c:6f79:5d45:48d:1d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b978537f3sm1454695a91.2.2025.10.15.00.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 00:52:37 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH] vorbis-tools: Fix CVE-2023-43361
Date: Wed, 15 Oct 2025 13:22:28 +0530
Message-Id: <20251015075228.245590-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 07:52:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120694

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.xiph.org/xiph/vorbis-tools/-/commit/5bb47f58582c15c2413564b741d1d95e7b566aa8

Reference: https://gitlab.xiph.org/xiph/vorbis-tools/-/merge_requests/7

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vorbis-tools/CVE-2023-43361.patch         | 57 +++++++++++++++++++
 .../vorbis-tools/vorbis-tools_1.4.2.bb        |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
new file mode 100644
index 0000000000..69286907fa
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
@@ -0,0 +1,57 @@
+From 5bb47f58582c15c2413564b741d1d95e7b566aa8 Mon Sep 17 00:00:00 2001
+From: Ralph Giles <giles@thaumas.net>
+Date: Sun, 17 Sep 2023 11:49:12 -0700
+Subject: [PATCH] oggenc: Don't assume the output path ends in a file name.
+
+oggenc attempts to create any specified directories in the output
+file path if they don't exist. The parser was assuming there was
+a final filename after the last directory separator, and so would
+try to read off the end of the argument if it was a bare directory
+such as `./` or `outdir/`. It also did not handle more than one
+consecutive separator. This corrects both issues.
+
+Thanks to Frank-Z7 (Zeng Yunxiang) at Huazhong University of Science
+and Technology (cse.hust.edu.cn) for the report.
+
+Fixes CVE-2023-43361.
+
+Upstream-Status: Backport [https://gitlab.xiph.org/xiph/vorbis-tools/-/commit/5bb47f58582c15c2413564b741d1d95e7b566aa8]
+CVE: CVE-2023-43361
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ oggenc/platform.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/oggenc/platform.c b/oggenc/platform.c
+index 6d9f4ef..d50ad99 100644
+--- a/oggenc/platform.c
++++ b/oggenc/platform.c
+@@ -136,18 +136,22 @@ int create_directories(char *fn, int isutf8)
+ {
+     char *end, *start;
+     struct stat statbuf;
+-    char *segment = malloc(strlen(fn)+1);
++    const size_t fn_len = strlen(fn);
++    char *segment = malloc(fn_len+1);
+ #ifdef _WIN32
+     wchar_t seg[MAX_PATH+1];
+ #endif
+ 
+     start = fn;
+ #ifdef _WIN32
+-    if(strlen(fn) >= 3 && isalpha(fn[0]) && fn[1]==':')
++    // Strip drive prefix
++    if(fn_len >= 3 && isalpha(fn[0]) && fn[1]==':') {
+         start = start+2;
++    }
+ #endif
+ 
+-    while((end = strpbrk(start+1, PATH_SEPS)) != NULL)
++    // Loop through path segments, creating directories if necessary
++    while((end = strpbrk(start + strspn(start, PATH_SEPS), PATH_SEPS)) != NULL)
+     {
+         int rv;
+         memcpy(segment, fn, end-fn);
+-- 
+GitLab
+
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
index 61a4aedb85..2cbd840138 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
@@ -13,6 +13,7 @@ DEPENDS = "libogg libvorbis"
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
            file://gettext.patch \
            file://0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch \
+           file://CVE-2023-43361.patch \
           "
 
 SRC_URI[md5sum] = "998fca293bd4e4bdc2b96fb70f952f4e"
-- 
2.25.1


