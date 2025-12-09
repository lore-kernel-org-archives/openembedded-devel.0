Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBB5D3B993
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 19:45:34 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16654.1765309529659804369
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 11:45:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PR0eIjWM;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c03ec27c42eso1204479a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 11:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765309529; x=1765914329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cf2mAnfgz2+CgiGYEOAiis4Qeu95bLq+sYi56DxE2qw=;
        b=PR0eIjWMWeAdofK7fzAadfY3s3CmS0T5MqkwMsL4fpEOxB4dS092uCN46x924lDIzG
         hj9FAqAo7PnnVTjba/kSucFtNbeIuUiKeyAbtZWnKzUKpmFLCo1Go7spN1mTFv0cBnwP
         Maf2BAnt1enpPulcoi8lIyHLpDM8zyr6LdzUI+yLU/9SsEITKwj8l6922tSIkxeiW5Al
         AhBC0gXDwL/0hqv9Miy++G+5iDtPf12DezNnOjwIDF2gQ1Fd5eVg/Z2t0LMeLkKx27n9
         7dl4d5iESrQC85JANlQJ/39P4sGt8AFw5Zd55fZ3ZrMnmD0X5bKT3ptCgUCd+b205YPR
         DPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765309529; x=1765914329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cf2mAnfgz2+CgiGYEOAiis4Qeu95bLq+sYi56DxE2qw=;
        b=BV0C2j7kI+kq3nnGwqzj796qMQaLrIZkQr2JQ7LUToajJEatySYvII8IcCV3pbuIp4
         /oB3N68ORZA4oOn/kLRvvIUY7nC9CHzi91iCVSFr46bwGwpIo7i2rH2NZpH6psuAwWJW
         IRRK77dvn5cSoUF5YN/x8hXlPjivGGUSlBKXgyxvjo+2oqhRHfSXWCrMdgyVOIC11Aiu
         08pRsQR6AOND7VTQgr9S5VZ8vdgsn3ekl77/qNOCuc8MhKqVnir8AB4o0gH+ra7WayAl
         NUe8ofJaOS2RCK0jm/Bp+VC1TKNMtOV0Zxzk3VdxiTnnl0VLk5wCdHat5KzoqUGS6EZS
         cTYQ==
X-Gm-Message-State: AOJu0YzOFE93DdBDY9zL27IIgDYGOQq9kYsNtsXiQES2kYMPwD67aEQU
	UlJOLsbFu+wySTP+BPrJrRNIlNwWy7tdKGVm+tmd1pPFIprmb7fi16gzSUnxEKdvQbM=
X-Gm-Gg: AY/fxX5c9afp/b/fekE2uTNEg4HiePnYabewe9BoyxCD6yOpfZsQQfh0efM5YoD/pJz
	QXhDkhsxAOnA6FVfBlqMmiLwgudNujMJfhZ0ZbZlBMzz4VUAoKBgBmgMrvM/+U8nu6H7nJPuOE0
	Ymxq7AgXp4/WgrrOkBkst3HksI2RbTG3AALbHunmz4mqwi0fsQ0TbEZTqS3kV31mrClszvRKzTa
	edG8GF15UoLgbfVcqTZ7ERTe/B9XZMQSuv9UM2hJm+X59rQnoLDjid2AwElreg2pL/JrbBNgpjs
	+2EEVhYCxbk3uQEJ3+lP3Ch3QNpzfV8TU8lu/DYwELHU3qq6WWWUMUk9EgSS2uC5YQjk+9Oqtuo
	TTcSzPoVNTrg98WqhSpG5uhwovaY5+DRUN5rz3qWQkenb4mZc8xA10R4iMGnLxrvudNhYDg2JQU
	BjPx/8CuweH6YaF8wK6oJ2M3VvUXEZDL6aQzCEyYPpZ1+CklDhxR8xo61ovDG6JqXp2elwY43w1
	+qEte4VHcBIXAbPez83e5xet8a26twXbHfuHKImSwI=
X-Google-Smtp-Source: AGHT+IHpUaAbWjM86DkK4GzJeaDmUJ3lFqmBQTA9SJsC36E612j8NQelK5lFluBzorLON0gf36f3DA==
X-Received: by 2002:a05:7301:714:b0:2a4:3593:466c with SMTP id 5a478bee46e88-2ac0553b585mr111308eec.8.1765309528646;
        Tue, 09 Dec 2025 11:45:28 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8816ae9sm48596685eec.5.2025.12.09.11.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 11:45:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] ktls-utils: Fix out of tree builds
Date: Tue,  9 Dec 2025 11:45:25 -0800
Message-ID: <20251209194525.675379-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209194525.675379-1-raj.khem@gmail.com>
References: <20251209194525.675379-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 19:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122476

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-systemd-Fix-out-of-tree-builds.patch | 28 +++++++++++++++++++
 .../ktls-utils/ktls-utils_1.3.0.bb            |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-systemd-Fix-out-of-tree-builds.patch

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-systemd-Fix-out-of-tree-builds.patch b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-systemd-Fix-out-of-tree-builds.patch
new file mode 100644
index 0000000000..a5a46ea8d3
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-systemd-Fix-out-of-tree-builds.patch
@@ -0,0 +1,28 @@
+From 496b0ffd7cd685a1adb48b150157fdea14f5f159 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Dec 2025 08:53:53 -0800
+Subject: [PATCH] systemd: Fix out-of-tree builds
+
+The systemd unit file installation does not work when the build directory
+differs from the source directory because cp cannot find the source file.
+Prefix the unit files with $(srcdir) to reference files from the source tree.
+
+This fixes out-of-tree builds which use separate build directories (B != S).
+
+Upstream-Status: Submitted [https://github.com/oracle/ktls-utils/pull/134]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ systemd/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/systemd/Makefile.am b/systemd/Makefile.am
+index d2f8e25..d6435ad 100644
+--- a/systemd/Makefile.am
++++ b/systemd/Makefile.am
+@@ -24,5 +24,5 @@ MAINTAINERCLEANFILES	= Makefile.in
+ if INSTALL_SYSTEMD
+ install-data-hook: $(unit_files)
+ 	mkdir -p $(DESTDIR)/$(unitdir)
+-	cp $(unit_files) $(DESTDIR)/$(unitdir)
++	cp $(addprefix $(srcdir)/,$(unit_files)) $(DESTDIR)/$(unitdir)
+ endif
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
index 748e1cae99..47e1f7f091 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
@@ -8,10 +8,11 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"

 SRC_URI = "https://github.com/oracle/ktls-utils/releases/download/${BP}/${BP}.tar.gz \
+           file://0001-systemd-Fix-out-of-tree-builds.patch \
            "
 SRC_URI[sha256sum] = "8ee295b26b608450bc0c47ba199b34cf92f7f9ec4c81a62363e6450da76b6739"

-inherit autotools-brokensep pkgconfig systemd
+inherit autotools pkgconfig systemd

 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"


