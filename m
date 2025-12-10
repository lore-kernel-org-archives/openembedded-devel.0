Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB891D3E765
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:49:33 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2031.1765388966808940359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MZKU6uTw;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so66820b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388966; x=1765993766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bM5178vAcijx+xqiGl4vaGkV43WOWNfGhWFhK5rQ214=;
        b=MZKU6uTwWy5QtqY/8mYFfMVn/u5GdHZkGL6O3q6P6Gz+j2oE7xyIaXb1mBx5fyBBID
         Og98EAM7Cb3A+tcrhjxUt52QiefZaNlnKXNk313rn/Zi9piOO/Cf3M4mvT5FPDm/qpNT
         Ug4oJQDKVq7hMTPmGeJ4wA3Pfmu5CFfMNe88G3YRf6Z8zdpOJcwwu5E6+KHAi2XgRK32
         unUM4mvwcjlXgEEhSmfPZxC7WAMmaT1pk1xEYR/s/ctmkUwa3HUlIL5pBgwmgKppDMf9
         8mcRwFiVTRm+ZRZDZw50DJE2P+pwQRp+gDZ5wUYw0NyyKShUaUcTXyzybzWdMOETy3Ax
         oCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388966; x=1765993766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bM5178vAcijx+xqiGl4vaGkV43WOWNfGhWFhK5rQ214=;
        b=JaV83gLTVj9bQN4vSvvCiLAO7mVFESte7WV9NlwYEygQwkQ/vs34WPJJCGplAwEaAK
         XF1zoHbFqMC44GsejLGwO2gIlshtdXS0/XgPYj3yHRNZunJ6KK1uoT+LLc8zOksqJxO2
         AmoSIZ4E9FzOgRYUV4cgqYXDULrpETBMUI/p2LYIBkV+2gdyLYLEGI27LX9rrIPvHrqP
         SosrMmnQVkJcJG6s6nqzJHobaN8KuKOUyqSsDkE/M1dh92yBAjmFnHcEKtG642AckA1s
         JjvFxOL5KKJ5VD8y6CJqJFhM0Hq6PE3SrKfONBIx2umZo2kKBO2QUWZ/g6tHu2xKsAqN
         rMyQ==
X-Gm-Message-State: AOJu0YyC47P2DS1hDWbv/zoegpHpOKKaOXCGs5xR2w4aSgtHk9lP7a0/
	eTnpMYcuyRui0EzRua6CXJ2aqnHOr3XhyXTCSliv9XfMYCJBCLiW3PxD7HWjO/xv
X-Gm-Gg: ASbGncsnAlTvsM2s0T7HvAUT0NFyNgiFlV2Mx1JaUSLcg7FRv9zbN9iCSGlX8IkgOll
	soMMqoQ/pEmxk1SXHXyPJ5FYyIBuA7nx/bbaYabtNXKtbV7c5kqursZ3W38uBY4XsY8xNvCJMA2
	sQdirCI6qxV3qtp8Lsq+o9UNbASQKVr6j7TjBKg0aIPOZrZubmFgiFBgPsjcR4VGtvI6xjtI9e0
	Mcreooqh5El3RUTwO8o7lDJmF8sWV7e/HEEyAL7kdGO32z6G9vvBqidZl5Xu1MhHnunxPiDvob6
	b90v/o8cLzISg4HhIZxLVDe1ZeQ78nDIRaqgdc00eU2U1bOES4FZy6n5vOVPisFb0Gd7EgjSC2h
	ZWzeAG6pzZ8G767UhZBMUUv2lu6zUOYnSrdrmLSIoIjUVmxfp8wT92jy9HVGnvzki1KlB8dVixi
	9+w9fo1iOnIH7LOTTVE7Fl/tQ=
X-Google-Smtp-Source: AGHT+IF8/kZUi1lf4Eb/BO4FKWGZ1FwoFe0mjo1+x038aBmHQV+orEM2KovKUWW0xM+HrAoFQi2Fyg==
X-Received: by 2002:a05:6a20:918f:b0:366:5d1a:c738 with SMTP id adf61e73a8af0-366e2999d45mr3496516637.57.1765388965986;
        Wed, 10 Dec 2025 09:49:25 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm124658a12.11.2025.12.10.09.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:49:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 10/10] openipmi: Pass BUILD_CFLAGS to BUILD_CC
Date: Wed, 10 Dec 2025 23:18:47 +0530
Message-ID: <20251210174847.2828731-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
References: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122576

From: Mingli Yu <mingli.yu@windriver.com>

* The option -fcanon-prefix-map is added to CFLAGS after the commit [1]
introduced and result in the below build error.
  Making all in sdrcomp
  make[3]: Entering directory '/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37/lanserv/sdrcomp'
aarch64-wrs-linux-gcc  -mcpu=cortex-a57+crc -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot -DHAVE_CONFIG_H -I. -I../..  -DSTATEDIR='"/var"'  -Wall -Wsign-compare -I../../include -I../../lanserv -I../../utils -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot=  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot-native=  -pipe -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -o sdrcomp.o sdrcomp.c
gcc  -o sdrcomp_build ../../lanserv/sdrcomp/sdrcomp.c -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot=  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot-native=  -pipe -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wsign-compare -I../../include -I../../lanserv -I../../utils -lm
  gcc: error: unrecognized command-line option ‘-fcanon-prefix-map’; did you mean ‘-fmacro-prefix-map=’?

* Pass BUILD_CFLAGS for BUILD_CC to fix the above build issue.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3dbc4a79f01ebfc54da024c1460c06772659088d

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c41fb791faaebf9e86b021d039d860ccf5ff45f1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch | 35 +++++++++++++++++++
 .../openipmi/openipmi_2.0.37.bb               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-support/openipmi/files/0001-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch

diff --git a/meta-networking/recipes-support/openipmi/files/0001-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch b/meta-networking/recipes-support/openipmi/files/0001-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch
new file mode 100644
index 0000000000..5749263d13
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/0001-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch
@@ -0,0 +1,35 @@
+From 05d8f730b746d73a1efec7c42066953b5708c5b6 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 2 Dec 2025 12:07:42 +0800
+Subject: [PATCH] Makefile.am: Pass BUILD_CFLAGS to BUILD_CC
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Pass BUILD_CFLAGS to BUILD_CC to fix the below error.
+   Making all in sdrcomp
+   make[3]: Entering directory '/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37/lanserv/sdrcomp'
+aarch64-wrs-linux-gcc  -mcpu=cortex-a57+crc -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot -DHAVE_CONFIG_H -I. -I../..  -DSTATEDIR='"/var"'  -Wall -Wsign-compare -I../../include -I../../lanserv -I../../utils -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot=  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot-native=  -pipe -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -o sdrcomp.o sdrcomp.c
+gcc  -o sdrcomp_build ../../lanserv/sdrcomp/sdrcomp.c -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/sources/OpenIPMI-2.0.37=/usr/src/debug/openipmi/2.0.37  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot=  -ffile-prefix-map=/tmp/work/cortexa57-wrs-linux/openipmi/2.0.37/recipe-sysroot-native=  -pipe -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wsign-compare -I../../include -I../../lanserv -I../../utils -lm
+   gcc: error: unrecognized command-line option ‘-fcanon-prefix-map’; did you mean ‘-fmacro-prefix-map=’?
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lanserv/sdrcomp/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lanserv/sdrcomp/Makefile.am b/lanserv/sdrcomp/Makefile.am
+index e473af8..057a536 100644
+--- a/lanserv/sdrcomp/Makefile.am
++++ b/lanserv/sdrcomp/Makefile.am
+@@ -19,4 +19,4 @@ BUILD_SDRCOMP_DEPS = $(top_srcdir)/lanserv/persist.c \
+ 	$(top_srcdir)/utils/string.c
+ BUILD_SDRCOMP_SRCS = $(top_srcdir)/$(subdir)/sdrcomp.c
+ sdrcomp_build$(EXEEXT): $(BUILD_SDRCOMP_SRCS) $(BUILD_SDRCOMP_DEPS)
+-	$(BUILD_CC) -o $@ $(BUILD_SDRCOMP_SRCS) $(CFLAGS) $(AM_CFLAGS) -lm
++	$(BUILD_CC) -o $@ $(BUILD_SDRCOMP_SRCS) $(BUILD_CFLAGS) $(AM_CFLAGS) -lm
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
index 090b54846c..db74b91f7e 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://openipmi-no-openipmigui-man.patch \
            file://ipmi-init-fix-the-arguments.patch \
            file://include_sys_types.patch \
+           file://0001-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch \
            file://openipmi-helper \
            file://ipmi.service \
            "

