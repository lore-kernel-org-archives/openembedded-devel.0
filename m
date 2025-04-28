Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAADBC369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 14:01:19 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.49128.1745848877691992618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 07:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ugbkhaet;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-605fda00c30so2579157eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745848877; x=1746453677; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75Y6TneDyNbbvkZlBRAj8rYXCd6CKfnEITy2/ACrzRY=;
        b=Ugbkhaet3QkPxrUzkCKh5w3+HroEBBoKf1ZFydgUrTyries4mozmVF3lpRXG6l3U4r
         N9t/gzEsQZ9DtGaBtRMiv2QV8u6b1dS2NgDTYsqiDjFBkAs9fuk1AO/lg6+NgZbQmh+E
         0tWNbSz5GHavYsTndJlmjdVss/PGAhRRyTcFGOR4DRXR8btKr/IMwS7YL3GyvML/Cgw/
         C6EqGlL5M2tH1S8iD2IETQcuPf4rNKE9m2Q8jFStmacABgcewJ/OXuajD64OaTB0kU/L
         wwxKfZfJthY/sv3K7T50I7rFA+BcQENv9UV+lGCOv9YBhMI4+Q6n1xBo57ZbjQHjDE9f
         uZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848877; x=1746453677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75Y6TneDyNbbvkZlBRAj8rYXCd6CKfnEITy2/ACrzRY=;
        b=S4FBk76/zlLANtZ4gRhqpF+bptnY/hkhZr1krM3wBmc4Z9E7zARyPvqMMUqlWecgz7
         TzYzKmack+ThqNpVy/bMg4xVGlQIDiQEwZqF8arSPYSME2nfB728NXD+5R5ygOLij02y
         BjEfJfYZue0QqTfFVNhiK6+zuvigvbyg9xeOFwdPYZETLQnKuYlIiRR6/UZxFtC7p2KS
         HMp7XN2A9TFRLoDX5DYTIRoWnQ7hexqbfpztnGrCvtm+jYHckfrRy7uZUuTBHMMB1/b5
         ILhJTz6O3+SkimDrHAjsjk2tC7daSkUGQShCk2AsxUspyGCsgd6jJ4cqC+BHEUexXyoP
         ehDQ==
X-Gm-Message-State: AOJu0YzW5+asXBuK+Ff5Qfs++J/vDopaAlAw2/Z8yH3AK720ixzZp8qb
	rd+SEz31rKPvUW054GS6+k7EfZ35d5svOw6oDIdOKrzbIt0UTY/S3wwCdi4rjrjVbsmuL1b1lQt
	DcufgQwgNgFkCVAFiP2pdFymmVnhkUB3g
X-Gm-Gg: ASbGncu/m1ge77WnIzRO0MabAA3OH7bYQ1yWcf+1QtNWAo+vtF+uCjuNFPkrM1m/CfJ
	hfL1j4qIQhy8e10cfw/nvGHus3DZgsaq2D42RJL86cPAS+WqHn5I/mAHCodjJ26ed9mWls/qU8P
	k2PSaT4tf+fiTKG7YeBEF2Jg==
X-Google-Smtp-Source: AGHT+IEI/aXNaTRDmJX2PKpbui79TAZsgQUHESQ7/yvgr9ARqd39asEeV6VaQ6gaITcdtqp4Isxj484MaBZfUjx72n8=
X-Received: by 2002:a05:6820:4d04:b0:606:42b7:2b02 with SMTP id
 006d021491bc7-60652badbc0mr6640090eaf.3.1745848874940; Mon, 28 Apr 2025
 07:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250316212656.3179516-1-raj.khem@gmail.com> <20250316212656.3179516-4-raj.khem@gmail.com>
 <TYWPR01MB11861ED8AE1726DF04016BD12DC812@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861ED8AE1726DF04016BD12DC812@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 07:00:48 -0700
X-Gm-Features: ATxdqUGqFLsdLJUTIOMlLEojQjypOeR2tbLWqzbTpoKkIM7NZ0IMGktv9PYYmvc
Message-ID: <CAMKF1spjySkFhHvVSru1p+SsNHEDyagL4_P9B7=W0X5uM+9FDA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 4/4] procmail: Fix build with GCC-14
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 14:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117197

On Mon, Apr 28, 2025 at 2:02=E2=80=AFAM Mingyu Wang (Fujitsu)
<wangmy@fujitsu.com> wrote:
>
> >  do_compile() {
> > -    oe_runmake -i CFLAGS=3D"$TARGET_CFLAGS -Wno-comments
> > -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURC=
E
> > -D_FILE_OFFSET_BITS=3D64" LDFLAGS0=3D"${LDFLAGS}"
> > +    oe_runmake -i CFLAGS=3D"$TARGET_CFLAGS -Wno-comments
> > -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE
> > -D_FILE_OFFSET_BITS=3D64" LDFLAGS0=3D"${LDFLAGS}"
>
> -Wno-implicit-int cannot be deleted.
> Because although bitbake did not exit, if this option is removed, do_comp=
ile will reveal an error that caused procmail to not generate.
> You can check log.do.compile to confirm this issue.

interesting. Please send a patch to reinstate it.?

>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org
> > <openembedded-devel@lists.openembedded.org> On Behalf Of Khem Raj via
> > lists.openembedded.org
> > Sent: Monday, March 17, 2025 5:27 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: [oe] [meta-oe][PATCH 4/4] procmail: Fix build with GCC-14
> >
> > aids building on newer build hosts which now have moved to gcc-14 as we=
ll, so
> > using cmdline option just for target compile is not enough as it runs t=
ests using
> > host compiler as well
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../procmail/procmail/gcc14.patch             | 127
> > ++++++++++++++++++
> >  .../recipes-support/procmail/procmail_3.22.bb |   4 +-
> >  2 files changed, 130 insertions(+), 1 deletion(-)  create mode 100644
> > meta-oe/recipes-support/procmail/procmail/gcc14.patch
> >
> > diff --git a/meta-oe/recipes-support/procmail/procmail/gcc14.patch
> > b/meta-oe/recipes-support/procmail/procmail/gcc14.patch
> > new file mode 100644
> > index 0000000000..5ca56fa006
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/procmail/procmail/gcc14.patch
> > @@ -0,0 +1,127 @@
> > +From: Santiago Vila <sanvila@debian.org>
> > +Subject: Fix build with gcc-14
> > +Bug-Debian: https://bugs.debian.org/1075398
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +--- a/initmake
> > ++++ b/initmake
> > +@@ -124,7 +124,7 @@ else
> > + fi
> > +
> > + cat >_autotst.c <<HERE
> > +-main()
> > ++int main()
> > + { return 0;
> > + }
> > + HERE
> > +@@ -200,7 +200,7 @@ cat >_autotst.c <<HERE  #include <sys/types.h>
> > +#include <stdio.h>  #include <sys/stat.h>
> > +-main()
> > ++int main()
> > + { struct stat buf;return!&buf;
> > + }
> > + HERE
> > +--- a/src/autoconf
> > ++++ b/src/autoconf
> > +@@ -414,6 +414,12 @@ cat >_autotst.c <<HERE  int
> > +dolock,child[NR_of_forks],timeout,fdcollect;
> > + char dirlocktest[]=3D"_locktest";
> > +
> > ++#include <stdlib.h>
> > ++int killchildren();
> > ++int fdlock(int fd);
> > ++int sfdlock(int fd);
> > ++int fdunlock();
> > ++
> > + void stimeout()
> > + { timeout=3D1;close(fdcollect);killchildren();
> > + }
> > +@@ -435,7 +441,7 @@ unsigned sfork()
> > +   return pid;
> > + }
> > +
> > +-int main(argc,argv)char*argv[];
> > ++int main(int argc,char*argv[])
> > + { int goodlock,testlock,i,pip[2],pipw[2];time_t otimet;unsigned dtime=
t;
> > +   static char filename[]=3D"_locktst.l0";
> > +   close(0);goodlock=3D0;testlock=3DFIRST_lock;signal(SIGPIPE,SIG_DFL)=
;
> > +@@ -585,13 +591,13 @@ int killchildren()
> > +   return 0;
> > + }
> > +
> > +-int sfdlock(fd)
> > ++int sfdlock(int fd)
> > + { int i;unsigned gobble[GOBBLE>>2];
> > +   for(i=3DGOBBLE>>2;i;gobble[--i]=3D~(unsigned)0);               /* S=
unOS crash
> > test */
> > +   return fdlock(fd);
> > + }
> > +
> > +-static oldfdlock;
> > ++static int oldfdlock;
> > + #ifdef F_SETLKW
> > + static struct flock flck;           /* why can't it be a local variab=
le? */
> > + #endif
> > +@@ -599,7 +605,7 @@ static struct flock flck;                /* why ca=
n't
> > + static off_t oldlockoffset;
> > + #endif
> > +
> > +-int fdlock(fd)
> > ++int fdlock(int fd)
> > + { int i;unsigned gobble[GOBBLE>>2];
> > +   for(i=3DGOBBLE>>2;i;gobble[--i]=3D~(unsigned)0);               /* S=
unOS crash
> > test */
> > +   oldfdlock=3Dfd;fd=3D0;
> > +@@ -993,11 +999,11 @@ int main(){int i;i=3D1;
> > +  i+=3DWIFEXITED(i);
> > +  i+=3DWIFSTOPPED(i);
> > +  i+=3DWEXITSTATUS(i);
> > +- i+=3DWSIGTERM(i);
> > ++ i+=3DWTERMSIG(i);
> > +  return i;}
> > + HERE
> > +
> > +-echo 'Testing for WIFEXITED(), WIFSTOPPED(), WEXITSTATUS() & WSIGTERM=
()'
> > ++echo 'Testing for WIFEXITED(), WIFSTOPPED(), WEXITSTATUS() &
> > WTERMSIG()'
> > + if $MAKE _autotst.$O >_autotst.rrr 2>&1  then
> > +    $FGREP -v include/ <_autotst.rrr >_autotst.$O @@ -1029,6 +1035,8 @=
@
> > +cat >_autotst.c <<HERE  #ifndef NO_COMSAT  #include "network.h"
> > + #endif
> > ++int setrgid();
> > ++int setresgid();
> > + int main(){char a[2];
> > +  endpwent();endgrent();memmove(a,"0",1);bcopy("0",a,1);strcspn(a,"0")=
;
> > +
> > +strtol("0",(char**)0,10);strchr("0",'0');strpbrk(a,"0");rename(a,"0");
> > +@@ -1059,7 +1067,7 @@ echo 'Testing for memmove, strchr, strpb
> > + echo '      rename, setrgid, setegid, pow, opendir, mkdir, waitpid, f=
sync,'
> > + echo '      ftruncate, strtod, strncasecmp, strerror, strlcat,'
> > + echo '      memset, bzero, and _exit'
> > +-if $MAKE _autotst.$O >$DEVNULL 2>&1
> > ++if $MAKE _autotst.$O >_autotst.rrr 2>&1
> > + then
> > + :
> > + else
> > +@@ -1196,7 +1204,7 @@ unsigned long dobench(strstr,iter,haysta
> > +   return (unsigned long)clock()-to;
> > + }
> > + #endif
> > +-int main(argc,argv)int argc;const char*argv[];
> > ++int main(int argc,const char*argv[])
> > + { if(argc=3D=3D1)
> > +    { char*haystack;
> > + #ifdef BENCHSIZE
> > +--- a/src/mailfold.c
> > ++++ b/src/mailfold.c
> > +@@ -378,7 +378,7 @@ void concon(ch)const int ch;   /* flip b
> > +    }
> > + }
> > +
> > +-void readmail(rhead,tobesent)const long tobesent;
> > ++void readmail(int rhead,const long tobesent)
> > + { char*chp,*pastend;static size_t contlengthoffset;
> > +   ;{ long dfilled;
> > +      if(rhead=3D=3D2)             /* already read, just examine what =
we have */
> > diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb
> > b/meta-oe/recipes-support/procmail/procmail_3.22.bb
> > index 59b78c0a6a..32fc12c7da 100644
> > --- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
> > +++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
> > @@ -15,6 +15,7 @@ SRC_URI =3D
> > "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
> >      file://man-file-mailstat.1-from-debian.patch \
> >      file://CVE-2014-3618.patch \
> >      file://CVE-2017-16844.patch \
> > +    file://gcc14.patch \
> >  "
> >  SRC_URI[sha256sum] =3D
> > "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
> >
> > @@ -24,6 +25,7 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Da71e50e197a992c862379e576e669757 \
> >
> >  DEPENDS =3D "libnet"
> >  inherit autotools-brokensep
> > +
> >  do_configure() {
> >      find examples -type f | xargs chmod 644
> >      export CC=3D"${BUILD_CC}"
> > @@ -35,7 +37,7 @@ do_configure() {
> >  }
> >
> >  do_compile() {
> > -    oe_runmake -i CFLAGS=3D"$TARGET_CFLAGS -Wno-comments
> > -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURC=
E
> > -D_FILE_OFFSET_BITS=3D64" LDFLAGS0=3D"${LDFLAGS}"
> > +    oe_runmake -i CFLAGS=3D"$TARGET_CFLAGS -Wno-comments
> > -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE
> > -D_FILE_OFFSET_BITS=3D64" LDFLAGS0=3D"${LDFLAGS}"
> >  }
> >
> >  do_install() {

