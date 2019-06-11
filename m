Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E53397E600
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 22:57:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c2so14775538wrm.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 15:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CZal7rDIwqz9LD4KpqGdwrcUglHERB/AbJt21hI/TNM=;
	b=aGSCPERXewFHEpzx+OKZz1k4/3vm3dCDtrVANHUsAtzz4PRs311svNi+UAY2StSfnw
	apujeHDv7tFIzyXH++RNV8AmLCCSmL00mt82A63+88+m5A+dJ6n+LrdSeF9+hP1NdvZc
	NNNnim1GFMmWIMVG+Efbp4leHAEmwAs3JNcSALNobORX+FDtQYTeVK8FeyT6WU+N7a6U
	1qUhxkckLNqYGxuG5qmIvP237P3L2mormJ1L3z7R+xP0V3HD7D8a49hgKlVjzeczbVr4
	dFeYD1W303xkoFa0+D9RtIJMfZ4hmyFWuNkWmXAZTAv9ny12PlYNTN9kF3QU/A5dP/FA
	40ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CZal7rDIwqz9LD4KpqGdwrcUglHERB/AbJt21hI/TNM=;
	b=hOottAE9KiKik+FLEbsWnCoyufV8hS/i7jgccQU/Mx8qm+vmT4+wf+w9dX+UQzSY7F
	aa8sbZF55fjn5c1pFocWV5bOmX191LBPYyYqvmF5Pq7D2Lg/GuTmOXaDqgd5vYNlN2Cz
	wZtdXeAcXqo7nDysXxN5qvvkEJJmBcb8KfYyZtTJubzulHUEKIXCyT/Ucuvv3Kp3xrSf
	PSJIP/BLRwKaZuIFEW2gQFOw5E1n0MUW3vkDmlJqWcUaLI333byu6z4VkfVJNrlmfqoA
	yRcEqrg3ssvhghVj9mM7sp01rUQxXpAC0qNP9k/eDMPMQIt7zC2iPaXX2sqWZa1O5Lh7
	2ksw==
X-Gm-Message-State: APjAAAVkqud4VX0XXPjPPyTQ5Em4QOg0P+AfvvTLn1op6a6+7S/Khrtl
	8xPgkK5o4enxCZH2DWMBLxw+U9Rn
X-Google-Smtp-Source: APXvYqzuTKe09B2GfpWF4mS01xO2KQ/uwff5KXB4q3e+ok7pqwzw0Ue/z4vX4hjswpnolKKs2Z3FHw==
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr8859587wrs.2.1560293829234;
	Tue, 11 Jun 2019 15:57:09 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id s10sm3968835wmf.8.2019.06.11.15.57.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 15:57:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 22:57:06 +0000
Message-Id: <20190611225706.6957-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] oprofile: drop virtual/kernel dependency and switch back to TUNE_PKGARCH
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
X-List-Received-Date: Tue, 11 Jun 2019 22:57:09 -0000

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
---
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
index 8d706e4a50..4e5b6ca33c 100644
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
2.17.1


