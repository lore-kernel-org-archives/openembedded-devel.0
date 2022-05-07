Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD471C433F5
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 19:19:19 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.13450.1651951157491602368
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 12:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gFqPjMe7;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id fv2so9822148pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 12:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xjDjfviI52T8EZy3yzIk1+C+dG+ldxZQYvB/uclhbfw=;
        b=gFqPjMe78MbKqR/CCruzdWxhoQsbRVhZnimMwoNzX0SLJ5w4d8PdOKGl0EyflsOjXG
         x/7RnjiRj5aJ/N6u/7Piv4lzqNG+dXd2BZ3e/vJsKeQJV+UpvGXFwws7ALJ7C7pgW0Ou
         hwW8rGyhXXtE1BcTnLtRH3Vlp5JYkw8QfnmiTNiRYLNxbfwURM/TzkzSPZVE8+/coLv4
         UcJOkDnxHPfpljdeC5RVfWPOiH0CGAljsh1nJ0LtDDaWeDjpi8zG16BJhXzKTry8yC8F
         3eRczi1hTLGE8B2VxQ3az8cAa+71TAlxbwTVV0dYUmiiV60KgGvwSim5SdLCYpF0fqW5
         mY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xjDjfviI52T8EZy3yzIk1+C+dG+ldxZQYvB/uclhbfw=;
        b=0E1RpnN9G/+wfZ96IYe9rL3xcK9w1hUKHkcVqFKA8lqk9wQTLpQ9RfV8E1vesTTOxE
         YxGnykkC6mk8YNBzuuBq4C1Z95zgF3dlYX6BMoGyEUEvSB8j68nYd7rHJAyx0sBkNfeQ
         Ng8YkJP2kkg1vqEN9cs6fV1ynpTKxNqMkqi4YKBzw2WiOQmJnr25Xv4kC80pNTw0d27f
         hHPKKh+xhMTFviPBAdHcREWPj3BAZLgblQGy9Eqt3NVInzJ4xfCy5daq0R3kKnThRWMM
         fHiGPe+3AsxCO88AKsMajYa+AAdZr31tY/YW6mpn2queZjW7ymuH57x06BrGO1c950AG
         15Gg==
X-Gm-Message-State: AOAM531IeOCmUhaxor6/SnxFvrKcvccK5ReWn4gKaONJG8PY3dnnPZgk
	zy8C0MZ9P1bZRee7IIh2DnyCnAyp8FAEGQ==
X-Google-Smtp-Source: 
 ABdhPJyMi//rZNz90OuT1RaJsUMuSgY+IUcpNG/NsoV/RAUxg3DRfGmagbjx0kYlY7KwGe/hQgHOZw==
X-Received: by 2002:a17:902:bd4b:b0:15e:ea25:94f0 with SMTP id
 b11-20020a170902bd4b00b0015eea2594f0mr8803579plx.105.1651951156400;
        Sat, 07 May 2022 12:19:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 z6-20020a1709027e8600b0015e8d4eb22csm4151058pla.118.2022.05.07.12.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 12:19:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Windel Bouwman <windel@windel.nl>
Subject: [meta-filesystem][PATCH] zfs: Fix build on musl systems
Date: Sat,  7 May 2022 12:19:14 -0700
Message-Id: <20220507191914.3355303-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 May 2022 19:19:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96979

musl does not provide strndupa

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Windel Bouwman <windel@windel.nl>
---
 ...Define-strndupa-if-it-does-not-exist.patch | 36 +++++++++++++++++++
 .../recipes-filesystems/zfs/zfs_2.1.4.bb      |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch b/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch
new file mode 100644
index 0000000000..8bb8b9479a
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch
@@ -0,0 +1,36 @@
+From 54883e714b7fd1e7f4ce47eb1fc09adff35d561e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 May 2022 12:15:22 -0700
+Subject: [PATCH] Define strndupa if it does not exist
+
+musl e.g. does not supply strndupa, unlike glibc
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ etc/systemd/system-generators/zfs-mount-generator.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/etc/systemd/system-generators/zfs-mount-generator.c b/etc/systemd/system-generators/zfs-mount-generator.c
+index b806339..592d2f9 100644
+--- a/etc/systemd/system-generators/zfs-mount-generator.c
++++ b/etc/systemd/system-generators/zfs-mount-generator.c
+@@ -47,6 +47,15 @@
+ #define	STRCMP ((int(*)(const void *, const void *))&strcmp)
+ #define	PID_T_CMP ((int(*)(const void *, const void *))&pid_t_cmp)
+ 
++#ifndef strndupa
++#define strndupa(s, n) \
++       (__extension__ ({const char *__in = (s);                    \
++                        size_t __len = strnlen (__in, (n)) + 1;    \
++                        char *__out = (char *) alloca (__len);     \
++                        __out[__len-1] = '\0';                     \
++                        (char *) memcpy (__out, __in, __len-1);}))
++#endif
++
+ static int
+ pid_t_cmp(const pid_t *lhs, const pid_t *rhs)
+ {
+-- 
+2.36.0
+
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
index 072af79019..1752e03750 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
@@ -5,7 +5,9 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE ="https://github.com/openzfs/zfs"
 
-SRC_URI = "https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-Define-strndupa-if-it-does-not-exist.patch \
+"
 SRC_URI[sha256sum] = "3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6"
 
 # Using both 'module' and 'autotools' classes seems a bit odd, they both
-- 
2.36.0


