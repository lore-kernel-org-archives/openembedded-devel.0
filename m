Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 057747ED5C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:41:45 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id u17so16426127pgi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=godUY1OhWD0KEsSFTjdg39oWqMBMkIxPIQnegYMrrg8=;
	b=JWDlzwkwCFCzc3qJMk0D6nY1rYJVg6+QYj6TXi7K9AnubWSPhYJNJ2tFlYbzlwVX9V
	aMbGkrfE9lJl3ccK1mWL/5+zey2vTWsDniYpTrHrISAXgtIo9VvCMGWoT7s9l280je4E
	5M+S+H49XadnlMThhCHCGhRvz0vQZzp8CtK/CTeVd3Kr2bJ8VBf0Gu94Euh3V2Wke3MZ
	+JGqQ3FdCcSXcYIXwhPLQdv93T2aQUyRx7hh4nmzB3LxrRZntcohW1lNjOYuZtBKuZ0h
	LCxizrPyOMDCeKwOETEhjSoTWpfg4/a60xfSXN0qeoFH8HGXiV+6Pfn4RZbg9/bMjZHw
	kSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=godUY1OhWD0KEsSFTjdg39oWqMBMkIxPIQnegYMrrg8=;
	b=Rjii5FTk62C6DsmbSG3OfHI8CDj+Qr5C/ww0OkvxWgMA4jeVFDtLymPSAoswiaVLik
	fQZympTAzY/jhIE87zfXpb51yCSmvgJ4WGGFPT0EZW9H9mKAGhtu/TRiNs8uNuNsrw4E
	qAX8zhsOgbrymGNCgpki3T3s1TFUTEm/T/aL6QYiMehQS2eFGzGPjwI7Fi+w1k4RqV/g
	YKTW3QrkB60aksBlHLgq3L/XjFeswaq/Q4UKQZrB9xxEHIm8xek7Pkhs9OQp2oEKdw2r
	EGW05LtRc09qb3dXB61DxI8+mIk3Jfg9biCFDp3O+K7f3gBeoB+jVS8Z3u2sCBGTjZDL
	yIlg==
X-Gm-Message-State: APjAAAWuW4l7ZsLrnnm5CvAgixqkfgvz0O5rvPeLhVkMfMu/RrrKvVQ6
	lbUe1GKPjbZGty0dVPA/cb4t+wJY
X-Google-Smtp-Source: APXvYqx+UZEnpibmqwG6t3fE29zfXcsHCI3JSd/UD1pqxKfqNiXEF58pQMiW2GgS+fxoNTYsgtT3Pw==
X-Received: by 2002:a17:90a:25af:: with SMTP id
	k44mr70435964pje.122.1563720107050; 
	Sun, 21 Jul 2019 07:41:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	t9sm37392604pji.18.2019.07.21.07.41.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:41:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:41:34 -0700
Message-Id: <8472e7a74f3eeb020358f4f518faf6b6abad3e2b.1563719997.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719996.git.akuster808@gmail.com>
References: <cover.1563719996.git.akuster808@gmail.com>
Subject: [warrior] 6/8] oprofile: drop virtual/kernel dependency and switch back to TUNE_PKGARCH
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
X-List-Received-Date: Sun, 21 Jul 2019 14:41:46 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* the kernel dependency was added couple years ago with:
  https://git.openembedded.org/openembedded-core/commit/?id=16bc366877a2e02d96adb91b90e30710777e6f09
  the reasons for it no longer seem valid as it build ok
  without the dependency

* there as some differences in the resulting binaries (built with and without
  kernel dependency):
docker-shr qemux86-64@ ~/build/oe-core $ diff -rq tmp-glibc/work/*/oprofile/*/image
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/ocount and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/ocount differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/opannotate and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/opannotate differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/oparchive and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/oparchive differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/operf and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/operf differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/opgprof and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/opgprof differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/ophelp and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/ophelp differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/opimport and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/opimport differ
Files tmp-glibc/work/core2-64-oe-linux/oprofile/1.3.0-r0-without-kernel-dep/image/usr/bin/opreport and tmp-glibc/work/qemux86_64-oe-linux/oprofile/1.3.0-r0-with-kernel-dep/image/usr/bin/opreport differ

* comparing the first one with diffoscope shows only 2 insignificant changes:

  -  GNU                  0x00000014    NT_GNU_BUILD_ID (unique build ID bitstring)         Build ID: 71d68718f2b1393cce55605691453ca0615a985d
  +  GNU                  0x00000014    NT_GNU_BUILD_ID (unique build ID bitstring)         Build ID: 3b6d2e8b3ce02b99a41e594fafb756e5648edd3c

  -  0x0041ab00 31203230 31390032 323a3334 3a333100 1 2019.22:34:31.
  +  0x0041ab00 31203230 31390032 323a3239 3a303600 1 2019.22:29:06.

* similarly for other binaries

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
index 8d706e4..4e5b6ca 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
@@ -1,11 +1,7 @@
 require oprofile.inc
 
-DEPENDS += "virtual/kernel"
 DEPENDS_append_powerpc64 = " libpfm4"
 
-# Depends on MACHINE_ARCH kernel
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 SRC_URI[md5sum] = "bd998df5521ebedae31e71cd3fb6200b"
 SRC_URI[sha256sum] = "95ded8bde1ec39922f0af015981a67aec63e025a501e4dc04cd65d38f73647e6"
 
-- 
2.7.4


