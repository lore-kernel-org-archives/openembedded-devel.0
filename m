Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id AAA5D6E660
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 05:55:38 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id g12-v6so8626750pgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Oct 2018 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uTmKh5Qos3noe2qz+bRB3yxFOCGms8mTjWbardpLUaw=;
	b=ZXpRK3eBYJP+zSChw9ZAQwpGFFj2RR0ZIBAS+JhHkfrcz2M6vZPsO3LNz4v2ikfeQq
	24Er0Lv8N8ud9GvNghrsIgMsQeJ3VTqkOtjoHPuh9yriuk2VFUe99Vq+t7k13ettZzMX
	DLFhDSDLZwsaHWQN4RwjPloHTfYjIshoccSBPiac7Fw8DBfpldcxKghyIWSSk4uWA4Eg
	VV+p783UkYGM+AvCq0mYv0XUxG2BqZtxN4MAKJGl/cvBgS8L567OrtcBethU5kc9XAUC
	7jWxnhbA1IT6xUgc8rjOB82AYOYX0yhBpaXs6to++rWonbcrbBkkyd0bhDQ7Tm/1XTwB
	byvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uTmKh5Qos3noe2qz+bRB3yxFOCGms8mTjWbardpLUaw=;
	b=THXD48dMDyLSBbClqNlWJ6ME3TxDL5M7hDuMHhWvFuUH+o4hYqAsx7jtmcY9/od/bG
	rvkOKMjpZKuPWR51/ecrgYB1xOSdGHZwl1fCN8kAF0pufdIcSutM7pSgg8ROONzzEjZF
	ytUaNkQfH2C7soGXXY38Js2l6QrPWMQie5xGGojKyYq33baNKrlNI/0m2FJpBuOfTf6O
	lNrpmNCO/TPh2gN8M7/tH2ySF7g1rAWU6twi8juhwc4b+jf19O30aO0jOQbdH6QESLvo
	HSfvmbwYSOXiNaoFLLMGlNk5kZc8rRR6+BEyG6v6jJ5aXFX46jVkOuGBRcui7bB0ee1E
	aS7g==
X-Gm-Message-State: ABuFfohAAa/mOBbMirZTTxF/iC94HNhVuDjdjaKsddZr6bqxVPswNS0x
	UaNBJxoUsgtUNUTENQytFsj+K7bS
X-Google-Smtp-Source: ACcGV60bvETthwJ7NDeGq8Q85h+r29oD99CDA3Q9Tm02wIjbM3qr0Cdqk/4Qek99g2y9O+YkbBdyyA==
X-Received: by 2002:a63:9a19:: with SMTP id
	o25-v6mr14813524pge.440.1539582939321; 
	Sun, 14 Oct 2018 22:55:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	p82-v6sm17113420pfa.47.2018.10.14.22.55.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Oct 2018 22:55:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Oct 2018 22:55:26 -0700
Message-Id: <20181015055526.6021-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] cpuid: upgrade 20170122 -> 20180519
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
X-List-Received-Date: Mon, 15 Oct 2018 05:55:38 -0000
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

- Remove upstreamed patch
- Create directory and install file in single install operation

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Fix build with musl/x86

 .../{cpuid_20170122.bb => cpuid_20180519.bb}  | 12 ++++------
 ...d-sys-sysmacros.h-to-fix-build-issue.patch | 24 -------------------
 2 files changed, 5 insertions(+), 31 deletions(-)
 rename meta-oe/recipes-devtools/cpuid/{cpuid_20170122.bb => cpuid_20180519.bb} (63%)
 delete mode 100644 meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
similarity index 63%
rename from meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
rename to meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
index 5dd1bdd4ee..533a00026e 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
@@ -7,17 +7,15 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
-           file://0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch"
-SRC_URI[md5sum] = "1c46a6662626c5a6eaca626f23a5a7d7"
-SRC_URI[sha256sum] = "667612aae6704341dd10844e97c84c5c5c8700817a5937a3c293b55013bc4865"
+           "
+SRC_URI[md5sum] = "b3b4e44ef49575043a91def0207dcc76"
+SRC_URI[sha256sum] = "967823be36f23cbc972eb0aa882d069c1d155a5978990ac3bcf425e6a2e7ff9a"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
 # The install rule from the Makefile has hardcoded paths, so we duplicate
 # the actions to accommodate different paths.
 do_install () {
-    install -d -m755 ${D}/${bindir}
-    install -m755 ${B}/cpuid ${D}/${bindir}/cpuid
-    install -d -m755 ${D}/${mandir}
-    install -m444 ${B}/cpuid.man.gz ${D}/${mandir}
+    install -D -m 0755 ${B}/cpuid ${D}/${bindir}/cpuid
+    install -D -m 0444 ${B}/cpuid.man.gz ${D}/${mandir}
 }
diff --git a/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch b/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch
deleted file mode 100644
index 985182e3bd..0000000000
--- a/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 2693a499d4eec4504962e85a9713fa6431d3025f Mon Sep 17 00:00:00 2001
-From: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
-Date: Thu, 16 Aug 2018 22:36:31 +0530
-Subject: [PATCH] Fix: Add sys/sysmacros.h to fix build issue
-
----
- cpuid.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cpuid.c b/cpuid.c
-index 3c94837..0a98616 100644
---- a/cpuid.c
-+++ b/cpuid.c
-@@ -31,6 +31,7 @@
- #include <stdio.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <fcntl.h>
- #include <errno.h>
- #include <unistd.h>
--- 
-2.7.4
-
-- 
2.19.1


