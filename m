Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id F2F1490024
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 16:41:07 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id v2so660207iob.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qNZSApyUlBiTglahtwHg9tF3VCsbSNYo1LlKf2nBbiM=;
	b=it/qTmzLAIXS6o7/WjL5cjuL59V1dR38b7Jx0Qtx1MBwJXeh+QKnTwte9HwUh7N5Id
	G9tcRBcgUPlpdjyyXIlP+W2mDGkCoJvQT+JraBn4t3sGjot6dxlkMAj3ukl50ZmN3hOR
	ie22gh4/U8Jl26cKOnBMY7/IdeUc4riLRE0L81thhzSD8DMy9YotUI1jMU51bUnbhhYr
	1mfMf0RuYQANszPEomLr79SGWx80PRnpCUrmdJ/bJT6F8DX1VOR9VIU5uYIsH9RE9t3A
	bsUA3dtNQ02nb9g3yOSpXTjsdirVsrwraEAn12LCXTAQIwxLmA62ZRNJyR9rSh5Dwv5i
	ogmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qNZSApyUlBiTglahtwHg9tF3VCsbSNYo1LlKf2nBbiM=;
	b=IdemZwSQsmOv6qk8cLrM4xouuOFwfhT4arfepI1Cr631OLuvEYOOWfAIW31TX0rI6x
	EPKXfpLWGYmJjzUL788GlPM1FIDqbULez6PaH1K4sL8sL+WBNq9KgKUWShDbDLNHALoZ
	CM6YH1/pp2clgnqLT5qeD0rljm0LxUf45OTyBeftFAmRVPrkILo8gXSiGL6gU5nBTKEz
	Zjs8uEpNaaXU23jjREb2WvrPMkviLwdX7vlc7wpyAvYV9hdB6fakvqaYF+GRManRdl5n
	uh5pS41wxZeZ8iGFcKrekHZPKbbi4irEoeusl+h1i9l+fKCJuaNAalrW8+dlKkXyTxL5
	PhQA==
X-Gm-Message-State: APjAAAVZTL5Y8jw7pd/R7ftTNfdQA6W0sAmkmeN8OrNqOEby3Ara9a8c
	MwOEfM81McovcGO/D9C8yHlTqdDEFKJQ+RINDbE=
X-Google-Smtp-Source: APXvYqwda+kYeHj07wo1oxU2A1IpFlB4emrUtrw7+JOYvaSFu0QpsdojkwkNzhifZWJeImRJxUvcJgPU+AOQZBWDZlg=
X-Received: by 2002:a02:2a87:: with SMTP id w129mr5714633jaw.41.1568824867588; 
	Wed, 18 Sep 2019 09:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
	<1568805952-19822-5-git-send-email-vincent.prince.external@saftbatteries.com>
	<CAMKF1sr=H7+_uAPgw3+VU3-NR3ztP-gTZPMOv2hO=wJ82BrZ_g@mail.gmail.com>
In-Reply-To: <CAMKF1sr=H7+_uAPgw3+VU3-NR3ztP-gTZPMOv2hO=wJ82BrZ_g@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 18 Sep 2019 18:40:55 +0200
Message-ID: <CAB2nKc_9d3Uduco+BuoXbASFFXV3jAcyOMAr-1XrJycNL5BiAg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH 4/4] mongodb: bump to version 4.2.0+git18ce5c9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Sep 2019 16:41:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

musl/arm64 problem seems quite easy to fix:
src/mongo/util/errno_util.cpp: In function 'std::string
mongo::errnoWithDescription(int)': src/mongo/util/errno_util.cpp:66:21:
error: invalid conversion from 'int' to 'char*' [-fpermissive]
msg =3D strerror_r(errNumber, buf, kBuflen);

clang/x86 looks more complicated to me:
src/mongo/stdx/new.h:53:12: error: no member named
'hardware_constructive_interference_size' in namespace 'std'
using std::hardware_constructive_interference_size;
...

I don't have resources to try patches for this outside Yocto build system,
so I can try to send v2 but if someone wants to help for these issues,
don't hesitate ;)



Le mer. 18 sept. 2019 =C3=A0 17:45, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :

> Hi Vincent
>
> Thanks for working on this, it fails on couple of combinations
>
> clang/x86
> https://errors.yoctoproject.org/Errors/Details/271195/
>
> musl/arm64
> https://errors.yoctoproject.org/Errors/Details/271194/
> On Wed, Sep 18, 2019 at 4:26 AM Vincent Prince
> <vincent.prince.fr@gmail.com> wrote:
> >
> > MongoDB v4.2.0 adds python3 support that is needed by scons upgrade
> [44f303b scons: inherit python3native].
> >  - mongodb git commit 18ce5c9 was needed to fix
> https://jira.mongodb.org/browse/SERVER-42787
> >  - Add PREFIX and prefix to scons environment to fix unknown variable
> check (SConstruct#L1073)
> >  - Previous patches are refreshed
> >
> > Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.co=
m
> >
> > ---
> >  ...FPMathLib20U1-Check-for-__DEFINED_wchar_t.patch | 22 +++++----
> >  ...001-Support-deprecated-resolver-functions.patch | 10 ++--
> >  ...to-use-build-settings-from-environment-va.patch | 46
> ++++++++---------
> >  ...__-to-control-use-of-gnu_get_libc_version.patch | 29 ++++++-----
> >  .../0001-Use-long-long-instead-of-int64_t.patch    | 26 +++++-----
> >  ...001-asio-Dont-use-experimental-with-clang.patch | 29 +++++------
> >  ...finition-for-the-macro-__ELF_NATIVE_CLASS.patch | 10 ++--
> >  .../0002-Fix-default-stack-size-to-256K.patch      | 12 ++---
> >  .../mongodb/0003-Fix-unknown-prefix-env.patch      | 19 ++++++++
> >  .../0004-wiredtiger-Disable-strtouq-on-musl.patch  | 15 +++---
> >  .../mongodb/mongodb/arm64-support.patch            | 57
> +++++++++++++---------
> >  meta-oe/recipes-dbs/mongodb/mongodb_git.bb         | 20 ++++----
> >  12 files changed, 164 insertions(+), 131 deletions(-)
> >  create mode 100644
> meta-oe/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
> >
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for=
-__DEFINED_wchar_t.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for=
-__DEFINED_wchar_t.patch
> > index 4d7ac3a..e636adc 100644
> > ---
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for=
-__DEFINED_wchar_t.patch
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for=
-__DEFINED_wchar_t.patch
> > @@ -1,7 +1,7 @@
> > -From fbfceebce2121831904f2f7115252dd03b413a6d Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Tue, 19 Sep 2017 18:52:53 -0700
> > -Subject: [PATCH] IntelRDFPMathLib20U1: Check for __DEFINED_wchar_t
> > +From 97914aeab52b4d0ea0ab9e5ff985a1c5cddb0fa1 Mon Sep 17 00:00:00 2001
> > +From: Vincent Prince <vincent.prince.fr@gmail.com>
> > +Date: Mon, 16 Sep 2019 13:41:39 +0200
> > +Subject: [PATCH 06/10] IntelRDFPMathLib20U1: Check for __DEFINED_wchar=
_t
> >
> >  This is defined by musl if wchar_t is already defined
> >
> > @@ -12,16 +12,15 @@
> src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h:46:15:
> error: t
> >  typedef int   wchar_t;
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >  ---
> > -Upstream-Status: Pending
> > -
> >   src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h | 2 =
+-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -Index:
> git/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ----
> git.orig/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
> > -+++ git/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions=
.h
> > +diff --git
> a/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
> b/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
> > +index 56775bc..be96a85 100755
> > +--- a/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
> > ++++ b/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
> >  @@ -43,7 +43,7 @@
> >
> >   #if 0 // MongoDB Modification -- just `#include <stddef.h>`
> > @@ -31,3 +30,6 @@ Index:
> git/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
> >   typedef int   wchar_t;
> >   #endif
> >   #else
> > +--
> > +2.7.4
> > +
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-fu=
nctions.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-fu=
nctions.patch
> > index 070411a..3d949c8 100644
> > ---
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-fu=
nctions.patch
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-fu=
nctions.patch
> > @@ -1,7 +1,7 @@
> > -From 5994023a03634dfc0318976c293e7391fe6aa060 Mon Sep 17 00:00:00 2001
> > +From 8d035e84c2edb44461ef4df9cdef0a6dfce0a1d7 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 24 Aug 2018 12:56:22 -0700
> > -Subject: [PATCH 1/2] Support deprecated resolver functions
> > +Subject: [PATCH 07/10] Support deprecated resolver functions
> >
> >  Needed for  musl libc
> >
> > @@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 6 insertions(+)
> >
> >  diff --git a/src/mongo/util/dns_query_posix-impl.h
> b/src/mongo/util/dns_query_posix-impl.h
> > -index d19958010c..bbca3309ed 100644
> > +index a5e3629..fb29d2d 100644
> >  --- a/src/mongo/util/dns_query_posix-impl.h
> >  +++ b/src/mongo/util/dns_query_posix-impl.h
> > -@@ -53,6 +53,12 @@
> > +@@ -54,6 +54,12 @@
> >
> >   #include <boost/noncopyable.hpp>
> >
> > @@ -29,5 +29,5 @@ index d19958010c..bbca3309ed 100644
> >   namespace dns {
> >   // The anonymous namespace is safe, in this header, as it is not
> really a header.  It is only used
> >  --
> > -2.18.0
> > +2.7.4
> >
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settin=
gs-from-environment-va.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settin=
gs-from-environment-va.patch
> > index a6d721a..1908846 100644
> > ---
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settin=
gs-from-environment-va.patch
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settin=
gs-from-environment-va.patch
> > @@ -1,19 +1,20 @@
> > -From 53368d3f4adc09dd84234a9af31771bcd8ca2757 Mon Sep 17 00:00:00 2001
> > -From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> > -Date: Fri, 15 Jan 2016 22:41:28 +0100
> > -Subject: [PATCH] Tell scons to use build settings from environment
> variables
> > +From 1b2e24e14ee72e54e466be2512c78272f62d60b4 Mon Sep 17 00:00:00 2001
> > +From: Vincent Prince <vincent.prince.fr@gmail.com>
> > +Date: Mon, 16 Sep 2019 13:21:44 +0200
> > +Subject: [PATCH 01/10] Tell scons to use build settings from environme=
nt
> > + variables
> >
> >  Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >  ---
> >   SConstruct                | 8 ++++++--
> > - src/mongo/util/SConscript | 2 ++
> > - 2 files changed, 8 insertions(+), 2 deletions(-)
> > + 1 files changed, 8 insertions(+), 2 deletions(-)
> >
> > -Index: git/SConstruct
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/SConstruct
> > -+++ git/SConstruct
> > -@@ -564,6 +564,7 @@ def variable_arch_converter(val):
> > +diff --git a/SConstruct b/SConstruct
> > +index 7ebbcbc..e63cf15 100644
> > +--- a/SConstruct
> > ++++ b/SConstruct
> > +@@ -608,6 +608,7 @@ def variable_arch_converter(val):
> >           'amd64':  'x86_64',
> >           'emt64':   'x86_64',
> >           'x86':    'i386',
> > @@ -21,7 +22,7 @@ Index: git/SConstruct
> >       }
> >       val =3D val.lower()
> >
> > -@@ -652,7 +653,8 @@ env_vars.Add(
> > +@@ -695,7 +696,8 @@ env_vars.Add(
> >   )
> >
> >   env_vars.Add('CC',
> > @@ -31,7 +32,7 @@ Index: git/SConstruct
> >
> >   env_vars.Add('CCFLAGS',
> >       help=3D'Sets flags for the C and C++ compiler',
> > -@@ -672,7 +674,8 @@ env_vars.Add('CPPPATH',
> > +@@ -715,7 +717,8 @@ env_vars.Add('CPPPATH',
> >       converter=3Dvariable_shlex_converter)
> >
> >   env_vars.Add('CXX',
> > @@ -41,24 +42,15 @@ Index: git/SConstruct
> >
> >   env_vars.Add('CXXFLAGS',
> >       help=3D'Sets flags for the C++ compiler',
> > -@@ -961,6 +964,7 @@ envDict =3D dict(BUILD_ROOT=3DbuildDir,
> > +@@ -1018,6 +1021,7 @@ envDict =3D dict(BUILD_ROOT=3DbuildDir,
> >                  )
> >
> >   env =3D Environment(variables=3Denv_vars, **envDict)
> >  +env.PrependENVPath('PATH', os.getenv('PATH'))
> >   del envDict
> >
> > - env.AddMethod(mongo_platform.env_os_is_wrapper, 'TargetOSIs')
> > -Index: git/src/mongo/util/SConscript
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/src/mongo/util/SConscript
> > -+++ git/src/mongo/util/SConscript
> > -@@ -329,6 +329,8 @@ if env['MONGO_ALLOCATOR'] =3D=3D 'tcmalloc':
> > -                 'MONGO_HAVE_GPERFTOOLS_SIZE_CLASS_STATS'
> > -             ]
> > -         )
> > -+    if not use_system_version_of_library('valgrind'):
> > -+        tcmspEnv.InjectThirdPartyIncludePaths('valgrind')
> > + for var in ['CC', 'CXX']:
> >
> > -     if not use_system_version_of_library('valgrind'):
> > -         # Include valgrind since tcmalloc disables itself while
> running under valgrind
> > +--
> > +2.7.4
> > +
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-o=
f-gnu_get_libc_version.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-o=
f-gnu_get_libc_version.patch
> > index c17ebf1..d98fa56 100644
> > ---
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-o=
f-gnu_get_libc_version.patch
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-o=
f-gnu_get_libc_version.patch
> > @@ -1,18 +1,18 @@
> > -From 3eed8388b49d5d3cbc2db74fee1b017eb4b40d0a Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 2 Sep 2017 10:06:24 -0700
> > -Subject: [PATCH] Use __GLIBC__ to control use of gnu_get_libc_version
> > +From d701ceeb15662038435b80ba556a80c17f76d2dc Mon Sep 17 00:00:00 2001
> > +From: Vincent Prince <vincent.prince.fr@gmail.com>
> > +Date: Mon, 16 Sep 2019 13:30:13 +0200
> > +Subject: [PATCH 03/10] Use __GLIBC__ to control use of
> gnu_get_libc_version
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >  ---
> > -Upstream-Status: Pending
> > - src/mongo/util/processinfo_linux.cpp | 6 ++++--
> > - 1 file changed, 4 insertions(+), 2 deletions(-)
> > + src/mongo/util/processinfo_linux.cpp | 8 ++++----
> > + 1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > -Index: git/src/mongo/util/processinfo_linux.cpp
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/src/mongo/util/processinfo_linux.cpp
> > -+++ git/src/mongo/util/processinfo_linux.cpp
> > +diff --git a/src/mongo/util/processinfo_linux.cpp
> b/src/mongo/util/processinfo_linux.cpp
> > +index cccb91c..45c4b7d 100644
> > +--- a/src/mongo/util/processinfo_linux.cpp
> > ++++ b/src/mongo/util/processinfo_linux.cpp
> >  @@ -44,10 +44,10 @@
> >   #include <unistd.h>
> >   #ifdef __BIONIC__
> > @@ -27,8 +27,8 @@ Index: git/src/mongo/util/processinfo_linux.cpp
> >   #endif
> >
> >   #include <boost/filesystem.hpp>
> > -@@ -503,7 +503,7 @@ void ProcessInfo::SystemInfo::collectSys
> > -     stringstream ss;
> > +@@ -546,7 +546,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo() =
{
> > +     std::stringstream ss;
> >       ss << "uClibc-" << __UCLIBC_MAJOR__ << "." << __UCLIBC_MINOR__ <<
> "." << __UCLIBC_SUBLEVEL__;
> >       bExtra.append("libcVersion", ss.str());
> >  -#else
> > @@ -36,3 +36,6 @@ Index: git/src/mongo/util/processinfo_linux.cpp
> >       bExtra.append("libcVersion", gnu_get_libc_version());
> >   #endif
> >       if (!verSig.empty())
> > +--
> > +2.7.4
> > +
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64=
_t.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64=
_t.patch
> > index 99edad3..b9c6704 100644
> > ---
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64=
_t.patch
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64=
_t.patch
> > @@ -1,7 +1,7 @@
> > -From a4951489d649c2b609cbb80f6cfb49fdcad8bd43 Mon Sep 17 00:00:00 2001
> > +From 20fcbf2a05ee6542aba942f6006d149db70fb9ce Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 2 Sep 2017 10:03:37 -0700
> > -Subject: [PATCH] Use long long instead of int64_t
> > +Subject: [PATCH 02/10] Use long long instead of int64_t
> >
> >  Fixes
> >  error: call to member function 'appendNumber' is ambiguous
> > @@ -9,15 +9,14 @@ since this function expects long long as parameter an=
d
> not int64_t
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> > -Upstream-Status: Pending
> >   src/mongo/util/procparser.cpp | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > -Index: git/src/mongo/util/procparser.cpp
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/src/mongo/util/procparser.cpp
> > -+++ git/src/mongo/util/procparser.cpp
> > -@@ -260,7 +260,7 @@ Status parseProcStat(const std::vector<S
> > +diff --git a/src/mongo/util/procparser.cpp
> b/src/mongo/util/procparser.cpp
> > +index c574a3f..5ea66b7 100644
> > +--- a/src/mongo/util/procparser.cpp
> > ++++ b/src/mongo/util/procparser.cpp
> > +@@ -261,7 +261,7 @@ Status parseProcStat(const std::vector<StringData>=
&
> keys,
> >
> >                       StringData stringValue((*partIt).begin(),
> (*partIt).end() - (*partIt).begin());
> >
> > @@ -26,7 +25,7 @@ Index: git/src/mongo/util/procparser.cpp
> >
> >                       if (!parseNumberFromString(stringValue,
> &value).isOK()) {
> >                           value =3D 0;
> > -@@ -272,7 +272,7 @@ Status parseProcStat(const std::vector<S
> > +@@ -273,7 +273,7 @@ Status parseProcStat(const std::vector<StringData>=
&
> keys,
> >               } else {
> >                   StringData stringValue((*partIt).begin(),
> (*partIt).end() - (*partIt).begin());
> >
> > @@ -35,7 +34,7 @@ Index: git/src/mongo/util/procparser.cpp
> >
> >                   if (!parseNumberFromString(stringValue,
> &value).isOK()) {
> >                       value =3D 0;
> > -@@ -365,7 +365,7 @@ Status parseProcMemInfo(const std::vecto
> > +@@ -366,7 +366,7 @@ Status parseProcMemInfo(const
> std::vector<StringData>& keys,
> >
> >               StringData stringValue((*partIt).begin(), (*partIt).end()=
);
> >
> > @@ -44,7 +43,7 @@ Index: git/src/mongo/util/procparser.cpp
> >
> >               if (!parseNumberFromString(stringValue, &value).isOK()) {
> >                   value =3D 0;
> > -@@ -522,7 +522,7 @@ Status parseProcDiskStats(const std::vec
> > +@@ -522,7 +522,7 @@ Status parseProcDiskStats(const
> std::vector<StringData>& disks,
> >                             StringData data,
> >                             BSONObjBuilder* builder) {
> >       bool foundKeys =3D false;
> > @@ -53,7 +52,7 @@ Index: git/src/mongo/util/procparser.cpp
> >       stats.reserve(kDiskFieldCount);
> >
> >       using string_split_iterator =3D
> boost::split_iterator<StringData::const_iterator>;
> > -@@ -597,7 +597,7 @@ Status parseProcDiskStats(const std::vec
> > +@@ -597,7 +597,7 @@ Status parseProcDiskStats(const
> std::vector<StringData>& disks,
> >
> >                   StringData stringValue((*partIt).begin(),
> (*partIt).end());
> >
> > @@ -62,3 +61,6 @@ Index: git/src/mongo/util/procparser.cpp
> >
> >                   if (!parseNumberFromString(stringValue,
> &value).isOK()) {
> >                       value =3D 0;
> > +--
> > +2.7.4
> > +
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wit=
h-clang.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wit=
h-clang.patch
> > index b597422..e726933 100644
> > ---
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wit=
h-clang.patch
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wit=
h-clang.patch
> > @@ -1,28 +1,29 @@
> > -From 31ca5c563f1d9a3f70258be3dd2b1e547a65a550 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Tue, 5 Feb 2019 00:21:12 -0800
> > -Subject: [PATCH] asio: Dont use experimental with clang
> > +From 097e8a66930cfa28ac8bfa35f62d0a9ee3b74488 Mon Sep 17 00:00:00 2001
> > +From: Vincent Prince <vincent.prince.fr@gmail.com>
> > +Date: Mon, 16 Sep 2019 13:46:52 +0200
> > +Subject: [PATCH 10/10] asio: Dont use experimental with clang
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> >  ---
> > - .../asio-master/asio/include/asio/detail/string_view.hpp      | 4 ++-=
-
> > + src/third_party/asio-master/asio/include/asio/detail/string_view.hpp =
|
> 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git
> a/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
> b/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
> > -index 222c02186d..3bf7494529 100644
> > +index f09cebc..fa307b5 100644
> >  ---
> a/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
> >  +++
> b/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
> > -@@ -28,8 +28,8 @@
> > - namespace asio {
> > -
> > - #if defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
> > +@@ -33,8 +33,8 @@ namespace asio {
> > + using std::basic_string_view;
> > + using std::string_view;
> > + #elif defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
> >  -using std::experimental::basic_string_view;
> >  -using std::experimental::string_view;
> >  +using std::basic_string_view;
> >  +using std::string_view;
> > - #else // defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
> > - using std::basic_string_view;
> > - using std::string_view;
> > + #endif // defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
> > +
> > + } // namespace asio
> >  --
> > -2.20.1
> > +2.7.4
> >
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro=
-__ELF_NATIVE_CLASS.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro=
-__ELF_NATIVE_CLASS.patch
> > index 098306f..869d284 100644
> > ---
> a/meta-oe/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro=
-__ELF_NATIVE_CLASS.patch
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro=
-__ELF_NATIVE_CLASS.patch
> > @@ -1,7 +1,7 @@
> > -From df7ef16afcc6ab55daa686e4f15c16e3d1280337 Mon Sep 17 00:00:00 2001
> > +From 73c6374ceb0c062e91210cc9ef3e0e9fa30ee514 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 2 Sep 2017 12:42:30 -0700
> > -Subject: [PATCH 2/4] Add a definition for the macro __ELF_NATIVE_CLASS
> > +Subject: [PATCH 04/10] Add a definition for the macro __ELF_NATIVE_CLA=
SS
> >
> >  It depends on the native arch's word size.
> >
> > @@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 9 insertions(+)
> >
> >  diff --git a/src/mongo/util/stacktrace_posix.cpp
> b/src/mongo/util/stacktrace_posix.cpp
> > -index 53ab85f56f..7c458e7ef2 100644
> > +index 1d7b3d7..f81e329 100644
> >  --- a/src/mongo/util/stacktrace_posix.cpp
> >  +++ b/src/mongo/util/stacktrace_posix.cpp
> > -@@ -37,6 +37,15 @@
> > +@@ -39,6 +39,15 @@
> >   #include <string>
> >   #include <sys/utsname.h>
> >
> > @@ -31,5 +31,5 @@ index 53ab85f56f..7c458e7ef2 100644
> >   #include "mongo/config.h"
> >   #include "mongo/db/jsobj.h"
> >  --
> > -2.14.1
> > +2.7.4
> >
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K=
.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K=
.patch
> > index 085fa50..59066b2 100644
> > ---
> a/meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K=
.patch
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K=
.patch
> > @@ -1,7 +1,7 @@
> > -From 98543889f7ba38c02eb7cd9822f45e27d619edd6 Mon Sep 17 00:00:00 2001
> > +From ffe6045b190b735601cd209d3e7ac121604c5a4e Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 24 Aug 2018 13:07:01 -0700
> > -Subject: [PATCH 2/2] Fix default stack size to 256K
> > +Subject: [PATCH 08/10] Fix default stack size to 256K
> >
> >  On musl default stack size is ~80K which is too low
> >  for mongodb
> > @@ -10,14 +10,14 @@ Upstream-Status: Pending
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> > - .../platform/stack_locator_pthread_getattr_np.cpp      | 10 +++++++++=
+
> > + src/mongo/platform/stack_locator_pthread_getattr_np.cpp | 10 ++++++++=
++
> >   1 file changed, 10 insertions(+)
> >
> >  diff --git a/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
> b/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
> > -index 648d26a41c..6e398f00c9 100644
> > +index 4f3044c..68e47e3 100644
> >  --- a/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
> >  +++ b/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
> > -@@ -35,6 +35,16 @@
> > +@@ -36,6 +36,16 @@
> >   #include "mongo/util/assert_util.h"
> >   #include "mongo/util/scopeguard.h"
> >
> > @@ -35,5 +35,5 @@ index 648d26a41c..6e398f00c9 100644
> >
> >   StackLocator::StackLocator() {
> >  --
> > -2.18.0
> > +2.7.4
> >
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
> > new file mode 100644
> > index 0000000..3a27aac
> > --- /dev/null
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
> > @@ -0,0 +1,19 @@
> > +Index: git/SConstruct
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/SConstruct
> > ++++ git/SConstruct
> > +@@ -884,6 +884,14 @@ env_vars.Add('WINDOWS_OPENSSL_BIN',
> > +     help=3D'Sets the path to the openssl binaries for packaging',
> > +     default=3D'c:/openssl/bin')
> > +
> > ++env_vars.Add('PREFIX',
> > ++    help=3D'installation prefix')
> > ++
> > ++env_vars.Add('prefix',
> > ++    help=3D'installation prefix')
> > ++
> > ++
> > ++
> > + # -- Validate user provided options --
> > +
> > + # A dummy environment that should *only* have the variables we have
> set. In practice it has
> > diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-=
musl.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-=
musl.patch
> > index a2e1f79..2cea9bc 100644
> > ---
> a/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-=
musl.patch
> > +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-=
musl.patch
> > @@ -1,17 +1,17 @@
> > -From a1c77702926eb8546ff96b00b5b994f7478dabae Mon Sep 17 00:00:00 2001
> > +From cc95a8878fa581b164dee8fb1f07b05b9d919ef0 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 2 Sep 2017 13:13:15 -0700
> > -Subject: [PATCH 4/4] wiredtiger: Disable strtouq on musl
> > +Subject: [PATCH 09/10] wiredtiger: Disable strtouq on musl
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> >   src/third_party/wiredtiger/build_linux/wiredtiger_config.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -Index: git/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/src/third_party/wiredtiger/build_linux/wiredtiger_config.=
h
> > -+++ git/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
> > +diff --git a/src/third_party/wiredtiger/build_linux/wiredtiger_config.=
h
> b/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
> > +index 82e9994..0399a67 100644
> > +--- a/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
> > ++++ b/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
> >  @@ -104,7 +104,7 @@
> >   #define HAVE_STRING_H 1
> >
> > @@ -21,3 +21,6 @@ Index:
> git/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
> >
> >   /* Define to 1 if you have the `sync_file_range' function. */
> >   /* #undef HAVE_SYNC_FILE_RANGE */
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
> > index c068987..15bd7da 100644
> > --- a/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
> > +++ b/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
> > @@ -1,25 +1,33 @@
> > -Add alises for arm64 which is same as aarch64
> > +From c9fc9e9a44b0fb764ce86a5e57f17d3c5bbfd8cd Mon Sep 17 00:00:00 2001
> > +From: Vincent Prince <vincent.prince.fr@gmail.com>
> > +Date: Mon, 16 Sep 2019 13:37:10 +0200
> > +Subject: [PATCH 05/10] Add alises for arm64 which is same as aarch64
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Upstream-Status: Pending
> > +Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> > +---
> > + SConstruct                                      | 1 +
> > + src/third_party/IntelRDFPMathLib20U1/SConscript | 2 +-
> > + src/third_party/wiredtiger/SConscript           | 2 +-
> > + 3 files changed, 3 insertions(+), 2 deletions(-)
> >
> > -Index: git/SConstruct
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/SConstruct
> > -+++ git/SConstruct
> > -@@ -1055,6 +1055,7 @@ elif endian =3D=3D "big":
> > +diff --git a/SConstruct b/SConstruct
> > +index e63cf15..5593c78 100644
> > +--- a/SConstruct
> > ++++ b/SConstruct
> > +@@ -1129,6 +1129,7 @@ elif endian =3D=3D "big":
> >   processor_macros =3D {
> > -     'arm'     : { 'endian': 'little', 'defines': ('__arm__',) },
> > -     'aarch64' : { 'endian': 'little', 'defines': ('__arm64__',
> '__aarch64__')},
> > -+    'arm64'   : { 'endian': 'little', 'defines': ('__arm64__',
> '__aarch64__')},
> > -     'i386'    : { 'endian': 'little', 'defines': ('__i386',
> '_M_IX86')},
> > -     'ppc64le' : { 'endian': 'little', 'defines': ('__powerpc64__',)},
> > -     's390x'   : { 'endian': 'big',    'defines': ('__s390x__',)},
> > -Index: git/src/third_party/IntelRDFPMathLib20U1/SConscript
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/src/third_party/IntelRDFPMathLib20U1/SConscript
> > -+++ git/src/third_party/IntelRDFPMathLib20U1/SConscript
> > -@@ -308,7 +308,7 @@ if processor =3D=3D 'i386':
> > +     'arm'        : { 'endian': 'little', 'defines': ('__arm__',) },
> > +     'aarch64'    : { 'endian': 'little', 'defines': ('__arm64__',
> '__aarch64__')},
> > ++    'arm64'      : { 'endian': 'little', 'defines': ('__arm64__',
> '__aarch64__')},
> > +     'i386'       : { 'endian': 'little', 'defines': ('__i386',
> '_M_IX86')},
> > +     'ppc64le'    : { 'endian': 'little', 'defines':
> ('__powerpc64__',)},
> > +     's390x'      : { 'endian': 'big',    'defines': ('__s390x__',)},
> > +diff --git a/src/third_party/IntelRDFPMathLib20U1/SConscript
> b/src/third_party/IntelRDFPMathLib20U1/SConscript
> > +index f23c071..fb82cd6 100644
> > +--- a/src/third_party/IntelRDFPMathLib20U1/SConscript
> > ++++ b/src/third_party/IntelRDFPMathLib20U1/SConscript
> > +@@ -308,7 +308,7 @@ if processor =3D=3D 'i386' or processor =3D=3D 'em=
scripten':
> >   elif processor =3D=3D 'arm':
> >       cpp_defines['IA32'] =3D '1'
> >       cpp_defines['ia32'] =3D '1'
> > @@ -28,11 +36,11 @@ Index:
> git/src/third_party/IntelRDFPMathLib20U1/SConscript
> >       cpp_defines['efi2'] =3D '1'
> >       cpp_defines['EFI2'] =3D '1'
> >   # Using 64 bit little endian
> > -Index: git/src/third_party/wiredtiger/SConscript
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/src/third_party/wiredtiger/SConscript
> > -+++ git/src/third_party/wiredtiger/SConscript
> > -@@ -151,7 +151,7 @@ condition_map =3D {
> > +diff --git a/src/third_party/wiredtiger/SConscript
> b/src/third_party/wiredtiger/SConscript
> > +index cdd090b..97a1b3b 100644
> > +--- a/src/third_party/wiredtiger/SConscript
> > ++++ b/src/third_party/wiredtiger/SConscript
> > +@@ -152,7 +152,7 @@ condition_map =3D {
> >       'POSIX_HOST'   : not env.TargetOSIs('windows'),
> >       'WINDOWS_HOST' : env.TargetOSIs('windows'),
> >
> > @@ -41,3 +49,6 @@ Index: git/src/third_party/wiredtiger/SConscript
> >       'POWERPC_HOST' : env['TARGET_ARCH'] =3D=3D 'ppc64le',
> >       'X86_HOST'     : env['TARGET_ARCH'] =3D=3D 'x86_64',
> >       'ZSERIES_HOST' : env['TARGET_ARCH'] =3D=3D 's390x',
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> > index ed05517..11efa5f 100644
> > --- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> > +++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> > @@ -3,17 +3,18 @@ LICENSE =3D "SSPL-1 & Apache-2.0 & Zlib"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE-Community.txt;md5=3D3a865f27f11f43ecbe542d9ea387dcf1 \
> >
> file://APACHE-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> >
> > -DEPENDS =3D "openssl libpcre libpcap zlib boost curl python \
> > -           python-setuptools-native python-typing-native \
> > -           python-pyyaml-native python-cheetah-native \
> > +DEPENDS =3D "openssl libpcre libpcap zlib boost curl python3 \
> > +           python3-setuptools-native \
> > +           python3-pyyaml-native python3-cheetah-native \
> > +           python3-psutil-native python3-regex-native \
> >             "
> >
> > -inherit scons dos2unix siteinfo pythonnative
> > +inherit scons dos2unix siteinfo python3native
> >
> > -PV =3D "4.0.6+git${SRCPV}"
> > -#v4.0.6
> > -SRCREV =3D "caa42a1f75a56c7643d0b68d3880444375ec42e3"
> > -SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv4.0 \
> > +PV =3D "4.2.0+git${SRCPV}"
> > +#v4.2.0
> > +SRCREV =3D "18ce5c9f56a01f2c933a720d64707f3456f81c8b"
> > +SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv4.2 \
> >
>  file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
> >             file://0001-Use-long-long-instead-of-int64_t.patch \
> >
>  file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch \
> > @@ -21,6 +22,7 @@ SRC_URI =3D "git://
> github.com/mongodb/mongo.git;branch=3Dv4.0 \
> >             file://arm64-support.patch \
> >
>  file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
> >             file://0001-Support-deprecated-resolver-functions.patch \
> > +           file://0003-Fix-unknown-prefix-env.patch \
> >             "
> >  SRC_URI_append_libc-musl =3D"\
> >             file://0002-Fix-default-stack-size-to-256K.patch \
> > @@ -75,5 +77,3 @@ scons_do_install() {
> >          ${STAGING_BINDIR_NATIVE}/scons install ${EXTRA_OESCONS}|| \
> >          die "scons install execution failed."
> >  }
> > -
> > -PNBLACKLIST[mongodb] =3D "Since bbclass scons convert to python3, buil=
d
> mongodb failed"
> > --
> > 2.7.4
> >
>

