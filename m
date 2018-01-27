Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8377888A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:05 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id p5so167738plo.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ubniw0pu5hfG13t9kZE5OsHTe8B23mNuuCMEo8bkgMA=;
	b=W3jqjViiVgKekfE3uLo7J05qN6xwyKRcfCDXH1ynyGvf0C+xSgSpFe2ObHArpD2ffS
	Lm/Ey/wGPFZlrSQZw+tZp4DV/toM0+cgMYnpWYwYoBHKRRfBj8coj0/2DAojP//hYdT3
	qSBlhZ/QmLxICokeqjZwccMyo4i4udt7KdAn2GzoHGf1XzsMxwIFyAHTPOOfNjBd73+S
	f7B4gMC+fQSrwrodeXZn0woRy83KDQWhibO4Kc+kdM3XD18VS7++kNoYB9QpjbXNG4fc
	VmwbPET5uctxfRMahYnwiP3ve/tbU8+ioC5Ho6oAGRWf8Chr4rG654/Z7WjPp+JlqWtr
	kqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ubniw0pu5hfG13t9kZE5OsHTe8B23mNuuCMEo8bkgMA=;
	b=LeAV2BvhlGzXrWVkIkJxnK0xQzTk7iuQwNN1CUJRNobhiG8cztOhfmxqJ+0Nqg0pH8
	qMyYgB2Gkt/E6V3TCyeXpJq+zY+4cZ7m5bnxGK4T+AWyesnC6AYkSRyW1Anb9/SKDg/S
	Qr7gKtLWhUKesykM5eZTDuLvnzqjeo/jsvJts/8wWYdf3RsY5jFgcKUQYrfnwia4qoyq
	peQjJPbqSEX73C+Cb0eT0IShopgbBFXxzc7bYkvkvJlyDGNfmUwYaktYA6U+JAn3vx7a
	4dri6phqXuZUx9Yf7PY93+y5zkp9DFisM9Q+DrEVtohWQ0dU2PD4a/rcOL1A/vFpi7ZV
	HN2A==
X-Gm-Message-State: AKwxytfY5f8r8jnilQvR33St7zkIhhwDLzlIfsjtZYeIRnO0ACP5ebfQ
	GNVVi6TbbwLjhpQHQM0h8dMy3w==
X-Google-Smtp-Source: AH8x226+nW/UPrtlUJpKa1Xw635dK2Q//wArXikD9ToWNLAKOOSWRSLkwlPswfxc62nHX0uqILh17A==
X-Received: by 2002:a17:902:4181:: with SMTP id
	f1-v6mr16021854pld.59.1517023507357; 
	Fri, 26 Jan 2018 19:25:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:29 -0800
Message-Id: <7514e0bc996eb2a6df892f04793ea683c85d6120.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 29/36] dovecot: Fix parallel build
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:06 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit ff720f34e47638dd86f9671ab8073f27094d819f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dovecot/0001-doveadm-Fix-parallel-build.patch  | 38 ++++++++++++++++++++++
 .../recipes-support/dovecot/dovecot_2.2.29.bb      |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
new file mode 100644
index 0000000..65ae9bf
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
@@ -0,0 +1,38 @@
+From be9b3809b86fe593dbb16f0b981b3d315a27b799 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 22 Oct 2017 22:10:41 -0700
+Subject: [PATCH] doveadm: Fix parallel build
+
+Sometimes dovetail build fails with errors like
+
+doveadm-util.o: file not recognized: File truncated
+collect2: error: ld returned 1 exit status
+make[4]: *** [Makefile:812: test-doveadm-util] Error 1
+
+This is partial backport from
+
+https://github.com/dovecot/core/commit/b200bc3875fa06d42c8619865cc306c3297fcacc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/doveadm/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/doveadm/Makefile.am b/src/doveadm/Makefile.am
+index c644646..6ae9144 100644
+--- a/src/doveadm/Makefile.am
++++ b/src/doveadm/Makefile.am
+@@ -180,8 +180,8 @@ test_libs = \
+ 	../lib/liblib.la
+ test_deps = $(noinst_LTLIBRARIES) $(test_libs)
+ 
+-test_doveadm_util_SOURCES = test-doveadm-util.c
+-test_doveadm_util_LDADD = doveadm-util.o $(test_libs) $(MODULE_LIBS)
++test_doveadm_util_SOURCES = doveadm-util.c test-doveadm-util.c
++test_doveadm_util_LDADD = $(test_libs) $(MODULE_LIBS)
+ test_doveadm_util_DEPENDENCIES = $(test_deps)
+ 
+ check: check-am check-test
+-- 
+2.14.2
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
index d834bef..1663408 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a981379bd0f1c362f8d1d21515e5b30b"
 SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
            file://dovecot.service \
-           file://dovecot.socket"
+           file://dovecot.socket \
+           file://0001-doveadm-Fix-parallel-build.patch \
+           "
 
 SRC_URI[md5sum] = "ff95486a5c43025a2c3f5a712e7962b9"
 SRC_URI[sha256sum] = "d939ea99126eb8a8c6955390b422b6e27ec0fa43a3b59b2b3218cb5ad67139a6"
-- 
2.7.4


