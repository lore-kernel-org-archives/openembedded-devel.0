Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id D2CC36E47A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:20 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id c73so5025566pfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1h/r+zVquM/oFwXbRq3mJ7dY3TaLzkt1n0IKCSaeypo=;
	b=Xgxr3ewdOJh6xXpypALoFK3/R4GoyXEPs5PEE6vh/PF8vcLTuIYtoX5io/aAMT3FFn
	7xOanZvjfxiHn1fR6bRRoLOclT817VkHyKMFYfakCbVqqcX34Z4PW4ErX5MlJVLUiXnJ
	zIXo+5NGU1leaXgKFjXfmKpkv2eYSZc5UXdA99gp7uR0jMqQY+16VqtXk8rtWQQ7CDoU
	cC3hnIkx6Jwwlzn/Ie7tnbux+Nomv9K4Huw02yMCTE8wEA4tdOBjfnzNzdsU5RvrjbTc
	vq3WtWbUNzsfgh43zJMeeUXxh70ZQtvO2NmDHf+cuV9HsFcupjsIUX70IPYrvQbo7iSq
	4aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1h/r+zVquM/oFwXbRq3mJ7dY3TaLzkt1n0IKCSaeypo=;
	b=RWvfxJ7sWWsJvWL1KeDYPmip2TuApyUKcu5zgAbtx8dYaR5rw+Zr6P8Y7huTlkZlUc
	G3HCDuLZwoqHAVSDYSo8eAPNz1nMYM4xevHvYsUS++DUtxR+G+JXcE2XkuVjXMNt3dlN
	IQYTA2uooqbeCmaFmdVuTCi3EhFFfrRiZdMXCbyUXvOQ5NV1FkYUdyguk6z4L55lg0IC
	XqBasLljSsvYnEuUHxDh9ye+q5dWw6M1+soh6tXgk8emqqf1xF+7cicSX2DXJvugabKu
	2HS/IULn0UsH1WRQCPwD0ovvYf8y1J1Y+R5hhJFjM8KwUX/Jp49itHHcOiTurQdydcDi
	8+ig==
X-Gm-Message-State: AJcUukfSf8vI3VOC3Z0s6aQRpetqcwKrKsW6GtHfrYsC4hKQXmCgvjCS
	mUwwp9bZpfKX64FTT49JKgZ0MUzuFgA=
X-Google-Smtp-Source: ALg8bN5OZZgRfm2dyeghiJ+TnUk2TWTvZ5cUMwGXGVRnpmcxazJ9v0ZKDEJbPRpsEoJKBmBbGtIf8A==
X-Received: by 2002:a63:db02:: with SMTP id e2mr10334396pgg.419.1545600981485; 
	Sun, 23 Dec 2018 13:36:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:52 -0800
Message-Id: <20181223213557.7834-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 13/18] mozjs: Remove -Werror=format from CXXFLAGS
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:21 -0000
Content-Transfer-Encoding: 8bit

This is to make way for gcc9 since it spews some extra warnings
which need to be eventually fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs/mozjs/format-overflow.patch         | 21 +++++++++++++++++++
 .../recipes-extended/mozjs/mozjs_52.9.1.bb    |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/format-overflow.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/format-overflow.patch b/meta-oe/recipes-extended/mozjs/mozjs/format-overflow.patch
new file mode 100644
index 0000000000..29c6a7b69c
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/format-overflow.patch
@@ -0,0 +1,21 @@
+Drop enable format string warnings to help gcc9
+
+Fixes
+| /mnt/a/yoe/build/tmp/work/core2-64-yoe-linux-musl/mozjs/52.9.1-r0/mozjs-52.9.1/js/src/jit/x64/BaseAssembler-x64.h:596:13: error: '%s' directive argument is null [-Werror=format-overflow=]
+|   596 |         spew("movq       " MEM_obs ", %s", ADDR_obs(offset, base, index, scale), GPReg64Name(dst));
+|       |         ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Inappropriate [Workaround for gcc9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/js/src/moz.build
++++ b/js/src/moz.build
+@@ -785,7 +785,7 @@ if CONFIG['JS_HAS_CTYPES']:
+         DEFINES['FFI_BUILDING'] = True
+ 
+ if CONFIG['GNU_CXX']:
+-    CXXFLAGS += ['-Wno-shadow', '-Werror=format']
++    CXXFLAGS += ['-Wno-shadow']
+ 
+ # Suppress warnings in third-party code.
+ if CONFIG['CLANG_CXX']:
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
index 440a25b74e..a28ecc57d6 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.9.1.o
            file://disable-mozglue-in-stand-alone-builds.patch \
            file://add-riscv-support.patch \
            file://0001-mozjs-fix-coredump-caused-by-getenv.patch \
+           file://format-overflow.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0006-support-musl.patch \
-- 
2.20.1


