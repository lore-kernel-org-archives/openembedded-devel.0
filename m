Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 47E3178289
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jul 2017 20:30:39 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z6so21122707pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jul 2017 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=I0HBpoaHQprmkMhA6IXH7emItwg7RJmAh8viRE9xeqw=;
	b=a6izZv15YxCbYKHHu94IflCo3MW2eDPpmMentG7pWeB3252l80/0VCFCnfMLBd0vva
	UMvkPAWv2uKrF37VPeI4WckVSkhvBBBhrdsojAEnxd4rw453/2STPi86JjkLU1r5UX68
	sSScB6tMJrkPQKQUFB85OGgcmCDNcEjAd5cZXnDcpfjmKkNCSFGy0dRTyHZ4szA7zdmo
	dsycFk43/KYrhxcQ3rxjQ9/AeKvzKIHc2isONkdfySIANbefmXSFPx0lcnr46bck2qvQ
	PDYstb/58uFuwC9Rdr7JRdU5fq+4cAZVqQoQ0yoRcvq6ABhfsAuXfKlm7CZIzJpiWcYf
	K9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I0HBpoaHQprmkMhA6IXH7emItwg7RJmAh8viRE9xeqw=;
	b=Gh7N7AcgbfF7M2Hgrm3aZOKVuwW7ncSxEHzjie5bI2mkbweeBYDhpBs8VFG59HP6VU
	zdWuta6cw/YBv8PbiH1k0A/mgB205raMEGS/0kWPxqUlhtakePj9JHUnXXwKLT95qdYV
	T3zg0Oj4sRsFkm/j8iPA5Fgf4PUsMTi6OMHkPPiztVyb7oMQ/o5yhkSIjMuACAR+B8ox
	tRNFsJkW78EXGvRMJeGRljFGcrtEZsesvtPdeNjYHzrIN0LrEPhaptjVvvoDvoPqOkb0
	J20B8GIpOwNCCFoW8wCv4w8rS3+2N3Zp0JG6U3Dy/OA1tMKePhdF8W9jtnNqOKA4tSrL
	uvvg==
X-Gm-Message-State: AIVw112pjIVxGgGLaiDccE+40E65jIZzPNBs8hBXe1ou9mB8dTmoNwmH
	pG1vHq87Mos+cff8
X-Received: by 10.98.62.70 with SMTP id l67mr2142734pfa.114.1498941040948;
	Sat, 01 Jul 2017 13:30:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w190sm31062227pgb.30.2017.07.01.13.30.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 13:30:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jul 2017 13:30:32 -0700
Message-Id: <20170701203032.20647-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH] gperftools: Fix build on ppc
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
X-List-Received-Date: Sat, 01 Jul 2017 20:30:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-ucontext_t-instead-of-struct-ucontext.patch | 36 ++++++++++++++++++++++
 .../recipes-support/gperftools/gperftools_2.5.bb   |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch
new file mode 100644
index 000000000..5bd0b6fa4
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch
@@ -0,0 +1,36 @@
+From 12ac0dc6742e1bcdfaf1842186c9002f0820a5e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 1 Jul 2017 13:21:21 -0700
+Subject: [PATCH] Use ucontext_t instead of struct ucontext
+
+Newer glibc has dropped the ucontext tag from exposing
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/stacktrace_powerpc-linux-inl.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc-linux-inl.h
+index a9bf775..47ff2d7 100644
+--- a/src/stacktrace_powerpc-linux-inl.h
++++ b/src/stacktrace_powerpc-linux-inl.h
+@@ -53,7 +53,6 @@
+ #elif defined(HAVE_UCONTEXT_H)
+ #include <ucontext.h>  // for ucontext_t
+ #endif
+-typedef ucontext ucontext_t;
+ 
+ // PowerPC64 Little Endian follows BE wrt. backchain, condition register,
+ // and LR save area, so no need to adjust the reading struct.
+@@ -202,7 +201,7 @@ static int GET_STACK_TRACE_OR_FRAMES {
+         struct rt_signal_frame_32 {
+           char dummy[64 + 16];
+           siginfo_t info;
+-          struct ucontext uc;
++          ucontext_t uc;
+           // We don't care about the rest, since IP value is at 'uc' field.A
+         } *sigframe = reinterpret_cast<rt_signal_frame_32*>(current);
+         result[n] = (void*) sigframe->uc.uc_mcontext.uc_regs->gregs[PT_NIP];
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
index 15cfc97e8..43780a5ee 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
@@ -7,7 +7,8 @@ DEPENDS = "libunwind"
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz \
            file://0001-Support-Atomic-ops-on-clang.patch \
            file://0001-Fix-build-failure-for-ppc.patch \
-          "
+           file://0001-Use-ucontext_t-instead-of-struct-ucontext.patch \
+           "
 
 SRC_URI[md5sum] = "aa1eaf95dbe2c9828d0bd3a00f770f50"
 SRC_URI[sha256sum] = "6fa2748f1acdf44d750253e160cf6e2e72571329b42e563b455bde09e9e85173"
-- 
2.13.2


