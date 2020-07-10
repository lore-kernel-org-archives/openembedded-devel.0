Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.1309.1594342182461060920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 17:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=USmlJtwp;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id gc15so3888232pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 17:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oYBq5N6fvistJerbir0nKbPWo3OezQmXt0nRAQxipqM=;
        b=USmlJtwpNW0XYkT/RfofkCNLUklWE5sWPvU6+/e3fDPvV3XV9h+Zycxa4r77qWih/u
         D974rWpohFlJng1IxYch9hG9N+I1Nh83bwjyFKA86YaKE37t0yzUi7D+q+YCLi1hi0VC
         8HhCLKdR2s8DZtcbsyopub//5hca0Rlt/uk4lSS/k+T8eVsbkZBKvHQR0ErbuzDkkhmK
         +wnczrEw4uJ1FhfXr3aBsmoPGVMfJFtwwIo5V/kAPttIDYBtK8J0ZEUuB4zYMpLPOZqu
         s5Lett2Sx/CCMK1P5RBgJ5RuIjyH8zdQLyf2llwtfO6NEqZQ1uuYRrD968jdlrLgsbC9
         b3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oYBq5N6fvistJerbir0nKbPWo3OezQmXt0nRAQxipqM=;
        b=Eu57D69Bm6dxOBuDkRsNHeQKuDHR3ZS2VFGdqJg1RIy2lm0q1xlNC8/XH9YbRaAogg
         KH9WHTtIn6WD8gxPA9BhgK4zKC/WFXkGrFALwJlmyq41JDK6pQxq9HEyWC+570iRlYoh
         XtWlW+fi+d6r4dnAS2dgKuwlPtcpKpwrsTNHXMbLBE4p2F71qGdMkkKc10y4Nx//mjSU
         60PcG9VKzY/IfQ2oTXdZzqTXwhCf2al30AczRHrjxgU4rqgHcGP1EM7eNc2aTJBIi6sD
         9revtKXrzveLivSuecocjJypNbprerIntcW73cNrItBAHDHNjMGHNGB6OeqHV+DnN3hR
         McEQ==
X-Gm-Message-State: AOAM530A1rF2CUXU609WOROL7V1WbgVfky7MNz/csZ//3pWUACL+vAFX
	ED79omkwzDno4aJ+yAM5JTsOPFItJuY=
X-Google-Smtp-Source: ABdhPJyBDNqq+2FZErkKKJvlnaC/032GMgG3MsJz6BR9oS7AXXNihqfs4w33MuI1q9dVEzPSGJDSQA==
X-Received: by 2002:a17:90a:2749:: with SMTP id o67mr2897095pje.183.1594342181420;
        Thu, 09 Jul 2020 17:49:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::c85a? ([2601:646:9200:4e0::c85a])
        by smtp.gmail.com with ESMTPSA id b8sm3934941pjm.31.2020.07.09.17.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 17:49:40 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/2] zchunk: upgrade 1.1.5 -> 1.1.6
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1591012275-14454-1-git-send-email-pjtexier@koncepto.io>
 <1618663E8BD13912.1568@lists.openembedded.org>
 <CA+chaQecTj9VO2JPwFkDWivKRg2Q51ViFeaNDv1HD_BguhwNPQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <b15e6dae-cff5-018d-d516-e4a69fce1833@gmail.com>
Date: Thu, 9 Jul 2020 17:49:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQecTj9VO2JPwFkDWivKRg2Q51ViFeaNDv1HD_BguhwNPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 7/8/20 12:53 AM, Martin Jansa wrote:
> Now the same upgrade was merged to dunfell, are you going to fix it?
> 
> On Sun, Jun 14, 2020 at 1:41 PM Martin Jansa via lists.openembedded.org
> <http://lists.openembedded.org>
> <Martin.Jansa=gmail.com@lists.openembedded.org
> <mailto:gmail.com@lists.openembedded.org>> wrote:
> 
>     The argp check added in:
>     https://github.com/zchunk/zchunk/commit/73f9f26d43f6786eadc49f7d43f1672e03d92b7f
> 
>     fails in builds with Werror=return-type with:
>     Code:
>      #include <argp.h>
>     static error_t parse_opt (int key, char *arg, struct argp_state
>     *state) { argp_usage(state); }; void main() {}
>     Compiler stdout:
> 
>     Compiler stderr:
>      In file included from
>     zchunk/1.1.6-r0/recipe-sysroot/usr/include/bits/libc-header-start.h:33,
>                      from
>     zchunk/1.1.6-r0/recipe-sysroot/usr/include/stdio.h:27,
>                      from
>     zchunk/1.1.6-r0/recipe-sysroot/usr/include/argp.h:23,
>                      from
>     zchunk/1.1.6-r0/build/meson-private/tmpqwvjccnp/testfile.c:1:
>     zchunk/1.1.6-r0/recipe-sysroot/usr/include/features.h:397:4:
>     warning: #warning _FORTIFY_SOURCE requires compiling with
>     optimization (-O) [-Wcpp]
>       397 | #  warning _FORTIFY_SOURCE requires compiling with
>     optimization (-O)
>           |    ^~~~~~~
>     zchunk/1.1.6-r0/build/meson-private/tmpqwvjccnp/testfile.c: In
>     function 'parse_opt':
>     zchunk/1.1.6-r0/build/meson-private/tmpqwvjccnp/testfile.c:2:54:
>     error: no return statement in function returning non-void
>     [-Werror=return-type]
>         2 | static error_t parse_opt (int key, char *arg, struct
>     argp_state *state) { argp_usage(state); }; void main() {}
>           |                                                      ^~~~~~~~~~
>     cc1: some warnings being treated as errors

this is fine, but I think this warning should be enabled upstream by
default as well

> 
>     and then build with glibc fails
> 
>     ../git/meson.build:26:4: ERROR: C library 'argp' not found
> 
>     It was building fine in 1.1.5 in my world builds, because this argp
>     check wasn't there yet. Can you please fix it in upstream and do
>     another upgrade?
> 
>     Thanks
> 
>     On Mon, Jun 1, 2020 at 1:52 PM Pierre-Jean Texier via
>     lists.openembedded.org <http://lists.openembedded.org>
>     <pjtexier=koncepto.io@lists.openembedded.org
>     <mailto:koncepto.io@lists.openembedded.org>> wrote:
> 
>         - Remove patches already in version
> 
>         Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io
>         <mailto:pjtexier@koncepto.io>>
>         ---
>          .../zchunk/0001-zck.h-fix-build-on-musl.patch      | 39
>         --------------
>          .../0002-unzck-fix-build-with-musl-libc.patch      | 61
>         ----------------------
>          .../zchunk/{zchunk_1.1.5.bb <http://zchunk_1.1.5.bb> =>
>         zchunk_1.1.6.bb <http://zchunk_1.1.6.bb>}    |  8 +--
>          3 files changed, 2 insertions(+), 106 deletions(-)
>          delete mode 100644
>         meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
>          delete mode 100644
>         meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
>          rename meta-oe/recipes-support/zchunk/{zchunk_1.1.5.bb
>         <http://zchunk_1.1.5.bb> => zchunk_1.1.6.bb
>         <http://zchunk_1.1.6.bb>} (66%)
> 
>         diff --git
>         a/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
>         b/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
>         deleted file mode 100644
>         index 64e0e8e..0000000
>         ---
>         a/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
>         +++ /dev/null
>         @@ -1,39 +0,0 @@
>         -From 78247d478cec254bad27f4ed97b532f4f54bf1b0 Mon Sep 17
>         00:00:00 2001
>         -From: Pierre-Jean Texier <pjtexier@koncepto.io
>         <mailto:pjtexier@koncepto.io>>
>         -Date: Thu, 23 Jan 2020 19:14:40 +0100
>         -Subject: [PATCH 1/2] zck.h: fix build on musl
>         -
>         -The ssize_t type requires the <sys/types.h> header. This fixes
>         build with musl
>         -libc:
>         -
>         -include/zck.h:68:1: error: unknown type name 'ssize_t'; did you
>         mean 'size_t'?
>         -   68 | ssize_t zck_read(zckCtx *zck, char *dst, size_t dst_size)
>         -      | ^~~~~~~
>         -      | size_t
>         -include/zck.h:81:1: error: unknown type name 'ssize_t'; did you
>         mean 'size_t'?
>         -   81 | ssize_t zck_write(zckCtx *zck, const char *src, const
>         size_t src_size)
>         -      | ^~~~~~~
>         -      | size_t
>         -     
>         -Upstream-Status: Submitted
>         [https://github.com/zchunk/zchunk/pull/23]
>         -
>         -Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io
>         <mailto:pjtexier@koncepto.io>>
>         ----
>         - include/zck.h.in <http://zck.h.in> | 1 +
>         - 1 file changed, 1 insertion(+)
>         -
>         -diff --git a/include/zck.h.in <http://zck.h.in>
>         b/include/zck.h.in <http://zck.h.in>
>         -index 91d2557..b847576 100644
>         ---- a/include/zck.h.in <http://zck.h.in>
>         -+++ b/include/zck.h.in <http://zck.h.in>
>         -@@ -5,6 +5,7 @@
>         -
>         - #include <stdlib.h>
>         - #include <stdbool.h>
>         -+#include <sys/types.h>
>         -
>         - typedef enum zck_hash {
>         -     ZCK_HASH_SHA1,
>         ---
>         -2.7.4
>         -
>         diff --git
>         a/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
>         b/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
>         deleted file mode 100644
>         index a1c95bf..0000000
>         ---
>         a/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
>         +++ /dev/null
>         @@ -1,61 +0,0 @@
>         -From 72c55e3da59eccdfea3778d11f83862b58af723d Mon Sep 17
>         00:00:00 2001
>         -From: Pierre-Jean Texier <pjtexier@koncepto.io
>         <mailto:pjtexier@koncepto.io>>
>         -Date: Thu, 23 Jan 2020 22:42:40 +0100
>         -Subject: [PATCH 2/2] unzck: fix build with musl libc
>         -
>         -On musl libc "stdout" is a preprocessor macro whose expansion
>         leads to
>         -compilation errors.
>         -
>         -Fixes:
>         -
>         -| In file included from ../git/src/unzck.c:31:
>         -| ../git/src/unzck.c: In function 'parse_opt':
>         -| ../git/src/unzck.c:78:24: error: expected identifier before
>         '(' token
>         -|    78 |             arguments->stdout = true;
>         -|       |                        ^~~~~~
>         -| ../git/src/unzck.c: In function 'main':
>         -| ../git/src/unzck.c:141:20: error: expected identifier before
>         '(' token
>         -|   141 |     if(!(arguments.stdout)) {
>         -|       |                    ^~~~~~
>         -
>         -Upstream-Status: Submitted
>         [https://github.com/zchunk/zchunk/pull/23]
>         -
>         -Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io
>         <mailto:pjtexier@koncepto.io>>
>         ----
>         - src/unzck.c | 6 +++---
>         - 1 file changed, 3 insertions(+), 3 deletions(-)
>         -
>         -diff --git a/src/unzck.c b/src/unzck.c
>         -index 8d6c62a..002492c 100644
>         ---- a/src/unzck.c
>         -+++ b/src/unzck.c
>         -@@ -58,7 +58,7 @@ struct arguments {
>         -   char *args[1];
>         -   zck_log_type log_level;
>         -   bool dict;
>         --  bool stdout;
>         -+  bool stdOut;
>         -   bool exit;
>         - };
>         -
>         -@@ -75,7 +75,7 @@ static error_t parse_opt (int key, char *arg,
>         struct argp_state *state) {
>         -                 arguments->log_level = ZCK_LOG_DDEBUG;
>         -             break;
>         -         case 'c':
>         --            arguments->stdout = true;
>         -+            arguments->stdOut = true;
>         -             break;
>         -         case 'V':
>         -             version();
>         -@@ -138,7 +138,7 @@ int main (int argc, char *argv[]) {
>         -         snprintf(out_name + strlen(base_name) - 4, 7, ".zdict");
>         -
>         -     int dst_fd = STDOUT_FILENO;
>         --    if(!arguments.stdout) {
>         -+    if(!arguments.stdOut) {
>         -         dst_fd = open(out_name, O_TRUNC | O_WRONLY | O_CREAT,
>         0666);
>         -         if(dst_fd < 0) {
>         -             dprintf(STDERR_FILENO, "Unable to open %s", out_name);
>         ---
>         -2.7.4
>         -
>         diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.1.5.bb
>         <http://zchunk_1.1.5.bb>
>         b/meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
>         <http://zchunk_1.1.6.bb>
>         similarity index 66%
>         rename from meta-oe/recipes-support/zchunk/zchunk_1.1.5.bb
>         <http://zchunk_1.1.5.bb>
>         rename to meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
>         <http://zchunk_1.1.6.bb>
>         index f75412f..e041132 100644
>         --- a/meta-oe/recipes-support/zchunk/zchunk_1.1.5.bb
>         <http://zchunk_1.1.5.bb>
>         +++ b/meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
>         <http://zchunk_1.1.6.bb>
>         @@ -4,13 +4,9 @@ AUTHOR = "Jonathan Dieter"
>          LICENSE = "BSD-2-Clause"
>          LIC_FILES_CHKSUM =
>         "file://LICENSE;md5=cd6e590282010ce90a94ef25dd31410f"
> 
>         -SRC_URI = " \
>         -       git://github.com/zchunk/zchunk.git;protocol=https
>         <http://github.com/zchunk/zchunk.git;protocol=https> \
>         -       file://0001-zck.h-fix-build-on-musl.patch \
>         -       file://0002-unzck-fix-build-with-musl-libc.patch \
>         -       "
>         +SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https
>         <http://github.com/zchunk/zchunk.git;protocol=https>"
> 
>         -SRCREV = "c01bf12feede792982f165f52f4a6c573e3a8c17"
>         +SRCREV = "f5593aa11584faa691c81b4898f0aaded47f8bf7"
>          S = "${WORKDIR}/git"
> 
>          DEPENDS = "\
>         -- 
>         2.7.4
> 
> 
> 
> 
> 
> 
