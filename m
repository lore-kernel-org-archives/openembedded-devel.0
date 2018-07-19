Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 13ACC78A8C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 17:13:25 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id t5-v6so7860565qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 10:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2T96d68XaPO4RuyjwhSWXyMU6FzK1g1EDu0XHujJ13Q=;
	b=qk8H8e7Cv93R6vqYRRJoUS98Qb31iq4azYpTwguKTzXzOCH/uB4fsBvfGbUYq5wcJz
	/J+KohTp7G7ZZhLxHzdsZtooRv8YK+cZONiSVFgSYdUBBX4ZgAsmnNH3ZiWtyFDp0Kbu
	5sTMs8DBd/AhG/Wl6UTahU3hzQi+6BS73I/Y40X0iRWk909WIVaLN4eaAhSW9SAdmP1B
	KnamcHCvcc16myqcED9D8SYlOMDsCymEViB9X2+n4lbxf45UxetBW8KebHKe5vpU1aq2
	fHWmFaWIIePlQc16K7cci132Jb8pQHZSz9VBL637PLvuoHQYYhfaPKq27cwednpPr1Iq
	01aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2T96d68XaPO4RuyjwhSWXyMU6FzK1g1EDu0XHujJ13Q=;
	b=t1qj+oqLV5UMJwt2q+1ukHU5FvRt8+wmi9wwyssAPiir1IDMVA5O7lCPnHvdHbIHNK
	7GI0ZgaQFAEUeWY/wQB9jo0mh6cEF3+zx/wwHZFmsO/rbPYfD+tFPv7iZzomiHT6ZhLP
	jxGupoZhAMdWPHyk+8XWCozW/GGeCQk0dRSjNyQWN8Y9IMS5KPzEJ8d3IW3SoxZ3n/4w
	//4ZKgiWdhid8AHbzuM6zgSitjiC7MrKp0+OGVCmZoC2G9ukmU2wu5akrgzSZd0B4zIx
	M0OU7XY+dd4WkaKG8D0eRx7Az5gpXt4vn6u5HRY5N2rP/Fm+6SWyqLKgyPhqXH8/LaM/
	s89Q==
X-Gm-Message-State: AOUpUlEOzofsywfXdWZBBdmdfAthqBd+JvrhDk+mRP7zzd37MfEjLwl9
	K/RjUfo4h3/zBYqlZ6V/b5bDSml/RDq8qXsg2o7xxpDO
X-Google-Smtp-Source: AAOMgpd9ZnOq90KH+B6peGnuz80tOGhBQDPE+Fi2GaI0AaWTlflURW1HoHF61pBamTMPnouu+xXjbdG9nw2VUcYm0tI=
X-Received: by 2002:a0c:d2f3:: with SMTP id
	x48-v6mr11688828qvh.214.1532020406607; 
	Thu, 19 Jul 2018 10:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <1531980780-138112-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1531980780-138112-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jul 2018 10:12:49 -0700
Message-ID: <CAMKF1spShdTYnsMubxu=nGSOcZSk9mcD4JeK512Rgm+MmUgryQ@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] protobuf: upgrade 3.5.1 -> 3.6.0.1
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
X-List-Received-Date: Thu, 19 Jul 2018 17:13:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2018 at 11:13 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> License-Update: copyright year updated and clean some useless content
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../0001-protobuf-fix-configure-error.patch        | 33 ++++++++++++++++=
++++++
>  .../{protobuf_3.5.1.bb =3D> protobuf_3.6.0.1.bb}     | 14 ++++++---


my host has gcc8 and it failed to build native version
NOTE: Running task 13158 of 33598
(virtual:native:/mnt/a/oe/sources/meta-openembedded/meta-oe/recipes-devtool=
s/protobuf/protobuf-c_1.3.0.bb:do_compile)
|                                ^
|    vector<pair<string, string> > options;
|                      ^
| ../git/protoc-c/c_generator.cc:108:29: error: expected
primary-expression before =E2=80=98>=E2=80=99 token
|    vector<pair<string, string> > options;
|                              ^
| ../git/protoc-c/c_generator.cc:108:31: error: expected
primary-expression before =E2=80=98>=E2=80=99 token
|    vector<pair<string, string> > options;
|                                ^
| ../git/protoc-c/c_generator.cc:108:33: error: =E2=80=98options=E2=80=99 w=
as not
declared in this scope
|    vector<pair<string, string> > options;
|                                  ^~~~~~~
| ../git/protoc-c/c_generator.cc:152:5: error: =E2=80=98scoped_ptr=E2=80=99=
 was not
declared in this scope
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|      ^~~~~~~~~~
| ../git/protoc-c/c_generator.cc:152:5: note: suggested alternative:
=E2=80=98sched_param=E2=80=99
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|      ^~~~~~~~~~
|      sched_param
| ../git/protoc-c/c_generator.cc:152:40: error: expected
primary-expression before =E2=80=98>=E2=80=99 token
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|                                         ^
| ../git/protoc-c/c_generator.cc:152:42: error: =E2=80=98output=E2=80=99 wa=
s not
declared in this scope
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|                                           ^~~~~~
| ../git/protoc-c/c_generator.cc:152:42: note: suggested alternative: =E2=
=80=98getpt=E2=80=99
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|                                           ^~~~~~
|                                           getpt
| ../git/protoc-c/c_generator.cc:160:5: error: =E2=80=98scoped_ptr=E2=80=99=
 was not
declared in this scope
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|      ^~~~~~~~~~
| ../git/protoc-c/c_generator.cc:160:5: note: suggested alternative:
=E2=80=98sched_param=E2=80=99
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|      ^~~~~~~~~~
|      sched_param
| ../git/protoc-c/c_generator.cc:160:40: error: expected
primary-expression before =E2=80=98>=E2=80=99 token
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|                                         ^
| ../git/protoc-c/c_generator.cc:160:42: error: =E2=80=98output=E2=80=99 wa=
s not
declared in this scope
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|                                           ^~~~~~
| ../git/protoc-c/c_generator.cc:160:42: note: suggested alternative: =E2=
=80=98getpt=E2=80=99
|      scoped_ptr<io::ZeroCopyOutputStream> output(
|                                           ^~~~~~
|                                           getpt
| make: *** [Makefile:1497: protoc-c/protoc_gen_c-c_primitive_field.o] Erro=
r 1
| make: *** [Makefile:1441: protoc-c/protoc_gen_c-c_generator.o] Error 1
| ERROR: oe_runmake failed

>  2 files changed, 43 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-proto=
buf-fix-configure-error.patch
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.5.1.bb =3D> protobu=
f_3.6.0.1.bb} (86%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix=
-configure-error.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-pr=
otobuf-fix-configure-error.patch
> new file mode 100644
> index 0000000..a2f7a4b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-config=
ure-error.patch
> @@ -0,0 +1,33 @@
> +From 52959e8e01e39139d18f752e97283e45b4b7a426 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 18 Jul 2018 17:52:34 +0800
> +Subject: [PATCH] protobuf: fix configure error
> +
> +fix below error:
> +gnu-configize: 'configure.ac' or 'configure.in' is required
> +
> +third_party/googletest is git submodule of protobuf. Above error
> +caused by missing submodule googletest.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + configure.ac | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index aec10cf..7fbe57d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -214,7 +214,6 @@ AX_CXX_COMPILE_STDCXX([11], [noext], [mandatory])
> + #   too.
> + export CFLAGS
> + export CXXFLAGS
> +-AC_CONFIG_SUBDIRS([third_party/googletest])
> +
> + AC_CONFIG_FILES([Makefile src/Makefile benchmarks/Makefile conformance/=
Makefile protobuf.pc protobuf-lite.pc])
> + AC_OUTPUT
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb b/meta-o=
e/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
> similarity index 86%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
> index 8cef391..5850744 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
> @@ -5,18 +5,19 @@ all of its internal RPC protocols and file formats."
>  HOMEPAGE =3D "https://github.com/google/protobuf"
>  SECTION =3D "console/tools"
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D35953c752efc9299b184f91bef540=
095"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bda42=
66b"
>
>  DEPENDS =3D "zlib"
>  DEPENDS_append_class-target =3D " protobuf-native"
>
>  PV .=3D "+git${SRCPV}"
> -SRCREV =3D "106ffc04be1abf3ff3399f54ccf149815b287dd9"
>
> -SRC_URI =3D "git://github.com/google/protobuf.git;branch=3D3.5.x \
> +SRCREV =3D "ce044817c7ba0aea27c3fd8e496635d94d20a755"
> +
> +SRC_URI =3D "git://github.com/google/protobuf.git;branch=3D3.6.x \
>             file://run-ptest \
> +           file://0001-protobuf-fix-configure-error.patch \
>  "
> -
>  S =3D "${WORKDIR}/git"
>
>  inherit autotools-brokensep pkgconfig ptest
> @@ -82,3 +83,8 @@ RDEPENDS_${PN}-ptest =3D "bash python-protobuf"
>  MIPS_INSTRUCTION_SET =3D "mips"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +LDFLAGS_append_arm =3D " -latomic"
> +LDFLAGS_append_mips =3D " -latomic"
> +LDFLAGS_append_powerpc =3D " -latomic"
> +LDFLAGS_append_mipsel =3D " -latomic"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

