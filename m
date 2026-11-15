Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10682.1794762019649418477
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iGKdJ0sM;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so3883396c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762019; x=1795366819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+NaSr/SRsC8n49OJPGOZ52ZiC6qQgvhM+IBNbH6+aI=;
        b=iGKdJ0sM0llvAV64sKh7K+7odMYyS4IR9l2Ime4hh3hLLNYUh6OA5fET8ce0jhLTM9
         ttEM5TLkcBy2DbtkjuF1Hemh3odavk/3csvjM9E9vG0jTMzb2cbSEYyUHCOWJz2HxFFK
         eRkBij9pXgmOh5vC4zEAdZdrLgPbqEXcM84q1+wT7AN3JNCKgjLKr1dExONyy03MT6P8
         M9ktH9t8SzHoOEgcax7w5oOkkTb7oulmCS5GDsZNQW3LYIa5pk5uScWb9vlmO8QB0XNp
         vHXxij/NLY+1gqQFFwXKYTz3rosLPs7wIdNTivSPUqFkNMs5Pgm/f7OFQyoRbIpMEajG
         T+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762019; x=1795366819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+NaSr/SRsC8n49OJPGOZ52ZiC6qQgvhM+IBNbH6+aI=;
        b=JJiU2nN2Yc6cwGnSzMoo3Xe6TEPmmyt5Ng5HuZJRdZcJnOSFmM3Qh9FXJl2rEe20s/
         2NEkz7A2CoK+xcRuQsLXbo8KHLoxcQovkIctlfgr0T1+AK0eiW9vdGdr0fdCfj+ThLay
         qDLyCc78YZcKye5smXI+11Vu6v5qm8XXRaEgBY6IpggbGHMJ9Y916ZdjnixQ6srprwQN
         i/2h2qEquuhNPyZdnjJ0uGhB262uAEgXI5Bg3sDbYJaOUGPQNRroaAU2PL/Vk5juexlu
         bWBfnftYw6V1t+7WhXfIFqpd1oN+eKzfCMcCX8ajvT3p8du2j4GH3KgnFEpc/wWlOObh
         7+KQ==
X-Gm-Message-State: APuU4Z9pLV5RN8bwEw4YHUMDB19uuN0pf62TkXOrNVk6oJXEbHKxhYRq
	N2m9CfIwtPbm2dzi3N9WDgcoUAnkTuNmuj/TrgVyHSZPi9E8puleIvm6pxMyEpO1
X-Gm-Gg: AYBFou1kt61m8kKXahlJciIPO3ZR0JkWE3XT9V25cP7Jhzm1QjNEZ6w6DXQ+xy8mIic
	sJT1U4veGwGHV9lCfbellJZ9O7tD4MrfexDRt0RYrDIJ55gKsQ610DULnd5qzroMvnouJEz6Jgn
	5jIWtnQBhf8YoSTU1YGe3+UcsvpsQi4QDBTal0xtk9nnJV7O3v2Q1/mbzpQPOIIYpASx2XN+wNa
	x/IBkiDKVpUUuDz/WTKP6otG6/1V8u2APPOFjmEuyBcDtj9yS6fw18T0R/5tz8fyikY8LK/0xqp
	H8wZxmb/q/1Sm7eSdwIxiHpdn6+SsL4rO2tMH8/3pPpe+E2vLgD3NgKv+Diln1wBYRTLI604BOa
	kbecFH9oeEg84eDXm3gmeC71F7o+uEfzg/HfoOQppTyieWgLcKHkfMyiB5X5XHts04f8AYK70pm
	rYXA5xWWNpoPTBn2fyQpTZ3KBT56TE2HwMmjamNC8HgUqY6ImopluS+S35Fi4KXjM6qk+k4FEKC
	DuoTXvyoBR8OebajkNo8cNHtdUy6GjWO0qDGn5qPRYXVh+GBnFbYNk9ACa+aWKXrKhXHzrXHPGE
	4e9DVJoet0rTql5owYJHMIvBDJsPkCIyIo+pqAk63kyLCpT2d2KgD7LWEFk2E9LNPdeZYVyJQ+n
	8im3rZ7Nsr2n/K5D+I1ES/ptvOkP9Pemi4hf5pB+FrSx9NkvP034zP97s4zb6nzSfdIqqaR2m+s
	1PE6IpHf4zTLyPzNSIuY9kW/PphF4P3v0vm2kLSTK7yT9GcCyrZSHp+TfGa9dOS3RgYT30mz5qV
	E6+6Of9sxIteJd6AX3qGc9utDjbEazozt2Q3V+AGsFjIMWZspPsO1JYvty33os9kRh7XHYmQqQY
	4+37
X-Received: by 2002:a05:7022:3b87:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b5030d2bf7mr8494146c88.33.1794762018754;
        Sun, 15 Nov 2026 09:00:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 13/15] xfstests: upgrade 2026.09.22 -> 2026.11.10
Date: Sun, 15 Nov 2026 08:59:52 -0800
Message-ID: <20261115165955.3485789-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132379
Content-Type: text/plain; charset="utf-8"

Drop 0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch,
upstream fixed it with a HAVE_STRUCT_DELEGATION check.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...tie-struct-delegation-to-the-F_GETDE.patch | 52 -------------------
 ...s_2026.09.22.bb => xfstests_2026.11.10.bb} |  3 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2026.09.22.bb => xfstests_2026.11.10.bb} (95%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch
deleted file mode 100644
index bed72a6c4a..0000000000
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From d298792d021059f2941822484bb989185bd02d70 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Wed, 29 Jul 2026 05:10:29 +0000
-Subject: [PATCH] locktest: do not tie struct delegation to the F_GETDELEG
- guard
-
-glibc 2.43 added F_GETDELEG/F_SETDELEG to <bits/fcntl-linux.h>, but it
-does not declare struct delegation and neither does the kernel UAPI.
-
-locktest.c defined struct delegation inside "#ifndef F_GETDELEG", which
-assumes that any libc providing the fcntl commands also provides the
-struct. On glibc 2.43+ the guard is taken, the struct is never defined
-and the build fails:
-
-  locktest.c:1065:20: error: variable has incomplete type 'struct delegation'
-  locktest.c:1365:23: error: variable has incomplete type 'struct delegation'
-  locktest.c:1615:20: error: variable has incomplete type 'struct delegation'
-
-Keep the F_GETDELEG/F_SETDELEG fallbacks guarded, but define the struct
-unconditionally since no libc declares it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/locktest.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/locktest.c b/src/locktest.c
-index 54ee1f07..e24a0fe1 100644
---- a/src/locktest.c
-+++ b/src/locktest.c
-@@ -80,13 +80,18 @@ extern int h_errno;
- #ifndef F_GETDELEG
- #define F_GETDELEG	(1024 + 15)
- #define F_SETDELEG	(1024 + 16)
-+#endif
-
-+/*
-+ * glibc 2.43 added F_GETDELEG/F_SETDELEG to <bits/fcntl-linux.h> but it does
-+ * not declare struct delegation, and neither does the kernel UAPI. Therefore
-+ * the struct definition cannot be tied to the F_GETDELEG guard above.
-+ */
- struct delegation {
- 	uint32_t d_flags;
- 	uint16_t d_type;
- 	uint16_t __pad;
- };
--#endif
-
- static char	*prog;
- static char	*filename = 0;
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2026.09.22.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2026.11.10.bb
similarity index 95%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2026.09.22.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2026.11.10.bb
index 1733ba8914..9cf9d9cebc 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2026.09.22.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2026.11.10.bb
@@ -2,7 +2,7 @@ SUMMARY = "File system QA test suite"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038"

-SRCREV = "22348afe338c0f6d540c0d7ef0db749eaa51b218"
+SRCREV = "71641219a506ac62bfa231592394265ca812670e"
 SRCREV_unionmount = "f48a57d2a7db5f86ff3dbc4444c3c3041e182d7d"
 SRCREV_FORMAT = "default_unionmount"

@@ -12,7 +12,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;ta
            file://0001-include-libgen.h-for-basename-API-prototype.patch \
            file://0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch \
            file://0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch \
-           file://0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch \
            file://0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch \
            file://0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch \
            "
