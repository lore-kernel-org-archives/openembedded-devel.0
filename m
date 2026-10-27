Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22222.1793115906734251572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 08:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eLDPcSOP;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso44462265e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793115905; x=1793720705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLfovxCkgOhMLDjHtyldThpkwP1AsSgGWWe/TO6HuLA=;
        b=eLDPcSOPQXZR/Ezb0TGMMpCxPKdzMDCXq5qrejiPLKmHpmkslgeBLPbc9N6fYwad+E
         xJ1HlaqHs9ENRGUFB6EyiQ8MjkooMxFQotmC3zrmzCXuTyUfz+n+lp7FNK2lOOCRJwKI
         En7SkR+6jQ92sbcrIokDeycnTBj7P7mG9NJRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115905; x=1793720705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLfovxCkgOhMLDjHtyldThpkwP1AsSgGWWe/TO6HuLA=;
        b=loo4DiGalRGQjaxCLZhv6UZCH/xAV798A7/nbTxOQKQ96ZXb1C8FHb4crpMMmtjgWP
         QlvPNRa9K33mNkZ9eTuWeqQVN5B1NV4zhjLOMgUDBzt44yIXTzPaOnbAgG8zwCdSTahB
         bfrqD4CWzl7TeZR8ZSz3U/SVhK7d2kSL2sUTXy/5l60WHtr3qe9k7W6PLpIo3fZeEUcg
         Ce+8siYGJCtd3cg3mH4ZuwIAtHapJrQsH4qJ1sq2Up7c6+aAtJRo6qLyOXzs8ZK/xTKV
         aB4575iP++v/rAOwAeJviXEQnWFKKONmpkDXmbd6N99aujXZrUZ8bOmgZTSQPY6BT70V
         QdzQ==
X-Gm-Message-State: AFq9FYLSxvUpihTt3BaGr7DlGguAfYKVgLWZ3PKADc/D70vWNJVqQYXv
	lFg8oDfTIdjCCZic/nQjCHadxfzEFc3CYV0/KAHKykooVlLAB5GgB8dGz074hdYWn51SrygOQQS
	ZzK4o
X-Gm-Gg: AYBFou2T64jLYlsV8vZhMY5Bn3z5JgnkiZYfqumv8aZM782kZbQyyMVRHmaATCU1bIi
	ka7cjeFZUClDeLy84fnb9RSS4SwuPmPSqM3I3wYVGLpFIg+oRnKsMoQIbZwniPT5JKEvbEk/wRx
	dmbbeU+9QvyYQyjGZZtL+OyZrpD9eqIrlTfLOVQQf8KKzX0OA1KuQsHgX8CE98GehbtDdqJeMfj
	SBQuiCtd6ho2eLPSLyNPXaqliyMdRq2LSdYJGqDCswtvmbr4XiS/KWUqM87/X5yhhzENDX2bJr/
	xfF9aKqYWOqmPR3cY9bvIuJm9s5xvzu1q3cAv7Lrgoqm1S1FPoCFKOSG7mOMZDq3VQPpzgG2LfA
	YT5wjJjSbljH9HXm7fRaHr0XN0DaCPMQqyyAw0pF6usXNDoofax/B6AgiNdd7WimtXsdVUMOT1i
	KJNfSdY1v0Gvb3KWQmQfh8H4+Z+QZzE5he1c48NyS4evBtlO9RvBto/6O4Z7gjemM0oUkBUOKlB
	8R3QWn23hUlhMg/nyQxSr9e4aKFGiUObxhBkfWIKEkxkX7egIgihOjOpazUDZLDvhBJg0Tee9K8
	JSaGH3AOx37yi3wEChxcKnbkpKMqnImOJy4Pf9djYCAi9Uvxe82kMqC5ho+oWquFpRqeulp41Ht
	ne9Oq
X-Received: by 2002:a05:600c:840e:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a35acafc84mr196878055e9.10.1793115904703;
        Tue, 27 Oct 2026 08:45:04 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm266099575e9.12.2026.10.27.08.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:45:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/2] zlog: Upgrade 1.2.19 -> 1.2.20
Date: Tue, 27 Oct 2026 17:45:00 +0200
Message-ID: <20261027154501.1209697-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 15:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131538
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.20:

- Added zlog_fsync(), to flush the logs to disk on demand.
- Added zlog_is_init(), so a library can tell whether the program
  around it has already set zlog up.
- Added zlog_category_has_rules(), so a caller can tell a
  category the configuration covers from one it has never heard of.
- Added zlog_fini_try(), which gives up instead of waiting for
  the configuration lock. zlog_fini() from a signal handler that
  interrupted a thread inside zlog waits forever.
- A rotating rule keeps its file open between messages: two
  syscalls a line instead of four, and about 1.8x faster.
- An oversized message is formatted once instead of twice:
  "%.200m" of a 4MB message is about twice as fast, for identical
  output.
- A message longer than buffer max is truncated instead of being
  dropped.
- Every %E(NAME) in a format or a file path is replaced, not just
  the first one. Two of them used to fail zlog_init().
- The rotate lock file falls back to /tmp/zlog.lock when the
  configuration file is not writable, instead of failing every
  rotation silently. It is created 0644 rather than 0777, and a
  symbolic link in its place is refused.
- The pthread return values in the writer thread are checked in
  release builds too, not only where asserts are compiled in.
- hzlog prints the buffer length in front of the dump.
- Include guards no longer use identifiers reserved to the
  implementation; the public one is ZLOG_ZLOG_H.
- __DATE__ and __TIME__ are gone, so the build is reproducible.
- Fixed the install and test targets in the top level Makefile.
- zlog.spec is gone: CPack generates its own, and the
  distributions that package zlog use their own.
- Dead code removed from conf.c, level_list.c and thread.c, and
  the debug messages removed from CMakeLists.txt.
- The release procedure is written down in doc/developer.md and
  no longer names a version, the rotate lock file section of the
  users guide says what the code does, and CLAUDE.md is corrected
  and translated to English.
- Typos fixed throughout the tree.
- Tests added for zlog_init(NULL), the rotation lock file, buffer
  max truncation, %E() replacement, and the return values
  test_press_write2 used to ignore

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-extended/zlog/{zlog_1.2.19.bb => zlog_1.2.20.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/zlog/{zlog_1.2.19.bb => zlog_1.2.20.bb} (85%)

diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.19.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.20.bb
similarity index 85%
rename from meta-oe/recipes-extended/zlog/zlog_1.2.19.bb
rename to meta-oe/recipes-extended/zlog/zlog_1.2.20.bb
index e3355bb2db..8be5db16c4 100644
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.19.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.20.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https;tag=${PV}"
-SRCREV = "728602097c5f07f860f7ca32baecb229d89a2637"
+SRCREV = "92b4ad0f60856ae92198d080327bd2c4ed10cd7d"
 
 inherit cmake
 
-- 
2.47.3

