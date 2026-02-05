Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DB6EC1E83
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 09:31:50 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16922.1770283903126872318
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 01:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXS57k6Z;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45efde72438so487672b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 01:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770283902; cv=none;
        d=google.com; s=arc-20240605;
        b=MicMGk2373vNmCgbQpW1NDRpTsewUP6DO5CrwBbbu8DqeipdbOXA4vQQYcfZWm1G5X
         f/u22VHIQ8HozLu0+dFeuvsfYdFQ27OdbKWjZrQHnmeR9WuSFKHaDTsn7hknMF+R7/TC
         jRnq3i/zMm6F7cpIw9MeNrrPIYsjLVFIs9GAOygxC3MR/PlY76v78499ASxxiQ9ReDFn
         aszo9S2T1E2gqS7N/5tNncUGpXbjMzh60MJbzEWgPAMlUAMEoOZKmp4tJ/pvvSXHdx9O
         3l7gTlsJUuMLOCecJlkU3Rlvyf++Veoqfi/ybJar3Nkentvo+XRX4eIV3kdSgUnUyEPf
         fZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E+GCklPTvd1n5bAJK5kGJN32zoiPS+Ia9apc5zyKHa0=;
        fh=/Zfoi4o9G9NEfOtGJ0LSUrfiVhZcuLLzOVZQmzCL8qM=;
        b=RE8fUPc48XdUuVsCMVFCNhpFgAPcOVnNQfqUD93qb63nLvIqFIQj2yEfI8vBmNe6BG
         FUfqVDqYpmaChggjv3U/oBDVVsvn5LY/Bh8BQ2YrLMFdlViWkkh1+rREXyjyZyjPcOkO
         aNG/R7p9HzQALERXbqNvqlsbppiDBKCNm14cmqx9XWZ6gtNfy4bLjpnnWDCZZoDtZ/X0
         WP4jvrrM/ftIADXi5wVsr3nfqgJb3V78cXIAxuK8NatfiQe6HnqBYKsFX75i55eXwee7
         D/fSiX1MZ4zhFL+j7vvq1CRp4tc7+vSkhHJBg8DjjNLIDc17SnMX36VH0ON07rzTh94x
         lIUA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770283902; x=1770888702; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+GCklPTvd1n5bAJK5kGJN32zoiPS+Ia9apc5zyKHa0=;
        b=jXS57k6ZGlWw/l/zx3YrwTJ7+WQnRTPW986wLtLy/ZGUzVvCKLuWl6yPqQCWla4YHw
         BEB8F5nMrA6xyxO3yv+qgEWhYvGORsvVeDTpGNu0LGw1VEs8Kc0plh3b8qDT/i1Yqbo+
         t/OkAd4LzMJs1m0bGji5HNvs+MwQuZe4L48TVt7WULVKCOtEHXZXYYmS8bN3yJTL8noe
         1zabKoIWYW4RgiNQF08T9jJlVbqwr5ExVrw9+u0eWlg6Owh9QGJe6eoVOAFmw/8Q+V40
         2Dwec27H2iTI81RBAZuTSRGYXDqwimZZ1K0W5cStsvHuHePcMSo8rP8wRgy2GEWHuXep
         2ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770283902; x=1770888702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+GCklPTvd1n5bAJK5kGJN32zoiPS+Ia9apc5zyKHa0=;
        b=P+qEMA0zMYkZvcDd32oqEIgPxfJ1/Y67lnTZaZc92uZ5Txo6+r3k2tcdSTbgNt7IOb
         Oj55Lao4/Cf/hFrY6H9YRjYpvOlnbyKVPlbOdMED4/cQ6Y4tO6A5zhPYoceR4d+gjVRc
         50LmcNFGJvpXHg/S2WmTVXsjItKYR5Y+2N9NeqqZ8VM/fKMoCHPDSeVScFRPSS3pHWrI
         KpmvHlpwOneFndY+BfVUbJ+X+Zme0B0aMiTR8Zft1/9ut3ii4FxJ+3O+8PW2d6AKfcET
         oauurUqElGWFVAU7zB6eIbGx3V2Jdevv8ucezHayqNWb7c4sV1Nc9sp3GjnheLxroq8x
         yJyg==
X-Gm-Message-State: AOJu0YyStZaIEhU03tIXelvagcvbuS/hu+fmuf8Sjt/uyR4gOjVtP2jc
	sGXGvJSYf4wE301OZLclv1q9MKuzptkcPZwdo5GlphsxpDGn3N6zGVzMYBYtBWHxXN0uNg/jdIC
	ukAik21KM69i/WtJoOHk/dGLaKf6c7Yo=
X-Gm-Gg: AZuq6aKyGU0CUwiRu/MmZSrcTOBUWLP4P9kv8DddWdSlxMpWhVOvwrvdP/ff80yn0ux
	dslwBxxVLi1ZZW6/JigzJKZz5FXtcNJdMp6B2RXH1ZwP+dDGnhnxYul+r43No0RO9aWoiXR6xOf
	pcdv1lCvH7EPzWR7BHVN45mIFqemUrySZIi1abZq1ssA0MYDpt8arf+OeJ9T1Hhv3g7tLqJthrU
	Xt/nMF3k/IfUIGKJpFegrsSDCPf4Le2cmh0Tn1VZJa7AHeZbW1w2Zd4l2CuTbHDMdREppzT
X-Received: by 2002:a05:6808:384e:b0:45e:e52c:8dd0 with SMTP id
 5614622812f47-462d5a76f41mr2733651b6e.48.1770283902243; Thu, 05 Feb 2026
 01:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20260202211401.1287664-1-skandigraun@gmail.com>
 <20260202211401.1287664-13-skandigraun@gmail.com> <CADySD0EAw8EY+gHxRU23RLn+2=pKfda1YWWuis1z1DXeAF6-UQ@mail.gmail.com>
 <20c9fdae-9dd0-4a1e-b709-c7d668bb03d5@gmail.com> <54ec6b29-5d8b-4504-8aa5-0a359a3709de@gmail.com>
 <CADySD0EOuQ4pLP9amP8X8Bnvenua_dod811W7SEKPHn9aUFURQ@mail.gmail.com>
In-Reply-To: <CADySD0EOuQ4pLP9amP8X8Bnvenua_dod811W7SEKPHn9aUFURQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 5 Feb 2026 22:31:30 +1300
X-Gm-Features: AZwV_QgcaQ8gpNVQGuIPTCwyiYK-tA0ydoKW9itTizd5s_zSE9EkV8pLyqivNeA
Message-ID: <CADySD0GUWwPX1ZOTS4Pfjoeq-A7suEYEtjPfKBsN_KGx1AA0ZQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][whinlatter][PATCH 13/15] nodejs: upgrade 22.21.1
 -> 22.22.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 09:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124204

On Wed, Feb 4, 2026 at 10:53=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:
>
> On Wed, Feb 4, 2026 at 10:34=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail=
.com> wrote:
> >
> > On 2/3/26 22:50, Gyorgy Sarvari wrote:
> > >
> > > On 2/3/26 10:55, Ankur Tyagi wrote:
> > >> Hi Gyorgy,
> > >>
> > >> Getting following error when building for qemux86 with musl and clan=
g
> > >>
> > >> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky=
-linux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-mu=
sl/i686-poky-linux-musl-ld:
> > >> /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bit=
s/atomic_base.h:1090:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessor=
BaseINS1_21TypedElementsAccessorILNS0_12ElementsKindE37EdEENS1_18ElementsKi=
ndTraitsILS4_37EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedA=
rrayEEESB_jj+0xe05):
> > >> undefined reference to `__atomic_store'
> > >> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky=
-linux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-mu=
sl/i686-poky-linux-musl-ld:
> > >> /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-l=
inux-musl/nodejs/22.22.0/sources/node-v22.22.0/out/Release/obj.host/v8_base=
_without_compiler/deps/v8/src/objects/elements.o:
> > >> in function `std::remove_volatile<double>::type
> > >> std::__atomic_impl::load<double>(double const*, std::memory_order)':
> > >> | /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/b=
its/atomic_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_121TypedElementsA=
ccessorILNS0_12ElementsKindE37EdE15GetInternalImplEPNS0_7IsolateENS0_6Handl=
eINS0_8JSObjectEEENS0_13InternalIndexE+0x7c):
> > >> undefined reference to `__atomic_load'
> > >> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky=
-linux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-mu=
sl/i686-poky-linux-musl-ld:
> > >> /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bit=
s/atomic_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessor=
BaseINS1_21TypedElementsAccessorILNS0_12ElementsKindE38EhEENS1_18ElementsKi=
ndTraitsILS4_38EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedA=
rrayEEESB_jj+0x549):
> > >> undefined reference to `__atomic_load'
> > >>
> > >> Can you please have a look into it?
> > > I don't think that I can unfortunately. It seems to be something with
> > > the -latomic LDFLAG. I *think* that the problem is the library order =
in
> > > the linker invocation. libatomic appears very early in the command,
> > > before any other resource, and I think it should appear at the end. B=
ut
> > > I'm not familiar with gyp, and nodejs takes 30 minutes to show that m=
y
> > > try about reordering the flags was unsuccessful.
> > >
> > > As a sidenote, it is not a regression from this patch, it has the sam=
e
> > > issue with the current version also - but if it's a stopper for
> > > Whinlatter, feel free to drop this. I might take another shot at it i=
n
> > > the future.
> > >
> >
> > I had a sleep since, and it frequently helps with annoying problems.
> >
> > I have a potential fix[1], but first I want to run it thru master to se=
e
> > if anyone has a better idea. It can be cherry-picked if it makes its wa=
y
> > to master successfully (which has the this problem also).
> >
> > Meanwhile feel free to test it if you want to, the patch should apply
> > clean on Whinlatter.
> >
> > [1]: https://lists.openembedded.org/g/openembedded-devel/message/124121
> >
>
> That's great, thanks !
> Will give it a try tomorrow.
>

It fixes the error, nice work !

> > >> cheers
> > >> Ankur
> > >>
> > >>
> > >> On Tue, Feb 3, 2026 at 10:14=E2=80=AFAM Gyorgy Sarvari via
> > >> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.o=
rg>
> > >> wrote:
> > >>> From: Jason Schonberg <schonm@gmail.com>
> > >>>
> > >>> This is the December 2025 security release that the nodejs team rel=
eased
> > >>> January 13, 2026.
> > >>>
> > >>>   3 high severity issues.
> > >>>   4 medium severity issues.
> > >>>   1 low severity issue.
> > >>>
> > >>> High priority fixes:
> > >>>   CVE-2025-55131
> > >>>   CVE-2025-55130
> > >>>   CVE-2025-59465
> > >>>
> > >>> Medium priority fixes:
> > >>>   CVE-2025-59466
> > >>>   CVE-2025-59464
> > >>>   CVE-2026-21636 *
> > >>>   CVE-2026-21637
> > >>>
> > >>> Low priority fixes:
> > >>>   CVE-2025-55132
> > >>>
> > >>> * note that this medium priority CVE only effects Nodejs v25.
> > >>>
> > >>> https://nodejs.org/en/blog/vulnerability/december-2025-security-rel=
eases
> > >>>
> > >>> Changelog: https://github.com/nodejs/node/releases/tag/v22.22.0
> > >>>
> > >>> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >>> (cherry picked from commit 0bb156371e433cf3e9fdc4291da2319d63a83575=
)
> > >>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > >>> ---
> > >>>  .../oe-npm-cache                                                | =
0
> > >>>  ...oe-cache-native_22.21.bb =3D> nodejs-oe-cache-native_22.22.bb} =
| 0
> > >>>  .../nodejs/{nodejs_22.21.1.bb =3D> nodejs_22.22.0.bb}             =
| 2 +-
> > >>>  3 files changed, 1 insertion(+), 1 deletion(-)
> > >>>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.21 =3D>=
 nodejs-oe-cache-22.22}/oe-npm-cache (100%)
> > >>>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.=
21.bb =3D> nodejs-oe-cache-native_22.22.bb} (100%)
> > >>>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.21.1.bb =3D> nod=
ejs_22.22.0.bb} (98%)
> > >>>
> > >>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/=
oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm=
-cache
> > >>> similarity index 100%
> > >>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/o=
e-npm-cache
> > >>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-=
npm-cache
> > >>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native=
_22.21.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
> > >>> similarity index 100%
> > >>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_=
22.21.bb
> > >>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22=
.22.bb
> > >>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb b/me=
ta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> > >>> similarity index 98%
> > >>> rename from meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> > >>> rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> > >>> index ccaf9f7bb2..443cdc430d 100644
> > >>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> > >>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> > >>> @@ -39,7 +39,7 @@ SRC_URI:append:class-target =3D " \
> > >>>  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
> > >>>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.pa=
tch \
> > >>>             "
> > >>> -SRC_URI[sha256sum] =3D "487d73fd4db00dc2420d659a8221b181a7937fbc5b=
c73f31c30b1680ad6ded6a"
> > >>> +SRC_URI[sha256sum] =3D "4c138012bb5352f49822a8f3e6d1db71e00639d0c3=
6d5b6756f91e4c6f30b683"
> > >>>
> > >>>  S =3D "${UNPACKDIR}/node-v${PV}"
> > >>>
> > >>>
> > >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >>> Links: You receive all messages sent to this group.
> > >>> View/Reply Online (#124086): https://lists.openembedded.org/g/opene=
mbedded-devel/message/124086
> > >>> Mute This Topic: https://lists.openembedded.org/mt/117604901/361973=
7
> > >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> > >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [ankur.tyagi85@gmail.com]
> > >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >>>
> >

