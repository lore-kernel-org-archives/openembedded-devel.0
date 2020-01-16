Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9567F979
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 07:19:22 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id t14so17241plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 23:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J+8UPqMpqf4Q/k3ayo+8jkv+B4/q9CgbRSjRrakWZAA=;
	b=cc+ml1yKzcKaus2z464IBJKpfFxpxDoAEhO3K8eDio00Pe0DrIl/5Z2LzskCZeGg/1
	ptN3GiBv0w2M5f7ysEnZaoBGhZMH5oHKwkuHJmMEZpQOuyinJVKmc/TpXI0Znz3AF5tU
	zMDZd/sc4WUpJW+uQUmfIl/dom0vvbOBbPLnZ1u6cMHeUPGRWimfuXSyfK7X+4QF7yOR
	oTH4q+ZcbiCMpDebfjT4LWI9Ucp1CcNlPDSgrJXxCiUh2/wu0L7d0hPPnfK5lCchkSlH
	0OKu/3v4eyO0f/HnUZVbi8g5sZWLE4sfGcezUYLcxrP7muTSRkrFW8jsE+HrBHNT0lYf
	beyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J+8UPqMpqf4Q/k3ayo+8jkv+B4/q9CgbRSjRrakWZAA=;
	b=sZZvoshtkVKqbkgfz5dJi2PzJ5MfpE1LCYQU9B9kV0lBrcMzOeFKJdV2z48MRGZYXS
	m6uG1ijcDdZ2cPPnaABiI3RTEzl8PRws17cVGL3YRoAr3c9mmxQvEwYjt8BcF3zM+SXW
	4pOLw6q2chM8P7gpUCmxoWdlDY7M4ivSTk9ydUN+/lJxDuFX2hzFspUak9DHyByXH6qG
	uAa9uEj7Nkv8kP9Nd2bTT6EGv9n2k0w59CtLWK7a4RyiducCUZycuoSMA7ev1q3IAT/z
	xEr8nL+0m215FmcfR4y2HBdHVSjcFs/rTNh7BdPCqkM7oK66jf/ENVusAakbAWmGOlYE
	kCyw==
X-Gm-Message-State: APjAAAXmHItS6l7a5SJC70XCKZummerOrhxS97QCHUcbxBGscwo3IEAT
	SNz6tEda1tXmlEVeFLBNZv8dTN3EvyA=
X-Google-Smtp-Source: APXvYqySZVZU5ybJdwo2P/aR0TvtDbjgyAVaKLN0LQvMhHhas9M31Ousy/e9yh81ACkKmr4Ak0pi3g==
X-Received: by 2002:a17:902:788b:: with SMTP id
	q11mr30624455pll.21.1579159162990; 
	Wed, 15 Jan 2020 23:19:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	12sm24780080pfn.177.2020.01.15.23.19.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 23:19:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2020 23:19:20 -0800
Message-Id: <20200116071920.2713631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] jack: Use c++ compiler for programs which use c++ source files
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
X-List-Received-Date: Thu, 16 Jan 2020 07:19:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Do not export CC to be CXX globally

 ...ts-Use-c-compiler-for-jack_simdtests.patch | 33 +++++++++++++++++++
 .../recipes-multimedia/jack/jack_1.19.14.bb   |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch b/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch
new file mode 100644
index 0000000000..dda21a32d8
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch
@@ -0,0 +1,33 @@
+From 76b8a389268275cc13f3b4e61394d40b24ec56f1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Jan 2020 20:21:58 -0800
+Subject: [PATCH] example-clients: Use c++ compiler for jack_simdtests
+
+It uses c++ sources and runtime therefore its best to use c++ compiler
+to build it so it can find the correct runtime, cross compiling with
+clang fails
+
+x86_64-yoe-linux-ld: example-clients/simdtests.cpp.28.o: undefined reference to symbol '__cxa_call_unexpected@@CXXABI_1.3'
+
+Upstream-Status: Submitted [https://github.com/jackaudio/jack2/pull/536]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ example-clients/wscript | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/example-clients/wscript b/example-clients/wscript
+index a8857aa7..df9435aa 100644
+--- a/example-clients/wscript
++++ b/example-clients/wscript
+@@ -69,6 +69,8 @@ def build(bld):
+ 
+         if bld.env['IS_MACOSX']:
+             prog = bld(features='c cprogram', framework = ['Foundation'])
++        elif example_program == 'jack_simdtests':
++            prog = bld(features='cxx cxxprogram')
+         else:
+             prog = bld(features='c cprogram')
+         prog.includes = os_incdir + ['../common/jack', '../common']
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
index cebc952661..e954341ffe 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git"
+SRC_URI = "git://github.com/jackaudio/jack2.git \
+           file://0001-example-clients-Use-c-compiler-for-jack_simdtests.patch \
+          "
 SRCREV = "b54a09bf7ef760d81fdb8544ad10e45575394624"
 
 S = "${WORKDIR}/git"
-- 
2.25.0


