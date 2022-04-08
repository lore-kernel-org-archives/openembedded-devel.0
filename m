Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41F2C3527C
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.320.1649377695624961070
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 17:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DbEAyX9I;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id i26so4040327uap.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 17:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rya2dlsrPPYDddTamKEEx2rlmC/hN7XDF8v8Iv9swRM=;
        b=DbEAyX9IZQolWxhm3Nb6SvhXGeA22Fnt8+f4Eh3jIIcdCVSC20OGMQSZcL4K/vIs5N
         LTWuLTLOBlHeDbZd5gkMau9wIa0xYGbxX8qa4/+SktQNq1BGBzHqLF6RuM0deVEO5/z9
         mrFyQ7duPm4/S2ZYarfF7dXwJxSV12hf7YqTxd65jxG3ZgUlJTfa1how79KLZpn1/59F
         rkYHNgpdOQ9h6x6z0FLJoRL2jNxdFWZBvizMmI6WenyFMCljxHKQfAKMLsrDWLumSkdh
         bvSPEuatZxHaiPUktkOUekhh9iaV3kuPtonxqbORF8EY3n1FirrGjBhMaEuqtWC6T39S
         167w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rya2dlsrPPYDddTamKEEx2rlmC/hN7XDF8v8Iv9swRM=;
        b=H6bVMi8inOoKZPNfwgxuLMJR2OIHG6Pkh/1A7qfZ7quGiHU7iSscuWxp7VynCxPUQl
         nYDeNm1V3Tam7V9jZdYG+pz2EuOhdDcSc/zlnwyLLJ9LIte5Py5ykrQjKdBhzgKd85TL
         bLGm3yfZMwte6mJ89wacCG/+/vbO977P2st4e8r06RuzUKGMPKn65L16bBGT0pJUW69u
         UhL83gKWCIL3jz6vGcmoGfXbbzsQHsiMn5BBmGoVdJCZ947NgCMWctuiPaVHJp6JeKLu
         NJdZ0riKtNrJSx7drjagQ9Zo6IbnoPPwo6NZHEAEKevC8OJCM3C8h1HhuH9T5KQan4su
         MQCg==
X-Gm-Message-State: AOAM531aqX6dNvcpeE0Urd+UmhtcNq8F42+Cv+ktfve0EbrWEdrPmGU9
	8n4BegB72VgQiskTKb5LVmUCsXq/qpUMZrHt+BE=
X-Google-Smtp-Source: 
 ABdhPJzV9u/IlyrX32VKsUJ2rrEUwdUfkmUwj7vh3STtuX9mk08f9D2wE2eXXKfZEq9AQpQ0G/HHFdGWpxsGREK+e/c=
X-Received: by 2002:ab0:76d8:0:b0:33c:9bea:fa2c with SMTP id
 w24-20020ab076d8000000b0033c9beafa2cmr4761805uaq.44.1649377694652; Thu, 07
 Apr 2022 17:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220405104123.1371786-1-Martin.Jansa@gmail.com>
 <20220405104123.1371786-2-Martin.Jansa@gmail.com>
 <a591a53a-636d-d582-2375-61599e3ffe53@gmail.com>
In-Reply-To: <a591a53a-636d-d582-2375-61599e3ffe53@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 8 Apr 2022 02:28:01 +0200
Message-ID: 
 <CA+chaQd-FiHD+8+iUVHGwMBm4C5g2ixdEW02xVuOZAW6Yosxhw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][hardknott][PATCH 2/3] abseil-cpp: Fix build with
 glibc 2.34
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000971e2705dc19ab49"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96466

--000000000000971e2705dc19ab49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just like the .patch file in master branch, does hardknott have stricter
rules than master branch?

On Fri, Apr 8, 2022 at 1:57 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 4/5/22 03:41, Martin Jansa wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > * based on commit from honister, but without the upgrade:
> >    commit 8691de2580dd872e3d001d67c8455108b3bd627c
> >    Author: Khem Raj <raj.khem@gmail.com>
> >    Date:   Sat May 8 14:38:52 2021 -0700
> >
> >      abseil-cpp: Upgrade to lts_2021_03_24
> >
> >      Fix build with glibc 2.34 while here
> >      Forward patches to this version
> >      Let system package the libraries
> >
> >    to fix abseil-cpp-native build on e.g. Ubuntu-22.04 with glibc-2.34
> to fix:
> >
> >    | FAILED:
> absl/debugging/CMakeFiles/failure_signal_handler.dir/failure_signal_handl=
er.cc.o
> >    | /OE/lge/build/webosose/hardknott/BUILD/hosttools/g++
> -Dfailure_signal_handler_EXPORTS
> -I/OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-cpp-nat=
ive/20200923+gitAUTOINC+6f9d96a1f4-r0/git
> -isystem/OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-c=
pp-native/20200923+gitAUTOINC+6f9d96a1f4-r0/recipe-sysroot-native/usr/inclu=
de
> -O2 -pipe -fPIC -Wall -Wextra -Wcast-qual -Wconversion-null
> -Wmissing-declarations -Woverlength-strings -Wpointer-arith -Wundef
> -Wunused-local-typedefs -Wunused-result -Wvarargs -Wvla -Wwrite-strings
> -Wno-missing-field-initializers -Wno-sign-compare -DNOMINMAX -std=3Dgnu++=
14
> -MD -MT
> absl/debugging/CMakeFiles/failure_signal_handler.dir/failure_signal_handl=
er.cc.o
> -MF
> absl/debugging/CMakeFiles/failure_signal_handler.dir/failure_signal_handl=
er.cc.o.d
> -o
> absl/debugging/CMakeFiles/failure_signal_handler.dir/failure_signal_handl=
er.cc.o
> -c
> /OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-cpp-nativ=
e/20200923+gitAUTOINC+6f9d96a1f4-r0/git/absl/debugging/failure_signal_handl=
er.cc
> >    |
> /OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-cpp-nativ=
e/20200923+gitAUTOINC+6f9d96a1f4-r0/git/absl/debugging/failure_signal_handl=
er.cc:
> In function =E2=80=98bool absl::lts_2020_09_23::SetupAlternateStackOnce()=
=E2=80=99:
> >    |
> /OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-cpp-nativ=
e/20200923+gitAUTOINC+6f9d96a1f4-r0/git/absl/debugging/failure_signal_handl=
er.cc:138:32:
> error: no matching function for call to =E2=80=98max(long int, int)=E2=80=
=99
> >    |   138 |   size_t stack_size =3D (std::max(SIGSTKSZ, 65536) +
> page_mask) & ~page_mask;
> >    |       |                        ~~~~~~~~^~~~~~~~~~~~~~~~~
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   ...01-Export-of-internal-Abseil-changes.patch | 82 ++++++++++++++++++=
+
> >   .../abseil-cpp/abseil-cpp_git.bb              |  1 +
> >   2 files changed, 83 insertions(+)
> >   create mode 100644
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Ab=
seil-changes.patch
> >
> > diff --git
> a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-=
Abseil-changes.patch
> b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-=
Abseil-changes.patch
> > new file mode 100644
> > index 0000000000..c0fb0571f7
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-=
Abseil-changes.patch
> > @@ -0,0 +1,82 @@
> > +From d3424201a73f29ab533121b1821a76e1b4313beb Mon Sep 17 00:00:00 2001
> > +From: Abseil Team <absl-team@google.com>
> > +Date: Mon, 3 May 2021 07:37:39 -0700
> > +Subject: [PATCH] Export of internal Abseil changes
> > +
> > +--
> > +cf88f9cf40eab54c06bca7f20795352ec23bb583 by Derek Mauro <
> dmauro@google.com>:
> > +
> > +Fixes build with latest glibc
> > +Fixes #952
> > +
> > +PiperOrigin-RevId: 371693908
> > +
> > +--
> > +99bcd0f4a747ce7a401e23c745adf34d0ec5131b by Samuel Benzaquen <
> sbenza@google.com>:
> > +
> > +Add support for std::string_view in StrFormat even when
> > +absl::string_view !=3D std::string_view.
> > +
> > +PiperOrigin-RevId: 371693633
> > +
> > +--
> > +e35463572149a6c2d4a0d439b9300ce03fd6b96d by Abseil Team <
> absl-team@google.com>:
> > +
> > +Cmake builds should only install pkg-config when explicitly requested.
> > +
> > +PiperOrigin-RevId: 371403419
> > +GitOrigin-RevId: cf88f9cf40eab54c06bca7f20795352ec23bb583
> > +Change-Id: I4360a18c638a4d901ff44ab1e0a9d8f321c302ea
>
> Patch missing "Upstream-Status" and "Signed-off-by"
>
> - armin
> > +---
> > + absl/debugging/failure_signal_handler.cc         | 3 ++-
> > + absl/strings/internal/str_format/arg.h           | 8 ++++++++
> > + absl/strings/internal/str_format/convert_test.cc | 3 +++
> > + 3 files changed, 13 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/absl/debugging/failure_signal_handler.cc
> b/absl/debugging/failure_signal_handler.cc
> > +index 5d13bdbb..2ed137b5 100644
> > +--- a/absl/debugging/failure_signal_handler.cc
> > ++++ b/absl/debugging/failure_signal_handler.cc
> > +@@ -135,7 +135,8 @@ static bool SetupAlternateStackOnce() {
> > + #else
> > +   const size_t page_mask =3D sysconf(_SC_PAGESIZE) - 1;
> > + #endif
> > +-  size_t stack_size =3D (std::max(SIGSTKSZ, 65536) + page_mask) &
> ~page_mask;
> > ++  size_t stack_size =3D
> > ++      (std::max<size_t>(SIGSTKSZ, 65536) + page_mask) & ~page_mask;
> > + #if defined(ABSL_HAVE_ADDRESS_SANITIZER) || \
> > +     defined(ABSL_HAVE_MEMORY_SANITIZER) ||
> defined(ABSL_HAVE_THREAD_SANITIZER)
> > +   // Account for sanitizer instrumentation requiring additional stack
> space.
> > +diff --git a/absl/strings/internal/str_format/arg.h
> b/absl/strings/internal/str_format/arg.h
> > +index 3dbc1526..f9d89d12 100644
> > +--- a/absl/strings/internal/str_format/arg.h
> > ++++ b/absl/strings/internal/str_format/arg.h
> > +@@ -108,6 +108,14 @@ StringConvertResult FormatConvertImpl(const
> std::string& v,
> > + StringConvertResult FormatConvertImpl(string_view v,
> > +                                       FormatConversionSpecImpl conv,
> > +                                       FormatSinkImpl* sink);
> > ++#if defined(ABSL_HAVE_STD_STRING_VIEW) &&
> !defined(ABSL_USES_STD_STRING_VIEW)
> > ++inline StringConvertResult FormatConvertImpl(std::string_view v,
> > ++                                             FormatConversionSpecImpl
> conv,
> > ++                                             FormatSinkImpl* sink) {
> > ++  return FormatConvertImpl(absl::string_view(v.data(), v.size()),
> conv, sink);
> > ++}
> > ++#endif  // ABSL_HAVE_STD_STRING_VIEW && !ABSL_USES_STD_STRING_VIEW
> > ++
> > + ArgConvertResult<FormatConversionCharSetUnion(
> > +     FormatConversionCharSetInternal::s,
> FormatConversionCharSetInternal::p)>
> > + FormatConvertImpl(const char* v, const FormatConversionSpecImpl conv,
> > +diff --git a/absl/strings/internal/str_format/convert_test.cc
> b/absl/strings/internal/str_format/convert_test.cc
> > +index 634ee78b..cc789530 100644
> > +--- a/absl/strings/internal/str_format/convert_test.cc
> > ++++ b/absl/strings/internal/str_format/convert_test.cc
> > +@@ -215,6 +215,9 @@ TEST_F(FormatConvertTest, BasicString) {
> > +   TestStringConvert(static_cast<const char*>("hello"));
> > +   TestStringConvert(std::string("hello"));
> > +   TestStringConvert(string_view("hello"));
> > ++#if defined(ABSL_HAVE_STD_STRING_VIEW)
> > ++  TestStringConvert(std::string_view("hello"));
> > ++#endif  // ABSL_HAVE_STD_STRING_VIEW
> > + }
> > +
> > + TEST_F(FormatConvertTest, NullString) {
> > diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> > index 569bb13993..a49fe672e8 100644
> > --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> > +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> > @@ -14,6 +14,7 @@ SRC_URI =3D "git://
> github.com/abseil/abseil-cpp;branch=3D${BRANCH};protocol=3Dhttps
> <http://github.com/abseil/abseil-cpp;branch=3D$%7BBRANCH%7D;protocol=3Dht=
tps>
> \
> >              file://0001-absl-always-use-asm-sgidefs.h.patch
>  \
> >              file://0002-Remove-maes-option-from-cross-compilation.patc=
h
> \
> >              file://abseil-ppc-fixes.patch \
> > +           file://0001-Export-of-internal-Abseil-changes.patch \
> >             "
> >
> >   S =3D "${WORKDIR}/git"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#96426):
> https://lists.openembedded.org/g/openembedded-devel/message/96426
> > Mute This Topic: https://lists.openembedded.org/mt/90262400/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> akuster808@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000971e2705dc19ab49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just like the .patch file in master branch, does hardknott=
 have stricter rules than master branch?</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 1:57 AM akus=
ter808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 4/5/22 03:41, Martin Jansa wrote:<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; * based on commit from honister, but without the upgrade:<br>
&gt;=C2=A0 =C2=A0 commit 8691de2580dd872e3d001d67c8455108b3bd627c<br>
&gt;=C2=A0 =C2=A0 Author: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 Date:=C2=A0 =C2=A0Sat May 8 14:38:52 2021 -0700<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 abseil-cpp: Upgrade to lts_2021_03_24<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Fix build with glibc 2.34 while here<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Forward patches to this version<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Let system package the libraries<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 to fix abseil-cpp-native build on e.g. Ubuntu-22.04 with =
glibc-2.34 to fix:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 | FAILED: absl/debugging/CMakeFiles/failure_signal_handle=
r.dir/failure_signal_handler.cc.o<br>
&gt;=C2=A0 =C2=A0 | /OE/lge/build/webosose/hardknott/BUILD/hosttools/g++ -D=
failure_signal_handler_EXPORTS -I/OE/lge/build/webosose/hardknott/BUILD/wor=
k/x86_64-linux/abseil-cpp-native/20200923+gitAUTOINC+6f9d96a1f4-r0/git -isy=
stem/OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-cpp-nat=
ive/20200923+gitAUTOINC+6f9d96a1f4-r0/recipe-sysroot-native/usr/include -O2=
 -pipe -fPIC -Wall -Wextra -Wcast-qual -Wconversion-null -Wmissing-declarat=
ions -Woverlength-strings -Wpointer-arith -Wundef -Wunused-local-typedefs -=
Wunused-result -Wvarargs -Wvla -Wwrite-strings -Wno-missing-field-initializ=
ers -Wno-sign-compare -DNOMINMAX -std=3Dgnu++14 -MD -MT absl/debugging/CMak=
eFiles/failure_signal_handler.dir/failure_signal_handler.cc.o -MF absl/debu=
gging/CMakeFiles/failure_signal_handler.dir/failure_signal_handler.cc.o.d -=
o absl/debugging/CMakeFiles/failure_signal_handler.dir/failure_signal_handl=
er.cc.o -c /OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-=
cpp-native/20200923+gitAUTOINC+6f9d96a1f4-r0/git/absl/debugging/failure_sig=
nal_handler.cc<br>
&gt;=C2=A0 =C2=A0 | /OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linu=
x/abseil-cpp-native/20200923+gitAUTOINC+6f9d96a1f4-r0/git/absl/debugging/fa=
ilure_signal_handler.cc: In function =E2=80=98bool absl::lts_2020_09_23::Se=
tupAlternateStackOnce()=E2=80=99:<br>
&gt;=C2=A0 =C2=A0 | /OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linu=
x/abseil-cpp-native/20200923+gitAUTOINC+6f9d96a1f4-r0/git/absl/debugging/fa=
ilure_signal_handler.cc:138:32: error: no matching function for call to =E2=
=80=98max(long int, int)=E2=80=99<br>
&gt;=C2=A0 =C2=A0 |=C2=A0 =C2=A0138 |=C2=A0 =C2=A0size_t stack_size =3D (st=
d::max(SIGSTKSZ, 65536) + page_mask) &amp; ~page_mask;<br>
&gt;=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~^~~~~~~~~~~=
~~~~~~<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...01-Export-of-internal-Abseil-changes.patch | 82 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0.../abseil-cpp/<a href=3D"http://abseil-cpp_git.bb" rel=3D=
"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A02 files changed, 83 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abs=
eil-cpp/0001-Export-of-internal-Abseil-changes.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Expor=
t-of-internal-Abseil-changes.patch b/meta-oe/recipes-devtools/abseil-cpp/ab=
seil-cpp/0001-Export-of-internal-Abseil-changes.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c0fb0571f7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-in=
ternal-Abseil-changes.patch<br>
&gt; @@ -0,0 +1,82 @@<br>
&gt; +From d3424201a73f29ab533121b1821a76e1b4313beb Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Abseil Team &lt;<a href=3D"mailto:absl-team@google.com" target=
=3D"_blank">absl-team@google.com</a>&gt;<br>
&gt; +Date: Mon, 3 May 2021 07:37:39 -0700<br>
&gt; +Subject: [PATCH] Export of internal Abseil changes<br>
&gt; +<br>
&gt; +--<br>
&gt; +cf88f9cf40eab54c06bca7f20795352ec23bb583 by Derek Mauro &lt;<a href=
=3D"mailto:dmauro@google.com" target=3D"_blank">dmauro@google.com</a>&gt;:<=
br>
&gt; +<br>
&gt; +Fixes build with latest glibc<br>
&gt; +Fixes #952<br>
&gt; +<br>
&gt; +PiperOrigin-RevId: 371693908<br>
&gt; +<br>
&gt; +--<br>
&gt; +99bcd0f4a747ce7a401e23c745adf34d0ec5131b by Samuel Benzaquen &lt;<a h=
ref=3D"mailto:sbenza@google.com" target=3D"_blank">sbenza@google.com</a>&gt=
;:<br>
&gt; +<br>
&gt; +Add support for std::string_view in StrFormat even when<br>
&gt; +absl::string_view !=3D std::string_view.<br>
&gt; +<br>
&gt; +PiperOrigin-RevId: 371693633<br>
&gt; +<br>
&gt; +--<br>
&gt; +e35463572149a6c2d4a0d439b9300ce03fd6b96d by Abseil Team &lt;<a href=
=3D"mailto:absl-team@google.com" target=3D"_blank">absl-team@google.com</a>=
&gt;:<br>
&gt; +<br>
&gt; +Cmake builds should only install pkg-config when explicitly requested=
.<br>
&gt; +<br>
&gt; +PiperOrigin-RevId: 371403419<br>
&gt; +GitOrigin-RevId: cf88f9cf40eab54c06bca7f20795352ec23bb583<br>
&gt; +Change-Id: I4360a18c638a4d901ff44ab1e0a9d8f321c302ea<br>
<br>
Patch missing &quot;Upstream-Status&quot; and &quot;Signed-off-by&quot;<br>
<br>
- armin<br>
&gt; +---<br>
&gt; + absl/debugging/failure_signal_handler.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 3 ++-<br>
&gt; + absl/strings/internal/str_format/arg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 8 ++++++++<br>
&gt; + absl/strings/internal/str_format/convert_test.cc | 3 +++<br>
&gt; + 3 files changed, 13 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/absl/debugging/failure_signal_handler.cc b/absl/debuggin=
g/failure_signal_handler.cc<br>
&gt; +index 5d13bdbb..2ed137b5 100644<br>
&gt; +--- a/absl/debugging/failure_signal_handler.cc<br>
&gt; ++++ b/absl/debugging/failure_signal_handler.cc<br>
&gt; +@@ -135,7 +135,8 @@ static bool SetupAlternateStackOnce() {<br>
&gt; + #else<br>
&gt; +=C2=A0 =C2=A0const size_t page_mask =3D sysconf(_SC_PAGESIZE) - 1;<br=
>
&gt; + #endif<br>
&gt; +-=C2=A0 size_t stack_size =3D (std::max(SIGSTKSZ, 65536) + page_mask)=
 &amp; ~page_mask;<br>
&gt; ++=C2=A0 size_t stack_size =3D<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 (std::max&lt;size_t&gt;(SIGSTKSZ, 65536) + page=
_mask) &amp; ~page_mask;<br>
&gt; + #if defined(ABSL_HAVE_ADDRESS_SANITIZER) || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0defined(ABSL_HAVE_MEMORY_SANITIZER) || defined(AB=
SL_HAVE_THREAD_SANITIZER)<br>
&gt; +=C2=A0 =C2=A0// Account for sanitizer instrumentation requiring addit=
ional stack space.<br>
&gt; +diff --git a/absl/strings/internal/str_format/arg.h b/absl/strings/in=
ternal/str_format/arg.h<br>
&gt; +index 3dbc1526..f9d89d12 100644<br>
&gt; +--- a/absl/strings/internal/str_format/arg.h<br>
&gt; ++++ b/absl/strings/internal/str_format/arg.h<br>
&gt; +@@ -108,6 +108,14 @@ StringConvertResult FormatConvertImpl(const std:=
:string&amp; v,<br>
&gt; + StringConvertResult FormatConvertImpl(string_view v,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Forma=
tConversionSpecImpl conv,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Forma=
tSinkImpl* sink);<br>
&gt; ++#if defined(ABSL_HAVE_STD_STRING_VIEW) &amp;&amp; !defined(ABSL_USES=
_STD_STRING_VIEW)<br>
&gt; ++inline StringConvertResult FormatConvertImpl(std::string_view v,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0FormatConversionSpecImpl conv,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0FormatSinkImpl* sink) {<br>
&gt; ++=C2=A0 return FormatConvertImpl(absl::string_view(v.data(), v.size()=
), conv, sink);<br>
&gt; ++}<br>
&gt; ++#endif=C2=A0 // ABSL_HAVE_STD_STRING_VIEW &amp;&amp; !ABSL_USES_STD_=
STRING_VIEW<br>
&gt; ++<br>
&gt; + ArgConvertResult&lt;FormatConversionCharSetUnion(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0FormatConversionCharSetInternal::s, FormatConvers=
ionCharSetInternal::p)&gt;<br>
&gt; + FormatConvertImpl(const char* v, const FormatConversionSpecImpl conv=
,<br>
&gt; +diff --git a/absl/strings/internal/str_format/convert_test.cc b/absl/=
strings/internal/str_format/convert_test.cc<br>
&gt; +index 634ee78b..cc789530 100644<br>
&gt; +--- a/absl/strings/internal/str_format/convert_test.cc<br>
&gt; ++++ b/absl/strings/internal/str_format/convert_test.cc<br>
&gt; +@@ -215,6 +215,9 @@ TEST_F(FormatConvertTest, BasicString) {<br>
&gt; +=C2=A0 =C2=A0TestStringConvert(static_cast&lt;const char*&gt;(&quot;h=
ello&quot;));<br>
&gt; +=C2=A0 =C2=A0TestStringConvert(std::string(&quot;hello&quot;));<br>
&gt; +=C2=A0 =C2=A0TestStringConvert(string_view(&quot;hello&quot;));<br>
&gt; ++#if defined(ABSL_HAVE_STD_STRING_VIEW)<br>
&gt; ++=C2=A0 TestStringConvert(std::string_view(&quot;hello&quot;));<br>
&gt; ++#endif=C2=A0 // ABSL_HAVE_STD_STRING_VIEW<br>
&gt; + }<br>
&gt; +<br>
&gt; + TEST_F(FormatConvertTest, NullString) {<br>
&gt; diff --git a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abs=
eil-cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a> =
b/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp_git.bb" =
rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
&gt; index 569bb13993..a49fe672e8 100644<br>
&gt; --- a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp=
_git.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp=
_git.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
&gt; @@ -14,6 +14,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/abseil/abseil-cpp;branch=3D$%7BBRANCH%7D;protocol=3Dhttps" rel=3D"noreferr=
er" target=3D"_blank">github.com/abseil/abseil-cpp;branch=3D${BRANCH};proto=
col=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-absl-alway=
s-use-asm-sgidefs.h.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Remove-mae=
s-option-from-cross-compilation.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://abseil-ppc-fixe=
s.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Export-of-intern=
al-Abseil-changes.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#96426): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/96426" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/96426</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90262400=
/3616698" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/90262400/3616698</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000971e2705dc19ab49--

