Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.17862.1597247611253646937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 08:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CCYEDWWh;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id x69so2509459qkb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NsHQd8S+FwOML+UWiC4fz+X8i/64apkekk59Hoj5SVA=;
        b=CCYEDWWh996fRUt0YF/6/gL/7WYlA6dn34sCg7ZYsPH6EnU38ZME2E4SXitDLTWEBP
         GYXht19aPbbgUsUDzcF2Ub7sSabVLsWAy2TiD8eLfCpC0wfljW7GLwidPrNZy14WJ/pN
         28IoCZ/BJqaLp8uiqxVkHwvF6XYvXbHt4xcZbY4XEgpUve3yjNkjUOhSGZcR6/O12tBM
         lAXBHr6Y6oNSnLqPbh0o8kh4l1c2Cr88PxWi1MohCHQwgwmzQic2ypDbN2pU9+nkzzoF
         U/BQ+4oOnLlUEQMxW2PpnE+3kCawzR7z0H6IZrLMIYSc3Mz650lTiBJiVFPjyTjyaLyS
         q5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NsHQd8S+FwOML+UWiC4fz+X8i/64apkekk59Hoj5SVA=;
        b=b3fUV6/OhCb6H1lTgxhgenj/llZckSTmUjrkiKG2xXZ5wF7lVrDooOkc7+uBUrskuB
         eQg9jiJu2cyWyNHvicBLT7E843EiZngxX0EJlAQE/W/GWkzWF7Ku/JFmaZxB2u7nP3kq
         bO+eCc2HOHgtct+2LF4taITnHqOrBq0Pgb9k5KyEZospf7x7pFQOLwmvX0NVhQ+05Tfd
         UBARLWrLaTVTfoGRqbu4u+t0oFmrSPSsN/ddgqb/Kj8wybRbc4MmBRMHkjLopP8U6bSV
         zQ4z+qSz+P8fgrfeNf78E4Kr38uxw/YmmK1rkLwq5Vszc4OujLdZVbaiynKBCokywmAI
         EZ8A==
X-Gm-Message-State: AOAM533Iso+2ut15xK2c47gQE2W3mzXLf6H/LgysDMqVkfwC6Yr0LmcJ
	5pumURj2rI2ywYBS9kOg1rjGEI8QPvstNZmX4Dg=
X-Google-Smtp-Source: ABdhPJyNVgWFtqoNG01VODGQ3OX2az7uAhNJW1nJOH55E15JyjhVToQxuaoglrRjpSj4V59SbZJVDXVpvZRu2osnLQo=
X-Received: by 2002:a37:9d53:: with SMTP id g80mr548180qke.17.1597247610323;
 Wed, 12 Aug 2020 08:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200811210229.93989-1-joe.slater@windriver.com>
 <CAMKF1sqUt6+-5AhPB1j8LtQgY0=gjAm4jNoXEx5txCChr0xzMQ@mail.gmail.com> <BY5PR11MB399200D5752C7637C2CF603588420@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB399200D5752C7637C2CF603588420@BY5PR11MB3992.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 12 Aug 2020 08:53:04 -0700
Message-ID: <CAMKF1soW3qb1VTUhDMUCKDP_Q08SHTtfrQRR=OoCNb=Q45o4Sw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] mozjs: specify TMPDIR
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 8:41 AM Slater, Joseph <joe.slater@windriver.com> w=
rote:
>
> The symptom seems to be that sometimes, when a lot of similar tempfiles =
are created under /tmp, a file will be created that cannot be read once the=
 original fd is closed.  Moving where these files are created might avoid s=
ome underlying problem, but it also might just reduce the failure rate to s=
omething so low that you never see it.
> There should probably be more investigation into what is going on, but i=
t is hard to put much effort into dealing with something that (usually) occ=
urs very rarely and is easily avoided.

this issue has never shown up on builders that I have access to, and I
would be interested to know if there are more users seeing this issue
as well.
I think we need some more reports on these lines for this change since
it will impact everyone

>
> Joe
>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Tuesday, August 11, 2020 4:04 PM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>; MacLe=
od, Randy <Randy.MacLeod@windriver.com>
> Subject: Re: [oe] [meta-oe][PATCH 1/1] mozjs: specify TMPDIR
>
> On Tue, Aug 11, 2020 at 2:02 PM Joe Slater <joe.slater@windriver.com> wr=
ote:
> >
> > Although it is extremely rare the following type of error can occur
> > during configuration:
> >
> > Creating `/tmp/conftest.i53clm4z.cpp` with content:
> > ...
> > x86_64-wrs-linux-g++: error: /tmp/conftest.i53clm4z.cpp: No such file
> > or directory
> > x86_64-wrs-linux-g++: error: /tmp/conftest.i53clm4z.cpp: No such file
> > or directory
> > x86_64-wrs-linux-g++: fatal error: no input files
> >
> > So, specify a local directory as TMPDIR during configuration.
>
> Do we know the real underlying issue ? it's not clear to me from descrip=
tion
>
> /tmp is always mounted on linux build systems so I am assuming its hitti=
ng some sort of race condition since /tmp is mounted using tmpfs it might b=
e more evident since its faster whereas when its pointing to custom dir on =
HDD its hiding the underlying issue.
>
> IOW how is the problem manifested and how is this patch helping ?
>
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  .../dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
> > | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git
> > a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9
> > .0.bb
> > b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9
> > .0.bb
> > index f13a184..629c652 100644
> > ---
> > a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9
> > .0.bb
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_
> > +++ 60.9.0.bb
> > @@ -100,7 +100,9 @@ do_configure() {
> >      autoconf213 --macrodir=3D${STAGING_DATADIR_NATIVE}/autoconf213
> > old-configure.in > old-configure
> >
> >      cd ${B}
> > -    ${S}/js/src/configure ${EXTRA_OECONF}
> > +    # use of /tmp can causes problems on heavily loaded hosts
> > +    mkdir -p "${B}/lcl_tmp"
> > +    TMPDIR=3D"${B}/lcl_tmp"  ${S}/js/src/configure ${EXTRA_OECONF}
> >
> >      # Make standard Makefile checks pass
> >      touch ${S}/js/src/configure
> > --
> > 2.7.4
> >
> >=20
