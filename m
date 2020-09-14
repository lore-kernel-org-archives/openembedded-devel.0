Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.57633.1600079945537719025
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 03:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gWbTZ2/Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id x23so10121800wmi.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2020 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u1tTZ4LT+IMQoB4uspTfMfS2958Kz4bZirvfMMiSxUU=;
        b=gWbTZ2/Qd9E3Yos7MuimZsilWWeeDu5dZm8v/pt1ZtvewT4GjelZd/OgA5N7lNKYVF
         HwtUxRJZCl/Nu1iunYMvS25muJtNrP1FI4uzkwLO6lWyELy3J+ZQSHVo4gGyRF8LHtTo
         OguaH7ZMKJHamyKx5yJRPE3xQezHnin0xetcxhnMZuV0epOI/b+5yqadu2ugKljSs2Y+
         0vpDkY9o0dyD167OsjvYYpPmV3YwwStjc+fyiaY4zc5o4kejrQzFULvFZafLTKNyQVjT
         C/pm0uIzbOAJBFjfIYB8i3e0BmS919ugDfofZYzHV3SqIHajNw7QbYrNqOKMHBmKeRV+
         KCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u1tTZ4LT+IMQoB4uspTfMfS2958Kz4bZirvfMMiSxUU=;
        b=IsCMOLXZglkU5J1QqaaIDNgjO2x9+Q/LSFQMOvP1noI4QkCwYJrSBa3e5ojL+rqvQC
         znt8MRPtin5X8uOYAY3ubrydKdTfKtFZfpUxn8132elOrOA4x1rFSdjBp+piOXD+aXfo
         vPeS1CxD8YblsVNboQEFtnE3YatKae6wes5nWAy/1n8NK/PCAOCej+ouVe4eEF0EUB9s
         V4k3ogyrDgN8DgICIgC0TeN/yVXqqELCfbGJNuumxR8Q335l5snXvXIuUcQux/X6OKzE
         tKj+Gob0TnuizvZypvKgMLPApo002kqFVcXHjwARP8zMH4lNcN32w6aXQL4h/PhUisvL
         QQoQ==
X-Gm-Message-State: AOAM5313TySIRU5W4/OKtUGaYWY4ATbQ0TCy10uRfU7cJylj9q4JGwmd
	FVCzOpKjNBKuQl0Ui3Roy5JOIYHxSKT2KiYl9+c=
X-Google-Smtp-Source: ABdhPJx15yTxJ/4lqDGxeKZrzok8QiagRhhgkUlnul/xblinLP/Nj5PnyvOtxUDlPr3k2opjK8b99fBe3jt96QXmpAc=
X-Received: by 2002:a1c:99c7:: with SMTP id b190mr14000483wme.44.1600079943728;
 Mon, 14 Sep 2020 03:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200911165441.7022-1-vincent.prince.external@saftbatteries.com> <CAMKF1srnSvCMYUBna02P+DE_OYKeE_j42=_4piD78vve84Ty7Q@mail.gmail.com>
In-Reply-To: <CAMKF1srnSvCMYUBna02P+DE_OYKeE_j42=_4piD78vve84Ty7Q@mail.gmail.com>
From: "nefethael" <vincent.prince.fr@gmail.com>
Date: Mon, 14 Sep 2020 12:38:52 +0200
Message-ID: <CAB2nKc-3Z1R3CXDv3PMb9wKU5g-xJM1byiBZgKR_vFBSy8BMfQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] mongodb: bump to r4.4.1 version
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Vincent Prince <vincent.prince.external@saftbatteries.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the report,

I added "shell" to PACKAGECONFIG default by mistake.
I don't have any arm builder etc, do you want me to send a v2 without
shell option even if I can't test it fails again?

Best regards,
Vincent

Le ven. 11 sept. 2020 =C3=A0 20:47, Khem Raj <raj.khem@gmail.com> a =C3=A9=
crit :
>
> fails to build
>
> https://errors.yoctoproject.org/Errors/Details/498803/
> https://errors.yoctoproject.org/Errors/Details/498801/
> https://errors.yoctoproject.org/Errors/Details/498804/
>
> On Fri, Sep 11, 2020 at 9:55 AM nefethael <vincent.prince.fr@gmail.com> =
wrote:
> >
> > Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.c=
om>
> > ---
> >  ...e-build-settings-from-environment-va.patch | 25 ++++----
> >  ...-control-use-of-gnu_get_libc_version.patch |  8 +--
> >  ...001-Use-long-long-instead-of-int64_t.patch | 15 ++---
> >  ...ion-for-the-macro-__ELF_NATIVE_CLASS.patch | 13 ++--
> >  .../mongodb/0003-Fix-unknown-prefix-env.patch |  2 +-
> >  .../recipes-dbs/mongodb/mongodb/1296.patch    | 12 ++--
> >  .../mongodb/mongodb/arm64-support.patch       | 14 ++---
> >  .../recipes-dbs/mongodb/mongodb_git.bb        | 63 +++++++++++++++---=
-
> >  8 files changed, 98 insertions(+), 54 deletions(-)
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mo=
ngodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/met=
a-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons=
-to-use-build-settings-from-environment-va.patch
> > index 190884624..b8a325295 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
001-Tell-scons-to-use-build-settings-from-environment-va.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
001-Tell-scons-to-use-build-settings-from-environment-va.patch
> > @@ -1,4 +1,4 @@
> > -From 1b2e24e14ee72e54e466be2512c78272f62d60b4 Mon Sep 17 00:00:00 200=
1
> > +From 8295bb6a60896fed54d6450bca091aea4eea4fb2 Mon Sep 17 00:00:00 200=
1
> >  From: Vincent Prince <vincent.prince.fr@gmail.com>
> >  Date: Mon, 16 Sep 2019 13:21:44 +0200
> >  Subject: [PATCH 01/10] Tell scons to use build settings from environm=
ent
> > @@ -7,14 +7,14 @@ Subject: [PATCH 01/10] Tell scons to use build setti=
ngs from environment
> >  Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> >  Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >  ---
> > - SConstruct                | 8 ++++++--
> > - 1 files changed, 8 insertions(+), 2 deletions(-)
> > + SConstruct | 8 ++++++--
> > + 1 file changed, 6 insertions(+), 2 deletions(-)
> >
> >  diff --git a/SConstruct b/SConstruct
> > -index 7ebbcbc..e63cf15 100644
> > +index 89c044ab78..2044c0ddb8 100644
> >  --- a/SConstruct
> >  +++ b/SConstruct
> > -@@ -608,6 +608,7 @@ def variable_arch_converter(val):
> > +@@ -593,6 +593,7 @@ def variable_arch_converter(val):
> >           'amd64':  'x86_64',
> >           'emt64':   'x86_64',
> >           'x86':    'i386',
> > @@ -22,7 +22,7 @@ index 7ebbcbc..e63cf15 100644
> >       }
> >       val =3D val.lower()
> >
> > -@@ -695,7 +696,8 @@ env_vars.Add(
> > +@@ -723,7 +724,8 @@ env_vars.Add(
> >   )
> >
> >   env_vars.Add('CC',
> > @@ -32,7 +32,7 @@ index 7ebbcbc..e63cf15 100644
> >
> >   env_vars.Add('CCFLAGS',
> >       help=3D'Sets flags for the C and C++ compiler',
> > -@@ -715,7 +717,8 @@ env_vars.Add('CPPPATH',
> > +@@ -743,7 +745,8 @@ env_vars.Add('CPPPATH',
> >       converter=3Dvariable_shlex_converter)
> >
> >   env_vars.Add('CXX',
> > @@ -42,15 +42,14 @@ index 7ebbcbc..e63cf15 100644
> >
> >   env_vars.Add('CXXFLAGS',
> >       help=3D'Sets flags for the C++ compiler',
> > -@@ -1018,6 +1021,7 @@ envDict =3D dict(BUILD_ROOT=3DbuildDir,
> > -                )
> > +@@ -1127,6 +1130,7 @@ if get_option('build-tools') =3D=3D 'next' or g=
et_option('ninja') =3D=3D 'next':
> > +     SCons.Tool.DefaultToolpath.insert(0, os.path.abspath('site_scons=
/site_tools/next'))
> >
> >   env =3D Environment(variables=3Denv_vars, **envDict)
> >  +env.PrependENVPath('PATH', os.getenv('PATH'))
> > - del envDict
> > -
> > - for var in ['CC', 'CXX']:
> >
> > + # Only print the spinner if stdout is a tty
> > + if sys.stdout.isatty():
> >  --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mo=
ngodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/met=
a-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIB=
C__-to-control-use-of-gnu_get_libc_version.patch
> > index d98fa56cb..8d82be1b5 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
> > @@ -1,4 +1,4 @@
> > -From d701ceeb15662038435b80ba556a80c17f76d2dc Mon Sep 17 00:00:00 200=
1
> > +From 6332823f9fdcb571305b716330e67d0b38810868 Mon Sep 17 00:00:00 200=
1
> >  From: Vincent Prince <vincent.prince.fr@gmail.com>
> >  Date: Mon, 16 Sep 2019 13:30:13 +0200
> >  Subject: [PATCH 03/10] Use __GLIBC__ to control use of gnu_get_libc_v=
ersion
> > @@ -10,7 +10,7 @@ Signed-off-by: Vincent Prince <vincent.prince.fr@gma=
il.com>
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >  diff --git a/src/mongo/util/processinfo_linux.cpp b/src/mongo/util/pr=
ocessinfo_linux.cpp
> > -index cccb91c..45c4b7d 100644
> > +index a968c54727..0d8b8874e2 100644
> >  --- a/src/mongo/util/processinfo_linux.cpp
> >  +++ b/src/mongo/util/processinfo_linux.cpp
> >  @@ -44,10 +44,10 @@
> > @@ -27,7 +27,7 @@ index cccb91c..45c4b7d 100644
> >   #endif
> >
> >   #include <boost/filesystem.hpp>
> > -@@ -546,7 +546,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo()=
 {
> > +@@ -617,7 +617,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo()=
 {
> >       std::stringstream ss;
> >       ss << "uClibc-" << __UCLIBC_MAJOR__ << "." << __UCLIBC_MINOR__ <=
< "." << __UCLIBC_SUBLEVEL__;
> >       bExtra.append("libcVersion", ss.str());
> > @@ -37,5 +37,5 @@ index cccb91c..45c4b7d 100644
> >   #endif
> >       if (!verSig.empty())
> >  --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mo=
ngodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/dynamic-layers/=
meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64=
_t.patch
> > index b9c670407..958e09c3d 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
001-Use-long-long-instead-of-int64_t.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
001-Use-long-long-instead-of-int64_t.patch
> > @@ -1,4 +1,4 @@
> > -From 20fcbf2a05ee6542aba942f6006d149db70fb9ce Mon Sep 17 00:00:00 200=
1
> > +From 4e7f15346682482bc2071c7209dec97507d3bc4c Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 2 Sep 2017 10:03:37 -0700
> >  Subject: [PATCH 02/10] Use long long instead of int64_t
> > @@ -8,12 +8,13 @@ error: call to member function 'appendNumber' is amb=
iguous
> >  since this function expects long long as parameter and not int64_t
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >  ---
> >   src/mongo/util/procparser.cpp | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >
> >  diff --git a/src/mongo/util/procparser.cpp b/src/mongo/util/procparse=
r.cpp
> > -index c574a3f..5ea66b7 100644
> > +index 24b9d1e2c9..0f274cfff6 100644
> >  --- a/src/mongo/util/procparser.cpp
> >  +++ b/src/mongo/util/procparser.cpp
> >  @@ -261,7 +261,7 @@ Status parseProcStat(const std::vector<StringData=
>& keys,
> > @@ -23,7 +24,7 @@ index c574a3f..5ea66b7 100644
> >  -                    uint64_t value;
> >  +                    long long  value;
> >
> > -                     if (!parseNumberFromString(stringValue, &value).=
isOK()) {
> > +                     if (!NumberParser{}(stringValue, &value).isOK())=
 {
> >                           value =3D 0;
> >  @@ -273,7 +273,7 @@ Status parseProcStat(const std::vector<StringData=
>& keys,
> >               } else {
> > @@ -32,7 +33,7 @@ index c574a3f..5ea66b7 100644
> >  -                uint64_t value;
> >  +                long long value;
> >
> > -                 if (!parseNumberFromString(stringValue, &value).isOK=
()) {
> > +                 if (!NumberParser{}(stringValue, &value).isOK()) {
> >                       value =3D 0;
> >  @@ -366,7 +366,7 @@ Status parseProcMemInfo(const std::vector<StringD=
ata>& keys,
> >
> > @@ -41,7 +42,7 @@ index c574a3f..5ea66b7 100644
> >  -            uint64_t value;
> >  +            long long value;
> >
> > -             if (!parseNumberFromString(stringValue, &value).isOK()) =
{
> > +             if (!NumberParser{}(stringValue, &value).isOK()) {
> >                   value =3D 0;
> >  @@ -522,7 +522,7 @@ Status parseProcDiskStats(const std::vector<Strin=
gData>& disks,
> >                             StringData data,
> > @@ -59,8 +60,8 @@ index c574a3f..5ea66b7 100644
> >  -                uint64_t value;
> >  +                long long value;
> >
> > -                 if (!parseNumberFromString(stringValue, &value).isOK=
()) {
> > +                 if (!NumberParser{}(stringValue, &value).isOK()) {
> >                       value =3D 0;
> >  --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mo=
ngodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch b/meta-o=
e/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definit=
ion-for-the-macro-__ELF_NATIVE_CLASS.patch
> > index 869d2849d..57f4168f5 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
> > @@ -1,4 +1,4 @@
> > -From 73c6374ceb0c062e91210cc9ef3e0e9fa30ee514 Mon Sep 17 00:00:00 200=
1
> > +From 28f34191eef1e70c24d2f81b66e4dd40dbefcd35 Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 2 Sep 2017 12:42:30 -0700
> >  Subject: [PATCH 04/10] Add a definition for the macro __ELF_NATIVE_CL=
ASS
> > @@ -6,17 +6,18 @@ Subject: [PATCH 04/10] Add a definition for the macr=
o __ELF_NATIVE_CLASS
> >  It depends on the native arch's word size.
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >  ---
> >   src/mongo/util/stacktrace_posix.cpp | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> >  diff --git a/src/mongo/util/stacktrace_posix.cpp b/src/mongo/util/sta=
cktrace_posix.cpp
> > -index 1d7b3d7..f81e329 100644
> > +index 531e21bdc2..fa611499e4 100644
> >  --- a/src/mongo/util/stacktrace_posix.cpp
> >  +++ b/src/mongo/util/stacktrace_posix.cpp
> > -@@ -39,6 +39,15 @@
> > +@@ -42,6 +42,15 @@
> > + #include <iostream>
> >   #include <string>
> > - #include <sys/utsname.h>
> >
> >  +#if !defined(__GLIBC__)
> >  +#if defined __x86_64__ && !defined __ILP32__
> > @@ -28,8 +29,8 @@ index 1d7b3d7..f81e329 100644
> >  +#endif
> >  +
> >   #include "mongo/base/init.h"
> > + #include "mongo/bson/json.h"
> >   #include "mongo/config.h"
> > - #include "mongo/db/jsobj.h"
> >  --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mo=
ngodb/0003-Fix-unknown-prefix-env.patch b/meta-oe/dynamic-layers/meta-pytho=
n/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
> > index 3a27aacfe..910ef0b5f 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
003-Fix-unknown-prefix-env.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0=
003-Fix-unknown-prefix-env.patch
> > @@ -2,7 +2,7 @@ Index: git/SConstruct
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  --- git.orig/SConstruct
> >  +++ git/SConstruct
> > -@@ -884,6 +884,14 @@ env_vars.Add('WINDOWS_OPENSSL_BIN',
> > +@@ -977,6 +977,14 @@ env_vars.Add('WINDOWS_OPENSSL_BIN',
> >       help=3D'Sets the path to the openssl binaries for packaging',
> >       default=3D'c:/openssl/bin')
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mo=
ngodb/1296.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/m=
ongodb/1296.patch
> > index ae84bcb56..e4ae30776 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1=
296.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1=
296.patch
> > @@ -15,15 +15,16 @@ src/mongo/util/net/ssl_manager.cpp:575:79: error: =
invalid conversion from 'size_
> >    if (mongoUnsignedAddOverflow64(tagAndLengthByteCount, derLength, ou=
tLength) ||
> >
> >  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >  ---
> >   src/mongo/util/net/ssl_manager.cpp | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >  diff --git a/src/mongo/util/net/ssl_manager.cpp b/src/mongo/util/net/=
ssl_manager.cpp
> > -index b93ebe84a4a3..3511eb5d998f 100644
> > +index 455a1662a5..e8497bc0d1 100644
> >  --- a/src/mongo/util/net/ssl_manager.cpp
> >  +++ b/src/mongo/util/net/ssl_manager.cpp
> > -@@ -782,7 +782,7 @@ class DERToken {
> > +@@ -810,7 +810,7 @@ public:
> >        *
> >        * Returns a DERToken which consists of the (tag, length, value)=
 tuple.
> >        */
> > @@ -32,7 +33,7 @@ index b93ebe84a4a3..3511eb5d998f 100644
> >
> >   private:
> >       DERType _type{DERType::EndOfContent};
> > -@@ -799,7 +799,7 @@ struct DataType::Handler<DERToken> {
> > +@@ -827,7 +827,7 @@ struct DataType::Handler<DERToken> {
> >                          size_t length,
> >                          size_t* advanced,
> >                          std::ptrdiff_t debug_offset) {
> > @@ -41,7 +42,7 @@ index b93ebe84a4a3..3511eb5d998f 100644
> >
> >           auto swPair =3D DERToken::parse(ConstDataRange(ptr, length),=
 &outLength);
> >
> > -@@ -844,7 +844,7 @@ StatusWith<std::string> readDERString(ConstDataRa=
ngeCursor& cdc) {
> > +@@ -889,7 +889,7 @@ StatusWith<DERInteger> readDERInt(ConstDataRangeC=
ursor& cdc) {
> >   }
> >
> >
> > @@ -50,3 +51,6 @@ index b93ebe84a4a3..3511eb5d998f 100644
> >       const size_t kTagLength =3D 1;
> >       const size_t kTagLengthAndInitialLengthByteLength =3D kTagLength=
 + 1;
> >
> > +--
> > +2.24.0
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mo=
ngodb/arm64-support.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/=
mongodb/mongodb/arm64-support.patch
> > index 15bd7da70..1a7bf0fc5 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/a=
rm64-support.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/a=
rm64-support.patch
> > @@ -1,4 +1,4 @@
> > -From c9fc9e9a44b0fb764ce86a5e57f17d3c5bbfd8cd Mon Sep 17 00:00:00 200=
1
> > +From 298d958148f1fb2bb7725fed15c68c09677c14c9 Mon Sep 17 00:00:00 200=
1
> >  From: Vincent Prince <vincent.prince.fr@gmail.com>
> >  Date: Mon, 16 Sep 2019 13:37:10 +0200
> >  Subject: [PATCH 05/10] Add alises for arm64 which is same as aarch64
> > @@ -12,10 +12,10 @@ Signed-off-by: Vincent Prince <vincent.prince.fr@g=
mail.com>
> >   3 files changed, 3 insertions(+), 2 deletions(-)
> >
> >  diff --git a/SConstruct b/SConstruct
> > -index e63cf15..5593c78 100644
> > +index 448939bdd0..abfd816f3e 100644
> >  --- a/SConstruct
> >  +++ b/SConstruct
> > -@@ -1129,6 +1129,7 @@ elif endian =3D=3D "big":
> > +@@ -1228,6 +1228,7 @@ if endian =3D=3D "auto":
> >   processor_macros =3D {
> >       'arm'        : { 'endian': 'little', 'defines': ('__arm__',) },
> >       'aarch64'    : { 'endian': 'little', 'defines': ('__arm64__', '_=
_aarch64__')},
> > @@ -24,10 +24,10 @@ index e63cf15..5593c78 100644
> >       'ppc64le'    : { 'endian': 'little', 'defines': ('__powerpc64__'=
,)},
> >       's390x'      : { 'endian': 'big',    'defines': ('__s390x__',)},
> >  diff --git a/src/third_party/IntelRDFPMathLib20U1/SConscript b/src/th=
ird_party/IntelRDFPMathLib20U1/SConscript
> > -index f23c071..fb82cd6 100644
> > +index 58e1b7ba65..bffe83b462 100644
> >  --- a/src/third_party/IntelRDFPMathLib20U1/SConscript
> >  +++ b/src/third_party/IntelRDFPMathLib20U1/SConscript
> > -@@ -308,7 +308,7 @@ if processor =3D=3D 'i386' or processor =3D=3D 'e=
mscripten':
> > +@@ -309,7 +309,7 @@ if processor =3D=3D 'i386' or processor =3D=3D 'e=
mscripten':
> >   elif processor =3D=3D 'arm':
> >       cpp_defines['IA32'] =3D '1'
> >       cpp_defines['ia32'] =3D '1'
> > @@ -37,7 +37,7 @@ index f23c071..fb82cd6 100644
> >       cpp_defines['EFI2'] =3D '1'
> >   # Using 64 bit little endian
> >  diff --git a/src/third_party/wiredtiger/SConscript b/src/third_party/=
wiredtiger/SConscript
> > -index cdd090b..97a1b3b 100644
> > +index d6bd665e23..2f1e656a19 100644
> >  --- a/src/third_party/wiredtiger/SConscript
> >  +++ b/src/third_party/wiredtiger/SConscript
> >  @@ -152,7 +152,7 @@ condition_map =3D {
> > @@ -50,5 +50,5 @@ index cdd090b..97a1b3b 100644
> >       'X86_HOST'     : env['TARGET_ARCH'] =3D=3D 'x86_64',
> >       'ZSERIES_HOST' : env['TARGET_ARCH'] =3D=3D 's390x',
> >  --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mo=
ngodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongo=
db_git.bb
> > index 58841ef31..6378c269f 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_g=
it.bb
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_g=
it.bb
> > @@ -9,12 +9,12 @@ DEPENDS =3D "openssl libpcap zlib boost curl python3=
 \
> >             python3-psutil-native python3-regex-native \
> >             "
> >
> > -inherit scons dos2unix siteinfo python3native
> > +inherit scons dos2unix siteinfo python3native systemd useradd
> >
> > -PV =3D "4.2.2"
> > -#v4.2.2
> > -SRCREV =3D "a0bbbff6ada159e19298d37946ac8dc4b497eadf"
> > -SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv4.2 \
> > +PV =3D "4.4.1"
> > +#v4.4.1
> > +SRCREV =3D "ad91a93a5a31e175f5cbf8c69561e788bbc55ce1"
> > +SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv4.4 \
> >             file://0001-Tell-scons-to-use-build-settings-from-environm=
ent-va.patch \
> >             file://0001-Use-long-long-instead-of-int64_t.patch \
> >             file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_v=
ersion.patch \
> > @@ -35,11 +35,12 @@ SRC_URI_append_toolchain-clang =3D "\
> >             file://0001-asio-Dont-use-experimental-with-clang.patch \
> >             "
> >
> > +
> >  S =3D "${WORKDIR}/git"
> >
> >  COMPATIBLE_HOST ?=3D '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
> >
> > -PACKAGECONFIG ??=3D "tcmalloc system-pcre"
> > +PACKAGECONFIG ??=3D "tcmalloc system-pcre shell"
> >  # gperftools compilation fails for arm below v7 because of missing su=
pport of
> >  # dmb operation. So we use system-allocator instead of tcmalloc
> >  PACKAGECONFIG_remove_armv6 =3D "tcmalloc"
> > @@ -51,26 +52,64 @@ PACKAGECONFIG[tcmalloc] =3D "--use-system-tcmalloc=
,--allocator=3Dsystem,gperftools,"
> >  PACKAGECONFIG[shell] =3D ",--js-engine=3Dnone,,"
> >  PACKAGECONFIG[system-pcre] =3D "--use-system-pcre,,libpcre,"
> >
> > -EXTRA_OESCONS =3D "--prefix=3D${D}${prefix} \
> > +EXTRA_OESCONS =3D "PREFIX=3D${prefix} \
> > +                 DESTDIR=3D${D} \
> >                   LIBPATH=3D${STAGING_LIBDIR} \
> >                   LINKFLAGS=3D'${LDFLAGS}' \
> >                   CXXFLAGS=3D'${CXXFLAGS}' \
> >                   TARGET_ARCH=3D${TARGET_ARCH} \
> > +                 MONGO_VERSION=3D${PV} \
> >                   --ssl \
> >                   --disable-warnings-as-errors \
> >                   --use-system-zlib \
> >                   --nostrip \
> >                   --endian=3D${@oe.utils.conditional('SITEINFO_ENDIANN=
ESS', 'le', 'little', 'big', d)} \
> >                   --wiredtiger=3D${@['off','on'][d.getVar('SITEINFO_BI=
TS') !=3D '32']} \
> > -                 ${PACKAGECONFIG_CONFARGS} \
> > -                 core"
> > +                 --separate-debug \
> > +                 ${PACKAGECONFIG_CONFARGS}"
> > +
> > +
> > +USERADD_PACKAGES =3D "${PN}"
> > +USERADD_PARAM_${PN} =3D "--system --no-create-home --home-dir /var/ru=
n/${BPN} --shell /bin/false --user-group ${BPN}"
> > +
> >
> >  scons_do_compile() {
> > -        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCO=
NS} || \
> > +        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCO=
NS} install-core || \
> >          die "scons build execution failed."
> >  }
> >
> >  scons_do_install() {
> > -        ${STAGING_BINDIR_NATIVE}/scons install ${EXTRA_OESCONS}|| \
> > -        die "scons install execution failed."
> > +        # install binaries
> > +        install -d ${D}${bindir}
> > +        for i in mongod mongos mongo
> > +        do
> > +            if [ -f ${B}/build/opt/mongo/${i} ]
> > +            then
> > +                install -m 0755 ${B}/build/opt/mongo/${i} ${D}${bindi=
r}/${i}
> > +            else
> > +                bbwarn "${i} does not exists"
> > +            fi
> > +        done
> > +
> > +        # install config
> > +        install -d ${D}${sysconfdir}
> > +        install -m 0644 ${S}/debian/mongod.conf ${D}${sysconfdir}/
> > +
> > +        # install systemd service
> > +       install -d ${D}${systemd_system_unitdir}
> > +       install -m 0644 ${S}/debian/mongod.service ${D}${systemd_syste=
m_unitdir}
> > +
> > +        # install mongo data folder
> > +       install -m 755 -d ${D}${localstatedir}/lib/${BPN}
> > +       chown ${PN}:${PN} ${D}${localstatedir}/lib/${BPN}
> > +
> > +        # Log files
> > +        install -m 755 -d ${D}${localstatedir}/log/${BPN}
> > +        chown ${PN}:${PN} ${D}${localstatedir}/log/${BPN}
> >  }
> > +
> > +CONFFILES_${PN} =3D "${sysconfdir}/mongod.conf"
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "mongod.service"
> > +
> > +
> > --
> > 2.24.0
> >
> >=20
