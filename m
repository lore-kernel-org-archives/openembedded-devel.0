Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2EBCA5FB5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:53 +0000 (UTC)
Received: from mail-dy2-f36.google.com (mail-dy2-f36.google.com [74.125.229.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1484.1790722664511580339
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W67vPBDs;
 spf=pass (domain: gmail.com, ip: 74.125.229.36, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f36.google.com with SMTP id 5a478bee46e88-328664c2da6so3978958eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722664; x=1791327464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rHrRVL6iG7rNs1aIFRHUFkqat1zRMVVcdde+taN7ZE=;
        b=W67vPBDsLwhFsXg1Jvvyq4b48A0N8qjOMuwgcTadcYo/hYXNqGxUk470Ma5H73APwS
         7guzDqPR7as0YvxO97CCyTZPw/TmBpsfWceE7w00c82gQ/JdU1rzfIJq8PoAmeq3l0c0
         mpl+sqOEtO2CP7kpmHnY1As736US6h9t1udp3sYZ99QgZxqBWkblXr5LVFkCM6cMiUUw
         cDieCUNZcne6qfHLogGK8wt2HWC3lMv8QhjGK07eLZsQ7wXp4ge3CmDA9x1L/ChdugZ4
         iZyY37Ah4AE0n4bNXiWlg6BLT13yAhFxMlHCqLQK6xpO6g3EThhJmRMjoYOfV7LUDfkB
         FedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722664; x=1791327464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rHrRVL6iG7rNs1aIFRHUFkqat1zRMVVcdde+taN7ZE=;
        b=tosyOpDG7TAxFpAyOpkuHZ+ElGWIrAujKUqnIC/zY8EzLJC1UXVL/+a9hH9uf1snMl
         +3+rEAZr8Dg4Qb4R/PTqlSgAs14ZfXr7B2+/EkktjB+BDNAXjxDe8KydbU/j6kkLp5hu
         c0yRdV1DipvkkfZfAyMhF0zQrkznyTkCYbG+I2liwZiH0WjT6C8oynZDf8J0MpPZTAZh
         zG8CXhlmDZYPm/vM2/VVpjjfh+H1Q+3+RRGA9yhL7rMozsA0vVrz+4s5uPg1f5tlDhpF
         rU+n/aNLghQrVFT+koRGv+iNd/L6Z8qNZ4bKQBBDsl/SjUb7oUlgkbRQ46sFY244jpof
         N0bQ==
X-Gm-Message-State: AFq9FYJr4qKw9rPwrHKHlJnOQR2hqYtyLNxmR1taMH0DJs4x8EgoYBQV
	iMHrPzQ/kvrja0WDONqk1poRwLmqhTlegn5iGzGb2FiiuZcS5GB8xLhdf1B7LtKG4A0=
X-Gm-Gg: AYBFou1nVxSuHdTuwc51v36I3KX97eECZgQ7faTO8or8C/vJJnyekUo6PLl0TSZuf0q
	ZGNRhnUqeiiOYSxKYH+MP8FiJfHDACcwkS/J/41LIqDNPCvN2Gsfuw7KiX9hEyirIQgRYs7L3+d
	lkJIAfL33ibLo8M4zlIkRiQoXbCTac+DNxwmZjU00+Cx0aQd17Ia1hwGQ9TFEPVP/wPB9Xz46yp
	SJIeD8lUXRFCT+PDaAEku5pCL4qOND4WbnWLETobnPBY9Swwcvo+6EVIlFLUyiZef9ZK2MC5lIq
	bWJYsnAPvgnXSlgh+eDKaDG0jYjzy5gzn2i2u5e4yPljzZD6uDD6AEpzPu4dqQv8+5XXLp6p/iT
	rcsE43g56aCRC5ou7iY0tJV2voNcxLCaZLDnjeTxG/1UncRX2gci53zhEONBcrvBOZugy4UCVpc
	8l3cr1cL7PliOz5CjRv84c6hg9zaYfWMu7TLBreuhWpoGKDn+0ylyfX7m1hUkFLMy8GD97HFOP7
	fPQn8v1yqoeh5hFfEmpbqv9Z28SFvtDRMjf/4Uc4lb+c1bcgYWbUYEVustiJej8oMVxOrBxtmyH
	9MaexjKILnIq0oWtolFZJlBJeYUaa5XZbHOALbui+228EjFOPyDk2D8YvrCB41ue/6lt2ms0Sl1
	Ehwb+51g/ZIuA/9/rDmBvyakTxbIe6QN8Rbwoz9ZR5gWHhQSHft9okruecvLdjqV7Kz3fVEFN4F
	g8s0qX8kIk1k+gFG4o5qfxPF5QWMTZ4GV9xjaTEWoW1gCvb3yB
X-Received: by 2002:a05:7300:a225:b0:343:6622:ee15 with SMTP id 5a478bee46e88-34c65a74014mr894014eec.11.1790722663734;
        Tue, 29 Sep 2026 15:57:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 10/26] xfstests: fix musl build (linux/types.h, RWH_WRITE_LIFE_NOT_SET)
Date: Tue, 29 Sep 2026 15:57:07 -0700
Message-ID: <20260929225723.1046705-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130497

fs-monitor.c uses __s32/__u32 without <linux/types.h>, and rw_hint.c
uses RWH_WRITE_LIFE_NOT_SET which musl's headers don't define. Add the
missing include and a guarded fallback define.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nclude-linux-types.h-for-__s32-__u32.patch | 24 +++++++++++++++
 ...lback-define-for-RWH_WRITE_LIFE_NOT_.patch | 29 +++++++++++++++++++
 .../xfstests/xfstests_2026.06.21.bb           |  2 ++
 3 files changed, 55 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch
new file mode 100644
index 0000000000..74b1d42f57
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch
@@ -0,0 +1,24 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:03:26 +0000
+Subject: [PATCH] fs-monitor: include linux/types.h for __s32/__u32
+
+The local fallback definition of "struct fanotify_event_info_error"
+(used when the libc's <sys/fanotify.h> predates FAN_FS_ERROR) uses the
+kernel-style __s32/__u32 typedefs. glibc's headers happen to pull
+these in transitively via other system headers, but musl does not, so
+building against musl fails with "unknown type name '__s32'/'__u32'"
+unless <linux/types.h> is included directly.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/src/fs-monitor.c
++++ b/src/fs-monitor.c
+@@ -12,6 +12,7 @@
+ #include <sys/fanotify.h>
+ #include <sys/types.h>
+ #include <unistd.h>
++#include <linux/types.h>
+
+ #ifndef FAN_FS_ERROR
+ #define FAN_FS_ERROR		0x00008000
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch
new file mode 100644
index 0000000000..a69dd6811b
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch
@@ -0,0 +1,29 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:03:26 +0000
+Subject: [PATCH] rw_hint: add fallback define for RWH_WRITE_LIFE_NOT_SET
+
+The musl <fcntl.h> shipped in this toolchain mistakenly names the
+"not set" write-hint constant RWF_WRITE_LIFE_NOT_SET instead of the
+kernel uapi's RWH_WRITE_LIFE_NOT_SET (the other RWH_WRITE_LIFE_*
+values are spelled correctly), while glibc's <bits/fcntl-linux.h>
+defines RWH_WRITE_LIFE_NOT_SET as expected. Guard a local fallback
+definition so the test builds against either libc, without needing to
+pull in <linux/fcntl.h> and risk clashing with musl's own F_*_RW_HINT
+macro values.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/src/rw_hint.c
++++ b/src/rw_hint.c
+@@ -7,6 +7,10 @@
+ #include <string.h>
+ #include <fcntl.h>
+
++#ifndef RWH_WRITE_LIFE_NOT_SET
++#define RWH_WRITE_LIFE_NOT_SET	0
++#endif
++
+ int main(int argc, char **argv)
+ {
+ 	uint64_t hint = -1;
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2026.06.21.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2026.06.21.bb
index ad1ceea463..f6f246332e 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2026.06.21.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2026.06.21.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;ta
            file://0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch \
            file://0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch \
            file://0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch \
+           file://0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch \
+           file://0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch \
            "



