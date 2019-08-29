Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id B81AF73196
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 04:56:26 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k3so905536pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 21:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cm1mUTcLeGEBNxPGNh04nC2U1wM8UpP+wOhq+TV8M6k=;
	b=gnmOm+HRmjzUPQGSNkDqoI76K1UW8ReEWGxqqE+gzEw1nH0jM+hIzo362ih3OfUuqC
	p41dOwD/4GhZQCrml+pYv2EuLt9GnAyajM5rqrW4MZqXLygW3vBp9Dyf6JbdBB1Q15I4
	oh0q+z+rL2znq71+mnFvKHMGMFRaqMneIRWUCyR+P1ek660qc4RpDIb5CYJlJwjjy+nG
	VfBAUO3wYxXDCyMt/Te1tWQIv+JK4atV13J3wddLUkv4kNS4xr1C/VlxDf2OQQLlILcK
	2VYE3AwM0UqWwxHm6u54T7NefazXLEJnXBisw8po6kXCanlFXzzEWVmHik3e4rWwSfSo
	t63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cm1mUTcLeGEBNxPGNh04nC2U1wM8UpP+wOhq+TV8M6k=;
	b=aa3GxGubKasrABU0GdmLr1Tk7fKSEg/myLHHfGRlAia4ipDjb5SXDu4pMDk1CEK/Dm
	2PJZJJ8PBdmCNikV+UVgNdg8CThGKDHSmGB848Zl7WpsguTYkRQHC+vkq8mRMR9ihrdF
	RCigjNuhGHuJ3TzOfbA9eOkU1poxh38PwGI7ErRfmapWN9lDP0FCcorYeTf6dBY0mzji
	pc3dW5APt/wb7InHsrrcRMQTOOrFKhzN+Y9ja3Kq3bpitJHMzGhDA4M/lWvUsQb9t5ka
	10NjiEkWsgmWHDGOTJExQK3/OGyjVTuBT5tnYbDqTbhKtNPC40epYGjuzWELWhW4gF3X
	uTgw==
X-Gm-Message-State: APjAAAUF3a5TPZoT9FQcNGZlr/8jFFAp/eKHnjGhWnlCY7z38/wpJQoT
	jRBLnOqRYDW9QeTWPpLXbD5eNlioIRw=
X-Google-Smtp-Source: APXvYqwdFeK6GvAaxLmZU6B8ZxpmlmfiK7zTTrjdCHg7wlRoQoj7d3quxv7omd8TJZyNHxbeMWk95Q==
X-Received: by 2002:a63:4c5a:: with SMTP id m26mr6442834pgl.270.1567054587244; 
	Wed, 28 Aug 2019 21:56:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	e13sm1234261pff.181.2019.08.28.21.56.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 21:56:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 21:56:15 -0700
Message-Id: <20190829045615.8476-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] kernel-selftest: Explicitly disable stack protector
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
X-List-Received-Date: Thu, 29 Aug 2019 04:56:27 -0000
Content-Transfer-Encoding: 8bit

selftests do not support it and clang from meta-clang builds with this
turned on by default

Disable security flags completely, drop all workarounds used to get
around the hoop

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kernel-selftest/kernel-selftest.bb        | 22 ++-----------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index dce33c16c5..ff9720f8d0 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -39,6 +39,7 @@ EXTRA_OEMAKE = '\
     CROSS_COMPILE=${TARGET_PREFIX} \
     ARCH=${ARCH} \
     CC="${CC}" \
+    CLANG="clang -fno-stack-protector" \
     AR="${AR}" \
     LD="${LD}" \
     DESTDIR="${D}" \
@@ -52,16 +53,6 @@ KERNEL_SELFTEST_SRC ?= "Makefile \
                         LICENSES \
 "
 
-python __anonymous () {
-    import re
-
-    var = d.getVar('TARGET_CC_ARCH')
-    pattern = '_FORTIFY_SOURCE=[^0]'
-
-    if re.search(pattern, var):
-        d.appendVar('TARGET_CC_ARCH', " -O")
-}
-
 do_compile() {
     if [ ${@bb.utils.contains('DEPENDS', 'clang-native', 'True', 'False', d)} = 'False' ]; then
         bbwarn "clang >= 6.0 with bpf support is needed with kernel 4.18+ so
@@ -123,13 +114,4 @@ RDEPENDS_${PN} += "python3"
 # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
 INSANE_SKIP_${PN} += "ldflags"
 
-# userfaultfd.c:126:2: error: format not a string literal and no format arguments [-Werror=format-security]
-#  fprintf(stderr, examples);
-#  ^~~~~~~
-SECURITY_STRINGFORMAT = ""
-
-# https://errors.yoctoproject.org/Errors/Details/261657/
-# kernel-selftest/1.0-r0/recipe-sysroot/usr/include/bits/fcntl2.h:50:4: error: call to '__open_missing_mode' declared with attribute error: open with O_CREAT or O_TMPFILE in second argument needs 3 arguments
-#     __open_missing_mode ();
-#     ^~~~~~~~~~~~~~~~~~~~~~
-lcl_maybe_fortify = ""
+SECURITY_CFLAGS = ""
-- 
2.23.0


