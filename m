Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id B858360273
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 00:18:53 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id r124so7532001pgr.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 17:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hEaDyUDZq/3naeFADU3uJlCPkJ70hAL2fxWxjAnX9wA=;
	b=mqnnY8vv/tMr5CsKCIIozbw+oU3ezoDPbI9lD/xzSIn+das1gdlKerNuw8MYUDEUpb
	IvccmhCdDfB02JSUj/rMvGX9gEYAC7e8ZNDQVuZmh3Cq/b+4S6lDOanozTDIIsrGCkl0
	5QT6RTbLbI3gkJG6zrT7T/VD4+5iTj6YbW1UEDX2b8oXzD8jLcXWW7kLSdgI4yFuy8DZ
	ZnjHQTACjZvaXCtGVUvCVq6C/LAM99pIOSc+vDQF6cZ+iSsoy7u/ya6pYw1Aip6XgsWr
	I91997ZEB4ZE0l69/+UlfX/lQhifQgFrrzqCR71mLo7Gv3BAWIYuul+CKSZ5eO/uAydw
	Vb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hEaDyUDZq/3naeFADU3uJlCPkJ70hAL2fxWxjAnX9wA=;
	b=GN7FXh5gTxNAymCCs+xzVF3SN+aw0YMgN74WD0r2fdPr2sUaUJGqaNHzmRh8Svairc
	+XhKcZenO4QNPcz06oCntygUZ/Y2/p5zaG3i/FCYY2Tug1JPzJv7Z4INDe8CjW68IUWX
	RqoUA4dR9J7sViwyCYq0NRSjfsI1W96lJ0VhYThSJpKuMiCIs2PuI/VRseR5Xy9NIM1/
	A85L65ziOx0aplWsLsHgdhCxh8IxYRMoCQ5oriLI8zYSobCkfEEIT2d6gduYeGwF7oLa
	U3yfFPpirgNlLR6ZfkpSbw4VycDjbK/J143SC0OrpYJUOPYjhsqZcw1wULqYMmLILlCT
	JtFg==
X-Gm-Message-State: APjAAAXN0yr8KQwS0Y9SwQrR0PtTpUPpB/aGevZVkw5XGtxGGTy1qbfD
	AZnRkG2Y0qreSEn0iflCx07CGZWy
X-Google-Smtp-Source: APXvYqxQH+wbd7uRfMifvN9m3bHr+dVJwMyxgB5o4nCFs2qdyGv9AVcpIz34+0pT+/Esg8Oa5oJxAg==
X-Received: by 2002:a65:43cc:: with SMTP id n12mr5863735pgp.218.1552695534393; 
	Fri, 15 Mar 2019 17:18:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	f11sm3677718pgv.28.2019.03.15.17.18.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 17:18:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 17:18:44 -0700
Message-Id: <20190316001844.15039-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] postgresql: Fix build for RISC-V
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
X-List-Received-Date: Sat, 16 Mar 2019 00:18:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Add-support-for-RISC-V.patch   | 41 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_11.2.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
new file mode 100644
index 0000000000..865ad3287b
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -0,0 +1,41 @@
+From b06a228a5fd1589fc9bed654b3288b321fc21aa1 Mon Sep 17 00:00:00 2001
+From: "Richard W.M. Jones" <rjones@redhat.com>
+Date: Sun, 20 Nov 2016 15:04:52 +0000
+Subject: [PATCH] Add support for RISC-V.
+
+The architecture is sufficiently similar to aarch64 that simply
+extending the existing aarch64 macro works.
+---
+ src/include/storage/s_lock.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
+index 3fe29ce..7cd578f 100644
+--- a/src/include/storage/s_lock.h
++++ b/src/include/storage/s_lock.h
+@@ -316,11 +316,12 @@ tas(volatile slock_t *lock)
+ 
+ /*
+  * On ARM and ARM64, we use __sync_lock_test_and_set(int *, int) if available.
++ * On RISC-V, the same.
+  *
+  * We use the int-width variant of the builtin because it works on more chips
+  * than other widths.
+  */
+-#if defined(__arm__) || defined(__arm) || defined(__aarch64__) || defined(__aarch64)
++#if defined(__arm__) || defined(__arm) || defined(__aarch64__) || defined(__aarch64) || defined(__riscv)
+ #ifdef HAVE_GCC__SYNC_INT32_TAS
+ #define HAS_TEST_AND_SET
+ 
+@@ -337,7 +338,7 @@ tas(volatile slock_t *lock)
+ #define S_UNLOCK(lock) __sync_lock_release(lock)
+ 
+ #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
+-#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 */
++#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
+ 
+ 
+ /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb
index b87289a1b8..0f59c8dd17 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=87da2b84884860b71f5f24ab37e7da78"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
+   file://0001-Add-support-for-RISC-V.patch \
 "
 
 SRC_URI[md5sum] = "19d43be679cb0d55363feb8926af3a0f"
-- 
2.21.0


