Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id E87DD7F3A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 16:43:32 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y8so41649304plr.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2019 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e5ISdWTtvtQHrK+bUPHKlCDYbYPNxjH5wSNND0tJDuM=;
	b=p4uq9O6KkC++oMRhrWI8xUOcP4FhkqnJyZFQ9rwS/CfmwNqSWQaTic5hDmwXu7oMi0
	DXaptMFifuLZzepJEV3Y5c2vkp4BL7Tyi2tjHvn+wQOuuvabdQ8ArjoHEAY/V8mfEa8x
	jZUR0AYYJdT+b9nmWFID/Spd9/XG8INpS/7Kn71ehB474JDupk+3DgPcTkKqCDgFeoF6
	iA50ZAATq8yYurFmMQEj0GtBBxTOIqV/1F8pGhdF6YWavfM59xJoLIo5g8X3rSCLvzAo
	aVYP/dIHGG3ik2yYCL6XasfMhfJmo+bb9iS5vo/crTgx3t5NvT3Ysw4A9Z3RSFwLVgRD
	blcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e5ISdWTtvtQHrK+bUPHKlCDYbYPNxjH5wSNND0tJDuM=;
	b=DAHaudHpQjm9eUxNkktpcX7nHtK9Ixn+GCHF20E3tmF59Y2ww6ZxuiDBxeFCGy3cUE
	/xmeQ2C/XLKKWaUx++vLP22xev+xO9sBxsJiqbU3lAA30KG3is88LKsTaK5zWb+UJW9D
	1USAIjGNRotk0rSSxx0NhD+FSB5ZDqKJi8HAvkkfgvyrLdUmdvGSGsX90GoB3mnvFWU2
	ommA8g4JPqnJbbx+2gtzIx8kt+iGU4CmpZB/P22/Vl054aAJO4MnIpN16Ad+EK4Z38iW
	wQJENI/8c68uGBkDDbq57vjtNRXK2FEC2yoAO/cbOB1E5lXgkiIXExKjTlEf19J9GRZF
	0rqA==
X-Gm-Message-State: APjAAAXmba3/FPHmFc2MYIOJLSKOmwvVRwrBrnxMdrcUKu0AQ8wU8OQc
	Gv+aOoJ1mn9/L5SDYtx6Dk8cFdHnYZM=
X-Google-Smtp-Source: APXvYqxw7Maom8kspcFysauU4CWAlmD+aFAjJ9A7crrlTe5IJqVu5rg+GMn8MnIhw2ZgXU5WEq6pmQ==
X-Received: by 2002:a63:ff03:: with SMTP id k3mr8697603pgi.40.1565196213448;
	Wed, 07 Aug 2019 09:43:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	o11sm168735060pfh.114.2019.08.07.09.43.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 09:43:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Aug 2019 09:43:21 -0700
Message-Id: <20190807164321.44571-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807164321.44571-1-raj.khem@gmail.com>
References: <20190807164321.44571-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] android-tools: Fix build with glibc 2.30
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
X-List-Received-Date: Wed, 07 Aug 2019 16:43:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-define-gettid-if-glibc-2.30-is-use.patch | 52 +++++++++++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
new file mode 100644
index 0000000000..8524517cb6
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
@@ -0,0 +1,52 @@
+From f4f9d24860e1b5cd4f6a014f3fda7cd33ebe5be7 Mon Sep 17 00:00:00 2001
+From: Petr Lautrbach <plautrba@redhat.com>
+Date: Sat, 27 Jul 2019 08:20:20 -0700
+Subject: [PATCH] libselinux: Do not define gettid() if glibc >= 2.30 is used
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Since version 2.30 glibc implements gettid() system call wrapper, see
+https://sourceware.org/bugzilla/show_bug.cgi?id=6399
+
+Fixes:
+cc -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -I../include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND   -c -o procattr.o procattr.c
+procattr.c:28:14: error: static declaration of ‘gettid’ follows non-static declaration
+   28 | static pid_t gettid(void)
+      |              ^~~~~~
+In file included from /usr/include/unistd.h:1170,
+                 from procattr.c:2:
+/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of ‘gettid’ was here
+   34 | extern __pid_t gettid (void) __THROW;
+      |                ^~~~~~
+
+Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
+Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/procattr.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+--- a/src/procattr.c
++++ b/src/procattr.c
+@@ -8,7 +8,19 @@
+ #include "selinux_internal.h"
+ #include "policy.h"
+ 
+-#ifndef __BIONIC__
++/* Bionic and glibc >= 2.30 declare gettid() system call wrapper in unistd.h and
++ * has a definition for it */
++#ifdef __BIONIC__
++  #define OVERRIDE_GETTID 0
++#elif !defined(__GLIBC_PREREQ)
++  #define OVERRIDE_GETTID 1
++#elif !__GLIBC_PREREQ(2,29)
++  #define OVERRIDE_GETTID 1
++#else
++  #define OVERRIDE_GETTID 0
++#endif
++
++#if OVERRIDE_GETTID
+ static pid_t gettid(void)
+ {
+ 	return syscall(__NR_gettid);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index e09cd829d7..d84fcaecc9 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -41,6 +41,7 @@ SRC_URI = " \
     file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=system/extras \
     file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;patchdir=system/extras \
     file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=external/libselinux \
+    file://libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch;patchdir=external/libselinux \
     file://android-tools-adbd.service \
     file://gitignore \
     file://adb.mk;subdir=${BPN} \
-- 
2.22.0


