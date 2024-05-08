Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F20CC10F1A
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 03:04:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.3560.1715137479751685327
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 May 2024 20:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fOPZnqm0;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ed012c1afbso3231655ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 20:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715137479; x=1715742279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BRBMw7dPeqi7zCwshLM1TIntz7xOgrIGYGcMvL4T5E=;
        b=fOPZnqm0FiErS3n5hF5vhZkV2mzjhwRxszXjh5DFmvr9D4+7bRy+zyOL9MdOktk+G5
         t9iwNcXQWMfbJqhQFUSf58zw/htH31f8IOjTpfJexo+78Tq5dk9fcBrrA9oYfdc7PshL
         x31rh1uzSBrYWNYZtv3/0tY1d3tmiAQfQBBkxsHLAt6bY/f4+RYjJ3QmFegfkOLhmJBb
         uDPr4I1COjNI426wxyojoUFRwigJ2dPnkG/JyVowc0hWfhwbmLd0BbjfwMbynU85vxCy
         KO5kv78Yw/ftlrKPhJR+11ENu+ue5solUSLZwJJXMFXTVNC24C9+wPJjV8oUOfqX6j7b
         i3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715137479; x=1715742279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BRBMw7dPeqi7zCwshLM1TIntz7xOgrIGYGcMvL4T5E=;
        b=rg4wYXCN3JfMrJOVmEp7Sa3/SQ1nrvV0QpltlRaSqswhl+zAz2wYibzuNHGUMF4v4E
         cbO+fJYj/vw3F2wbW8++yoRpkx2FxIWC+wBWE+cXbb+UGzsMpG4C42iSajxAxay0C5Yx
         Ut2UouwDf4CDpnepHQKstP/7oMANQJNyS9sJdgxg7Gn5Y91ly8UBEd6Y3CnbBVjIqTK7
         hZhpUDgNfeQehzugp7+/SNWXZBEbZUdNiRJKvLWXzwkPZCIAxD4AtEAqW7THnjJIdr7j
         8tBsFAQhaIkYh7jkSZxINybKEqcW0N4s5ELBmyChuApH8+n1qATZvWE/LVwfn1hLmpRV
         Jhiw==
X-Gm-Message-State: AOJu0YxGP/TxiKVy3Tt4Cda2WyI2fED3GB96BiQewh1eY0Y8D+Ci1j+o
	4sFiRLMdzgBpw5Yu69GckPerV7F9k2fJc40AwDiJ7vb5t/gZc5WjZ0T1E6/q
X-Google-Smtp-Source: AGHT+IE1loIghFA1vPBJZXo6s0d/LBz2fDXE3a9sCyQfXL/PJ/srQkqhyu1jnKdmK4/K7XcKXLB46Q==
X-Received: by 2002:a17:902:ce86:b0:1e0:9964:76f4 with SMTP id d9443c01a7336-1eeab8ac0f7mr21179635ad.14.1715137478774;
        Tue, 07 May 2024 20:04:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id ld14-20020a170902face00b001e0c568ae8fsm10745635plb.192.2024.05.07.20.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 20:04:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] oprofile: Fix file_manip_tests ptest
Date: Tue,  7 May 2024 20:04:36 -0700
Message-ID: <20240508030436.2270650-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 03:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110272

Remove assumptions around absolute paths which used __FILE__ macro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-replace-__FILE__-with-__FILE_NAME__.patch | 47 +++++++++++++++++++
 .../recipes-kernel/oprofile/oprofile_1.4.0.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0011-replace-__FILE__-with-__FILE_NAME__.patch

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0011-replace-__FILE__-with-__FILE_NAME__.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0011-replace-__FILE__-with-__FILE_NAME__.patch
new file mode 100644
index 0000000000..902032969e
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0011-replace-__FILE__-with-__FILE_NAME__.patch
@@ -0,0 +1,47 @@
+From 640b116618b89eeddd61a91b793bb3c879adfe57 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 7 May 2024 19:56:59 -0700
+Subject: [PATCH] replace __FILE__ with __FILE_NAME__
+
+This helps build paths not beeing assumed during runtime
+since in cross-builds its possible that absolute paths during
+build will not match runtime paths
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libutil++/tests/file_manip_tests.cpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libutil++/tests/file_manip_tests.cpp b/libutil++/tests/file_manip_tests.cpp
+index dfe161b..3d960bc 100644
+--- a/libutil++/tests/file_manip_tests.cpp
++++ b/libutil++/tests/file_manip_tests.cpp
+@@ -138,9 +138,9 @@ static void is_directory_tests()
+ static input_output<pair<string, string>, bool>
+ expect_is_files_identical[] = {
+ #define MAKE_PAIR(a, b) make_pair(string(a), string(b))
+-	{ MAKE_PAIR(__FILE__, __FILE__), true },
+-	{ MAKE_PAIR(__FILE__, "not_existing"), false },
+-	{ MAKE_PAIR("not_exisiting", __FILE__), false },
++	{ MAKE_PAIR(__FILE_NAME__, __FILE_NAME__), true },
++	{ MAKE_PAIR(__FILE_NAME__, "not_existing"), false },
++	{ MAKE_PAIR("not_exisiting", __FILE_NAME__), false },
+ 	{ MAKE_PAIR("not_exisiting", "not_existing"), false },
+ 	{ MAKE_PAIR("", ""), false }
+ #undef MAKE_PAIR
+@@ -163,8 +163,8 @@ void is_files_identical_tests(char const * prog_name)
+ 
+ static input_output<char const *, bool> expect_op_file_readable[] =
+ {
+-	{ __FILE__, true },
+-	{ "./" __FILE__, true },
++	{ __FILE_NAME__, true },
++	{ "./" __FILE_NAME__, true },
+ 	{ ".", false },
+ 	{ "/.", false },
+ 	{ "./", false },
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index 092d22746a..c4c89e5750 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0008-include-linux-limits.h-for-MAX_INPUT.patch \
            file://0009-Prevent-running-check-tests-on-host-if-cross-compili.patch \
            file://0010-oprofile-Determine-the-root-home-directory-dynamical.patch \
+           file://0011-replace-__FILE__-with-__FILE_NAME__.patch \
            file://0001-configure-Include-unistd.h-for-getpid-API.patch \
            file://0001-Replace-std-bind2nd-with-generic-lambda.patch \
 "
-- 
2.45.0


