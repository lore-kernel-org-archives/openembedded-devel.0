Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C67B37E086
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYd3lwXzJB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489317;
	bh=H0VHRT8M5J1sGYG1yRspyGdKMWGUXE+NR24sjteTDGQ=;
	h=From:To:Subject:Date:From;
	b=sxx168F/zySa5JONIgTqZkJAu8JZaJIvMJNFNKSCsQwwpWy0DhI/9jDFWvBFasRRX
	w50KP6JLvtlz2pufMBWBVMYeJ0DELK9mq83yx/oa68pk0fOSBxzwLtNN4uIg3yWSwv
	EhRbijKHHapm0+3eGtu3uAv2IYE/lemGfHExL9gci+sbnrLpneU9m0T0tY7R37KLHG
	Sidve690yq350BgCbc2YXw1jU3LZf7Ad32wKgQJ81fdBXHxD8qKPEgoRvf2pGCJmWO
	upLQBT+F2/AuAxrQPt+oAs5EGuSRfPNSJKZnN3s5guaiUZCdONP1Y+JWdSWkOpuZX5
	/CA82YK7I744r8Yz0mGc2GksC+G1yX/Tv7v1rMfSwOQLFXcBYqDE7lbQG5iEh7pnAV
	S3Hs5sZC0M/TZ8ovpo2sz9PAFp/UnsHGKAbV7BVY41hMims1ql1hb1Fg8ghQj5naEr
	UWZvRA93rtiUFvepeODLyy2oRr+XaFVzDH5pxsyqnUls7yXL1dmFZbzRSwBtel7oWr
	fS01Mz9BeD8+9R3ZYci9SkvIZmgSRBOs4WEjjUudvKNuS+PI+1Iv28ASVvuH1Ch7QQ
	pNKCdYkhp//te9D8iajj9S8Fq9l+DVYL6GpEKqDX2H8KdjJgdjsLR/PcYqqOeBupb7
	+7d5OW/5WAIPbx/OZEBVpPo4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:00 +0300
Message-Id: <20190510115515.19491-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] fluentbit: Upgrade 0.12.1 -> 0.12.19
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
X-List-Received-Date: Fri, 10 May 2019 11:55:17 -0000

Remove patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...fluent-bit-shared-Link-with-lpthread.patch | 35 -------------------
 ...uentbit_0.12.1.bb => fluentbit_0.12.19.bb} |  5 ++-
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-fluent-bit-shared-Link-with-lpthread.patch
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_0.12.1.bb => fluentbit_0.12.19.bb} (78%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-fluent-bit-shared-Link-with-lpthread.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-fluent-bit-shared-Link-with-lpthread.patch
deleted file mode 100644
index e9eed24b3..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-fluent-bit-shared-Link-with-lpthread.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 62fa9bceb15a9d160dd5d624a6d46907c1019c5c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Sep 2017 17:02:55 -0700
-Subject: [PATCH] fluent-bit-shared: Link with -lpthread
-
-This fixes a reference to pthread_atfork in libfluent-bit.so
-otherwise we get undefined reference to the symbols in binaries
-which are linked with libfluent-bit.so
-
-Fixes errors like
-arm-bec-linux-gnueabi-ld: ../../bin/hello_world: hidden symbol `pthread_atfork' in /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/fluentbit/0.12.1-r0/recipe-sysroot/usr/lib/libpthread_nonshared.a(pthread_atfork.oS) is referenced by DSO
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- src/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 425a246..1264e59 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -168,7 +168,7 @@ set(FLB_DEPS
- # Shared Library
- if(NOT FLB_WITHOUT_SHARED_LIB)
-   add_library(fluent-bit-shared SHARED ${src})
--  target_link_libraries(fluent-bit-shared ${FLB_DEPS})
-+  target_link_libraries(fluent-bit-shared ${FLB_DEPS} -lpthread)
-   set_target_properties(fluent-bit-shared
-     PROPERTIES OUTPUT_NAME fluent-bit)
- 
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
similarity index 78%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
index 99f680f9a..e50aa71a9 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
@@ -4,10 +4,9 @@ BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
 
 SRC_URI = "http://fluentbit.io/releases/0.12/fluent-bit-${PV}.tar.gz \
            file://jemalloc.patch \
-           file://0001-fluent-bit-shared-Link-with-lpthread.patch \
            "
-SRC_URI[md5sum] = "6b4472cb7e7213a01425af9121576827"
-SRC_URI[sha256sum] = "8ec05365baea723033165687611b3bba3e67a77dce72e282e9f000f7acf9e37b"
+SRC_URI[md5sum] = "7c8708312ac9122faacf9e2a4751eb34"
+SRC_URI[sha256sum] = "23a81087edf0e2c6f2d49411c6a82308afc5224f67bbaa45729c057af62e9241"
 
 S = "${WORKDIR}/fluent-bit-${PV}"
 
-- 
2.17.1


