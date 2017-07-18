Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 246FB77FEC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 09:51:01 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id z78so1225574lff.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 02:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TDGYUxjiCf1Pr4TCAfEi4qzNnRBo1ER9dg/WC82tKC4=;
	b=uUroP+8HfeGuA4g8Za5CN255f18cfVUjNi0lwkv8qQ8K9RRcy+924DY13wMHTmuX22
	rQ/0XDOk516VC7luLwF5jWiiwKH9AjiqyqR53ASCeMjpwGkst45dEEEH2kxxwRAZ/n1u
	OEwHRW5Ecq2emm9fb0xfQy2Nz+o6icjLF+2gtiAdnvOLPxnmZhxqLrqEuffn7ZAb/Wm9
	uJQYhPRPC2jazeM3Wq972MjYbJ3GO1PY34pVMFzwnbEOOAL/GrQ+XCJE9NVfRSnXCdeP
	+B8B88AMIH2IbiQKrszQKYtL6reEOhIx+GqQ4ju54LPEPODXO5SIarKpP21HjioXwY7F
	Tc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TDGYUxjiCf1Pr4TCAfEi4qzNnRBo1ER9dg/WC82tKC4=;
	b=mnt4orJIcrASAQvBMh4PLkEzJl9ORvmN/jznEyDcpSutKcCXyU+T6iNFHPlg4u4DIo
	/7d56xGIpWzELcDt4BwrgzvipdK2MdWdaP8tzp3H6omC7tKybtiopgrbrNqFBEJmqpLL
	wN5MTLK+j8m0nCttl4V/z7s2RepHyWZYgsKpXBIKzc31Fq0P9ph8vdcdok+HDrnhCbFY
	lK9MkpPoDw73blqbzVUtJpJkvgetHNNmR1QZKjh0qawhpAoIbMUy+V2QdQMQ5mEKRm8v
	m5I6CTWRU+ycSeDEbYRJhChYzWPGiVaQEF27KVPHo24DOejAfsegAIodqJbiGs1LdRNY
	aPgQ==
X-Gm-Message-State: AIVw110RiADCLx11p6CjRrnlBxXwV1bWsQfbn0ZOshDCAjMtpYfSkHsv
	SvzCTiREb/579Q4VIWY=
X-Received: by 10.46.21.1 with SMTP id s1mr384440ljd.2.1500371462473;
	Tue, 18 Jul 2017 02:51:02 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x62sm441459lfa.13.2017.07.18.02.51.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 02:51:01 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 11:50:54 +0200
Message-Id: <20170718095055.32249-3-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718095055.32249-1-ricardo.ribalda@gmail.com>
References: <20170718095055.32249-1-ricardo.ribalda@gmail.com>
Subject: [PATCH] lld_git: Only apply -stdlib flag to clang toolchain
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
X-List-Received-Date: Tue, 18 Jul 2017 09:51:02 -0000

GCC does not understand the stdlib flag. Resulting in this error during
configuration:

|   x86_64-poky-linux-g++: error: unrecognized command line option
|   '-stdlib=libc++'

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-devtools/clang/lld_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/clang/lld_git.bb b/recipes-devtools/clang/lld_git.bb
index 5b31ff5fdbc8..31af909d25ad 100644
--- a/recipes-devtools/clang/lld_git.bb
+++ b/recipes-devtools/clang/lld_git.bb
@@ -34,7 +34,7 @@ OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 EXTRA_OECMAKE = "\
     -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
 "
-CXXFLAGS += "-stdlib=libc++"
+CXXFLAGS_toolchain-clang += "-stdlib=libc++"
 
 do_compile() {
 	cd ${B}/tools/lld
-- 
2.13.2


