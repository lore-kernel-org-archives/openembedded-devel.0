Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C578CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 07:09:17 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.37352.1760339349723852130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 00:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XQNQ8+oa;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-639fe77bb29so5911055a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760339348; x=1760944148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MhMpmR48K4g0hod2XKQcYHBkmCtAH52Hy/glYA2rdPc=;
        b=XQNQ8+oaVxubIT2k/vdMXQUWrprfsOZddw5eR/icIP6IPvSlyT+ziDS6HZiDhJGDMo
         t6Vpa0QI3C+EjLZBtkp5plO9zvluNz0LQ7TGh7UDKmxJ6fWahFMqHOFrEByFfVbOdqsm
         AqXGmKpK0atAAALpjxBbsUYGhxvHCDls/EBJCSFKqfNs/oPdhY9FLZyN4CzICShvjaT8
         /OxVLds5qtVqX3OtGCYTvUV43p/dCZCKSbA0wKOt2f9FfSM2dTnkZYXpxK7M0h4RQXgu
         WJ/DTLbBwE7NkBV10u533zy7N2n2/ExEQ+G79eaVx6CKBb2GRj5epL7oLBSlpeOS7S2r
         4uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760339348; x=1760944148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhMpmR48K4g0hod2XKQcYHBkmCtAH52Hy/glYA2rdPc=;
        b=oFtdWVL8E3UR8P55ixA2WDYwBdwo2yc+z8OZ1wrIiJIbWaJEV3thiBYOL1FGnEX6TY
         4rw7ELnrkUdkNMqDrln7dKizjNZKjDcuBbvjvL4yb7uJVx3z8HIKIvBrLT2DTXxqP9r+
         oAiTNPfTOvjYT8U9AvEv/CUqSs1AzXgJXDDJvzHf8kLpmnc63yv+vXEzhIewljkooya1
         fXDIhmPL8N1xXOyrxQ5iTE9Vk3zBUQmGv7xXc5XOjRUj0MBC+ambpzimnGT74IAWEOfG
         G3VeW7qDj2zm2ghHydK4mtKnK2U/txBF6RI4GP4k+xpEhnV9NS2yOAguRxKKXysJIRvb
         I7QA==
X-Gm-Message-State: AOJu0Yw7sydIP/dvCR/m0GEeGyYuyX92wq6amJnHkNoSphO2GDAIqZaf
	CoNt4CFPRerp0YoK9/rjHpfF7huopMu0xWh8UeHWg9T5cl7GXgS8EyGCo7fM9Ep8
X-Gm-Gg: ASbGncs4tsvTzFoNM3eGupIahbdujF3/OYe98V7ZvhuhBW5KJyvSWCS91ND5NG2O7K7
	dTm3KywgMZPparV9YWc32qM/90Ncuc/jiCJk+7LYxjazYtcM3eH7YA28m/WBkt16Xphr2w+378k
	zqq0r6CFJw1i+D1JbuHc8ae06gBHcBrc2KTri9YM3XUFPihREVx8E4NuqDbFeDPFzlaVBkspIAZ
	S8susNkDRFbSZ8IsMywfZFM57vbqEhxLRTAwBI/ZPEBxulIxlJLEKuMzz+qcFtp1BHk3WAkfDYS
	zPd2qkCHOlGtGK1ELqLyiEdhf+H84JezJ0ZJXDvodw0W6gelvWIZdcXf92zhRU3/vr003UTAT1I
	XkmAlJCA7nuYr7/4XyZKqR5Q95nbeb5H00BwkVpaxVGlHc/oLXbPD9x/VeKsCqEQYkGZ3oVgd7Q
	==
X-Google-Smtp-Source: AGHT+IGOqMOKvyXu4vfC3EGY99AB8Fll+LstG96LqVPXgIMNoFti994bU+dGv+GBzYfi/iRtTgfXTA==
X-Received: by 2002:a05:6402:35cb:b0:634:bb0c:728 with SMTP id 4fb4d7f45d1cf-639d5c2ae43mr17776709a12.23.1760339347569;
        Mon, 13 Oct 2025 00:09:07 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b715ffsm8451613a12.22.2025.10.13.00.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 00:09:06 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Bring back reworked aio patch
Date: Mon, 13 Oct 2025 09:09:03 +0200
Message-ID: <20251013070903.408915-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 07:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120527

The libaio subsystem in MariaDB was rewritten in 11.4.8,
which made the previously used patch called
0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
non-applicable.

This patch was deleted in commit f3cd830c09 ("mariadb: 11.4.8")
but it's still needed, because the original code was simply
moved into a new source file.

Add a new patch applying the same change to tpool/aio_libaio.cc
to fix the build error on riscv32.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...ck-if-syscall-exists-before-using-it.patch | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-aio_libaio-Check-if-syscall-exists-before-using-it.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 53a24d14bc..6e07f1ffa9 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -15,6 +15,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-aio_libaio-Check-if-syscall-exists-before-using-it.patch \
            file://ssize_t.patch \
            file://sys_futex.patch \
            file://cross-compiling.patch \
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_libaio-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_libaio-Check-if-syscall-exists-before-using-it.patch
new file mode 100644
index 0000000000..ee0d1b37ae
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_libaio-Check-if-syscall-exists-before-using-it.patch
@@ -0,0 +1,49 @@
+From a30e52fdb6507dd39b081b1218d95eb8582b81fb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Mon, 13 Oct 2025 08:57:05 +0200
+Subject: [PATCH] aio_libaio: Check if syscall exists before using it
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Return -ENOSYS if not implememented, fixes build on arches like RISCV32
+Fixes
+tpool/aio_libaio.cc:61:20:
+error: use of undeclared identifier '
+   ↪ __NR_io_getevents'; did you mean 'io_getevents'?
+   |    61 |   int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
+   |       |                    ^~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ tpool/aio_libaio.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tpool/aio_libaio.cc b/tpool/aio_libaio.cc
+index 2ce69384cde..60f558afa87 100644
+--- a/tpool/aio_libaio.cc
++++ b/tpool/aio_libaio.cc
+@@ -58,6 +58,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
+ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
+   noexcept
+ {
++#ifdef __NR_io_getevents
+   int saved_errno= errno;
+   int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
+                    min_nr, nr, ev, 0);
+@@ -67,6 +68,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
+     errno= saved_errno;
+   }
+   return ret;
++#else
++  return -ENOSYS;
++#endif
+ }
+ 
+ 
+-- 
+2.51.0
+
-- 
2.51.0


