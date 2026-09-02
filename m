Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD071C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 17:46:57 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.283.1788367875351406355
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 09:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FlhMTzrM;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: joel.winarske@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso1155782a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367875; x=1788972675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gAOCukuh26QXqEp3ucfZN0Uk8IIL/CXPZGh3BvkUSZg=;
        b=FlhMTzrM1pNLRuaRS89C1bCwfp1jcyb7En+JpsOSxO0G/YtnoYmH0dgqsCVIS2kRdY
         twOwUDvCj8x6y6cWQ6QRJqsHmWrq00ajr7Y3JHanhJCgDicYzj6DTaF6xgVmUCJqozrh
         IGZBzpLGD+MqaYBnNgx3jLXGh0aKAxhvJXDLTScIWcD2diWOSlmsKTwyE+dgWMRBOzY9
         0qzdIWB1k0pFIJKcWi84rXpkzBeINki4F88zBSrUSX2B4Ch4O18oJCVBpDorMOXJ15Yn
         WIR9CJPYTTROokTgZh8ajFT+bVWiP9pmPgVOcC0H+Y7lXb2wTg8Kg9Dk0uICx02BrxmT
         NN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367875; x=1788972675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAOCukuh26QXqEp3ucfZN0Uk8IIL/CXPZGh3BvkUSZg=;
        b=VPSahgG/sjkq9Zz/Qpx04WBHt6ONoPbERah7zbJkLHD5Xpe4bbQjiDBEW7jRfa069H
         pKcIOmoRCJLGVnNM6jJ2LL+ISiRwTgiF58VWpAL48VP0XzPBr5Ygf4xEGmIgSCjixsLw
         QH2aDBtMjnZp2tB1ODbUxa4O2TVYuHU97QT+bDumS9ncB/aCYcowb8F7zVFVKKekyT4t
         ZlLfFPeuMjTQBDAWBMsx4QluTHz5TV0G5UkfQkiLWQPOof+RNw8lbQaxf7BlKcQqw1eT
         szGkZGBVebIX8sccHjBsY3YJ1oaG7ZhcSV5P0GU6440SKbYlhObey30hW9j9ZF6wwGio
         KMlA==
X-Gm-Message-State: AFuF++n3XcHfezn3lzDeQ7YPptOfvJCUHwF0zZeGbNUw94VhI69gFhI8
	e7BDXHBhKDEuYCPIvM3H9YAhduBEzWmKmrR+P0o3GOrVf1yE0azyFoTPqDnueQ==
X-Gm-Gg: AYBFou3MS6tA+jgp77e9WAU1wdAdpWbQHhntTFyI0UN50NLf4JE0shyQ6Gq3dj8fQqp
	njYfCutAsmDnIS8mRiASZmAvAyFLdcBsg4B6THkjdlZ+4ObjFwAL8Tkc5NyUSJav5giU22NI7mZ
	slgRHjmhX6SPf5OLSGwlxS3B4EQC8J/63C99/gfkpaBwWFuvqX6DKuh/l2nANaE/kJoiVsi0Fjq
	hJzS7cOf9HAycddtGXN9rlmsPg+0RB8MlIFYp2qOnH6M1ToWbmr8svAESKSsGy7zc9fp2K7R4wx
	A9Oj7y0KdWXF3oLvACQPgwRPnx2174wczm3IKFLJH2yUy9hpzWXf4wOEDmqLdiOmAGHIUEC9OSd
	g2+r4DyVGxztR9wjVo7MErYV5ed13ijugIA5AkuEWl5iaEJHNUEy+YgUMrdFLc2RppEu4d4C/ox
	d2mzb3PE0mRBbdxblLDMaYhbFtxeReQ11tfkCHPd8v1p9PpZZTytFMVsrrq74H2mwgCUzx6myAi
	zhaR2kKIwDngK0Y+wVUqVVNh0QL0v53/n3Np3X6+Pzugg==
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr8733997a91.12.1788367874534;
        Wed, 02 Sep 2026 09:51:14 -0700 (PDT)
Received: from air.lan ([2601:602:57f:c7b0:d6fc:cce0:dbc5:cca6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08624f11sm270775a91.11.2026.09.02.09.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:51:14 -0700 (PDT)
From: "Joel Winarske" <joel.winarske@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joel Winarske <joel.winarske@gmail.com>
Subject: [meta-oe][PATCH] capnproto: build position independent code
Date: Wed,  2 Sep 2026 09:51:08 -0700
Message-ID: <20260902165108.1200976-1-joel.winarske@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 17:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129698

The recipe produces static archives only, and does not compile them PIC, so
linking capnp or kj into a shared library fails:

  libkj.a(exception.c++.o): relocation R_X86_64_TPOFF32 against
  `kj::(anonymous namespace)::threadLocalCallback' can not be used when making
  a shared object; local-exec is incompatible with -shared

kj/exception.c++ has a file-scope thread_local, which non-PIC code compiles to
the local-exec TLS model. A shared object cannot use that model, so the link
fails on any consumer that puts capnp inside a .so. Debian and Fedora do not
hit this because they ship shared libcapnp.

Set CMAKE_POSITION_INDEPENDENT_CODE. Packaging is unchanged: still static,
still no .so, no new packages and no ABI surface, only the code model differs.

Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
index b867c72e36..9909afb0e9 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
@@ -19,8 +19,17 @@ CXXFLAGS:append:mips = " -latomic"
 CXXFLAGS:append:powerpc = " -latomic"
 CXXFLAGS:append:riscv32 = " -latomic"
 
+# The build produces static archives only. Compile them position independent so
+# they can be linked into shared libraries; without this any consumer that does
+# so fails on the thread-local in kj/exception.c++, which non-PIC code compiles
+# to the local-exec TLS model:
+#
+#   libkj.a(exception.c++.o): relocation R_X86_64_TPOFF32 against
+#   `kj::(anonymous namespace)::threadLocalCallback' can not be used when making
+#   a shared object; local-exec is incompatible with -shared
 EXTRA_OECMAKE += "\
     -DBUILD_TESTING=OFF \
+    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 "
 
 FILES:${PN}-compiler = "${bindir}"
-- 
2.55.0


