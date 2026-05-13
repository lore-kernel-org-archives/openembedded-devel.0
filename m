Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D27ACD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:27:59 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2139.1778657278187034389
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 00:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bQrpGS5o;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c305f381eso7012235d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 00:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778657277; cv=none;
        d=google.com; s=arc-20240605;
        b=h0PVtRlc15shN/bzq92bbDRzd0RAYAi2zjE8/M664jp8wyDb4vZw6Lq8/DirX5o8qI
         1QcKuLhIqzvXW/ds6JZn/sEsUsSRrJ+7Gtf1jhNU8nXOJ686YKe4ocbe1bSwdBz+6PTV
         11ppU4LMb+lQAiPJndfJuXdwKmzHXqlF3RYBqkmRixptEU5f0kAUoHpAIVPlaLtnJjjU
         W8+s4lmdt7QDptx2lSOnl/qtY7G5Z1uL0ZkyRRIczZcE8SmvxOY0YjT9upmN8aYh2so0
         fcDD/W69C/yFl624xZjv5GymB8D8y3R4FefE/gE5HCj6XI4e9ubW6XrwJRHWRNSH9zj6
         Uf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lXFtC5irTKD8VR+jAV+0DeLrFlO7AgZ4yE0wWKd8dFQ=;
        fh=IdKuTZhrygwjS6H9YujwhjKTm1acyyh7Q88keTxiug4=;
        b=dB27jqxSJnEvDQCZxYdrCRpVBluF3VegQ+S64jbaIiKq2AOFxtTGTcMVJw/YzxqjoK
         3O1fTZhPVZUxB3++qstGJW9xmm5pm4tFtcbmJbOw4xsr5k8gU9gcs2jccrAB1w2Yb1t0
         TCytuf5UWoIL/D7ziaw7UuhypUEDtsx1+ZaMeuaR+XIgU/WbKZRJUDPS9M1quW/Zzc6N
         cSDKjLLFpm6VLMMIqDXyTwNZtJ9R/VnU/2IvuECa9mj8B6EGjwDMq4dO6X5UFC4TyZV5
         XYtO0zFdu8Ldd7w8p6ov11fR/N/gOCNIBMgzSaUObNhNnsz1t6Bc0PFKjFWcEp3+9vsa
         g7cg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778657277; x=1779262077; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lXFtC5irTKD8VR+jAV+0DeLrFlO7AgZ4yE0wWKd8dFQ=;
        b=bQrpGS5oBVyg403NXquTPbY6hZCqgsL1eKZCgZ/r26FeWc56OGrTXoq1WsZZ+YvrrZ
         4VDHreQrmc/pmSKHZRUCUWE6qGKZvIRvug3sGbOHSNYiR5zow6l+mwJ6dpoYtJVF1EQL
         vgZ9UK0qahZB/NRyTCmvESGGncRiqPYXa+SQz6X8PzCGYWhiaVeq8Q7NBu6XN3lkfnIn
         TCEkW9nVja5zEpi3C5JtMm6yk5MUGA75oP6ZhUXHoVHaMGrit7wTtTpgjOYpt8Zq1X5H
         qqJ02ZBmajn6C9DtH2PY5Q6QihB6mh+mEcCV3EepCDWPUKpRLlUqoBb4DGpH5KWLRrFa
         oJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657277; x=1779262077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXFtC5irTKD8VR+jAV+0DeLrFlO7AgZ4yE0wWKd8dFQ=;
        b=lGhpDbNrhrUD2AkgR5OJ+VgtfA3ZsQ5hQLAPgllHL0tHwb91krCBRHQhKBKEN2y30s
         pB6MSLswChP8lSLqEsAhftXM3F13R924jdayO6g11ojzuH0A5qS3+1d36fiUHd7riekG
         J4KSX9+LHO6JK87fn6dSn4ZSV481580QTPTXlDjtza0mbu0IfVxcuJIyzPzeIE3wYnGf
         oqfi4B88yvio32FgJGCJ1ACysR+ZphzDioEimzun/LF0wDhA6aPooZOd4yCXnsd1j4AR
         Mob1Wj4G0bZOFw4aSG5TDc8VnAl8a0U4EGGF3HMlJOkQ7N4Fh4sNT0i7YejXp1pEYKBS
         JMSg==
X-Gm-Message-State: AOJu0YwOO11fDEnawiSZ6HLK+ZFD3eWwVnlpbVumIVBEREv7DeZg9nXF
	Ypb7DjBlLiI7oi6Y5Qe8qEn9VZ+ramNSKRPt4Iv1McirMXK6bbSuKjN/1y8+sI3iGBJyJq/Oncw
	h7gFL3NqreZUPl1fAuIrDoBh0OU1ZcW0vQJcxPOG8cQ==
X-Gm-Gg: Acq92OGMfSM5GWwoh0cY/kUKTUYON4SqWRxVNNH1JSYK1NLYO4+g6SDYWxuxqYhP8mY
	gQdthbpKzOjLW8pltzBoydib08FwAb9kbKuWsTVakZF0xHQAagpm/CL55zdvY6m1gUlPIk0DLPq
	da/f19YJim5h2wm5RGm3BgKkStBdt23Yd81TZUQrLbGH58epxtB9eKuwrlHrdAE9Ha2+CUwpEjz
	Vz1nrsmerh1OqJPFWsPrYP9hbXEud+A/LwCkhzJ43VvkBboxreQZDUgLxELDJKNjLAJLeZQTWv5
	IoVBNyisCPdS9yw7gG2RymCQNb9dj7UvbxrGdMKuagNRrwH4/X3mXzZGo8lSY859H+BJOgQjHKM
	2FQajJ2MbVvG4GjVJhZpYGzSnqx3Iksa7yrL1CfLri9B2kggXzS4+Xaua6g2ZlzAAkVgdm2fQvn
	7hfd3j/djqK0G6v3YH
X-Received: by 2002:a53:c904:0:b0:650:31d2:234f with SMTP id
 956f58d0204a3-65df63cf482mr1538072d50.51.1778657277044; Wed, 13 May 2026
 00:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260513030944.2378915-1-changqing.li@windriver.com>
In-Reply-To: <20260513030944.2378915-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 May 2026 00:27:30 -0700
X-Gm-Features: AVHnY4IK0bz3C1HVM_edr_tYWiGY09PG8SRTcc29X7zTjPqwcUFimCWS1Muxfc8
Message-ID: <CAMKF1sr-mFccrpOTJ3yVitujsrkCCJyS+SFdPyki8Wo0vk+TCA@mail.gmail.com>
Subject: Re: [oe] [wrynose][master][PATCH V2] postfix: upgrade 3.10.8 -> 3.11.2
To: changqing.li@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002cecb60651adebd3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 07:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126957

--0000000000002cecb60651adebd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase on top of latest master and resend please

On Tue, May 12, 2026 at 8:12=E2=80=AFPM Changqing Li via lists.openembedded=
.org <
changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:

> * Refresh patch to mute patch-fuzz
> * Add patch 0001-sys_defs.h-workaround-for-musl-lib.patch to workaround
>   for musl lib
> * This upgrade include the following commit, which make postfix can
>   compile on latest stable ubuntu 26.04, which have Linux 7.x kernel
>
>   Postfix works on Linux 7.x kernels. Frank Scheiner. Files:
>         makedefs, util/sys_defs.h.
>
> Changes:
> https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../postfix/files/0001-Fix-makedefs.patch     | 25 +++++------
>  ...1-sys_defs.h-workaround-for-musl-lib.patch | 43 +++++++++++++++++++
>  ...tconf-to-a-variable-for-cross-compil.patch |  9 ++--
>  ...tive-compiler-to-build-makedefs.test.patch | 17 +++-----
>  .../postfix/files/0004-Fix-icu-config.patch   |  9 ++--
>  ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 ++---
>  .../{postfix_3.10.8.bb =3D> postfix_3.11.2.bb}  |  3 +-
>  7 files changed, 73 insertions(+), 44 deletions(-)
>  create mode 100644
> meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-=
for-musl-lib.patch
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb =3D>
> postfix_3.11.2.bb} (98%)
>
> diff --git
> a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
> b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
> index 785fe87452..4e187849dc 100644
> --- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.pat=
ch
> +++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.pat=
ch
> @@ -1,4 +1,4 @@
> -From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
> +From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
>  From: Li xin <lixin.fnst@cn.fujitsu.com>
>  Date: Fri, 19 Jun 2015 16:45:54 +0900
>  Subject: [PATCH] Fix makedefs
> @@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>   1 file changed, 11 insertions(+), 16 deletions(-)
>
>  diff --git a/makedefs b/makedefs
> -index a740e41..28fb128 100644
> +index d5103ce..9713327 100644
>  --- a/makedefs
>  +++ b/makedefs
> -@@ -230,9 +230,6 @@ echo "# pie=3D$pie"
> +@@ -232,9 +232,6 @@ echo "# pie=3D$pie"
>
>   # Defaults for most sane systems
>
> @@ -32,7 +32,7 @@ index a740e41..28fb128 100644
>   ARFL=3Drv
>
>   # Ugly function to make our error message more visible among the
> -@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
> +@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
>                 case "$CCARGS" in
>                  *-DNO_DB*) ;;
>                  *-DHAS_DB*) ;;
> @@ -48,8 +48,8 @@ index a740e41..28fb128 100644
>                     else
>                         # No, we're not going to try db1 db2 db3 etc.
>                         # On a properly installed system, Postfix builds
> -@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
> -                       echo "Install the appropriate db*-devel package
> first." 1>&2
> +@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
> +                       echo "Alternatively, build with CCARGS=3D\"-NO_DB
> ...\"" 1>&2
>                         exit 1
>                     fi
>  -                  SYSLIBS=3D"-ldb"
> @@ -63,7 +63,7 @@ index a740e41..28fb128 100644
>                     do
>                         test -e $lib/lib$name.a -o -e $lib/lib$name.so &&=
 {
>                             SYSLIBS=3D"$SYSLIBS -l$name"
> -@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
> +@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
>                        if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
>                        then
>                            :
> @@ -72,7 +72,7 @@ index a740e41..28fb128 100644
>                        then
>                            echo CCARGS=3D"$CCARGS -DNO_EPOLL"
>                        else
> -@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
> +@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
>   }
>   EOF
>                            ${CC-gcc} -o makedefs.test makedefs.test.c ||
> exit 1
> @@ -81,7 +81,7 @@ index a740e41..28fb128 100644
>                            rm -f makedefs.test makedefs.test.[co]
>                        fi;;
>                 esac
> -@@ -644,12 +639,12 @@ EOF
> +@@ -690,12 +685,12 @@ EOF
>                 case "$CCARGS" in
>                  *-DNO_DB*) ;;
>                  *-DHAS_DB*) ;;
> @@ -97,8 +97,8 @@ index a740e41..28fb128 100644
>                     else
>                         # On a properly installed system, Postfix builds
>                         # by including <db.h> and by linking with -ldb
> -@@ -657,12 +652,12 @@ EOF
> -                       echo "Install the appropriate db*-devel package
> first." 1>&2
> +@@ -705,12 +700,12 @@ EOF
> +                       echo "See:
> https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf" 1>&2
>                         exit 1
>                     fi
>  -                  SYSLIBS=3D"-ldb"
> @@ -112,6 +112,3 @@ index a740e41..28fb128 100644
>                     do
>                         test -e $lib/lib$name.a -o -e $lib/lib$name.so &&=
 {
>                             SYSLIBS=3D"$SYSLIBS -l$name"
> ---
> -2.25.1
> -
> diff --git
> a/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaroun=
d-for-musl-lib.patch
> b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaroun=
d-for-musl-lib.patch
> new file mode 100644
> index 0000000000..b7a8e05165
> --- /dev/null
> +++
> b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaroun=
d-for-musl-lib.patch
> @@ -0,0 +1,43 @@
> +From ce15792203ae0c787e3602d6d38a892ea1ce31ce Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 12 May 2026 15:04:55 +0800
> +Subject: [PATCH] sys_defs.h: workaround for musl lib
> +
> +Fix musl lib compile failure:
> +vbuf_print.c:215:46: error: macro 'VBUF_SNPRINTF' passed 5 arguments, bu=
t
> takes just 4
> +  215 |                     VSTRING_ADDNUM(fmt, width);
> +      |                                              ^
> +vbuf_print.c:132:9: note: macro 'VBUF_SNPRINTF' defined here
> +  132 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \
> +
> +Previously checking condition will make #else branch is selected, and
> +NO_SNPRINTF is defined, and when NO_SNPRINTF is defined, VBUF_SNPRINTF
> +only take 4 arguments, and cause above failure. musl lib support
> +snprintf and we only have glibc and musl libc, so workaround by when
> +glibc is not defected, take it as musl lib, and select the #if branch.
> +
> +Upstream-Status: Pending [Reported to postfix-users@postfix.org]
> +
> +https://www.mail-archive.com/postfix-users@postfix.org/msg107898.html
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/util/sys_defs.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
> +index 1890577..c3527c9 100644
> +--- a/src/util/sys_defs.h
> ++++ b/src/util/sys_defs.h
> +@@ -794,7 +794,7 @@ extern int initgroups(const char *, int);
> + #define NATIVE_NEWALIAS_PATH "/usr/bin/newaliases"
> + #define NATIVE_COMMAND_DIR "/usr/sbin"
> + #define NATIVE_DAEMON_DIR "/usr/libexec/postfix"
> +-#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
> ++#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1) || !defined(__GLIBC__)
> + #define SOCKADDR_SIZE socklen_t
> + #define SOCKOPT_SIZE  socklen_t
> + #else
> +--
> +2.34.1
> +
> diff --git
> a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> index d46efb95cb..a74c46fa92 100644
> ---
> a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> +++
> b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> @@ -1,4 +1,4 @@
> -From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
> +From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
>  From: Li xin <lixin.fnst@cn.fujitsu.com>
>  Date: Fri, 19 Jun 2015 17:14:58 +0900
>  Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
> @@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>   2 files changed, 11 insertions(+), 9 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index a37f89f..17cb64b 100644
> +index 8d7501a..d2a85e8 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -22,7 +22,7 @@ META =3D meta/main.cf.proto meta/master.cf.proto
> meta/postfix-files \
> +@@ -23,7 +23,7 @@ META =3D meta/main.cf.proto meta/master.cf.proto
> meta/postfix-files \
>   EXPAND        =3D sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
>             -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
>   SHLIB_DIR_OVERRIDE =3D \
> @@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
>       "daemon_directory =3D $daemon_directory" \
>       "data_directory =3D $data_directory" \
>       "command_directory =3D $command_directory" \
> ---
> -2.25.1
> -
> diff --git
> a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch
> b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch
> index 6f8e3e84da..201b4741de 100644
> ---
> a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch
> +++
> b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch
> @@ -1,4 +1,4 @@
> -From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
> +From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 26 Aug 2017 10:29:37 -0700
>  Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
> @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
>  diff --git a/makedefs b/makedefs
> -index 28fb128..313b401 100644
> +index 9713327..e879832 100644
>  --- a/makedefs
>  +++ b/makedefs
> -@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
> +@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
>       exit(0);
>   }
>   EOF
> @@ -25,7 +25,7 @@ index 28fb128..313b401 100644
>                            rm -f makedefs.test makedefs.test.[co]
>                        fi;;
>                 esac
> -@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
> +@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
>       exit(0);
>   }
>   EOF
> @@ -34,7 +34,7 @@ index 28fb128..313b401 100644
>                    ./makedefs.test 2>/dev/null ||
>                         CCARGS=3D"$CCARGS -DNO_SIGSETJMP"
>                    rm -f makedefs.test makedefs.test.[co]
> -@@ -903,7 +903,7 @@ int main(int argc, char **argv)
> +@@ -952,7 +952,7 @@ int main(int argc, char **argv)
>                                   &error) !=3D 14);
>   }
>   EOF
> @@ -43,7 +43,7 @@ index 28fb128..313b401 100644
>                         $icu_ldflags >/dev/null 2>&1
>                     if ./makedefs.test 2>/dev/null ; then
>                         CCARGS=3D"$CCARGS $icu_cppflags"
> -@@ -1024,7 +1024,7 @@ int     main(void)
> +@@ -1088,7 +1088,7 @@ int     main(void)
>       exit(ferror(stdout) ? 1 : 0);
>   }
>   EOF
> @@ -52,7 +52,7 @@ index 28fb128..313b401 100644
>       ./makedefs.test || exit 1
>       rm -f makedefs.test makedefs.test.[co]
>   }
> -@@ -1180,7 +1180,7 @@ int     main(void)
> +@@ -1245,7 +1245,7 @@ int     main(void)
>       exit(ferror(stdout) ? 1 : 0);
>   }
>   EOF
> @@ -61,6 +61,3 @@ index 28fb128..313b401 100644
>         parm_val=3D`./makedefs.test` || exit 1
>         rm -f makedefs.test makedefs.test.[co]
>         eval ${parm_name}=3D\""\$parm_val"\"
> ---
> -2.25.1
> -
> diff --git
> a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
> b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
> index 0660ee098e..daf5c7089e 100644
> ---
> a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
> +++
> b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
> @@ -1,4 +1,4 @@
> -From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
> +From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 16 Jan 2022 11:21:54 +0800
>  Subject: [PATCH] Fix icu config
> @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/makedefs b/makedefs
> -index 313b401..e5db212 100644
> +index e879832..f9c132e 100644
>  --- a/makedefs
>  +++ b/makedefs
> -@@ -906,7 +906,6 @@ EOF
> +@@ -955,7 +955,6 @@ EOF
>                     ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c
> $icu_cppflags \
>                         $icu_ldflags >/dev/null 2>&1
>                     if ./makedefs.test 2>/dev/null ; then
> @@ -29,6 +29,3 @@ index 313b401..e5db212 100644
>                         SYSLIBS=3D"$SYSLIBS $icu_ldflags"
>                     else
>                         CCARGS=3D"$CCARGS -DNO_EAI"
> ---
> -2.25.1
> -
> diff --git
> a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch
> b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch
> index 1571aa844d..c2e640d6ff 100644
> ---
> a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch
> +++
> b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch
> @@ -1,4 +1,4 @@
> -From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
> +From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
>  From: Yi Zhao <yi.zhao@windriver.com>
>  Date: Fri, 12 Oct 2018 12:38:02 +0800
>  Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
> @@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   1 file changed, 2 insertions(+), 20 deletions(-)
>
>  diff --git a/makedefs b/makedefs
> -index e5db212..b00049b 100644
> +index f9c132e..5ebef5b 100644
>  --- a/makedefs
>  +++ b/makedefs
> -@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
> +@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
>                     SYSLIBS=3D"$SYSLIBS -ldb"
>                     ;;
>                 esac
> @@ -35,7 +35,7 @@ index e5db212..b00049b 100644
>                 # Kernel 2.4 added IPv6
>                 case "$RELEASE" in
>                 2.[0-3].*) CCARGS=3D"$CCARGS -DNO_IPV6";;
> -@@ -655,16 +646,7 @@ EOF
> +@@ -703,16 +694,7 @@ EOF
>                     SYSLIBS=3D"$SYSLIBS -ldb"
>                     ;;
>                 esac
> @@ -53,6 +53,3 @@ index e5db212..b00049b 100644
>                 SYSLIBS=3D"$SYSLIBS -ldl"
>                 : ${SHLIB_SUFFIX=3D.so}
>                 : ${SHLIB_CFLAGS=3D-fPIC}
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
> b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> similarity index 98%
> rename from meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
> rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> index a66ecc0b5d..14fec1b276 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> @@ -26,9 +26,10 @@ SRC_URI =3D "
> http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
>
> file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
>             file://0004-Fix-icu-config.patch \
>
> file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
> +           file://0001-sys_defs.h-workaround-for-musl-lib.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c"
> +SRC_URI[sha256sum] =3D
> "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3aa4207778"
>
>  UPSTREAM_CHECK_URI =3D "https://www.postfix.org/announcements.html"
>  UPSTREAM_CHECK_REGEX =3D "postfix-(?P<pver>\d+(\.\d+)+)"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126883):
> https://lists.openembedded.org/g/openembedded-devel/message/126883
> Mute This Topic: https://lists.openembedded.org/mt/119292155/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002cecb60651adebd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase on top of latest master and resend please</d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, May 12, 2026 at 8:12=E2=80=AFPM Changqing Li via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;<=
a href=3D"http://changqing.li">changqing.li</a>=3D<a href=3D"mailto:windriv=
er.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* Refres=
h patch to mute patch-fuzz<br>
* Add patch 0001-sys_defs.h-workaround-for-musl-lib.patch to workaround<br>
=C2=A0 for musl lib<br>
* This upgrade include the following commit, which make postfix can<br>
=C2=A0 compile on latest stable ubuntu 26.04, which have Linux 7.x kernel<b=
r>
<br>
=C2=A0 Postfix works on Linux 7.x kernels. Frank Scheiner. Files:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 makedefs, util/sys_defs.h.<br>
<br>
Changes:<br>
<a href=3D"https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HIS=
TORY" rel=3D"noreferrer" target=3D"_blank">https://www.ftp.saix.net/MTA/pos=
tfix/official/postfix-3.11.2.HISTORY</a><br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../postfix/files/0001-Fix-makedefs.patch=C2=A0 =C2=A0 =C2=A0| 25 +++=
++------<br>
=C2=A0...1-sys_defs.h-workaround-for-musl-lib.patch | 43 ++++++++++++++++++=
+<br>
=C2=A0...tconf-to-a-variable-for-cross-compil.patch |=C2=A0 9 ++--<br>
=C2=A0...tive-compiler-to-build-makedefs.test.patch | 17 +++-----<br>
=C2=A0.../postfix/files/0004-Fix-icu-config.patch=C2=A0 =C2=A0|=C2=A0 9 ++-=
-<br>
=C2=A0...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 ++---<br>
=C2=A0.../{<a href=3D"http://postfix_3.10.8.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.8.bb</a> =3D&gt; <a href=3D"http://postfix_3.11.2.=
bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.11.2.bb</a>}=C2=A0 |=C2=
=A0 3 +-<br>
=C2=A07 files changed, 73 insertions(+), 44 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/postfix/files/0001=
-sys_defs.h-workaround-for-musl-lib.patch<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.10.8.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.8.bb</a> =
=3D&gt; <a href=3D"http://postfix_3.11.2.bb" rel=3D"noreferrer" target=3D"_=
blank">postfix_3.11.2.bb</a>} (98%)<br>
<br>
diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedef=
s.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.p=
atch<br>
index 785fe87452..4e187849dc 100644<br>
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch=
<br>
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch=
<br>
@@ -1,4 +1,4 @@<br>
-From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001<br>
+From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" target=
=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
=C2=A0Date: Fri, 19 Jun 2015 16:45:54 +0900<br>
=C2=A0Subject: [PATCH] Fix makedefs<br>
@@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao &lt;<a href=3D"mailto:yao.zhao@=
windriver.com" target=3D"_blank">yao.zhao@windriver.com</a>&gt;<br>
=C2=A0 1 file changed, 11 insertions(+), 16 deletions(-)<br>
<br>
=C2=A0diff --git a/makedefs b/makedefs<br>
-index a740e41..28fb128 100644<br>
+index d5103ce..9713327 100644<br>
=C2=A0--- a/makedefs<br>
=C2=A0+++ b/makedefs<br>
-@@ -230,9 +230,6 @@ echo &quot;# pie=3D$pie&quot;<br>
+@@ -232,9 +232,6 @@ echo &quot;# pie=3D$pie&quot;<br>
<br>
=C2=A0 # Defaults for most sane systems<br>
<br>
@@ -32,7 +32,7 @@ index a740e41..28fb128 100644<br>
=C2=A0 ARFL=3Drv<br>
<br>
=C2=A0 # Ugly function to make our error message more visible among the<br>
-@@ -563,12 +560,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
+@@ -608,12 +605,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$CCARGS&=
quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*-DNO_DB*) ;;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*-DHAS_DB*) ;=
;<br>
@@ -48,8 +48,8 @@ index a740e41..28fb128 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # No, we&#39;re not going to try db1 db2 db3 etc.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # On a properly installed system, Postfix builds<br>
-@@ -577,12 +574,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Install the appropriate db*-devel package first.&quot;=
 1&gt;&amp;2<br>
+@@ -623,12 +620,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Alternatively, build with CCARGS=3D\&quot;-NO_DB ...\&=
quot;&quot; 1&gt;&amp;2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br=
>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSLI=
BS=3D&quot;-ldb&quot;<br>
@@ -63,7 +63,7 @@ index a740e41..28fb128 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 test -e $lib/lib$name.a -o -e $lib/lib$name.so &amp;&amp; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SYSLIBS=3D&quot;$SYSLIBS -l$name&quot;<br>
-@@ -602,7 +599,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
+@@ -648,7 +645,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ `expr &quot;X$CCARGS&quot; : &quot;X.*-DNO_EPOLL&quot;` -gt =
0 ]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0:<br>
@@ -72,7 +72,7 @@ index a740e41..28fb128 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0echo CCARGS=3D&quot;$CCARGS -DNO_EPOLL&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
-@@ -626,8 +623,6 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv)<br>
+@@ -672,8 +669,6 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv)<br>
=C2=A0 }<br>
=C2=A0 EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${CC-gcc} -o makedefs.test makedefs.test.c || exit =
1<br>
@@ -81,7 +81,7 @@ index a740e41..28fb128 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0rm -f makedefs.test makedefs.test.[co]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
-@@ -644,12 +639,12 @@ EOF<br>
+@@ -690,12 +685,12 @@ EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$CCARGS&=
quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*-DNO_DB*) ;;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*-DHAS_DB*) ;=
;<br>
@@ -97,8 +97,8 @@ index a740e41..28fb128 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # On a properly installed system, Postfix builds<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # by including &lt;db.h&gt; and by linking with -ldb<br>
-@@ -657,12 +652,12 @@ EOF<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Install the appropriate db*-devel package first.&quot;=
 1&gt;&amp;2<br>
+@@ -705,12 +700,12 @@ EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;See: <a href=3D"https://www.postfix.org/NON_BERKELEYDB=
_README.html#build-conf" rel=3D"noreferrer" target=3D"_blank">https://www.p=
ostfix.org/NON_BERKELEYDB_README.html#build-conf</a>&quot; 1&gt;&amp;2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br=
>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSLI=
BS=3D&quot;-ldb&quot;<br>
@@ -112,6 +112,3 @@ index a740e41..28fb128 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 test -e $lib/lib$name.a -o -e $lib/lib$name.so &amp;&amp; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SYSLIBS=3D&quot;$SYSLIBS -l$name&quot;<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-=
workaround-for-musl-lib.patch b/meta-networking/recipes-daemons/postfix/fil=
es/0001-sys_defs.h-workaround-for-musl-lib.patch<br>
new file mode 100644<br>
index 0000000000..b7a8e05165<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaro=
und-for-musl-lib.patch<br>
@@ -0,0 +1,43 @@<br>
+From ce15792203ae0c787e3602d6d38a892ea1ce31ce Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Tue, 12 May 2026 15:04:55 +0800<br>
+Subject: [PATCH] sys_defs.h: workaround for musl lib<br>
+<br>
+Fix musl lib compile failure:<br>
+vbuf_print.c:215:46: error: macro &#39;VBUF_SNPRINTF&#39; passed 5 argumen=
ts, but takes just 4<br>
+=C2=A0 215 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0VSTRING_ADDNUM(fmt, width);<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
+vbuf_print.c:132:9: note: macro &#39;VBUF_SNPRINTF&#39; defined here<br>
+=C2=A0 132 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \<br>
+<br>
+Previously checking condition will make #else branch is selected, and<br>
+NO_SNPRINTF is defined, and when NO_SNPRINTF is defined, VBUF_SNPRINTF<br>
+only take 4 arguments, and cause above failure. musl lib support<br>
+snprintf and we only have glibc and musl libc, so workaround by when<br>
+glibc is not defected, take it as musl lib, and select the #if branch.<br>
+<br>
+Upstream-Status: Pending [Reported to <a href=3D"mailto:postfix-users@post=
fix.org" target=3D"_blank">postfix-users@postfix.org</a>]<br>
+<br>
+<a href=3D"https://www.mail-archive.com/postfix-users@postfix.org/msg10789=
8.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/p=
ostfix-users@postfix.org/msg107898.html</a><br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ src/util/sys_defs.h | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h<br>
+index 1890577..c3527c9 100644<br>
+--- a/src/util/sys_defs.h<br>
++++ b/src/util/sys_defs.h<br>
+@@ -794,7 +794,7 @@ extern int initgroups(const char *, int);<br>
+ #define NATIVE_NEWALIAS_PATH &quot;/usr/bin/newaliases&quot;<br>
+ #define NATIVE_COMMAND_DIR &quot;/usr/sbin&quot;<br>
+ #define NATIVE_DAEMON_DIR &quot;/usr/libexec/postfix&quot;<br>
+-#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)<br>
++#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1) || !defined(__GLIBC__)<br>
+ #define SOCKADDR_SIZE socklen_t<br>
+ #define SOCKOPT_SIZE=C2=A0 socklen_t<br>
+ #else<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixe=
d-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-d=
aemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-com=
pil.patch<br>
index d46efb95cb..a74c46fa92 100644<br>
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postc=
onf-to-a-variable-for-cross-compil.patch<br>
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postc=
onf-to-a-variable-for-cross-compil.patch<br>
@@ -1,4 +1,4 @@<br>
-From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001<br>
+From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" target=
=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
=C2=A0Date: Fri, 19 Jun 2015 17:14:58 +0900<br>
=C2=A0Subject: [PATCH] Change fixed postconf to a variable for cross-compil=
ing<br>
@@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao &lt;<a href=3D"mailto:yao.zhao@=
windriver.com" target=3D"_blank">yao.zhao@windriver.com</a>&gt;<br>
=C2=A0 2 files changed, 11 insertions(+), 9 deletions(-)<br>
<br>
=C2=A0diff --git a/Makefile.in b/Makefile.in<br>
-index a37f89f..17cb64b 100644<br>
+index 8d7501a..d2a85e8 100644<br>
=C2=A0--- a/Makefile.in<br>
=C2=A0+++ b/Makefile.in<br>
-@@ -22,7 +22,7 @@ META =3D meta/main.cf.proto meta/master.cf.proto meta/po=
stfix-files \<br>
+@@ -23,7 +23,7 @@ META =3D meta/main.cf.proto meta/master.cf.proto meta/po=
stfix-files \<br>
=C2=A0 EXPAND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sed -e &quot;s;\$${LIB_PREFIX}=
;$(LIB_PREFIX);&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s;\$${LIB_SUFFIX};$(LIB_=
SUFFIX);&quot;<br>
=C2=A0 SHLIB_DIR_OVERRIDE =3D \<br>
@@ -102,6 +102,3 @@ index 563ee27..00d4651 100644<br>
=C2=A0 =C2=A0 =C2=A0 &quot;daemon_directory =3D $daemon_directory&quot; \<b=
r>
=C2=A0 =C2=A0 =C2=A0 &quot;data_directory =3D $data_directory&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 &quot;command_directory =3D $command_directory&quot; \=
<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Us=
e-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-da=
emons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.tes=
t.patch<br>
index 6f8e3e84da..201b4741de 100644<br>
--- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-nativ=
e-compiler-to-build-makedefs.test.patch<br>
+++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-nativ=
e-compiler-to-build-makedefs.test.patch<br>
@@ -1,4 +1,4 @@<br>
-From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001<br>
+From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 26 Aug 2017 10:29:37 -0700<br>
=C2=A0Subject: [PATCH] makedefs: Use native compiler to build makedefs.test=
<br>
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/makedefs b/makedefs<br>
-index 28fb128..313b401 100644<br>
+index 9713327..e879832 100644<br>
=C2=A0--- a/makedefs<br>
=C2=A0+++ b/makedefs<br>
-@@ -622,7 +622,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv)<br>
+@@ -668,7 +668,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 exit(0);<br>
=C2=A0 }<br>
=C2=A0 EOF<br>
@@ -25,7 +25,7 @@ index 28fb128..313b401 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0rm -f makedefs.test makedefs.test.[co]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
-@@ -865,7 +865,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv)<br>
+@@ -914,7 +914,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 exit(0);<br>
=C2=A0 }<br>
=C2=A0 EOF<br>
@@ -34,7 +34,7 @@ index 28fb128..313b401 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0./make=
defs.test 2&gt;/dev/null ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CCARGS=3D&quot;$CCARGS -DNO_SIGSETJMP&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f =
makedefs.test makedefs.test.[co]<br>
-@@ -903,7 +903,7 @@ int main(int argc, char **argv)<br>
+@@ -952,7 +952,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error) !=3D 14);<br>
=C2=A0 }<br>
=C2=A0 EOF<br>
@@ -43,7 +43,7 @@ index 28fb128..313b401 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $icu_ldflags &gt;/dev/null 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ./=
makedefs.test 2&gt;/dev/null ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CCARGS=3D&quot;$CCARGS $icu_cppflags&quot;<br>
-@@ -1024,7 +1024,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)<br>
+@@ -1088,7 +1088,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)<br>
=C2=A0 =C2=A0 =C2=A0 exit(ferror(stdout) ? 1 : 0);<br>
=C2=A0 }<br>
=C2=A0 EOF<br>
@@ -52,7 +52,7 @@ index 28fb128..313b401 100644<br>
=C2=A0 =C2=A0 =C2=A0 ./makedefs.test || exit 1<br>
=C2=A0 =C2=A0 =C2=A0 rm -f makedefs.test makedefs.test.[co]<br>
=C2=A0 }<br>
-@@ -1180,7 +1180,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)<br>
+@@ -1245,7 +1245,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)<br>
=C2=A0 =C2=A0 =C2=A0 exit(ferror(stdout) ? 1 : 0);<br>
=C2=A0 }<br>
=C2=A0 EOF<br>
@@ -61,6 +61,3 @@ index 28fb128..313b401 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 parm_val=3D`./makedefs.test` || exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f makedefs.test makedefs.test.[co]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 eval ${parm_name}=3D\&quot;&quot;\$parm_val&quo=
t;\&quot;<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-con=
fig.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-conf=
ig.patch<br>
index 0660ee098e..daf5c7089e 100644<br>
--- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.pat=
ch<br>
+++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.pat=
ch<br>
@@ -1,4 +1,4 @@<br>
-From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001<br>
+From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 16 Jan 2022 11:21:54 +0800<br>
=C2=A0Subject: [PATCH] Fix icu config<br>
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/makedefs b/makedefs<br>
-index 313b401..e5db212 100644<br>
+index e879832..f9c132e 100644<br>
=C2=A0--- a/makedefs<br>
=C2=A0+++ b/makedefs<br>
-@@ -906,7 +906,6 @@ EOF<br>
+@@ -955,7 +955,6 @@ EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BUI=
LD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $icu_ldflags &gt;/dev/null 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ./=
makedefs.test 2&gt;/dev/null ; then<br>
@@ -29,6 +29,3 @@ index 313b401..e5db212 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 SYSLIBS=3D&quot;$SYSLIBS $icu_ldflags&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CCARGS=3D&quot;$CCARGS -DNO_EAI&quot;<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-ad=
d-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-da=
emons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-defaul=
t.patch<br>
index 1571aa844d..c2e640d6ff 100644<br>
--- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-=
and-lresolv-to-SYSLIBS-by-default.patch<br>
+++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-=
and-lresolv-to-SYSLIBS-by-default.patch<br>
@@ -1,4 +1,4 @@<br>
-From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001<br>
+From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"=
_blank">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0Date: Fri, 12 Oct 2018 12:38:02 +0800<br>
=C2=A0Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by defau=
lt<br>
@@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@wi=
ndriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 20 deletions(-)<br>
<br>
=C2=A0diff --git a/makedefs b/makedefs<br>
-index e5db212..b00049b 100644<br>
+index f9c132e..5ebef5b 100644<br>
=C2=A0--- a/makedefs<br>
=C2=A0+++ b/makedefs<br>
-@@ -577,16 +577,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
+@@ -623,16 +623,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSLI=
BS=3D&quot;$SYSLIBS -ldb&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
@@ -35,7 +35,7 @@ index e5db212..b00049b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Kernel 2.4 added =
IPv6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$RELEASE=
&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2.[0-3].*) CCARGS=
=3D&quot;$CCARGS -DNO_IPV6&quot;;;<br>
-@@ -655,16 +646,7 @@ EOF<br>
+@@ -703,16 +694,7 @@ EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSLI=
BS=3D&quot;$SYSLIBS -ldb&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
@@ -53,6 +53,3 @@ index e5db212..b00049b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSLIBS=3D&quot;$SY=
SLIBS -ldl&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : ${SHLIB_SUFFIX=3D=
.so}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : ${SHLIB_CFLAGS=3D=
-fPIC}<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta-networking/recipes-daemons/postfix/<a href=3D"http://post=
fix_3.10.8.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.8.bb</a> b=
/meta-networking/recipes-daemons/postfix/<a href=3D"http://postfix_3.11.2.b=
b" rel=3D"noreferrer" target=3D"_blank">postfix_3.11.2.bb</a><br>
similarity index 98%<br>
rename from meta-networking/recipes-daemons/postfix/<a href=3D"http://postf=
ix_3.10.8.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.8.bb</a><br=
>
rename to meta-networking/recipes-daemons/postfix/<a href=3D"http://postfix=
_3.11.2.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.11.2.bb</a><br>
index a66ecc0b5d..14fec1b276 100644<br>
--- a/meta-networking/recipes-daemons/postfix/<a href=3D"http://postfix_3.1=
0.8.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.8.bb</a><br>
+++ b/meta-networking/recipes-daemons/postfix/<a href=3D"http://postfix_3.1=
1.2.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.11.2.bb</a><br>
@@ -26,9 +26,10 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.porcupine.org/mi=
rrors/postfix-release/official/postfix-$%7BP" rel=3D"noreferrer" target=3D"=
_blank">http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-$=
{P</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-makedefs-Use-native-c=
ompiler-to-build-makedefs.test.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Fix-icu-config.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-makedefs-add-lnsl-and=
-lresolv-to-SYSLIBS-by-default.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-sys_defs.h-workaround=
-for-musl-lib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;31d4b3eb8093d823b5a151f571719ff7c0462571bc95e=
6440d87ca525bfb096c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;daed65b08c9288cdb386a914f3e52cdddd44935407b5c=
e5aee8bcc3aa4207778&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.postfix.org/annou=
ncements.html" rel=3D"noreferrer" target=3D"_blank">https://www.postfix.org=
/announcements.html</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;postfix-(?P&lt;pver&gt;\d+(\.\d+)+)&qu=
ot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126883): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126883" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126883</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119292155/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119292155/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002cecb60651adebd3--

