Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3007807D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 16:32:05 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id m30so76138pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5ZFAZRznhDxqFRcA8PxNyCmnDYTseS4uCa8wQ2MUTcE=;
	b=ub2GiHHMPTp+37UrvG9CFtlcGT0xX2YoNdfGGMuGHeVjFSXBA0dSu5agUYphQO1/eQ
	woavujLSxTyPY+XfARhu5pK9HlGC91R2uGJEG0Ascvjdv3B0Akg9CmpmC9z2e9kgEK1r
	PyoLWQmBbPTKLiKRJdKXvkm2iOT/cVp8LfC5PkITc8sz4jeOukIhAoauCW6Kzy5sK7NQ
	DIhjRWQ0pDeYOCeQApsBy+CabQxUAxiFyK7y0VGK/OQ1Uhw8X9BYTnmu1csmObG1Jr+o
	golwr90k31O437UkzK1VctBbON4+NMSe4QPhA2Qkt7Z2yZYmPpcEcbIo1eCoPDSaWUyi
	k6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5ZFAZRznhDxqFRcA8PxNyCmnDYTseS4uCa8wQ2MUTcE=;
	b=XSbg45q8FVJw8CP4J33AHv6O27vT0WnUKaVg4VklVl1EEu7+h2pwIjUholMzXbYkVW
	3SFj7MQryLPLw+ZPXIRrlvOlnoX+r5mi3mw3zFQammOXJ7HiGW/u/gD1vy7m3/5nT7+U
	ar68Ye89Qjq0iz+iMmilfG3pT5oRdkzHU7WrPP0Y6+lqpljEtmKe4Vxn8XCFJMUEGZPl
	4ltEDgYru8iS/00gLYlbWgr1jbT9gpsRz95b0jyYvUD2c+rULlCdESMKr5v96pFVwoET
	q32U4i/1iOYI/2tBxdu3JkhS+p3nuHwW4j2KsrYJOi7XfHRyhqDEnCXZJ3fk5usL+5AS
	oWIQ==
X-Gm-Message-State: AHPjjUg9RktYe/bYCsKYQM5uBlJJzt8uQDm2cKtDbdghBgcCsRRmKpOm
	vZbrjAyBqgwAFDTF4Bd6L6jcYg==
X-Google-Smtp-Source: AOwi7QD0ycMXL24hUPsHDif+5MvGWfovr/+5UDC9UhGPnHqxz6qzSw3S7dgz+fLzsj5REDykkbIxFw==
X-Received: by 10.84.133.69 with SMTP id 63mr1814717plf.98.1505838727093;
	Tue, 19 Sep 2017 09:32:07 -0700 (PDT)
Received: from localhost.localdomain (c-73-158-54-208.hsd1.ca.comcast.net.
	[73.158.54.208]) by smtp.gmail.com with ESMTPSA id
	c30sm4257354pgn.33.2017.09.19.09.32.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 09:32:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 09:31:58 -0700
Message-Id: <20170919163158.38598-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170919163158.38598-1-raj.khem@gmail.com>
References: <20170919163158.38598-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] breakpad: Fix mips build on musl
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
X-List-Received-Date: Tue, 19 Sep 2017 16:32:06 -0000

There still are issues but this makes it better
and fix can be upstreamed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../breakpad/breakpad/mips_asm_sgidefs.patch         | 20 ++++++++++++++++++++
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb    |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch b/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
new file mode 100644
index 000000000..678f63d74
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
@@ -0,0 +1,20 @@
+Index: lss/linux_syscall_support.h
+===================================================================
+--- lss.orig/linux_syscall_support.h
++++ lss/linux_syscall_support.h
+@@ -118,15 +118,7 @@ extern "C" {
+ #include <endian.h>
+ 
+ #ifdef __mips__
+-/* Include definitions of the ABI currently in use.                          */
+-#ifdef __ANDROID__
+-/* Android doesn't have sgidefs.h, but does have asm/sgidefs.h,
+- * which has the definitions we need.
+- */
+ #include <asm/sgidefs.h>
+-#else
+-#include <sgidefs.h>
+-#endif
+ #endif
+ #endif
+ 
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 9a1255594..1ddd6b565 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
            file://0005-md2core-Replace-basename.patch \
            file://0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
+           file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
 "
 S = "${WORKDIR}/git"
 
-- 
2.14.1


