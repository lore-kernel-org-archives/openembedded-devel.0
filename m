Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 64140780C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:30 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z6so9725570pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eHCL0ljA/zRlV/5iV5Ph9U2ZQ6mSM/M3d0M0fs4O78I=;
	b=PMTZ33IOSPsMKgJDFUCOGli02nLFiiu5GsUy4/ATAytcDfeoMK9/BXIphli0pXiYLH
	sEc3snOEfGt7SoxQRhQ3l41j8Sy7yo/7rjWHMYm3u1XtgzFuNhVSDMEA4vntlybD9eYI
	8SQv+GpbHFnB9rXPeww4AI7SzFuopXYFscKLtXkaew96JbExd3lvSsglrSJPCQv3RQ9z
	wp7V6xztrP2uh4oB+CYJwEPLbpn22yNBYMAAfIMKXuZT+uK1JnyqbM0Nvuy6ZxaYOF3Z
	1b3SDBwygrHFZEfdl7BNyfKeaTvUnsAL7EDzc6NkESh/qyOq6n/o+o8IEiYRVSEfDjCS
	vOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eHCL0ljA/zRlV/5iV5Ph9U2ZQ6mSM/M3d0M0fs4O78I=;
	b=jto1XsPjlQriL+0rvTra4aFEpU/NT01S28n6oeg66Funk3IM1x25bQUknIm+Nn3vqF
	N2aChHh4Hjak7jIUDxkxaxbrklXvwES9FGiXt7+hQ8GFLS415uwVhtlG5UVfZ0+MHVq3
	GCkU42K5Cl2OUUgZCulIvsd+5RsEa0uHDZnG+1L2czdTdxsvpNB0pgf7BpKhewuadUV0
	OVXpBr1V8+2RxWCA1tDsOd6jBq6YqrH/SGDueeHHUYGWNhDPPTLo5QCmFDugvYe3SP2w
	jIjLckN3+uwtg0S+hXZUTrTEIsudGyVtVLXtdiLZXQmbzCMeieNn3aJ460vxcoYbeypa
	ohQA==
X-Gm-Message-State: AIVw112ZeuyIm2xdQSp8aVPkMWRHoH6yDIRpKS+CAMPdkJvRayxOQUfn
	unDL4r9WxHp3extu
X-Received: by 10.84.218.136 with SMTP id r8mr14541163pli.205.1500010831693;
	Thu, 13 Jul 2017 22:40:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:00 -0700
Message-Id: <20170714054013.34458-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 05/18] cdparanoia: Fix build with musl
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cdparanoia/cdparanoia_10.2.bb                  |  1 +
 ...-utils-Use-c99-compiler-independent-types.patch | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/cdparanoia/files/0001-utils-Use-c99-compiler-independent-types.patch

diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
index 30d71ff2c..27fa0e585 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-${PV}.sr
            file://out-of-tree-build.patch \
            file://0001-check-for-null-buffer-before-trying-a-byteswap.patch \
            file://0002-Fix-printf-format-errors.patch \
+           file://0001-utils-Use-c99-compiler-independent-types.patch \
            "
 SRC_URI[md5sum] = "b304bbe8ab63373924a744eac9ebc652"
 SRC_URI[sha256sum] = "005db45ef4ee017f5c32ec124f913a0546e77014266c6a1c50df902a55fe64df"
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-utils-Use-c99-compiler-independent-types.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-utils-Use-c99-compiler-independent-types.patch
new file mode 100644
index 000000000..7699017f7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-utils-Use-c99-compiler-independent-types.patch
@@ -0,0 +1,49 @@
+From 89071cbc8d3ab9a15503f397580b7590338e5e91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 17:23:45 -0700
+Subject: [PATCH] utils: Use c99 compiler independent types
+
+Make it portable across different platforms
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils.h | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/utils.h b/utils.h
+index 10dce58..73bba92 100644
+--- a/utils.h
++++ b/utils.h
+@@ -3,6 +3,7 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <string.h>
++#include <stdint.h>
+ 
+ extern long buffering_write(int outf, char *buffer, long num);
+ extern int buffering_close(int fd);
+@@ -18,15 +19,15 @@ static inline int bigendianp(void){
+ }
+ 
+ static inline int32_t swap32(int32_t x){
+-  return((((u_int32_t)x & 0x000000ffU) << 24) | 
+-	 (((u_int32_t)x & 0x0000ff00U) <<  8) | 
+-	 (((u_int32_t)x & 0x00ff0000U) >>  8) | 
+-	 (((u_int32_t)x & 0xff000000U) >> 24));
++  return((((uint32_t)x & 0x000000ffU) << 24) | 
++	 (((uint32_t)x & 0x0000ff00U) <<  8) | 
++	 (((uint32_t)x & 0x00ff0000U) >>  8) | 
++	 (((uint32_t)x & 0xff000000U) >> 24));
+ }
+ 
+ static inline int16_t swap16(int16_t x){
+-  return((((u_int16_t)x & 0x00ffU) <<  8) | 
+-	 (((u_int16_t)x & 0xff00U) >>  8));
++  return((((uint16_t)x & 0x00ffU) <<  8) | 
++	 (((uint16_t)x & 0xff00U) >>  8));
+ }
+ 
+ #if BYTE_ORDER == LITTLE_ENDIAN
+-- 
+2.13.2
+
-- 
2.13.2


