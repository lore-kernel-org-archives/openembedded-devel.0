Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.127.1614100529621735793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 09:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cmqFvqEc;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id x124so5771463qkc.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 09:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O7KkzYBojCMeNlfFNVImNwMfyacGMGxfulhJFO7F6nE=;
        b=cmqFvqEcX1PgL54roCt70XY6bJ4TWH7x7mbUoeENllaLQOOwSGl4yYww3Ibb3IGwXz
         o2gAU2rGoZ1jYqkTrKikv8kxA/SM7H7e5sX36biX0Lq2nk3++a4dKqmf98/oKRrbibXO
         0z98n1f65+gKa0ynlr+X+1HDrSx+eOoWn8hwk5bpqJh03aALz5otGCwZX5S8CZD78zXw
         wYlZ3GYOWk243RlDtpMBZBoy32o/T5XYoJfHR9CJARU8dffkYarzO4eFvqKnZc3yQEW6
         hLB3PqmVrRnbEKjzZ1aDzmwu8TEJ3r1qOUiC7Vx48CghzxNNSNF9efuvMqRXt/GQKfWu
         TpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O7KkzYBojCMeNlfFNVImNwMfyacGMGxfulhJFO7F6nE=;
        b=rNHYYN037ryTq9xaJfes/VfgXurkhl5AHJyL04eEKffsJ09vrEOmPbampd6zG/UTBk
         seh9RsD9jtzLpO9q3wctBo+PREHzEPZaqV80ArGbx0vFhI3/5x0mTHZPAOQtsyJMCrMQ
         3xhzbSmtll2vA8uO9Idz93lXdaJCkza/x6eJWt4lNfFL/yGuPPxLBMoBQ986yJPGA0Un
         fM3HsfvtQR/ON8gR8ub/c6mA+IcwXUhYYYuBnSSIFZbfNtXSm2Kx17IguCuzozyR4lQz
         Tsbu8BlpdmHnGC6bH393b1fZoeBuOwt2NhSHCzlGc/hnWuNnTs9JHRuObbdSoOdBnzHx
         t2Zg==
X-Gm-Message-State: AOAM533fMb0x4d6itdgS8i3Vc3CfOxP3TKmW7vb75wtvAWD6+sA5mskb
	8wrbu00/3fNkiMtNY+1qqiLMDguRqWsW3qCFT6M=
X-Google-Smtp-Source: ABdhPJweP2AfrObUgxSdIVX2WdhmT3WMcXKqB0eCcNmVela8q7x8u62557MmArFYRSZKubAsh2aI0F4qNSgFKAtnq9Q=
X-Received: by 2002:a05:620a:b95:: with SMTP id k21mr26538492qkh.125.1614100528633;
 Tue, 23 Feb 2021 09:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20210223162705.2595483-1-andrei@gherzan.com> <20210223171242.csn2hwn6imsn4ega@jama>
In-Reply-To: <20210223171242.csn2hwn6imsn4ega@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 23 Feb 2021 09:15:02 -0800
Message-ID: <CAMKF1spNM_nxwEMFN3DXCG5O4rxK22VMMe6yZKm7zjmUWg4LSQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Andrei Gherzan <andrei@gherzan.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 9:12 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> On Tue, Feb 23, 2021 at 04:27:05PM +0000, Andrei Gherzan wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > We are seeing warnigs with gcc-10 even on target builds e.g.
>
> Do you use gcc-10 in dunfell builds?
>
> dunfell has 9.3.0 gcc, so either you're using gcc-10 through some
> backports or the warning is reproducible also with gcc-9, but I'm not
> seeing nss failures in my dunfell builds.

I think its the native one he is running into issues. Perhaps he has
newer build host OS which has gcc 10

>
> Cheers,
>
> >
> > | In file included from nsinstall.c:20:
> > | /usr/include/unistd.h:520:14: note: in a call to function =E2=80=98g=
etcwd=E2=80=99 declared with attribute =E2=80=98write_only (1, 2)=E2=80=99
> > |   520 | extern char *getcwd (char *__buf, size_t __size) __THROW __w=
ur
> > |       |              ^~~~~~
> > | nsinstall.c:70:16: error: argument 1 is null but the corresponding s=
ize argument 2 value is 4096 [-Werror=3Dnonnull]
> > |    70 | #define GETCWD getcwd
> > |       |                ^
> > | nsinstall.c:246:13: note: in expansion of macro =E2=80=98GETCWD=E2=
=80=99
> > |   246 |     todir =3D GETCWD(0, PATH_MAX);
> > |       |             ^~~~~~
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-support/nss/nss_3.51.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recip=
es-support/nss/nss_3.51.1.bb
> > index 3e3c3a3fd..348c2c13f 100644
> > --- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
> > +++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
> > @@ -62,7 +62,6 @@ do_configure_prepend_libc-musl () {
> >  do_compile_prepend_class-native() {
> >      export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR_NATIVE}/nspr
> >      export NSPR_LIB_DIR=3D${STAGING_LIBDIR_NATIVE}
> > -    export NSS_ENABLE_WERROR=3D0
> >  }
> >
> >  do_compile_prepend_class-nativesdk() {
> > @@ -76,6 +75,7 @@ do_compile_prepend_class-native() {
> >
> >  do_compile() {
> >      export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR}/nspr
> > +    export NSS_ENABLE_WERROR=3D0
> >
> >      export CROSS_COMPILE=3D1
> >      export NATIVE_CC=3D"${BUILD_CC}"
> > --
> > 2.30.1
> >
>
> >
> >=20
> >
>
