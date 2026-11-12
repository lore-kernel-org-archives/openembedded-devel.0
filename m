Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8132.1794465758677354197
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=meluPF6i;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso1662834a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465758; x=1795070558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsCKAJmI7IcFVj17e7A1pt1miEn0pg4TBALLVXBBJTg=;
        b=meluPF6i4YCYMk4P2m+Q38cTRJQQHqsy8qf2LEX4E7UPYSIZLNlbARe1FAhqQLAyqK
         hQFFnOScEAYx+zLqKjBtfzYhOV4Tlh6NC8kGZdfvr+a4xAWDByIvHRcWgolqgLL1rTdr
         0XbL3tMpKY+Bb9KuDBCvjnL80971mnQGJSmFJygoA0SOQ27QftDGMOzi4YbLP9d+FS/g
         Jo6e1klI5VNCTER2bJOgKSLfqMApgZpqQTBol0S+4D3BTP/mnHqbguVDmTdHA6Su5KAg
         eZpPdK83T7W6bwqlaMv3HtGF4Y7MhaDm+Xho0mDTC38/9nlZ/x3ouofud9XrD7J8QJAD
         cuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465758; x=1795070558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsCKAJmI7IcFVj17e7A1pt1miEn0pg4TBALLVXBBJTg=;
        b=cifon3w50CQbQawjuzAa0H1PhGhF7G5Za9VX8LuCU7+e3cngTM0m+GPJNuyMA32iYb
         uhQ/7HJtn41wjsjqqeas3WFi3m0tVPy3UlY9ket+djaA19E4vCMRQDdXfS+INpdT9Srr
         IqbZmlj781vMJVeGLvirJpwdEHmkfDWCX0TARECNgQJMB3dbxyFy5OGsxU/luW7wT3xl
         ytnH4saCJ9soWpXROUOXIoRsDn8tDyXQzyufhxHIyegXtFl9gV+h+/byiJ00BndBB2G4
         mm9cbSNIgn+n0FNetoHj0mqkuvo0ndqjIDFSCNunfN5nYiFAzqqsgBwelisyJXpIBHXn
         u6pQ==
X-Gm-Message-State: APuU4Z8NZ06u4lGUovxhIRVcMmeH0JaiywSidS/8cfjnYszA10NvJSFc
	GYYwvUlRkh9xQB4qv38P/09dH69CmevTZla/SSkvu2YzVVTD3YUfxY/cWqxuENkDvCg=
X-Gm-Gg: AYBFou0IyOAuWcyv+3aokP2cxQTIiEz764UNVXnGtTa5MG8xkoi4lySj/VnCyrSomxh
	1QKX7a2vrp/l769YR4yGkY2cLCQhf/owbmaIJzVtc5uCN+WqgRf/RL6/tpjTtDMTpQDJUAhpPKd
	shm3cgfygpg5sJn7SNd8E7vXNyXTUA76dP47E1DCxPPIV1889c0PsEaI9dFq3EBQ4BEOcAesYWG
	iDlnDEBvMyhHZ9Xitq5q6wqx9d1qqhNCSDQRzgepcWMKHq93Nv9qfGI8AsnFKUi5crBeM6Up1dO
	e+UHmxirJswTUNx5IOimboSyc0CJ97CbVW6vv2Bf1cuOdJpCNLz7lfI/lomrc7qgJMKkUXFxlvN
	3IgbVZoWCFYqQxjWIcAbDF2a8yPqtQ7dU0M4/VGkwVV6zw5eERxQOqa4kFnJolYGiVMr8TYwLN6
	iki4p7/ojqGSrgZkxLgoe3flwg/yuwToqbxo5ha998zUaOrTyX8Ogw+vElvhi+svS643Lx5QW2N
	DoMVXvZ5ReJXnjvSsTw8HBBiuRpEpYwoybkwdZochQ+IFdPSuqvOpGXSkYsuCASaVhVKAgXhj9l
	cUyM+pVlUL54DoflKfx6W7ZkeEKSeip8G8Nc1LBlwjsUTdzaqb9kp9alAv37cE9DYg84eHJHt7o
	i4MhZzZ7zyYVwTFAwD7S1U3IYFF0IK8rgvQ+xKEiaNyW46llo1eeKtdpHA7uIcfwT9NTNa8+OU9
	DRLZ0ew9Sxw9KmdIwWut09M8oU7zPGdQ+bWmnOeNzGHhKnZ/Eyi8DLFMaFKJkp8NWZQlJ41Exn7
	/DEz2XwTjvgkOfY+9JjLuDb+uZU1K5N7iRgT9cFzL7z1/xOCW36JpXyP2r5bOEaDWtYKQF9vpCD
	5/DBrRN/ZgErw1VGr8x2sm53HA==
X-Received: by 2002:a17:90b:1e47:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3b182e02b3fmr4471058a91.1.1794465757989;
        Wed, 11 Nov 2026 22:42:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 08/24] tgt: upgrade 1.0.90 -> 1.0.98
Date: Wed, 11 Nov 2026 22:42:08 -0800
Message-ID: <20261112064225.2410019-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132177
Content-Type: text/plain; charset="utf-8"

Drop musl-__wordsize.patch, __WORDSIZE is no longer used.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../tgt/files/musl-__wordsize.patch           | 41 -------------------
 .../tgt/{tgt_1.0.90.bb => tgt_1.0.98.bb}      |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/tgt/files/musl-__wordsize.patch
 rename meta-networking/recipes-extended/tgt/{tgt_1.0.90.bb => tgt_1.0.98.bb} (97%)

diff --git a/meta-networking/recipes-extended/tgt/files/musl-__wordsize.patch b/meta-networking/recipes-extended/tgt/files/musl-__wordsize.patch
deleted file mode 100644
index ac758cc39d..0000000000
--- a/meta-networking/recipes-extended/tgt/files/musl-__wordsize.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-The definition of __WORDSIZE is found in <sys/reg.h>
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/usr/iscsi/iscsid.h
-+++ b/usr/iscsi/iscsid.h
-@@ -22,6 +22,9 @@
- #include <stdint.h>
- #include <inttypes.h>
- #include <netdb.h>
-+#if !defined(__GLIBC__)
-+#include <sys/reg.h>
-+#endif
- 
- #include "transport.h"
- #include "list.h"
---- a/usr/tgtd.h
-+++ b/usr/tgtd.h
-@@ -1,6 +1,9 @@
- #ifndef __TARGET_DAEMON_H
- #define __TARGET_DAEMON_H
- 
-+#if !defined(__GLIBC__)
-+#include <sys/reg.h>
-+#endif
- #include "log.h"
- #include "scsi_cmnd.h"
- #include "tgtadm_error.h"
---- a/usr/util.h
-+++ b/usr/util.h
-@@ -19,6 +19,9 @@
- #include <linux/fs.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#if !defined(__GLIBC__)
-+#include <sys/reg.h>
-+#endif
- 
- #include "be_byteshift.h"
- 
diff --git a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb b/meta-networking/recipes-extended/tgt/tgt_1.0.98.bb
similarity index 97%
rename from meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
rename to meta-networking/recipes-extended/tgt/tgt_1.0.98.bb
index a110d556a3..c4ceb6a76a 100644
--- a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_1.0.98.bb
@@ -4,13 +4,12 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
 DEPENDS = "sg3-utils libaio"
 
-SRCREV = "df991fa788e22cd8b8e3013cfae306988c19c3d0"
+SRCREV = "4922507af70c65e4c6e35489f1651f841d01ebaf"
 
 SRC_URI = "git://github.com/fujita/tgt.git;branch=master;protocol=https \
 	      file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
         file://0001-usr-Makefile-WARNING-fix.patch \
         file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
-        file://musl-__wordsize.patch \
 "
 SRC_URI += "file://tgtd.init \
             file://tgtd.service \
