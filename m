Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3D86B7FEA0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 03:23:29 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id r11so2524749pgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 19:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bg+OZa6gAtvHzdwXNWfgzDVvHaIo5sdIyLtKH3OOHVo=;
	b=IX0JBNH93tF8tsEhui6zcoxz/Jazya1cwqhJr9EsWhg9AjaoFmBDmtOZdlsEzTk1VB
	sDzYJ8/3wbSGksPBf1HbfESD0JS6wi8KbQ3zby38R1whVCZOdBK96JSQ9/LCd4yoIePe
	xH2bkjbnEghPPDqu/w3DCFBZ4PbloL45uSVYNBFq1qnTjhO7DJeCWGXEUWnnnelTYmAA
	2pMQ3DRYlOOiYkKr3QwZx5WJgBh5+ur1ser0Zon+2Q8JHPTJjnD1Zz8tgxLs9dMqwU/o
	/b5QkUDYWaJzZ5EYpZGD599/vGh8LwzzJeds5SsZvlxvCF3J/YbTcH7BezYDZBf7J2Yk
	PIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bg+OZa6gAtvHzdwXNWfgzDVvHaIo5sdIyLtKH3OOHVo=;
	b=tnatSiIw85ZXlJT/hwPmmuZ4QD33JhEHqFv+m0KV+sC+iakhRIoOBh4MY+BZYASnLL
	IGVfT2o1ETGySNw5m2QkMsPZ1/zAiUkjcC/CCn7pqGDdyuYZYXSKhvFxwBaz01xT37YB
	QlAsILijTTkEyrO65nKzElKYOYNcdIU53GYkDY+apvHd7CXQdenJAnCfDHUMtX4AVqzk
	4Ja++UWsChrr3M9qKAuDEH+mwbHM1iae/466RPb/v8zee9XTcW4CZTM73ueUScS/CL6B
	J1E5J8CAHWGdrZ1ik70jhI5CpPvm8OW8fcf3Iv70oYhGkOpvZiRQhw7N638FElPcYlva
	TYww==
X-Gm-Message-State: APjAAAUcbE6A5xo/tt3DbMZYRl14449h91mgdepcK5vitOwR38kVApP9
	w+GWZy51wfDlTdb5JilNJOw388KJISM=
X-Google-Smtp-Source: APXvYqwsOrc8p4stLl8tpvWdm79OhXWsSVIDG7uHd0sgnyJipEf1EirX8C5fk+V0CWyCjfQ1wUgC9A==
X-Received: by 2002:a63:e30a:: with SMTP id f10mr8658541pgh.331.1578540209814; 
	Wed, 08 Jan 2020 19:23:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	r30sm5657182pfl.162.2020.01.08.19.23.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 19:23:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jan 2020 19:23:19 -0800
Message-Id: <20200109032319.3645429-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109032319.3645429-1-raj.khem@gmail.com>
References: <20200109032319.3645429-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] makedumpfile: Drop linking with libebl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jan 2020 03:23:29 -0000
Content-Transfer-Encoding: 8bit

This seems to be not needed as link succeeds without this library,
moreover this is static-only library in latest elfutils

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ebl-from-required-libraries-during-l.patch | 34 +++++++++++++++++++
 .../makedumpfile/makedumpfile_1.6.6.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0003-build-Delete-libebl-from-required-libraries-during-l.patch

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0003-build-Delete-libebl-from-required-libraries-during-l.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0003-build-Delete-libebl-from-required-libraries-during-l.patch
new file mode 100644
index 0000000000..40956434de
--- /dev/null
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0003-build-Delete-libebl-from-required-libraries-during-l.patch
@@ -0,0 +1,34 @@
+From 460851c15e807d1a2515dfb985423f8a6624f4aa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 8 Jan 2020 19:14:19 -0800
+Subject: [PATCH 3/3] build: Delete libebl from required libraries during link
+
+This is a static library from elfutils, which is not made available when
+static archives are disabled, this can result in link failures e.g.
+
+aarch64-yoe-linux-musl/9.2.0/ld: cannot find -lebl
+collect2: error: ld returned 1 exit status
+Makefile:93: recipe for target 'makedumpfile' failed
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 5dce589..c3a4054 100644
+--- a/Makefile
++++ b/Makefile
+@@ -51,7 +51,7 @@ OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
+ SRC_ARCH = arch/arm.c arch/arm64.c arch/x86.c arch/x86_64.c arch/ia64.c arch/ppc64.c arch/s390x.c arch/ppc.c arch/sparc64.c
+ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
+ 
+-LIBS = -ldw -lbz2 -lebl -ldl -lelf -lz
++LIBS = -ldw -lbz2 -ldl -lelf -lz
+ ifneq ($(LINKTYPE), dynamic)
+ LIBS := $(LIBS)
+ endif
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb
index 9c357bf6e6..6924e39d60 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
     file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
+    file://0003-build-Delete-libebl-from-required-libraries-during-l.patch \
 "
 SRC_URI[md5sum] = "6fd632b97ad78d9a0a3b0f0989094064"
 SRC_URI[sha256sum] = "d007eec05cb14f0155f2d06a0d4dc70d321dbb2aec65fccdce953145c8230324"
-- 
2.24.1


