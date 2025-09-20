Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1427ACAC597
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 05:49:41 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.4432.1758347375628105115
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 22:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YoscsRl8;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-330d1565844so1903118fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 22:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758347375; x=1758952175; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MPXp6RAHJv+XBFlx7913OB7m+lpVWM9L25A8l5MdE4=;
        b=YoscsRl84lkBv3yBpcJXEwB9yXhKbALU1K1APOhnHwbEPyHjoCINTg9z3q9oiM1JpQ
         PoWj9s8OgDBGG/XGW1/+oPhke7czfqM3GFBe6C2mYeJh5wUyFqjIHMHuqq5jNLN0jGrz
         +B+1gbYbEpXSy3WpY8nDxJZrXS3sXVXAB9VGZCC8Q6i6T1GuO+pAtYdnhaaEfI9XV3oJ
         yaaVUC0Gbyl+YqOYdjN6o4ob6+jCCfJvWHa7QjInSk33JOwPlfT4wJsKbqL+2oBfBNYL
         4W6FOnASCxRJoDx7iOQJYOGnJWBss3e1f/OAik+OtGPt4gX+R5mzLdECq5Sa9q4Xbfft
         h0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758347375; x=1758952175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MPXp6RAHJv+XBFlx7913OB7m+lpVWM9L25A8l5MdE4=;
        b=IZ8u1DWbC7XwWLfZNMiaKq1oPPe8FsSchI+S3IQJ7P+WOLFQvO2Nh5JkYqqblJU0l/
         5TdfBbij8FRnw2Gc5yND/dIntkPIAi6I5lHTGCkNeSFIgZtsTio5hTCSVwDxy1sCf8sm
         YUJQJtcBqhmbzqwBNmjngFicEW8cz44SESuJZGymcPtHpCIdJZpcvHi6kexw89L8iFvr
         bE8VcLHuOvoG09yb/OqrkgRU2RAI7s0iFwpmAh3wjm5xEZC5n97I4hN1LZh/QmpCxTIL
         NjRquSR0Kz4TLQIVHsJpy5+f0EKGh3CiILQy6RACy4f0TfRfcobKsJUUzB941AVJzrys
         02SQ==
X-Gm-Message-State: AOJu0Yyal0EGDZ2xr1oLIiQBSPQZMtiZbPc+qStepOD9BDZ2twIS8B+L
	LOR6EBNQdhSPgloIYhzHjtW/i6KxgHro0Zk6XM5vjahgSMu9iz1i9Yb/XJvrXF5HhrO7ufvZ2Cs
	wjcBziCvDmmUu0C5+6LedvkR13O53rDU=
X-Gm-Gg: ASbGncu2kXJnNnITi3Y8fNZTjWZC9kLlwGM2qv9i+Y1FNrB/K65hawX+zEfyPblhNzJ
	31LXVFqd6o12RYLfHAanR6X57uCpqonKoftflH4hxCocHFYpZNGfReUGRh8OgnA0VUG2+QX3XX+
	i+4aSFuKxMbqSjZostyoBP5Lvv5Xm0xdRpewl6ivrbCwqwHBivf112OLH+DlK9y/VbXfXrDgFdQ
	MvbRetgB5MwGecnpkpH
X-Google-Smtp-Source: AGHT+IGbhw6cvqe4oG6/VRTeb/f6r1BElUcGamrIvjwVlbpoUlUKQuPmxW/gnvn1EypFMQ7tKD3C/5z++jO0pvDMn4s=
X-Received: by 2002:a05:6871:a101:b0:30b:ca29:cf8d with SMTP id
 586e51a60fabf-33bb4412e3emr2936973fac.35.1758347374808; Fri, 19 Sep 2025
 22:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250919141342.934718-1-skandigraun@gmail.com>
In-Reply-To: <20250919141342.934718-1-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 20 Sep 2025 17:49:23 +1200
X-Gm-Features: AS18NWDpp_y8Osk0eaJydNmEU0Cl_OLGfDB1g8JrQIpN6zHnHfpf7zg0DOI4XxQ
Message-ID: <CADySD0EYbcRrPWrh4HcaGmf5dzdxed6c17JDoY1-icTZDi7rJw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] daemonize: update to latest revision
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 05:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119617

Please also submit this patch for walnascar, kirkstone and scarthgap
branches as well.

On Sat, Sep 20, 2025 at 2:13=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Drop a patch that has been incorporated into this version.
>
> (That is also the changelog - the only change is the accepted patch)
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...-many-arguments-to-function-write-er.patch | 46 -------------------
>  .../daemonize/daemonize_git.bb                |  3 +-
>  2 files changed, 1 insertion(+), 48 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/daemonize/daemonize/0001-fix-=
getopt.c-too-many-arguments-to-function-write-er.patch
>
> diff --git a/meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.=
c-too-many-arguments-to-function-write-er.patch b/meta-oe/recipes-support/d=
aemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-e=
r.patch
> deleted file mode 100644
> index 3a79dba682..0000000000
> --- a/meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-m=
any-arguments-to-function-write-er.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From c47fdcc0a900aea93b1967c20db42743171ab1ac Mon Sep 17 00:00:00 2001
> -From: "mark.yang" <mark.yang@lge.com>
> -Date: Thu, 27 Mar 2025 16:46:42 +0900
> -Subject: [PATCH] fix getopt.c too many arguments to function 'write' err=
or in
> - gcc-15.0.1
> -
> -In the original code, write() was declared as 'extern int write();',
> -which is interpreted as a function taking no parameters.
> -This caused errors when actually calling it with 3 parameters.
> -The current fix to declare it as 'extern int write(int, const void *, un=
signed);'
> -is the correct solution.
> -This properly defines the write function to accept 3 parameters.
> -
> -../git/getopt.c: In function 'x_getopt':
> -../git/getopt.c:51:16: error: too many arguments to function 'write'; ex=
pected 0, have 3
> -   51 |         (void) write(2, argv[0], (unsigned)strlen(argv[0]));\
> -      |                ^~~~~ ~
> -../git/getopt.c:78:17: note: in expansion of macro 'ERR'
> -   78 |                 ERR(": illegal option -- ", c);
> -      |                 ^~~
> -../git/getopt.c:48:20: note: declared here
> -   48 |         extern int write();\
> -      |                    ^~~~~
> -
> -Upstream-Status: Submitted [https://github.com/bmc/daemonize/pull/37]
> -Signed-off-by: mark.yang <mark.yang@lge.com>
> ----
> - getopt.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/getopt.c b/getopt.c
> -index 3f37c55..f298da7 100644
> ---- a/getopt.c
> -+++ b/getopt.c
> -@@ -45,7 +45,7 @@
> - #include <string.h>
> -
> - #define ERR(s, c)     if(x_opterr){\
> --      extern int write();\
> -+      extern int write(int, const void *, unsigned);\
> -       char errbuf[2];\
> -       errbuf[0] =3D c; errbuf[1] =3D '\n';\
> -       (void) write(2, argv[0], (unsigned)strlen(argv[0]));\
> ---
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe=
/recipes-support/daemonize/daemonize_git.bb
> index bae04ca7a3..fef237e882 100644
> --- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
> +++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
> @@ -6,10 +6,9 @@ PV =3D "1.7.8"
>
>  inherit autotools
>
> -SRCREV =3D "18869a797dab12bf1c917ba3b4782fef484c407c"
> +SRCREV =3D "58237626e6999e68b9583ed1b4b08136f118f68c"
>  SRC_URI =3D " \
>      git://github.com/bmc/daemonize.git;branch=3Dmaster;protocol=3Dhttps =
\
> -    file://0001-fix-getopt.c-too-many-arguments-to-function-write-er.pat=
ch \
>  "
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119607): https://lists.openembedded.org/g/openembedde=
d-devel/message/119607
> Mute This Topic: https://lists.openembedded.org/mt/115328462/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

