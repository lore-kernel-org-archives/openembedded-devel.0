Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3C6C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:54 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14717.1782634304987233942
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J8LqYo1J;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30ec1ddd510so322389eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634304; x=1783239104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDMYRypvL/m5M7HXh0GtPd5kuzE4YBYDhmzx8uvPUVU=;
        b=J8LqYo1JsgZEqh7oTWCD1DxujXYM5mMZr4wcDsfb+LX42H3+C0bWUwZd6+V1vhAyEF
         OV5TYqFo3vkB6r99BDH+y1u6tQefqw2rQykVmpGn0DJy9Ztjy586m8+ddIPETeLWdFtM
         Mz+TgnO/A2XL7AF+OIjDnhXFK8/CMxmRfFtSztmEulIDSw5bXroEDnt2xaX/Jna34D3P
         AAoxhUftTRPHGTx0PrqXB7r/F9Q4PdOfCxsvH1ln2VXgKKQcoFCWjZRp1cab+YW+lwhC
         q0usvmN5doJhSxBdY/MPkGzxoGTtS9qY3JgyIvw5jkZ8SaxwUMmD6HzL2ylbdXkPgSjA
         1h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634304; x=1783239104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDMYRypvL/m5M7HXh0GtPd5kuzE4YBYDhmzx8uvPUVU=;
        b=D/+vSDSKlfEd8B9AYNKQ3eml9DMTYsE58ceLbtjBUUCf/7cKfqFTCpaCiSK1vz50Mt
         t4RWlTarLvlSKa+NRQ8xbnQHnSXsvYosFVUIu/x/yC8G/11ZaRZCqc8+mWchDx/ObITs
         cdK5WGCBw510GoGGTAoTXSIEwn4nMnUKOKLVjZkH3jykMnzisKQvW10wmLaOA7VhZX7f
         WMvHdAbWcAHiAq9AZBYpXm373Qzv6tyU8m328rxHzSwCySC1o7rhc3ui7hImh8RcJf/t
         xXT+ycC1OLSA8nX18DQ+QTwTUoKYRcToQjXVVVp6MibWvGCPqBwctg55xtWUH3hlBhJB
         attw==
X-Gm-Message-State: AOJu0YzfALAGKeBTAh1Y/S+nyDVPNOWUIW7DIrdANL5+x3xJeDbmBjMl
	gmO/1/ta1SOIluNtSj9IGo2w0WR/8XP83Ga+1kDKrcUqjuAcyok68xXDr7A/3iNrGjMAcg==
X-Gm-Gg: AfdE7cnYJWLgK45Vj6xhZid2RVjP2l8O16eaKVxKqQrEa55ItnloZKKcrwFRsZhRyXG
	hwM/QjRePChdlYcfo/40EHhLYKJ4zf3wqlH8riKGF/VdaLljJMDx9E9U0TUWseRVXQVrOr+3Myu
	nEE8C3jdQtod+T5OvZvOL+L3M4qPsn3MFi5c/uTuzxISt5UX+vdqtZ7t8g0HivOnojWdwbnFx+Z
	lJ5vvHdFaMc2HFD9J6qo6jxBUFjnVsrvE73j1uAudRzAUZ1NJiT0OP9ZoUtpGkG9fpWZouXV0hG
	Fbu4m5h56H+FY34t9wjJi6MKcyUAWkytJAKM/eNk+y/F6vtUGes28gVkfORzyt/WPqnUJRiwlxi
	X1W7N+IiuhJmmwqa9t+oHyFJCLmd2DqErxh0MV2mZce1ixz1CI5CulX2Ttkv8KpCQjnSbP9HKNJ
	nRfMq8iFYld0nPOuIO0eRMtuR/5u5nCqGDUfNfLZqhyhhTGvcEWRKTmHXGxouskzXSMZoQCLz+E
	+h/NaYzQJ5YvGPS2VBbbJrl+bP3TMM1NbQfLWxa8wx9Jr6KqgUaiv/IM2ZU+qW0duKZLWWsIt8A
	4yB3ppXefi6eYzHpjyiwJgKEvifbHw==
X-Received: by 2002:a05:7300:220b:b0:307:34f9:cc9 with SMTP id 5a478bee46e88-30c84b71144mr13264197eec.2.1782634303979;
        Sun, 28 Jun 2026 01:11:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 020/128] libowfat: upgrade 0.32 -> 0.34
Date: Sun, 28 Jun 2026 01:09:31 -0700
Message-ID: <20260628081122.178348-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127830

Drop 0001-replace-__pure__-with-compiler-attribute-pure, which is obsolete
in 0.34, and refresh 0001-fix-incompatible-type-error-with-gcc-15 to the
hunks still needed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...epend-on-haveuint128.h-for-umult64.c.patch |  36 +-
 ...build-json-helper-for-the-build-host.patch |  45 ++
 ...-incompatible-type-error-with-gcc-15.patch |  56 +-
 ..._pure__-with-compiler-attribute-pure.patch | 562 ------------------
 .../{libowfat_0.32.bb => libowfat_0.34.bb}    |   5 +-
 5 files changed, 71 insertions(+), 633 deletions(-)
 create mode 100644 meta-networking/recipes-support/ncp/libowfat/0001-GNUmakefile-build-json-helper-for-the-build-host.patch
 delete mode 100644 meta-networking/recipes-support/ncp/libowfat/0001-replace-__pure__-with-compiler-attribute-pure.patch
 rename meta-networking/recipes-support/ncp/{libowfat_0.32.bb => libowfat_0.34.bb} (81%)

diff --git a/meta-networking/recipes-support/ncp/libowfat/0001-Depend-on-haveuint128.h-for-umult64.c.patch b/meta-networking/recipes-support/ncp/libowfat/0001-Depend-on-haveuint128.h-for-umult64.c.patch
index 6226e2c038..d4e609d8b7 100644
--- a/meta-networking/recipes-support/ncp/libowfat/0001-Depend-on-haveuint128.h-for-umult64.c.patch
+++ b/meta-networking/recipes-support/ncp/libowfat/0001-Depend-on-haveuint128.h-for-umult64.c.patch
@@ -10,35 +10,31 @@ mult/umult64.c:9:10: fatal error: 'haveuint128.h' file not found
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- GNUmakefile | 1 +
+ GNUmakefile | 2 +-
  Makefile    | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/GNUmakefile b/GNUmakefile
-index 3f3193d..751ca60 100644
 --- a/GNUmakefile
 +++ b/GNUmakefile
-@@ -126,6 +126,7 @@ $(CDB_OBJS): cdb.h uint32.h
- $(CRITBIT_OBJS): critbit.h
- 
- mult64.o: haveuint128.h
-+umult64.o: haveuint128.h
- 
- 
- iob_addbuf.o iob_addfile.o iob_new.o iob_reset.o iob_send.o: iob_internal.h iob.h
+@@ -753,7 +753,7 @@
+ range_strinbuf.o: mult/range_strinbuf.c rangecheck.h libowfat/compiler.h
+ umult16.o: mult/umult16.c uint16.h
+ umult32.o: mult/umult32.c uint32.h
+-umult64.o: mult/umult64.c uint64.h
++umult64.o: mult/umult64.c uint64.h haveuint128.h
+ open_append.o: open/open_append.c open.h libowfat/compiler.h
+ open_excl.o: open/open_excl.c open.h libowfat/compiler.h
+ open_read.o: open/open_read.c open.h libowfat/compiler.h
 diff --git a/Makefile b/Makefile
-index 0d08da4..02df6c6 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -430,7 +430,7 @@ range_str4inbuf.o: mult/range_str4inbuf.c rangecheck.h
- range_strinbuf.o: mult/range_strinbuf.c rangecheck.h
+@@ -690,7 +690,7 @@
+ range_strinbuf.o: mult/range_strinbuf.c rangecheck.h libowfat/compiler.h
  umult16.o: mult/umult16.c uint16.h
  umult32.o: mult/umult32.c uint32.h
 -umult64.o: mult/umult64.c uint64.h
 +umult64.o: mult/umult64.c uint64.h haveuint128.h
- open_append.o: open/open_append.c open.h
- open_excl.o: open/open_excl.c open.h
- open_read.o: open/open_read.c open.h
--- 
-2.24.0
-
+ open_append.o: open/open_append.c open.h libowfat/compiler.h
+ open_excl.o: open/open_excl.c open.h libowfat/compiler.h
+ open_read.o: open/open_read.c open.h libowfat/compiler.h
diff --git a/meta-networking/recipes-support/ncp/libowfat/0001-GNUmakefile-build-json-helper-for-the-build-host.patch b/meta-networking/recipes-support/ncp/libowfat/0001-GNUmakefile-build-json-helper-for-the-build-host.patch
new file mode 100644
index 0000000000..343e91db8a
--- /dev/null
+++ b/meta-networking/recipes-support/ncp/libowfat/0001-GNUmakefile-build-json-helper-for-the-build-host.patch
@@ -0,0 +1,45 @@
+From 2b6e64879883eec435318eb2dd9165904c2db764 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jun 2026 21:48:13 -0700
+Subject: [PATCH] GNUmakefile: build the json helper with the build-host
+ compiler
+
+json is a build-time helper: it runs on the build host during the build to
+emit compile_commands.json. It has no explicit rule, so GNU make builds it
+with the builtin rule "$(CC) $(CFLAGS) json.c -o json". When cross
+compiling, $(CC) is the build-host compiler but $(CFLAGS) carries the
+target flags, so the host compiler is handed target-only options such as
+-fcanon-prefix-map and fails on older host toolchains (e.g. gcc 12 on
+Debian 12):
+
+  gcc: error: unrecognized command-line option '-fcanon-prefix-map';
+  did you mean '-fmacro-prefix-map='?
+  make: *** [<builtin>: json] Error 1
+
+Add an explicit rule that builds json with $(CC) only, exactly like the
+sibling host helper "ent", so the cross/target $(CFLAGS) are never applied
+to a piece that must be compiled for the build host.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ GNUmakefile | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index c883337..08b9718 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -1390,6 +1390,12 @@ Makefile: GNUmakefile dep libdep
+ srcdirs=$(subst :, ,$(VPATH))
+ srcfiles=$(foreach dir,$(srcdirs),$(wildcard $(dir)/*.c))
+ 
++# json is a build-host helper (it runs during the build to emit
++# compile_commands.json). Build it with $(CC) like ent, so the cross
++# target $(CFLAGS) are not applied to a build-host compile.
++json: json.c
++	$(CC) -g -o $@ json.c -I.
++
+ compile_commands.json.tmpl: json
+ 	./json $(srcfiles) > $@
+ 
diff --git a/meta-networking/recipes-support/ncp/libowfat/0001-fix-incompatible-type-error-with-gcc-15.patch b/meta-networking/recipes-support/ncp/libowfat/0001-fix-incompatible-type-error-with-gcc-15.patch
index 6f5f3e712e..66a6c2c5d2 100644
--- a/meta-networking/recipes-support/ncp/libowfat/0001-fix-incompatible-type-error-with-gcc-15.patch
+++ b/meta-networking/recipes-support/ncp/libowfat/0001-fix-incompatible-type-error-with-gcc-15.patch
@@ -15,24 +15,21 @@ Subject: [PATCH] fix incompatible type error with gcc 15
 Upstream-Status: Submitted [felix-libowfat@fefe.de]
 Signed-off-by: mark.yang <mark.yang@lge.com>
 ---
- buffer.h                  | 2 +-
- buffer/buffer_frombuf.c   | 2 +-
- buffer/buffer_stubborn.c  | 2 +-
- buffer/buffer_stubborn2.c | 2 +-
- buffer/buffer_tosa.c      | 2 +-
- select.h2                 | 2 --
- 6 files changed, 5 insertions(+), 7 deletions(-)
+ buffer.h                | 2 +-
+ buffer/buffer_frombuf.c | 2 +-
+ buffer/buffer_tosa.c    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/buffer.h b/buffer.h
 index 54bed5c..eaf7acb 100644
 --- a/buffer.h
 +++ b/buffer.h
-@@ -24,7 +24,7 @@ typedef struct buffer {
+@@ -37,7 +37,7 @@ typedef struct buffer {
    int fd;		/* passed as first argument to op */
  } buffer;
- 
--#define BUFFER_INIT(op,fd,buf,len) { (buf), 0, 0, (len), (op), NULL, NULL, (fd) }
-+#define BUFFER_INIT(op,fd,buf,len) { (buf), 0, 0, (len), (void*)(op), NULL, NULL, (fd) }
+
+-#define BUFFER_INIT(op,fd,buf,len) { (char*)(buf), 0, 0, (len), (op), NULL, NULL, (fd) }
++#define BUFFER_INIT(op,fd,buf,len) { (char*)(buf), 0, 0, (len), (void*)(op), NULL, NULL, (fd) }
  #define BUFFER_INIT_FREE(op,fd,buf,len) { (buf), 0, 0, (len), (op), NULL, buffer_free, (fd) }
  #define BUFFER_INIT_READ(op,fd,buf,len) BUFFER_INIT(op,fd,buf,len) /*obsolete*/
  #define BUFFER_INSIZE 8192
@@ -48,32 +45,6 @@ index 0c9d931..2aa27ca 100644
 +  b->op=(void*)dummyreadwrite;
    b->deinit=0;
  }
-diff --git a/buffer/buffer_stubborn.c b/buffer/buffer_stubborn.c
-index 2e00418..8079000 100644
---- a/buffer/buffer_stubborn.c
-+++ b/buffer/buffer_stubborn.c
-@@ -1,7 +1,7 @@
- #include <errno.h>
- #include "buffer.h"
- 
--int buffer_stubborn(ssize_t (*op)(),int fd,const char* buf, size_t len,void* cookie) {
-+int buffer_stubborn(ssize_t (*op)(int,char*,size_t,void*),int fd,const char* buf, size_t len,void* cookie) {
-   ssize_t w;
-   errno=0;
-   while (len) {
-diff --git a/buffer/buffer_stubborn2.c b/buffer/buffer_stubborn2.c
-index b9146e2..b47a245 100644
---- a/buffer/buffer_stubborn2.c
-+++ b/buffer/buffer_stubborn2.c
-@@ -1,7 +1,7 @@
- #include <errno.h>
- #include "buffer.h"
- 
--ssize_t buffer_stubborn_read(ssize_t (*op)(),int fd,const char* buf, size_t len,void* cookie) {
-+ssize_t buffer_stubborn_read(ssize_t (*op)(int,char*,size_t,void*),int fd,const char* buf, size_t len,void* cookie) {
-   ssize_t w;
-   for (;;) {
-     if ((w=op(fd,buf,len,cookie))<0)
 diff --git a/buffer/buffer_tosa.c b/buffer/buffer_tosa.c
 index a10be4f..99111a9 100644
 --- a/buffer/buffer_tosa.c
@@ -87,14 +58,3 @@ index a10be4f..99111a9 100644
    b->cookie=sa;
    b->deinit=0;
    return 0;
-diff --git a/select.h2 b/select.h2
-index 961c380..2a22543 100644
---- a/select.h2
-+++ b/select.h2
-@@ -10,6 +10,4 @@
- /* braindead BSD uses bzero in FD_ZERO but doesn't #include string.h */
- #include <string.h>
- 
--extern int select();
--
- #endif
diff --git a/meta-networking/recipes-support/ncp/libowfat/0001-replace-__pure__-with-compiler-attribute-pure.patch b/meta-networking/recipes-support/ncp/libowfat/0001-replace-__pure__-with-compiler-attribute-pure.patch
deleted file mode 100644
index 880d80b106..0000000000
--- a/meta-networking/recipes-support/ncp/libowfat/0001-replace-__pure__-with-compiler-attribute-pure.patch
+++ /dev/null
@@ -1,562 +0,0 @@
-From 408e7dfaf2eb735804f62728de679972867c30d5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 May 2021 13:53:10 -0700
-Subject: [PATCH] replace __pure__ with compiler attribute 'pure'
-
-Remove defining __deprecated__
-
-Upstream-Status: Inappropriate [Untested with dietlibc]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- byte.h     |  22 ++++++----
- critbit.h  |  12 ++++--
- fmt.h      | 100 +++++++++++++++++++++++---------------------
- str.h      |  22 ++++++----
- stralloc.h |  20 +++++----
- 5 files changed, 103 insertions(+), 73 deletions(-)
-
---- a/byte.h
-+++ b/byte.h
-@@ -2,6 +2,16 @@
- #ifndef BYTE_H
- #define BYTE_H
- 
-+#ifndef __has_attribute
-+  #define __has_attribute(x) 0
-+#endif
-+
-+#if __has_attribute(pure)
-+#define __PURE __attribute__ ((pure))
-+#else
-+#define __PURE
-+#endif
-+
- /* for size_t: */
- #include <stddef.h>
- 
-@@ -9,17 +19,13 @@
- extern "C" {
- #endif
- 
--#ifndef __pure__
--#define __pure__
--#endif
--
- /* byte_chr returns the smallest integer i between 0 and len-1
-  * inclusive such that one[i] equals needle, or len if not found. */
--size_t byte_chr(const void* haystack, size_t len, char needle) __pure__;
-+size_t byte_chr(const void* haystack, size_t len, char needle) __PURE;
- 
- /* byte_rchr returns the largest integer i between 0 and len-1 inclusive
-  * such that one[i] equals needle, or len if not found. */
--size_t byte_rchr(const void* haystack,size_t len,char needle) __pure__;
-+size_t byte_rchr(const void* haystack,size_t len,char needle) __PURE;
- 
- /* byte_copy copies in[0] to out[0], in[1] to out[1], ... and in[len-1]
-  * to out[len-1]. */
-@@ -34,14 +40,14 @@ void byte_copyr(void* out, size_t len, c
-  * than, equal to, or greater than the string b[0], b[1], ...,
-  * b[len-1]. When the strings are different, byte_diff does not read
-  * bytes past the first difference. */
--int byte_diff(const void* a, size_t len, const void* b) __pure__;
-+int byte_diff(const void* a, size_t len, const void* b) __PURE;
- 
- /* byte_zero sets the bytes out[0], out[1], ..., out[len-1] to 0 */
- void byte_zero(void* out, size_t len);
- 
- #define byte_equal(s,n,t) (!byte_diff((s),(n),(t)))
- 
--int byte_equal_notimingattack(const void* a, size_t len,const void* b) __pure__;
-+int byte_equal_notimingattack(const void* a, size_t len,const void* b) __PURE;
- 
- #if defined(__i386__) || defined(__x86_64__)
- #define UNALIGNED_ACCESS_OK
---- a/critbit.h
-+++ b/critbit.h
-@@ -8,15 +8,21 @@ extern "C" {
- /* for __pure__ if we are compiling under dietlibc */
- #include <stddef.h>
- 
--#ifndef __pure__
--#define __pure__
-+#ifndef __has_attribute
-+  #define __has_attribute(x) 0
-+#endif
-+
-+#if __has_attribute(pure)
-+#define __PURE __attribute__ ((pure))
-+#else
-+#define __PURE
- #endif
- 
- typedef struct {
-   void *root;
- } critbit0_tree;
- 
--int critbit0_contains(critbit0_tree *t, const char *u) __pure__;
-+int critbit0_contains(critbit0_tree *t, const char *u) __PURE;
- int critbit0_insert(critbit0_tree *t, const char *u);
- int critbit0_delete(critbit0_tree *t, const char *u);
- void critbit0_clear(critbit0_tree *t);
---- a/fmt.h
-+++ b/fmt.h
-@@ -2,6 +2,16 @@
- #ifndef FMT_H
- #define FMT_H
- 
-+#ifndef __has_attribute
-+  #define __has_attribute(x) 0
-+#endif
-+
-+#if __has_attribute(pure)
-+#define __PURE __attribute__ ((pure))
-+#else
-+#define __PURE
-+#endif
-+
- /* for size_t: */
- #include <stddef.h>
- /* for uint32_t */
-@@ -15,10 +25,6 @@
- extern "C" {
- #endif
- 
--#ifndef __pure__
--#define __pure__
--#endif
--
- #define FMT_LONG  41 /* enough space to hold -2^127 in decimal, plus \0 */
- #define FMT_ULONG 40 /* enough space to hold 2^128 - 1 in decimal, plus \0 */
- #define FMT_8LONG 44 /* enough space to hold 2^128 - 1 in octal, plus \0 */
-@@ -46,31 +52,31 @@ extern "C" {
- /* convert signed src integer -23 to ASCII '-','2','3', return number of
-  * bytes of value in output format (3 in this example).
-  * If dest is not NULL, write result to dest */
--size_t fmt_long(char *dest,signed long src) __pure__;
-+size_t fmt_long(char *dest,signed long src) __PURE;
- 
- /* convert unsigned src integer 23 to ASCII '2','3', return number of
-  * bytes of value in output format (2 in this example).
-  * If dest is not NULL, write result to dest */
--size_t fmt_ulong(char *dest,unsigned long src) __pure__;
-+size_t fmt_ulong(char *dest,unsigned long src) __PURE;
- 
- /* convert unsigned src integer 0x23 to ASCII '2','3', return number of
-  * bytes of value in output format (2 in this example).
-  * If dest is not NULL, write result to dest */
--size_t fmt_xlong(char *dest,unsigned long src) __pure__;
-+size_t fmt_xlong(char *dest,unsigned long src) __PURE;
- 
- /* convert unsigned src integer 023 to ASCII '2','3', return number of
-  * bytes of value in output format (2 in this example).
-  * If dest is not NULL, write result to dest */
--size_t fmt_8long(char *dest,unsigned long src) __pure__;
-+size_t fmt_8long(char *dest,unsigned long src) __PURE;
- 
- /* like fmt_long but for long long */
--size_t fmt_longlong(char *dest,signed long long src) __pure__;
-+size_t fmt_longlong(char *dest,signed long long src) __PURE;
- 
- /* like fmt_ulong but for unsigned long long */
--size_t fmt_ulonglong(char *dest,unsigned long long src) __pure__;
-+size_t fmt_ulonglong(char *dest,unsigned long long src) __PURE;
- 
- /* like fmt_xlong but for unsigned long long */
--size_t fmt_xlonglong(char *dest,unsigned long long src) __pure__;
-+size_t fmt_xlonglong(char *dest,unsigned long long src) __PURE;
- 
- #define fmt_uint(dest,src) fmt_ulong(dest,src)
- #define fmt_int(dest,src) fmt_long(dest,src)
-@@ -81,22 +87,22 @@ size_t fmt_xlonglong(char *dest,unsigned
-  * Does not truncate! */
- /* fmt_ulong0(buf,23,4) -> '0','0','2','3' return 4 */
- /* fmt_ulong0(buf,234,2) -> '2','3','4', return 3 */
--size_t fmt_ulong0(char *,unsigned long src,size_t padto) __pure__;
-+size_t fmt_ulong0(char *,unsigned long src,size_t padto) __PURE;
- 
- #define fmt_uint0(buf,src,padto) fmt_ulong0(buf,src,padto)
- 
- /* convert src double 1.7 to ASCII '1','.','7', return length.
-  * If dest is not NULL, write result to dest */
--size_t fmt_double(char *dest, double d,int max,int prec) __pure__;
-+size_t fmt_double(char *dest, double d,int max,int prec) __PURE;
- 
- /* if src is negative, write '-' and return 1.
-  * if src is positive, write '+' and return 1.
-  * otherwise return 0 */
--size_t fmt_plusminus(char *dest,int src) __pure__;
-+size_t fmt_plusminus(char *dest,int src) __PURE;
- 
- /* if src is negative, write '-' and return 1.
-  * otherwise return 0. */
--size_t fmt_minus(char *dest,int src) __pure__;
-+size_t fmt_minus(char *dest,int src) __PURE;
- 
- /* copy str to dest until \0 byte, return number of copied bytes. */
- /* fmt_str(NULL,str) == strlen(str) */
-@@ -108,11 +114,11 @@ size_t fmt_minus(char *dest,int src) __p
-  * This is more efficient because strcat needs to scan the string to
-  * find the end and append.
-  */
--size_t fmt_str(char *dest,const char *src) __pure__;
-+size_t fmt_str(char *dest,const char *src) __PURE;
- 
- /* copy str to dest until \0 byte or limit bytes copied.
-  * return number of copied bytes. */
--size_t fmt_strn(char *dest,const char *src,size_t limit) __pure__;
-+size_t fmt_strn(char *dest,const char *src,size_t limit) __PURE;
- 
- /* copy n bytes from src to dest, return n */
- static inline size_t fmt_copybytes(char* dest,const char* src,size_t n) {
-@@ -124,56 +130,56 @@ static inline size_t fmt_copybytes(char*
-  * write padlen-srclen spaces, if that is >= 0.  Then copy srclen
-  * characters from src.  Truncate only if total length is larger than
-  * maxlen.  Return number of characters written. */
--size_t fmt_pad(char* dest,const char* src,size_t srclen,size_t padlen,size_t maxlen) __pure__;
-+size_t fmt_pad(char* dest,const char* src,size_t srclen,size_t padlen,size_t maxlen) __PURE;
- 
- /* "foo" -> "foo  "
-  * append padlen-srclen spaces after dest, if that is >= 0.  Truncate
-  * only if total length is larger than maxlen.  Return number of
-  * characters written. */
--size_t fmt_fill(char* dest,size_t srclen,size_t padlen,size_t maxlen) __pure__;
-+size_t fmt_fill(char* dest,size_t srclen,size_t padlen,size_t maxlen) __PURE;
- 
- /* 1 -> "1", 4900 -> "4.9k", 2300000 -> "2.3M" */
--size_t fmt_human(char* dest,unsigned long long l) __pure__;
-+size_t fmt_human(char* dest,unsigned long long l) __PURE;
- 
- /* 1 -> "1", 4900 -> "4.8k", 2300000 -> "2.2M" */
--size_t fmt_humank(char* dest,unsigned long long l) __pure__;
-+size_t fmt_humank(char* dest,unsigned long long l) __PURE;
- 
- /* "Sun, 06 Nov 1994 08:49:37 GMT" */
- size_t fmt_httpdate(char* dest,time_t t);	/* not marked pure because it calls gmtime */
- 
- /* "2014-05-27T19:22:16.247Z" */
--size_t fmt_iso8601(char* dest,time_t t) __pure__;
-+size_t fmt_iso8601(char* dest,time_t t) __PURE;
- 
- #define FMT_UTF8 5
- #define FMT_ASN1LENGTH 17 /* enough space to hold 2^128-1 */
- #define FMT_ASN1TAG 19 /* enough space to hold 2^128-1 */
- 
- /* some variable length encodings for integers */
--size_t fmt_utf8(char* dest,uint32_t n) __pure__;	/* can store 0-0x7fffffff */
--size_t fmt_asn1derlength(char* dest,unsigned long long l) __pure__;	/* 0-0x7f: 1 byte, above that 1+bytes_needed bytes */
--size_t fmt_asn1dertag(char* dest,unsigned long long l) __pure__;	/* 1 byte for each 7 bits; upper bit = more bytes coming */
-+size_t fmt_utf8(char* dest,uint32_t n) __PURE;	/* can store 0-0x7fffffff */
-+size_t fmt_asn1derlength(char* dest,unsigned long long l) __PURE;	/* 0-0x7f: 1 byte, above that 1+bytes_needed bytes */
-+size_t fmt_asn1dertag(char* dest,unsigned long long l) __PURE;	/* 1 byte for each 7 bits; upper bit = more bytes coming */
- 
- /* Google Protocol Buffers, https://developers.google.com/protocol-buffers/docs/encoding */
--size_t fmt_varint(char* dest,unsigned long long l) __pure__;	/* protocol buffers encoding; like asn1dertag but little endian */
--size_t fmt_pb_tag(char* dest,size_t fieldno,unsigned char type) __pure__;	/* protocol buffer tag */
--size_t fmt_pb_type0_int(char* dest,unsigned long long l) __pure__;	/* protocol buffers encoding: type 0 bool/enum/int32/uint32/int64/uint64 */
--size_t fmt_pb_type0_sint(char* dest,signed long long l) __pure__;/* protocol buffers encoding: type 0 sint32/sint64 */
--size_t fmt_pb_type1_double(char* dest,double d) __pure__;	/* protocol buffers encoding: double (64-bit little endian blob) */
--size_t fmt_pb_type1_fixed64(char* dest,uint64_t l) __pure__;	/* protocol buffers encoding: 64-bit little endian blob */
-+size_t fmt_varint(char* dest,unsigned long long l) __PURE;	/* protocol buffers encoding; like asn1dertag but little endian */
-+size_t fmt_pb_tag(char* dest,size_t fieldno,unsigned char type) __PURE;	/* protocol buffer tag */
-+size_t fmt_pb_type0_int(char* dest,unsigned long long l) __PURE;	/* protocol buffers encoding: type 0 bool/enum/int32/uint32/int64/uint64 */
-+size_t fmt_pb_type0_sint(char* dest,signed long long l) __PURE;/* protocol buffers encoding: type 0 sint32/sint64 */
-+size_t fmt_pb_type1_double(char* dest,double d) __PURE;	/* protocol buffers encoding: double (64-bit little endian blob) */
-+size_t fmt_pb_type1_fixed64(char* dest,uint64_t l) __PURE;	/* protocol buffers encoding: 64-bit little endian blob */
- 
- /* fmt_pb_type2_string can return 0 if (s,l) is clearly invalid */
--size_t fmt_pb_type2_string(char* dest,const char* s,size_t l) __pure__;	/* protocol buffers encoding: varint length + blob */
--size_t fmt_pb_type5_float(char* dest,float f) __pure__;		/* protocol buffers encoding: float (32-bit little endian blob) */
--size_t fmt_pb_type5_fixed32(char* dest,uint32_t l) __pure__;	/* protocol buffers encoding: 32-bit little endian blob */
--
--size_t fmt_pb_int(char* dest,size_t fieldno,unsigned long long l) __pure__;
--size_t fmt_pb_sint(char* dest,size_t fieldno,signed long long l) __pure__;
--size_t fmt_pb_double(char* dest,size_t fieldno,double d) __pure__;
--size_t fmt_pb_float(char* dest,size_t fieldno,float f) __pure__;
--size_t fmt_pb_string(char* dest,size_t fieldno,const char* s,size_t l) __pure__;
-+size_t fmt_pb_type2_string(char* dest,const char* s,size_t l) __PURE;	/* protocol buffers encoding: varint length + blob */
-+size_t fmt_pb_type5_float(char* dest,float f) __PURE;		/* protocol buffers encoding: float (32-bit little endian blob) */
-+size_t fmt_pb_type5_fixed32(char* dest,uint32_t l) __PURE;	/* protocol buffers encoding: 32-bit little endian blob */
-+
-+size_t fmt_pb_int(char* dest,size_t fieldno,unsigned long long l) __PURE;
-+size_t fmt_pb_sint(char* dest,size_t fieldno,signed long long l) __PURE;
-+size_t fmt_pb_double(char* dest,size_t fieldno,double d) __PURE;
-+size_t fmt_pb_float(char* dest,size_t fieldno,float f) __PURE;
-+size_t fmt_pb_string(char* dest,size_t fieldno,const char* s,size_t l) __PURE;
- 
- /* fmt_netstring can return 0 if (src,len) is clearly invalid */
--size_t fmt_netstring(char* dest,const char* src,size_t len) __pure__;
-+size_t fmt_netstring(char* dest,const char* src,size_t len) __PURE;
- 
- /* Marshaling helper functions.
-  * Escape one character, no matter if it needs escaping or not.
-@@ -185,27 +191,27 @@ size_t fmt_netstring(char* dest,const ch
-  * unicode codepoint) may be limited to 0x7f, 0xff or 0x10ffff. */
- 
- /* XML escaping: '&' -> '&amp;', '<' -> '&lt;', 'ö' -> '&#xf6;' */
--size_t fmt_escapecharxml(char* dest,uint32_t ch) __pure__;
-+size_t fmt_escapecharxml(char* dest,uint32_t ch) __PURE;
- /* HTML escaping is the same as XML escaping. */
--size_t fmt_escapecharhtml(char* dest,uint32_t ch) __pure__;
-+size_t fmt_escapecharhtml(char* dest,uint32_t ch) __PURE;
- 
- /* JSON escaping: '\' -> '\\', '"' -> '\"', 'ö' -> '\u00f6' */
--size_t fmt_escapecharjson(char* dest,uint32_t ch) __pure__;
-+size_t fmt_escapecharjson(char* dest,uint32_t ch) __PURE;
- 
- /* MIME quoted-printable escaping: 'ö' -> '=f6', characters > 0xff not supported */
--size_t fmt_escapecharquotedprintable(char* dest,uint32_t ch) __pure__;
-+size_t fmt_escapecharquotedprintable(char* dest,uint32_t ch) __PURE;
- 
- /* MIME quoted-printable escaping with UTF-8: 'ö' -> '=c3=b6', characters > 0x7fffffff not supported */
--size_t fmt_escapecharquotedprintableutf8(char* dest,uint32_t ch) __pure__;
-+size_t fmt_escapecharquotedprintableutf8(char* dest,uint32_t ch) __PURE;
- 
- /* C99 style escaping: '\' -> '\\', newline -> '\n', 0xc2 -> '\302' */
--size_t fmt_escapecharc(char* dest,uint32_t ch) __pure__;
-+size_t fmt_escapecharc(char* dest,uint32_t ch) __PURE;
- 
- /* internal functions, may be independently useful */
- char fmt_tohex(char c) __attribute__((__const__));
- 
- #define fmt_strm(b,...) fmt_strm_internal(b,__VA_ARGS__,(char*)0)
--size_t fmt_strm_internal(char* dest,...) __pure__;
-+size_t fmt_strm_internal(char* dest,...) __PURE;
- 
- #ifndef MAX_ALLOCA
- #define MAX_ALLOCA 100000
---- a/str.h
-+++ b/str.h
-@@ -8,8 +8,14 @@
- extern "C" {
- #endif
- 
--#ifndef __pure__
--#define __pure__
-+#ifndef __has_attribute
-+  #define __has_attribute(x) 0
-+#endif
-+
-+#if __has_attribute(pure)
-+#define __PURE __attribute__ ((pure))
-+#else
-+#define __PURE
- #endif
- 
- /* str_copy copies leading bytes from in to out until \0.
-@@ -21,7 +27,7 @@ size_t str_copy(char *out,const char *in
-  * equal to, or greater than the string b[0], b[1], ..., b[m-1]=='\0'.
-  * If the strings are different, str_diff does not read bytes past the
-  * first difference. */
--int str_diff(const char *a,const char *b) __pure__;
-+int str_diff(const char *a,const char *b) __PURE;
- 
- /* str_diffn returns negative, 0, or positive, depending on whether the
-  * string a[0], a[1], ..., a[n]=='\0' is lexicographically smaller than,
-@@ -29,24 +35,24 @@ int str_diff(const char *a,const char *b
-  * If the strings are different, str_diffn does not read bytes past the
-  * first difference. The strings will be considered equal if the first
-  * limit characters match. */
--int str_diffn(const char *a,const char *b,size_t limit) __pure__;
-+int str_diffn(const char *a,const char *b,size_t limit) __PURE;
- 
- #ifdef __dietlibc__
- #include <string.h>
- #define str_len(foo) strlen(foo)
- #else
- /* str_len returns the index of \0 in s */
--size_t str_len(const char *s) __pure__;
-+size_t str_len(const char *s) __PURE;
- #endif
- 
- /* str_chr returns the index of the first occurance of needle or \0 in haystack */
--size_t str_chr(const char *haystack,char needle) __pure__;
-+size_t str_chr(const char *haystack,char needle) __PURE;
- 
- /* str_rchr returns the index of the last occurance of needle or \0 in haystack */
--size_t str_rchr(const char *haystack,char needle) __pure__;
-+size_t str_rchr(const char *haystack,char needle) __PURE;
- 
- /* str_start returns 1 if the b is a prefix of a, 0 otherwise */
--int str_start(const char *a,const char *b) __pure__;
-+int str_start(const char *a,const char *b) __PURE;
- 
- /* convenience shortcut to test for string equality */
- #define str_equal(s,t) (!str_diff((s),(t)))
---- a/stralloc.h
-+++ b/stralloc.h
-@@ -2,16 +2,22 @@
- #ifndef STRALLOC_H
- #define STRALLOC_H
- 
-+#ifndef __has_attribute
-+  #define __has_attribute(x) 0
-+#endif
-+
-+#if __has_attribute(pure)
-+#define __PURE __attribute__ ((pure))
-+#else
-+#define __PURE
-+#endif
-+
- #include <stddef.h>
- 
- #ifdef __cplusplus
- extern "C" {
- #endif
- 
--#ifndef __pure__
--#define __pure__
--#endif
--
- /* stralloc is the internal data structure all functions are working on.
-  * s is the string.
-  * len is the used length of the string.
-@@ -101,17 +107,17 @@ static inline int stralloc_APPEND(strall
- /* stralloc_starts returns 1 if the \0-terminated string in "in", without
-  * the terminating \0, is a prefix of the string stored in sa. Otherwise
-  * it returns 0. sa must already be allocated. */
--int stralloc_starts(stralloc* sa,const char* in) __pure__;
-+int stralloc_starts(stralloc* sa,const char* in) __PURE;
- 
- /* stralloc_diff returns negative, 0, or positive, depending on whether
-  * a is lexicographically smaller than, equal to, or greater than the
-  * string b. */
--int stralloc_diff(const stralloc* a,const stralloc* b) __pure__;
-+int stralloc_diff(const stralloc* a,const stralloc* b) __PURE;
- 
- /* stralloc_diffs returns negative, 0, or positive, depending on whether
-  * a is lexicographically smaller than, equal to, or greater than the
-  * string b[0], b[1], ..., b[n]=='\0'. */
--int stralloc_diffs(const stralloc* a,const char* b) __pure__;
-+int stralloc_diffs(const stralloc* a,const char* b) __PURE;
- 
- #define stralloc_equal(a,b) (!stralloc_diff((a),(b)))
- #define stralloc_equals(a,b) (!stralloc_diffs((a),(b)))
---- a/scan.h
-+++ b/scan.h
-@@ -15,8 +15,14 @@
- extern "C" {
- #endif
- 
--#ifndef __pure__
--#define __pure__
-+#ifndef __has_attribute
-+  #define __has_attribute(x) 0
-+#endif
-+
-+#if __has_attribute(pure)
-+#define __PURE __attribute__ ((pure))
-+#else
-+#define __PURE
- #endif
- 
- /* This file declared functions used to decode / scan / unmarshal
-@@ -84,18 +90,18 @@ size_t scan_double(const char *in, doubl
- size_t scan_plusminus(const char *src,signed int *dest);
- 
- /* return the highest integer n<=limit so that isspace(in[i]) for all 0<=i<=n */
--size_t scan_whitenskip(const char *in,size_t limit) __pure__;
-+size_t scan_whitenskip(const char *in,size_t limit) __PURE;
- 
- /* return the highest integer n<=limit so that !isspace(in[i]) for all 0<=i<=n */
--size_t scan_nonwhitenskip(const char *in,size_t limit) __pure__;
-+size_t scan_nonwhitenskip(const char *in,size_t limit) __PURE;
- 
- /* return the highest integer n<=limit so that in[i] is element of
-  * charset (ASCIIZ string) for all 0<=i<=n */
--size_t scan_charsetnskip(const char *in,const char *charset,size_t limit) __pure__;
-+size_t scan_charsetnskip(const char *in,const char *charset,size_t limit) __PURE;
- 
- /* return the highest integer n<=limit so that in[i] is not element of
-  * charset (ASCIIZ string) for all 0<=i<=n */
--size_t scan_noncharsetnskip(const char *in,const char *charset,size_t limit) __pure__;
-+size_t scan_noncharsetnskip(const char *in,const char *charset,size_t limit) __PURE;
- 
- /* try to parse ASCII GMT date; does not understand time zones. */
- /* example dates:
-@@ -103,17 +109,17 @@ size_t scan_noncharsetnskip(const char *
-  *   "Sunday, 06-Nov-94 08:49:37 GMT"
-  *   "Sun Nov  6 08:49:37 1994"
-  */
--size_t scan_httpdate(const char *in,time_t *t) __pure__;
-+size_t scan_httpdate(const char *in,time_t *t) __PURE;
- 
- /* try to parse ASCII ISO-8601 date; does not understand time zones. */
- /* example date: "2014-05-27T19:22:16Z" */
--size_t scan_iso8601(const char* in,struct timespec* t) __pure__;
-+size_t scan_iso8601(const char* in,struct timespec* t) __PURE;
- 
- /* some variable length encodings for integers */
--size_t scan_utf8(const char* in,size_t len,uint32_t* n) __pure__;
--size_t scan_utf8_sem(const char* in,size_t len,uint32_t* n) __pure__;
--size_t scan_asn1derlength(const char* in,size_t len,unsigned long long* n) __pure__;
--size_t scan_asn1dertag(const char* in,size_t len,unsigned long long* n) __pure__;
-+size_t scan_utf8(const char* in,size_t len,uint32_t* n) __PURE;
-+size_t scan_utf8_sem(const char* in,size_t len,uint32_t* n) __PURE;
-+size_t scan_asn1derlength(const char* in,size_t len,unsigned long long* n) __PURE;
-+size_t scan_asn1dertag(const char* in,size_t len,unsigned long long* n) __PURE;
- 
- /* Google protocol buffers */
- /* A protocol buffer is a sequence of (tag,value).
-@@ -121,16 +127,16 @@ size_t scan_asn1dertag(const char* in,si
-  *   which field in your struct is being sent. Integers must have type
-  *   0, double type 1, strings type 2 and floats type 5. However, you
-  *   have to check this yourself.
-- */ 
--size_t scan_varint(const char* in,size_t len, unsigned long long* n) __pure__;	/* internal */
--size_t scan_pb_tag(const char* in,size_t len, size_t* fieldno,unsigned char* type) __pure__;
-+ */
-+size_t scan_varint(const char* in,size_t len, unsigned long long* n) __PURE;	/* internal */
-+size_t scan_pb_tag(const char* in,size_t len, size_t* fieldno,unsigned char* type) __PURE;
- 
- /* Then, depending on the field number, validate the type and call the
-  * corresponding of these functions to parse the value */
--size_t scan_pb_type0_int(const char* in,size_t len,unsigned long long* l) __pure__;
--size_t scan_pb_type0_sint(const char* in,size_t len,signed long long* l) __pure__;
--size_t scan_pb_type1_double(const char* in,size_t len,double* d) __pure__;
--size_t scan_pb_type1_fixed64(const char* in,size_t len,uint64_t* b) __pure__;
-+size_t scan_pb_type0_int(const char* in,size_t len,unsigned long long* l) __PURE;
-+size_t scan_pb_type0_sint(const char* in,size_t len,signed long long* l) __PURE;
-+size_t scan_pb_type1_double(const char* in,size_t len,double* d) __PURE;
-+size_t scan_pb_type1_fixed64(const char* in,size_t len,uint64_t* b) __PURE;
- /* NOTE: scan_pb_type2_stringlen only parses the length of the string,
-  * not the string itself. It will return the number of bytes parsed in
-  * the length, then set slen to the value of the length integer it just
-@@ -141,9 +147,9 @@ size_t scan_pb_type1_fixed64(const char*
-  * parsing early without having to read and allocate memory for the rest
-  * (potentially gigabytes) of the data announced by one unreasonable
-  * string length value. */
--size_t scan_pb_type2_stringlen(const char* in,size_t len,const char** string, size_t* slen) __pure__;
--size_t scan_pb_type5_float(const char* in,size_t len,float* f) __pure__;
--size_t scan_pb_type5_fixed32(const char* in,size_t len,uint32_t* b) __pure__;
-+size_t scan_pb_type2_stringlen(const char* in,size_t len,const char** string, size_t* slen) __PURE;
-+size_t scan_pb_type5_float(const char* in,size_t len,float* f) __PURE;
-+size_t scan_pb_type5_fixed32(const char* in,size_t len,uint32_t* b) __PURE;
- 
- /* parse a netstring, input buffer is in (len bytes).
-  * if parsing is successful:
-@@ -153,7 +159,7 @@ size_t scan_pb_type5_fixed32(const char*
-  *   return 0
-  * Note: *dest will point inside the input buffer!
-  */
--size_t scan_netstring(const char* in,size_t len,char** dest,size_t* slen) __pure__;
-+size_t scan_netstring(const char* in,size_t len,char** dest,size_t* slen) __PURE;
- 
- /* internal function that might be useful independently */
- /* convert from hex ASCII, return 0 to 15 for success or -1 for failure */
---- a/scan/scan_httpdate.c
-+++ b/scan/scan_httpdate.c
-@@ -1,5 +1,4 @@
- #define _GNU_SOURCE
--#define __deprecated__
- #include "scan.h"
- #include "byte.h"
- #include "case.h"
---- a/scan/scan_iso8601.c
-+++ b/scan/scan_iso8601.c
-@@ -1,5 +1,4 @@
- #define _GNU_SOURCE
--#define __deprecated__
- #include "scan.h"
- #include "byte.h"
- #include "case.h"
diff --git a/meta-networking/recipes-support/ncp/libowfat_0.32.bb b/meta-networking/recipes-support/ncp/libowfat_0.34.bb
similarity index 81%
rename from meta-networking/recipes-support/ncp/libowfat_0.32.bb
rename to meta-networking/recipes-support/ncp/libowfat_0.34.bb
index 2f00da34c5..fa251f55a7 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.32.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.34.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 SRC_URI = "http://www.fefe.de/${BPN}/${BP}.tar.xz \
            file://0001-Depend-on-haveuint128.h-for-umult64.c.patch \
-           file://0001-replace-__pure__-with-compiler-attribute-pure.patch \
            file://0001-fix-incompatible-type-error-with-gcc-15.patch \
+           file://0001-GNUmakefile-build-json-helper-for-the-build-host.patch \
           "
-SRC_URI[md5sum] = "ee015ccf45cb2bc61c942642038c2bdc"
-SRC_URI[sha256sum] = "f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"
+SRC_URI[sha256sum] = "d4330d373ac9581b397bc24a22ad1f7f5d58a7fe36d9d239fe352ceffc5d304b"
 
 EXTRA_OEMAKE = "\
     DIET= \

