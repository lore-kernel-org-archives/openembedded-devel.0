Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2440DC369DF
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 11:56:51 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.7493.1745668607106365760
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 04:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gtrTV44Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso6002280a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745668605; x=1746273405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zCawoPCPwxQqXBWFRmE/p1+ah21kkXEYtGqERV77II=;
        b=gtrTV44Qogzl7KQUsMO5QwGi3mKaZE4IgVPXOJvlVwXdsNVfmVqVGYJ7StTBzT8gpj
         b1kWaNC21XT9GCbw6C3vAYjJD9GwkvSBE+tEeQO9h5R7fHddqM+jgsNUZ2qLRr3BHZy9
         t35VvY3adQDqi3rlBTyYYxH0HqbF0jKLOetxE1DC8TwMTPArsuj9aDtXihaxCr632KbB
         9bVF4sfvynd2dNJSg/sQxQHv/9AOmscYkcKEwYbYNPfU2prAD+pNDnyZfqODtIzjgb46
         Ojpo3JA9mjCHa7LtE/mTjUva0RJ0ZoB9o0nPMuPI3cwyArZDrSQkUXAXSJWBAFAIK5Co
         G1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745668605; x=1746273405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zCawoPCPwxQqXBWFRmE/p1+ah21kkXEYtGqERV77II=;
        b=cf0K9hCd9PMYWOIfJIdH9NP3uPNYpRaLDvzFoRT6ZXtJ6vWvqk82Z9LoERLA2MHrjy
         YCQsTZ7KVduklrrsxQo3p85Y6gqEk8Mrgw5uwc7cMRu4gRKOyeB7oxPG9/FvMV2PSwUP
         NUQsjRUtkRhtdT0bEhbyAJNY1thFb8ghXLG2ZGxO/TZcGRcVSyEU7PW9jBb4GnPgsvHM
         1dReeMsoD5hQL3vEqwr5SOy2s64ud3/UGeBdpzipPMl7Uyj96EHQPGEaGwx+r+yKr6Kw
         P7M2KJaW5osJKxJNI15SIt8JM8hFK3wZlSacsQwaNXkIO0v2fzZxb3g6uIYP5P0Jolux
         OLew==
X-Gm-Message-State: AOJu0YyPOS2j4FODbGU7TVoxdtds4b0XriW9YU6+x9Ollu8M8UI2OoS8
	/S9ghQYs9xy1E5VY0bRLuuNF8m4KC/UoA+CDZXo7QM6s9qniWP2fUpGwfBqM
X-Gm-Gg: ASbGnctbl1Y1S/CDyVNjMbAtOrBn6if+FHryfKPpbgnKGKRVc3VmXf8CjFz9hiMziyf
	nHACiBKnOc4fQOpvjpT5ojLEDWBLU1csREiauCAvarGOA4NyAkYAxdq2SFqGzgPrOwIngoNIfB3
	EGjOZrWsYfKv7eXff4QVVVvYOR6UkX6z6SmspwZGhRUUO+lH/DPuhSctnqUV8psz73afncYpkIR
	vY5DZ8i47SDo8M01VcO8pX9P4kyqS3i1zu98DyYTOkmUgz3MaTu3C0o5YrVzqLJ88Q5cnh2D5pd
	8oSVNaNlN1wbQxJspcIttfC20+KqgUZwNi7biFe5wd7L8esR6tlXOZeqKMvUojO5r09khYw3HZ8
	sCoy7B+Ql
X-Google-Smtp-Source: AGHT+IEQiQw86SRSV8PTv0WAiwFjLNZatsCW29T6xiCZ20M2NW48KSiB+Sx1S8Rb8+B/PqdkFI3pXg==
X-Received: by 2002:a17:907:3e05:b0:aca:d66d:cd0d with SMTP id a640c23a62f3a-ace8493e8afmr218165966b.30.1745668605166;
        Sat, 26 Apr 2025 04:56:45 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6edb15a7sm283675066b.178.2025.04.26.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:56:44 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 7/8] open-vm-tools: fix build with gcc-15
Date: Sat, 26 Apr 2025 13:56:22 +0200
Message-ID: <20250426115623.2732743-7-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426115623.2732743-1-martin.jansa@gmail.com>
References: <20250426115623.2732743-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117148

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...ix-build-when-compiling-with-std-c23.patch | 26 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_12.5.0.bb     |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-build-when-compiling-with-std-c23.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-build-when-compiling-with-std-c23.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-build-when-compiling-with-std-c23.patch
new file mode 100644
index 0000000000..aad1b10b52
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-build-when-compiling-with-std-c23.patch
@@ -0,0 +1,26 @@
+From 2a79621f58bf1c4bc0166ccc044fcf343fb66b44 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 10:40:03 +1100
+Subject: [PATCH] Fix build when compiling with -std=c23
+
+Fixes the build when using gcc 15
+
+Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/751]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ open-vm-tools/lib/lock/ul.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/lib/lock/ul.c b/open-vm-tools/lib/lock/ul.c
+index d376a98af..fc9fdb714 100644
+--- a/open-vm-tools/lib/lock/ul.c
++++ b/open-vm-tools/lib/lock/ul.c
+@@ -29,7 +29,7 @@
+ static Bool mxInPanic = FALSE;  // track when involved in a panic
+ static Bool mxUserCollectLockingTree = FALSE;
+ 
+-Bool (*MXUserTryAcquireForceFail)() = NULL;
++Bool (*MXUserTryAcquireForceFail)(const char *) = NULL;
+ 
+ static MX_Rank (*MXUserMxCheckRank)(void) = NULL;
+ static void (*MXUserMxLockLister)(void) = NULL;
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
index d44709a64d..0288a59458 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stabl
            file://0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0014-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
+           file://0001-Fix-build-when-compiling-with-std-c23.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"

