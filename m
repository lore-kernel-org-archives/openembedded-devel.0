Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 967007F37C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 16:43:31 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id ay6so41682973plb.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2019 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pxYpAfofj6oj+Pza2kT9Ibds9yE3iB86mSMHnDENSEE=;
	b=jtd1Nv9WXa1XPnhmhs3hokZQ3q4CTT7ZsLnfz8PLLJhnQVOy8NQ7hCaKkc3WywDXj0
	7IxGQGmWbMOOEWXpq4szmFcJTLG9rwfW92wmPnk2ZCq5clI4DLMe5nDc+GhCnuSOq9Jt
	IGLRLJVJVubF+nTAcLO0Hc/S2s9EzBlNOf8mEk8FGsmG0nRnNfNm7p+PBYAVp7zfon7h
	YUWV9FvHrnvmjWM7H4POCw3DaT6VR/hUag1jUyIVUaMKZvQxV0pjeNY3SJXwmJu0Zyt4
	bTqV/Z2owTVadyc+LZ9y9UqsOBJ7Qoj8vinph0D2iAi26mKd5g+8+2u2n1Se7uoRQRXb
	1tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pxYpAfofj6oj+Pza2kT9Ibds9yE3iB86mSMHnDENSEE=;
	b=dBoKFQv38FUunR4Qe8O/zNRZBr/65hr9JNCLl76yE4jXflL/fImtFQQ/tfxU/8YrFK
	kpb0w4TKQZ/cuu8QnraWFIhf3EgFb1+ykSaBCWoGSnx9PSS6G0jYdo5PAczSpk1z+eow
	a39y4ZAMD0L9sq2SRSU3mhu9FJjsS8ocrdRiPx3Db3KkZirP+o8WuNDc2GK5z59RVoiV
	6fiMab28GJjzJW7TBxkgQUEPGdAmOJ2qVnlnfYxMs/LVmWuvKigFkvgbpoAqqjNJSjrr
	BriUhKoc8bxxfxvCnOu8w+E1bHHjIoge0Sj3odY+Rgagh8ILyWp/0/WoZytx8Ly0Nriz
	mP0g==
X-Gm-Message-State: APjAAAV/2NQqgq1hLW+O1ZsCL9wsjcqVE7JncIRAEC7ymalAbKhL6Tsm
	F7zLtX86eiuN9CyRZXcmXmcaOhVOs6k=
X-Google-Smtp-Source: APXvYqzbomeI2j7QWa3cwm/Y6HLc47srJE2Sh8qBsr4Hqcy+4GngAUr51rvoVvPYol9faiHMlQGgDg==
X-Received: by 2002:aa7:8711:: with SMTP id b17mr10416285pfo.234.1565196211997;
	Wed, 07 Aug 2019 09:43:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	o11sm168735060pfh.114.2019.08.07.09.43.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 09:43:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Aug 2019 09:43:19 -0700
Message-Id: <20190807164321.44571-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/3] python-grpcio: Use gettid API from glibc 2.30+
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
X-List-Received-Date: Wed, 07 Aug 2019 16:43:31 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python-grpcio.inc |  1 +
 .../python/python-grpcio/gettid.patch         | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio/gettid.patch

diff --git a/meta-python/recipes-devtools/python/python-grpcio.inc b/meta-python/recipes-devtools/python/python-grpcio.inc
index fd341f5de7..7d3675c455 100644
--- a/meta-python/recipes-devtools/python/python-grpcio.inc
+++ b/meta-python/recipes-devtools/python/python-grpcio.inc
@@ -9,6 +9,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-grpcio:"
 SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
                                 file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
+                                file://gettid.patch \
 "
 
 RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
diff --git a/meta-python/recipes-devtools/python/python-grpcio/gettid.patch b/meta-python/recipes-devtools/python/python-grpcio/gettid.patch
new file mode 100644
index 0000000000..fb15cf7f96
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio/gettid.patch
@@ -0,0 +1,26 @@
+use glibc provided gettid API for glibc 2.30+
+
+glibc 2.30 introduced this function see [1]
+so it's best to detect it
+and provide fallback only if it's not present
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=6399
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/core/lib/gpr/log_linux.cc
++++ b/src/core/lib/gpr/log_linux.cc
+@@ -40,7 +40,13 @@
+ #include <time.h>
+ #include <unistd.h>
+ 
++#if  defined(__GLIBC__)
++#if !__GLIBC_PREREQ(2,29)
+ static long gettid(void) { return syscall(__NR_gettid); }
++#endif
++#else
++static long gettid(void) { return syscall(__NR_gettid); }
++#endif
+ 
+ void gpr_log(const char* file, int line, gpr_log_severity severity,
+              const char* format, ...) {
-- 
2.22.0


