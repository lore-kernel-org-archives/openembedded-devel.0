Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6683BCCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 14:51:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.17636.1760712697677019347
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 07:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e8PIpt59;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47117e75258so8395035e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760712696; x=1761317496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Lo3+l4HjgTj8D/SyQnCrybYqPZ/qRIkJqZW4j/hXRc=;
        b=e8PIpt59qeD2cVP+YAjgzFH7ELvDBpcW4EysO91r/Eh+gdkxLoni1/zrQzRgvFKqi/
         fxB718061E9HAIaiGmtpPQ0cTWl9aOWf0QMFgqN95YH4TkBulpGkycfYqulLriUh7aZC
         pE/ib6K3Ll5QVejlLdfCEZG0NHW9j4KrExqZxIv7eOsuShHaQtYPXGKJgsX3IS9av7ul
         w3e4jx2LJo9Ft4o3J4fIWgWfWiLcMzSIGr6KwNEV3A1rQicSxLhmknq0pLuPF/tJyhN4
         pu7F50pHURzYcdEmAN6Yq3wFb7y11eVJrTs+EZTHcYJxY7OB3jpDAZxWck+AmD+rp3Iu
         6/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760712696; x=1761317496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Lo3+l4HjgTj8D/SyQnCrybYqPZ/qRIkJqZW4j/hXRc=;
        b=s+DXg8IRotvrJqYFgWA2Ck6M2XSyQC1Wf+MiYA8OuM4WICDTjqz9suvdJWBqIFNUhw
         5r6IDBdwDZLhgdzhEdMqk383QfOXBRMj1UqqvCqImNBVC+T9t3HPMh491OEuDPw72Ez3
         pV7M5S0Nt4gDIRNr4INexooTgmIqPu915P/Tv29V9MifuOlUze+vpwFufYsT1mE9ic8K
         BiUAtclq7EabXsENxLuyfiFloE43IbKAic4IpeFY82LeCIlGHwqbpTzlI713DJYZhZoT
         NEhTgIB3gh4w/m5XEODtGjwXzzr6bjvuwcMoSD3BpxTbR6Z2vlWrV7rCW8KYC3PX8NwC
         ZkrQ==
X-Gm-Message-State: AOJu0Yw4JuGiqvDXTtkpW2Brr73/byt7OtAbj6e7csplnM5+ZB///PWR
	3B+FX8EUAzeP7/dqgHnNXZbWEJrqOC/8aN4HgGFBH/YyI8NVx2hvxEGaEimepw==
X-Gm-Gg: ASbGnctO5JCuSYxcwYJiI+8wqsmoZLuY6IpyND6UEm6bLfgVwLIrXAunNSeSobLrdDQ
	EbPoI/SJ1Pe/4MfShPZMCDm2VdT2NTf78SYo7BUEbi9JRAcPKKLBZjBmgrpJ1CsgGxJQWYWiQtV
	VDq7tRHuSjTxbUVx9795qxWp/10D+ep86mToVy3Tdh0Vx5JDQ/DWQa8VdEgHSIN57JovHTm5VKW
	BP6v6LVvvlWgkjwR8pW0gk1avRE14YbfyYiBEYuodsNfx46RZaAE4UOhlN9ryKbz0cScAYoD5CB
	7IIMh5vIRIM/gVmgfcix06++KT4H/zwNi5pCCEN0qc9HEj6AuJrN3uVyitjZZ9vYqzkUR4kbTw6
	2QUuK3yvl40FDxyewAkDm8h3TPQKYRDY5Ri33382TCjZyh3vfe10mA2XGt55STOZgOPzVI4m2R/
	yHFFwmK7Aqmx89opFFUHs=
X-Google-Smtp-Source: AGHT+IFi8fZKb8T8dlBOhpDr3PgLeXuWUE4z/0HfC0dZeUm7HXNyOYe6EBxlykglLhSf7sCAkPjjBQ==
X-Received: by 2002:a05:600c:3e0b:b0:46e:6af4:ed83 with SMTP id 5b1f17b1804b1-4711791158cmr28348655e9.23.1760712695686;
        Fri, 17 Oct 2025 07:51:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c34sm94531995e9.10.2025.10.17.07.51.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:51:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] keyutils: fix ptest failed since "+++ Can't Determine Endianness"
Date: Fri, 17 Oct 2025 16:51:34 +0200
Message-ID: <20251017145134.2612603-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 14:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120764

From: Changqing Li <changqing.li@windriver.com>

All the ptest cases are failed since error "+++ Can't Determine Endianness",
update the regex for matching the endianness to fix this issue.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6de9b46cc78543f838526c3bcb193d02d487cfb6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...c.sh-update-regex-for-getting-endian.patch | 35 +++++++++++++++++++
 .../keyutils/keyutils_1.6.1.bb                |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch

diff --git a/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch b/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
new file mode 100644
index 0000000000..728f464331
--- /dev/null
+++ b/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
@@ -0,0 +1,35 @@
+From 935a31dd6f14bd1aff735495f0fdbae4ca05c695 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 2 Dec 2022 15:35:40 +0800
+Subject: [PATCH] tests/toolbox.inc.sh: update regex for getting endian
+
+Update regex for getting endian in following condition:
+/proc/777/exe: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2
+
+Upstream-Status: Submited [Submitted to keyrings@vger.kernel.org ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/toolbox.inc.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
+index 1964450..e827e20 100644
+--- a/tests/toolbox.inc.sh
++++ b/tests/toolbox.inc.sh
+@@ -13,10 +13,10 @@
+ echo === $OUTPUTFILE ===
+ 
+ endian=`file -L /proc/$$/exe`
+-if expr "$endian" : '.* MSB \+\(executable\|shared object\).*' >&/dev/null
++if expr "$endian" : '.* MSB .*\(executable\|shared object\).*' >&/dev/null
+ then
+     endian=BE
+-elif expr "$endian" : '.* LSB \+\(executable\|shared object\).*' >&/dev/null
++elif expr "$endian" : '.* LSB .*\(executable\|shared object\).*' >&/dev/null
+ then
+     endian=LE
+ else
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
index a915b7f2d2..0464117311 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
            file://keyutils-fix-error-report-by-adding-default-message.patch \
            file://run-ptest \
            file://fix_library_install_path.patch \
+           file://0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch \
            "
 
 SRC_URI[md5sum] = "919af7f33576816b423d537f8a8692e8"

