Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.9318.1600160379220196138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 01:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M5AiQsM/;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id k15so2395215wrn.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 01:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e3G3SypdUZ6tZAKyhYnx7PFHmyutVwFbZnV7Hiv9/iI=;
        b=M5AiQsM/oXonN4pt0rrgVvaz2CmhaGbiSRJ1IrJfzz8X1NMM1LZsH1vh6ZnLZEF0dn
         MC4AxLiXZX3Q3WLz1lKZJgeGGRDMgI83hIrmJBEfZ8EVCk5VLRJWAysgr0E203+nbwWc
         8OhZ54LiXDaf2cR+QDzRyQmW1Q0tUi8JM7H1m/v+a7kQnMySZXHz3ok82q7AbYzyw66R
         utpsuFWbKy7DTplqbJk9dYyIhffQ9K/g5cnzu8eqVNrk5ydb4R6oVB0BNLGROBAWuo+u
         YpOCnZCIhr9+NXloAteqya1doceowex+QFZoY18z51w8KvmBOVns6ha4p3IHs8VehYZX
         6Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e3G3SypdUZ6tZAKyhYnx7PFHmyutVwFbZnV7Hiv9/iI=;
        b=AYjUp/n62Eoz02q7Bw2jA+f3goxSsgu5Y1stCcKSJvmEF/Vc062vaoHrH5FWmIMkSv
         tDUJ2hYDS5EOJVmws0sUiOcy5/1p6dl46bApb5p+3OqcNl67WOgoOQHImQ2OaIdhKVRh
         XFuPiFG5a4WxhMjtG9eYnMp5JWuZXcCwxbHtjRsYmCvVcWJ4jf4B2ekomtDP4Klo0P5V
         //CO2IXTqiCbwY4VZSmFIDMzXvetvtEi9CXBSlNocUj0l/vRYXAHNRoZuzxfUEWC+mtY
         XaV+Nbq8hFMFOL5Qc9NF70BLcQ2xRnevSvqcGHj7LhgzpNKwOOZKoHt45RUcuBN5dnoc
         Ch9w==
X-Gm-Message-State: AOAM531+CfpDhCFVZtxadS9fRIWKdHIsA0bSF1pqswthQCDgriGcScQl
	HMAfIKUQtv7ZMQFGNLFSVDNkAP8Om/7MBqxSt90=
X-Google-Smtp-Source: ABdhPJw2lWxJmGIEaVJhVBqVef0wZXf8v592diew1lLhBT48hX0bm1jTWG5riRoq6aIv0EQb3oakFATVmdBH73F2O1k=
X-Received: by 2002:adf:ec90:: with SMTP id z16mr19509056wrn.145.1600160377294;
 Tue, 15 Sep 2020 01:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200914154902.19553-1-vincent.prince.external@saftbatteries.com> <de3db326-8468-988d-05f0-7937c3b5fe2f@gmail.com>
In-Reply-To: <de3db326-8468-988d-05f0-7937c3b5fe2f@gmail.com>
From: "nefethael" <vincent.prince.fr@gmail.com>
Date: Tue, 15 Sep 2020 10:59:26 +0200
Message-ID: <CAB2nKc_LJvEhQi7oKABOkAgr_21t1Z0MR6nLZbbMXP_WAbC30g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] mongodb: bump to r4.4.1 version
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Vincent Prince <vincent.prince.fr@gmail.com.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I see that a bugfix already exists upstream in libmongocrypt but it
seems it was never merged into mongodb?
https://github.com/mongodb/libmongocrypt/pull/89
https://github.com/mongodb/libmongocrypt/commit/90ce62d63ec674bcd161ce6bfc4=
9337bdccdb05f

I'll check what is the best option before sending v3, and I just saw a
new r4.7.0 was released 4 days ago ...

Vincent

Le mar. 15 sept. 2020 =C3=A0 00:36, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :
>
> Hi Vincent
>
> I am seeing a build failure on musl ( TCLIBC =3D "musl" )
>
> https://errors.yoctoproject.org/Errors/Details/498873/
>
> src/third_party/kms-message/src/kms_request_str.h:42:52: error: unknown
> type name 'ssize_t'; did you mean 'size_t'?
>
> perhaps this file should include
>
> #include <sys/types.h>
>
> Can you cook such a patch and send it
>
> On 9/14/20 8:49 AM, Vincent Prince wrote:
> > From: Vincent Prince <vincent.prince.fr@gmail.com>
> >
> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com.com>
> > ---
> > Changes in v2:
> >   - remove shell option from packageconfig
> >   - reformat tabs
> >   - replace bbwarn by bbnote when binary is not compiled
> >
> >   ...e-build-settings-from-environment-va.patch | 25 ++++----
> >   ...-control-use-of-gnu_get_libc_version.patch |  8 +--
> >   ...001-Use-long-long-instead-of-int64_t.patch | 15 ++---
> >   ...ion-for-the-macro-__ELF_NATIVE_CLASS.patch | 13 ++--
> >   .../mongodb/0003-Fix-unknown-prefix-env.patch |  2 +-
> >   .../recipes-dbs/mongodb/mongodb/1296.patch    | 12 ++--
> >   .../mongodb/mongodb/arm64-support.patch       | 14 ++---
> >   .../recipes-dbs/mongodb/mongodb_git.bb        | 61 +++++++++++++++---=
-
> >   8 files changed, 97 insertions(+), 53 deletions(-)
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mon=
godb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta=
-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-=
to-use-build-settings-from-environment-va.patch
> > index 190884624..b8a325295 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-Tell-scons-to-use-build-settings-from-environment-va.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-Tell-scons-to-use-build-settings-from-environment-va.patch
> > @@ -1,4 +1,4 @@
> > -From 1b2e24e14ee72e54e466be2512c78272f62d60b4 Mon Sep 17 00:00:00 2001
> > +From 8295bb6a60896fed54d6450bca091aea4eea4fb2 Mon Sep 17 00:00:00 2001
> >   From: Vincent Prince <vincent.prince.fr@gmail.com>
> >   Date: Mon, 16 Sep 2019 13:21:44 +0200
> >   Subject: [PATCH 01/10] Tell scons to use build settings from environm=
ent
> > @@ -7,14 +7,14 @@ Subject: [PATCH 01/10] Tell scons to use build settin=
gs from environment
> >   Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> >   Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >   ---
> > - SConstruct                | 8 ++++++--
> > - 1 files changed, 8 insertions(+), 2 deletions(-)
> > + SConstruct | 8 ++++++--
> > + 1 file changed, 6 insertions(+), 2 deletions(-)
> >
> >   diff --git a/SConstruct b/SConstruct
> > -index 7ebbcbc..e63cf15 100644
> > +index 89c044ab78..2044c0ddb8 100644
> >   --- a/SConstruct
> >   +++ b/SConstruct
> > -@@ -608,6 +608,7 @@ def variable_arch_converter(val):
> > +@@ -593,6 +593,7 @@ def variable_arch_converter(val):
> >            'amd64':  'x86_64',
> >            'emt64':   'x86_64',
> >            'x86':    'i386',
> > @@ -22,7 +22,7 @@ index 7ebbcbc..e63cf15 100644
> >        }
> >        val =3D val.lower()
> >
> > -@@ -695,7 +696,8 @@ env_vars.Add(
> > +@@ -723,7 +724,8 @@ env_vars.Add(
> >    )
> >
> >    env_vars.Add('CC',
> > @@ -32,7 +32,7 @@ index 7ebbcbc..e63cf15 100644
> >
> >    env_vars.Add('CCFLAGS',
> >        help=3D'Sets flags for the C and C++ compiler',
> > -@@ -715,7 +717,8 @@ env_vars.Add('CPPPATH',
> > +@@ -743,7 +745,8 @@ env_vars.Add('CPPPATH',
> >        converter=3Dvariable_shlex_converter)
> >
> >    env_vars.Add('CXX',
> > @@ -42,15 +42,14 @@ index 7ebbcbc..e63cf15 100644
> >
> >    env_vars.Add('CXXFLAGS',
> >        help=3D'Sets flags for the C++ compiler',
> > -@@ -1018,6 +1021,7 @@ envDict =3D dict(BUILD_ROOT=3DbuildDir,
> > -                )
> > +@@ -1127,6 +1130,7 @@ if get_option('build-tools') =3D=3D 'next' or ge=
t_option('ninja') =3D=3D 'next':
> > +     SCons.Tool.DefaultToolpath.insert(0, os.path.abspath('site_scons/=
site_tools/next'))
> >
> >    env =3D Environment(variables=3Denv_vars, **envDict)
> >   +env.PrependENVPath('PATH', os.getenv('PATH'))
> > - del envDict
> > -
> > - for var in ['CC', 'CXX']:
> >
> > + # Only print the spinner if stdout is a tty
> > + if sys.stdout.isatty():
> >   --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mon=
godb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/meta=
-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC=
__-to-control-use-of-gnu_get_libc_version.patch
> > index d98fa56cb..8d82be1b5 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
> > @@ -1,4 +1,4 @@
> > -From d701ceeb15662038435b80ba556a80c17f76d2dc Mon Sep 17 00:00:00 2001
> > +From 6332823f9fdcb571305b716330e67d0b38810868 Mon Sep 17 00:00:00 2001
> >   From: Vincent Prince <vincent.prince.fr@gmail.com>
> >   Date: Mon, 16 Sep 2019 13:30:13 +0200
> >   Subject: [PATCH 03/10] Use __GLIBC__ to control use of gnu_get_libc_v=
ersion
> > @@ -10,7 +10,7 @@ Signed-off-by: Vincent Prince <vincent.prince.fr@gmai=
l.com>
> >    1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >   diff --git a/src/mongo/util/processinfo_linux.cpp b/src/mongo/util/pr=
ocessinfo_linux.cpp
> > -index cccb91c..45c4b7d 100644
> > +index a968c54727..0d8b8874e2 100644
> >   --- a/src/mongo/util/processinfo_linux.cpp
> >   +++ b/src/mongo/util/processinfo_linux.cpp
> >   @@ -44,10 +44,10 @@
> > @@ -27,7 +27,7 @@ index cccb91c..45c4b7d 100644
> >    #endif
> >
> >    #include <boost/filesystem.hpp>
> > -@@ -546,7 +546,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo() =
{
> > +@@ -617,7 +617,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo() =
{
> >        std::stringstream ss;
> >        ss << "uClibc-" << __UCLIBC_MAJOR__ << "." << __UCLIBC_MINOR__ <=
< "." << __UCLIBC_SUBLEVEL__;
> >        bExtra.append("libcVersion", ss.str());
> > @@ -37,5 +37,5 @@ index cccb91c..45c4b7d 100644
> >    #endif
> >        if (!verSig.empty())
> >   --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mon=
godb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/dynamic-layers/m=
eta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_=
t.patch
> > index b9c670407..958e09c3d 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-Use-long-long-instead-of-int64_t.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-Use-long-long-instead-of-int64_t.patch
> > @@ -1,4 +1,4 @@
> > -From 20fcbf2a05ee6542aba942f6006d149db70fb9ce Mon Sep 17 00:00:00 2001
> > +From 4e7f15346682482bc2071c7209dec97507d3bc4c Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Sat, 2 Sep 2017 10:03:37 -0700
> >   Subject: [PATCH 02/10] Use long long instead of int64_t
> > @@ -8,12 +8,13 @@ error: call to member function 'appendNumber' is ambi=
guous
> >   since this function expects long long as parameter and not int64_t
> >
> >   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >   ---
> >    src/mongo/util/procparser.cpp | 10 +++++-----
> >    1 file changed, 5 insertions(+), 5 deletions(-)
> >
> >   diff --git a/src/mongo/util/procparser.cpp b/src/mongo/util/procparse=
r.cpp
> > -index c574a3f..5ea66b7 100644
> > +index 24b9d1e2c9..0f274cfff6 100644
> >   --- a/src/mongo/util/procparser.cpp
> >   +++ b/src/mongo/util/procparser.cpp
> >   @@ -261,7 +261,7 @@ Status parseProcStat(const std::vector<StringData=
>& keys,
> > @@ -23,7 +24,7 @@ index c574a3f..5ea66b7 100644
> >   -                    uint64_t value;
> >   +                    long long  value;
> >
> > -                     if (!parseNumberFromString(stringValue, &value).i=
sOK()) {
> > +                     if (!NumberParser{}(stringValue, &value).isOK()) =
{
> >                            value =3D 0;
> >   @@ -273,7 +273,7 @@ Status parseProcStat(const std::vector<StringData=
>& keys,
> >                } else {
> > @@ -32,7 +33,7 @@ index c574a3f..5ea66b7 100644
> >   -                uint64_t value;
> >   +                long long value;
> >
> > -                 if (!parseNumberFromString(stringValue, &value).isOK(=
)) {
> > +                 if (!NumberParser{}(stringValue, &value).isOK()) {
> >                        value =3D 0;
> >   @@ -366,7 +366,7 @@ Status parseProcMemInfo(const std::vector<StringD=
ata>& keys,
> >
> > @@ -41,7 +42,7 @@ index c574a3f..5ea66b7 100644
> >   -            uint64_t value;
> >   +            long long value;
> >
> > -             if (!parseNumberFromString(stringValue, &value).isOK()) {
> > +             if (!NumberParser{}(stringValue, &value).isOK()) {
> >                    value =3D 0;
> >   @@ -522,7 +522,7 @@ Status parseProcDiskStats(const std::vector<Strin=
gData>& disks,
> >                              StringData data,
> > @@ -59,8 +60,8 @@ index c574a3f..5ea66b7 100644
> >   -                uint64_t value;
> >   +                long long value;
> >
> > -                 if (!parseNumberFromString(stringValue, &value).isOK(=
)) {
> > +                 if (!NumberParser{}(stringValue, &value).isOK()) {
> >                        value =3D 0;
> >   --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mon=
godb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch b/meta-oe=
/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definiti=
on-for-the-macro-__ELF_NATIVE_CLASS.patch
> > index 869d2849d..57f4168f5 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
02-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
02-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
> > @@ -1,4 +1,4 @@
> > -From 73c6374ceb0c062e91210cc9ef3e0e9fa30ee514 Mon Sep 17 00:00:00 2001
> > +From 28f34191eef1e70c24d2f81b66e4dd40dbefcd35 Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Sat, 2 Sep 2017 12:42:30 -0700
> >   Subject: [PATCH 04/10] Add a definition for the macro __ELF_NATIVE_CL=
ASS
> > @@ -6,17 +6,18 @@ Subject: [PATCH 04/10] Add a definition for the macro=
 __ELF_NATIVE_CLASS
> >   It depends on the native arch's word size.
> >
> >   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >   ---
> >    src/mongo/util/stacktrace_posix.cpp | 9 +++++++++
> >    1 file changed, 9 insertions(+)
> >
> >   diff --git a/src/mongo/util/stacktrace_posix.cpp b/src/mongo/util/sta=
cktrace_posix.cpp
> > -index 1d7b3d7..f81e329 100644
> > +index 531e21bdc2..fa611499e4 100644
> >   --- a/src/mongo/util/stacktrace_posix.cpp
> >   +++ b/src/mongo/util/stacktrace_posix.cpp
> > -@@ -39,6 +39,15 @@
> > +@@ -42,6 +42,15 @@
> > + #include <iostream>
> >    #include <string>
> > - #include <sys/utsname.h>
> >
> >   +#if !defined(__GLIBC__)
> >   +#if defined __x86_64__ && !defined __ILP32__
> > @@ -28,8 +29,8 @@ index 1d7b3d7..f81e329 100644
> >   +#endif
> >   +
> >    #include "mongo/base/init.h"
> > + #include "mongo/bson/json.h"
> >    #include "mongo/config.h"
> > - #include "mongo/db/jsobj.h"
> >   --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mon=
godb/0003-Fix-unknown-prefix-env.patch b/meta-oe/dynamic-layers/meta-python=
/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
> > index 3a27aacfe..910ef0b5f 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
03-Fix-unknown-prefix-env.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
03-Fix-unknown-prefix-env.patch
> > @@ -2,7 +2,7 @@ Index: git/SConstruct
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   --- git.orig/SConstruct
> >   +++ git/SConstruct
> > -@@ -884,6 +884,14 @@ env_vars.Add('WINDOWS_OPENSSL_BIN',
> > +@@ -977,6 +977,14 @@ env_vars.Add('WINDOWS_OPENSSL_BIN',
> >        help=3D'Sets the path to the openssl binaries for packaging',
> >        default=3D'c:/openssl/bin')
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mon=
godb/1296.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mo=
ngodb/1296.patch
> > index ae84bcb56..e4ae30776 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/12=
96.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/12=
96.patch
> > @@ -15,15 +15,16 @@ src/mongo/util/net/ssl_manager.cpp:575:79: error: i=
nvalid conversion from 'size_
> >     if (mongoUnsignedAddOverflow64(tagAndLengthByteCount, derLength, ou=
tLength) ||
> >
> >   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >   ---
> >    src/mongo/util/net/ssl_manager.cpp | 6 +++---
> >    1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >   diff --git a/src/mongo/util/net/ssl_manager.cpp b/src/mongo/util/net/=
ssl_manager.cpp
> > -index b93ebe84a4a3..3511eb5d998f 100644
> > +index 455a1662a5..e8497bc0d1 100644
> >   --- a/src/mongo/util/net/ssl_manager.cpp
> >   +++ b/src/mongo/util/net/ssl_manager.cpp
> > -@@ -782,7 +782,7 @@ class DERToken {
> > +@@ -810,7 +810,7 @@ public:
> >         *
> >         * Returns a DERToken which consists of the (tag, length, value)=
 tuple.
> >         */
> > @@ -32,7 +33,7 @@ index b93ebe84a4a3..3511eb5d998f 100644
> >
> >    private:
> >        DERType _type{DERType::EndOfContent};
> > -@@ -799,7 +799,7 @@ struct DataType::Handler<DERToken> {
> > +@@ -827,7 +827,7 @@ struct DataType::Handler<DERToken> {
> >                           size_t length,
> >                           size_t* advanced,
> >                           std::ptrdiff_t debug_offset) {
> > @@ -41,7 +42,7 @@ index b93ebe84a4a3..3511eb5d998f 100644
> >
> >            auto swPair =3D DERToken::parse(ConstDataRange(ptr, length),=
 &outLength);
> >
> > -@@ -844,7 +844,7 @@ StatusWith<std::string> readDERString(ConstDataRan=
geCursor& cdc) {
> > +@@ -889,7 +889,7 @@ StatusWith<DERInteger> readDERInt(ConstDataRangeCu=
rsor& cdc) {
> >    }
> >
> >
> > @@ -50,3 +51,6 @@ index b93ebe84a4a3..3511eb5d998f 100644
> >        const size_t kTagLength =3D 1;
> >        const size_t kTagLengthAndInitialLengthByteLength =3D kTagLength=
 + 1;
> >
> > +--
> > +2.24.0
> > +
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mon=
godb/arm64-support.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/m=
ongodb/mongodb/arm64-support.patch
> > index 15bd7da70..1a7bf0fc5 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ar=
m64-support.patch
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ar=
m64-support.patch
> > @@ -1,4 +1,4 @@
> > -From c9fc9e9a44b0fb764ce86a5e57f17d3c5bbfd8cd Mon Sep 17 00:00:00 2001
> > +From 298d958148f1fb2bb7725fed15c68c09677c14c9 Mon Sep 17 00:00:00 2001
> >   From: Vincent Prince <vincent.prince.fr@gmail.com>
> >   Date: Mon, 16 Sep 2019 13:37:10 +0200
> >   Subject: [PATCH 05/10] Add alises for arm64 which is same as aarch64
> > @@ -12,10 +12,10 @@ Signed-off-by: Vincent Prince <vincent.prince.fr@gm=
ail.com>
> >    3 files changed, 3 insertions(+), 2 deletions(-)
> >
> >   diff --git a/SConstruct b/SConstruct
> > -index e63cf15..5593c78 100644
> > +index 448939bdd0..abfd816f3e 100644
> >   --- a/SConstruct
> >   +++ b/SConstruct
> > -@@ -1129,6 +1129,7 @@ elif endian =3D=3D "big":
> > +@@ -1228,6 +1228,7 @@ if endian =3D=3D "auto":
> >    processor_macros =3D {
> >        'arm'        : { 'endian': 'little', 'defines': ('__arm__',) },
> >        'aarch64'    : { 'endian': 'little', 'defines': ('__arm64__', '_=
_aarch64__')},
> > @@ -24,10 +24,10 @@ index e63cf15..5593c78 100644
> >        'ppc64le'    : { 'endian': 'little', 'defines': ('__powerpc64__'=
,)},
> >        's390x'      : { 'endian': 'big',    'defines': ('__s390x__',)},
> >   diff --git a/src/third_party/IntelRDFPMathLib20U1/SConscript b/src/th=
ird_party/IntelRDFPMathLib20U1/SConscript
> > -index f23c071..fb82cd6 100644
> > +index 58e1b7ba65..bffe83b462 100644
> >   --- a/src/third_party/IntelRDFPMathLib20U1/SConscript
> >   +++ b/src/third_party/IntelRDFPMathLib20U1/SConscript
> > -@@ -308,7 +308,7 @@ if processor =3D=3D 'i386' or processor =3D=3D 'em=
scripten':
> > +@@ -309,7 +309,7 @@ if processor =3D=3D 'i386' or processor =3D=3D 'em=
scripten':
> >    elif processor =3D=3D 'arm':
> >        cpp_defines['IA32'] =3D '1'
> >        cpp_defines['ia32'] =3D '1'
> > @@ -37,7 +37,7 @@ index f23c071..fb82cd6 100644
> >        cpp_defines['EFI2'] =3D '1'
> >    # Using 64 bit little endian
> >   diff --git a/src/third_party/wiredtiger/SConscript b/src/third_party/=
wiredtiger/SConscript
> > -index cdd090b..97a1b3b 100644
> > +index d6bd665e23..2f1e656a19 100644
> >   --- a/src/third_party/wiredtiger/SConscript
> >   +++ b/src/third_party/wiredtiger/SConscript
> >   @@ -152,7 +152,7 @@ condition_map =3D {
> > @@ -50,5 +50,5 @@ index cdd090b..97a1b3b 100644
> >        'X86_HOST'     : env['TARGET_ARCH'] =3D=3D 'x86_64',
> >        'ZSERIES_HOST' : env['TARGET_ARCH'] =3D=3D 's390x',
> >   --
> > -2.7.4
> > +2.24.0
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mon=
godb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongod=
b_git.bb
> > index 58841ef31..b8691df9e 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_gi=
t.bb
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_gi=
t.bb
> > @@ -9,12 +9,12 @@ DEPENDS =3D "openssl libpcap zlib boost curl python3 =
\
> >              python3-psutil-native python3-regex-native \
> >              "
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
> >              file://0001-Tell-scons-to-use-build-settings-from-environm=
ent-va.patch \
> >              file://0001-Use-long-long-instead-of-int64_t.patch \
> >              file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_v=
ersion.patch \
> > @@ -35,6 +35,7 @@ SRC_URI_append_toolchain-clang =3D "\
> >              file://0001-asio-Dont-use-experimental-with-clang.patch \
> >              "
> >
> > +
> >   S =3D "${WORKDIR}/git"
> >
> >   COMPATIBLE_HOST ?=3D '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
> > @@ -51,26 +52,64 @@ PACKAGECONFIG[tcmalloc] =3D "--use-system-tcmalloc,=
--allocator=3Dsystem,gperftools,"
> >   PACKAGECONFIG[shell] =3D ",--js-engine=3Dnone,,"
> >   PACKAGECONFIG[system-pcre] =3D "--use-system-pcre,,libpcre,"
> >
> > -EXTRA_OESCONS =3D "--prefix=3D${D}${prefix} \
> > +EXTRA_OESCONS =3D "PREFIX=3D${prefix} \
> > +                 DESTDIR=3D${D} \
> >                    LIBPATH=3D${STAGING_LIBDIR} \
> >                    LINKFLAGS=3D'${LDFLAGS}' \
> >                    CXXFLAGS=3D'${CXXFLAGS}' \
> >                    TARGET_ARCH=3D${TARGET_ARCH} \
> > +                 MONGO_VERSION=3D${PV} \
> >                    --ssl \
> >                    --disable-warnings-as-errors \
> >                    --use-system-zlib \
> >                    --nostrip \
> >                    --endian=3D${@oe.utils.conditional('SITEINFO_ENDIANN=
ESS', 'le', 'little', 'big', d)} \
> >                    --wiredtiger=3D${@['off','on'][d.getVar('SITEINFO_BI=
TS') !=3D '32']} \
> > -                 ${PACKAGECONFIG_CONFARGS} \
> > -                 core"
> > +                 --separate-debug \
> > +                 ${PACKAGECONFIG_CONFARGS}"
> > +
> > +
> > +USERADD_PACKAGES =3D "${PN}"
> > +USERADD_PARAM_${PN} =3D "--system --no-create-home --home-dir /var/run=
/${BPN} --shell /bin/false --user-group ${BPN}"
> > +
> >
> >   scons_do_compile() {
> > -        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCON=
S} || \
> > +        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCON=
S} install-core || \
> >           die "scons build execution failed."
> >   }
> >
> >   scons_do_install() {
> > -        ${STAGING_BINDIR_NATIVE}/scons install ${EXTRA_OESCONS}|| \
> > -        die "scons install execution failed."
> > +        # install binaries
> > +        install -d ${D}${bindir}
> > +        for i in mongod mongos mongo
> > +        do
> > +            if [ -f ${B}/build/opt/mongo/${i} ]
> > +            then
> > +                install -m 0755 ${B}/build/opt/mongo/${i} ${D}${bindir=
}/${i}
> > +            else
> > +                bbnote "${i} does not exist"
> > +            fi
> > +        done
> > +
> > +        # install config
> > +        install -d ${D}${sysconfdir}
> > +        install -m 0644 ${S}/debian/mongod.conf ${D}${sysconfdir}/
> > +
> > +        # install systemd service
> > +        install -d ${D}${systemd_system_unitdir}
> > +        install -m 0644 ${S}/debian/mongod.service ${D}${systemd_syste=
m_unitdir}
> > +
> > +        # install mongo data folder
> > +        install -m 755 -d ${D}${localstatedir}/lib/${BPN}
> > +        chown ${PN}:${PN} ${D}${localstatedir}/lib/${BPN}
> > +
> > +        # Log files
> > +        install -m 755 -d ${D}${localstatedir}/log/${BPN}
> > +        chown ${PN}:${PN} ${D}${localstatedir}/log/${BPN}
> >   }
> > +
> > +CONFFILES_${PN} =3D "${sysconfdir}/mongod.conf"
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "mongod.service"
> > +
> > +
> >
