Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC3A7E3E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 20:00:34 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id y23so24807142lje.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 13:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5XaT+0hjt5/KgyWVOtxuwDNEtNcAJgJQmQkNx5LIwwM=;
	b=SjRMZQ2H9yBjcgrSsvflLh3iGuynVRNssJJ3AwRbx77uwYU/4W1rIPDgvx4cSRVT/y
	GxoAvYNmAeXzOaCUypB4gMQNCAiI1jyGglXydc9vpdIYo5YwJ84HGqZb/9HI+XxO6VTH
	SOPAXF0iNuhzSRl3K4+thwmPqp1/cWKVmoSJ23hE+M0moRDtHFLxMhuGuGPRGAXtgiz2
	1UzUShDZIpd65SCmxCg35YCU1E6AwK4m6BQGXJir4fyO4AemqhLndrXNYju0DLp1pbBR
	kg6+/NcvaY/mWHICd+cubramz6YUAj+5L8+BA+n15x0ARjoDk06wcpJ1YevAQ+QNimMD
	7WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5XaT+0hjt5/KgyWVOtxuwDNEtNcAJgJQmQkNx5LIwwM=;
	b=DA3Ovilv/fWQqxGGiyhOHS2hyqxihFOrmg9OtfFUTdeUM84rpXKu/vaQ4TigikWr3t
	z/RJAUNVa/u+e8CFoZi63yNF9uGfACvWNsx49XQrY+bungjbWLq46bZpI1VjtFBril4Z
	mpeeIOCaO5VkmqGHifz2+ivIvVKCNXk1ohbF+fBARRFJHhnaoBA3NRpj7LcUmMiQuBxU
	+5h57j2vxJd/SBIiMg79tsKTjV4vTa5G/pMdDVdVt3yo1gMQ2qSlxGf6Xpl6KuYL5r5/
	Pyr3Wjz2pbR4aUarngJNuA9YaIEm3ceHJA3SCMVbrV+nxNM8G/k/cMjAic6h2RnAinwG
	9Ybw==
X-Gm-Message-State: APjAAAV/QchwEJ55ZGTcJRf4fm9Xs+rjQPl/8DAa8V7Ad4W3iejgkQvC
	qTFySouuWBXXKo9yivioR9TX4qBAqqw=
X-Google-Smtp-Source: APXvYqzqS/wCik3gmwRcEB1K239P+7GqpyUcGIONBwT0zkMEih6zFJ07F9l+ogGvODZvvuYUzvvO+A==
X-Received: by 2002:a2e:9086:: with SMTP id l6mr1665157ljg.120.1568318434344; 
	Thu, 12 Sep 2019 13:00:34 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id n9sm3703366ljh.53.2019.09.12.13.00.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 13:00:33 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 22:00:31 +0200
Message-Id: <20190912200031.32245-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] avro-c: update to 1.9.1
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
X-List-Received-Date: Thu, 12 Sep 2019 20:00:34 -0000

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...avro-c-Fix-build-with-clang-compiler.patch | 37 -------------------
 .../avro/{avro-c_1.8.1.bb => avro-c_1.9.1.bb} |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
 rename meta-oe/recipes-support/avro/{avro-c_1.8.1.bb => avro-c_1.9.1.bb} (64%)

diff --git a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch b/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
deleted file mode 100644
index 01235d8ef..000000000
--- a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 518bb8ccfb3f3fc143fbd571782f3e40573d01b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Apr 2017 09:15:04 -0700
-Subject: [PATCH] avro-c: Fix build with clang compiler
-
-Clang advertizes itself to be compatible with gcc 4.2.1
-while that was true several years ago, it now supports
-a lot more newer features, the test to just check gcc
-version should be supplanted with clang check as well
-so atomic support in clang can be asserted as well
-
-Fixes
-
-lang/c/src/avro/refcount.h:301:2: error: "No atomic implementation!"
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lang/c/src/avro/refcount.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lang/c/src/avro/refcount.h b/lang/c/src/avro/refcount.h
-index 69afa4fc..d76ba057 100644
---- a/lang/c/src/avro/refcount.h
-+++ b/lang/c/src/avro/refcount.h
-@@ -118,7 +118,8 @@ avro_refcount_dec(volatile int *refcount)
-  * GCC intrinsics
-  */
- 
--#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500
-+#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500 \
-+|| defined(__clang__)
- 
- static inline void
- avro_refcount_set(volatile int *refcount, int value)
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
similarity index 64%
rename from meta-oe/recipes-support/avro/avro-c_1.8.1.bb
rename to meta-oe/recipes-support/avro/avro-c_1.9.1.bb
index 276fe2b5a..709b9d5f7 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
@@ -8,10 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
 DEPENDS = "jansson zlib xz"
 PV .= "+git${SRCPV}"
 
-SRCREV = "4b3677c32b879e0e7f717eb95f9135ac654da760"
-SRC_URI = "git://github.com/apache/avro \
-           file://0001-avro-c-Fix-build-with-clang-compiler.patch;patchdir=../../ \
-"
+SRCREV = "89218262cde62e98fcb3778b86cd3f03056c54f3"
+SRC_URI = "git://github.com/apache/avro;branch=branch-1.9"
 
 S = "${WORKDIR}/git/lang/c"
 
-- 
2.17.1


