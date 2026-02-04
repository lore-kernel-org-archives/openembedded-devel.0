Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AF9E9536C
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 09:53:36 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16930.1770198808360872095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 01:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hMLWvXTY;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-45f194e9a98so2103809b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 01:53:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770198807; cv=none;
        d=google.com; s=arc-20240605;
        b=T3EBEPf1YPB2axfgLQbkQqCj7cD4yY0567xNnrt/VA1NYLGe8j3+JlwQtLH0eoJeX/
         6DztFQUzF3h80HVlkkZFPm/AEcXH5oAJLn3BwJh5kzDkg7yV8w+SweDSHA8u3Zg1Agq8
         I6OOwBpzN/n8zUz4foEhNQ97t/lNbtCjUbll+2JFvmvAUVO5ugPowlKYxsc83UNphSAX
         8AEL1QGu8G77Uf8mY9JHJLsmNktwIwk8JfcADV7qCD4t2ox7b/EFz/HtFhR5c+hl+Pi7
         EjExifKlkX3DqL5lsnV73/cYmT73ZltIOSfQj5iiM8nrwP+pt4+TYKQd3EPZ2FpXEdHW
         Fwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oQyh91m9eDuu3nrnrRio02FqKvPZuxVCpxSGrvi75Y8=;
        fh=/Zfoi4o9G9NEfOtGJ0LSUrfiVhZcuLLzOVZQmzCL8qM=;
        b=I/+Xg/IqhJ4od6YpMxkVWYf6yITiHG/SVyaYHy9KptbhfowYqfogzOUnwu2ZrYCxg+
         5OC/Wq1iH1HKr649DlyzZuxsMhLPY0IJxYa7LWIsIwXQ/NF2uqYS+MQgW1sVdritKtpi
         r3Vf0hKKp+mtk3sjaakXlaJrtP8SkVNU4TF6u+wGlzx9bxxkCgTU0dpGe+mARno3rKu0
         S1vKVimX4KW7s+CiWNFwf/VnubzVQNy1kgtiAHkXar9rjZBbaUiymKcUQ5yWSUbb2aqs
         IievmF5Jk44MzOE05Es8DmhWKhhRzdhQH0WP/LssyUZtgI0p7VtgM4QcP+BPqmtt8uJq
         Hrjg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770198807; x=1770803607; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQyh91m9eDuu3nrnrRio02FqKvPZuxVCpxSGrvi75Y8=;
        b=hMLWvXTYkL4+gc/QOVptF/nKdWj+uLcnqpx8ty36kcG6KIRyYGJCGJjz+oOblFmGrm
         4MbrjmbZDPxFkvHqXez4okPknrTOD5ghySAkZP0AL9neS6wfY+wO3MRaRzPFFTkNcgu5
         jPhry580s9UGmCc0tOPSY7gL3uT6wZ5S1+6uNaB+BL7zhndUmyT2dInrcMAqY2kWBux1
         pt4G+Z35qrX1bz+7R+BrgLAqyaShlOOu0pxl3vKxiMsB0YUaiN/0wgM+3bLF8j1eD5u6
         4zxXBQnsps4izhTkMRlIKwHIamvg8K018luX7JWETPuN8Qu1q+1vsW09ZuhwdZlJup4T
         GDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198807; x=1770803607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQyh91m9eDuu3nrnrRio02FqKvPZuxVCpxSGrvi75Y8=;
        b=GUaH9/wJ68ny0iuz8pZoFfYmx4BliEEIQ2uvm92Yq/0JBEytAroSbDhK1pMCBQFeM1
         dc4X4dCRvXrqXZFgxNh2XJEptuIjZ19Hb/WzeKrUJd72qVZbPPeob+wv0QWNmzYjjSIr
         jH34fwKmJcHLddEqMsxHTu0LGeCZDr2png/jAvpFxTdOiaR4Q6u+KDCUPVJQJD2hWqnW
         hP2rgJl8rOwnxaQi3EXkH3LFEwfy248TKZLWCwqwYZnOC7XxEPtm8Zr+Ke0IBpBQWfgU
         Io/MTNgTjUo2lV90aa9o3HQdO0DRL40sYumBOnTYjywOTHr+2ZC4PXPXfYUKew2iHyKM
         1oQw==
X-Gm-Message-State: AOJu0YzR22XBKbOiS+yYPX1McqT6rmGRr73j17iv58Qcc62lZi6pFy4J
	ATsvH/7/yeLf3DaoeK5xKS5r8ifFiqSFV/ie9TlxmK8xeEmC2X86D6NzTV5DAAFg4pBGIuzvlC0
	UBYKdzbdN3VTkcOedDLNOqiORdoVygpX4Xw==
X-Gm-Gg: AZuq6aJ/5fgtlkk/PiOm/RpUv/nRk1Ljk3/BrbrKXSYErXtp1rapGN1cgKn1NSdiuEg
	FzY9Th6bJbN3EpWsfysPs3CAv8E9Hj4cWYp88tOeUMTCHhQYsQcjNK6TqeC/sOEMbkoWWP8xeqZ
	DDWQqfQk5W3ii/XsRsgcnwSCJ4dAmC5fuBymcNSF5SFR1BtTdwhK1ZH4ZBffBoqCxECI1agVBxB
	kIXkXLQvPeXySyQqLt+tnzSALzwJ6PvebR2/lZPmrePcgAGZ8Edg+Q8XvuFrobVTV6Bpmo53npK
	8bfbvGo=
X-Received: by 2002:a05:6808:d52:b0:45e:bfc6:2303 with SMTP id
 5614622812f47-462d5887d39mr1344111b6e.7.1770198807548; Wed, 04 Feb 2026
 01:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20260202211401.1287664-1-skandigraun@gmail.com>
 <20260202211401.1287664-13-skandigraun@gmail.com> <CADySD0EAw8EY+gHxRU23RLn+2=pKfda1YWWuis1z1DXeAF6-UQ@mail.gmail.com>
 <20c9fdae-9dd0-4a1e-b709-c7d668bb03d5@gmail.com> <54ec6b29-5d8b-4504-8aa5-0a359a3709de@gmail.com>
In-Reply-To: <54ec6b29-5d8b-4504-8aa5-0a359a3709de@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 4 Feb 2026 22:53:15 +1300
X-Gm-Features: AZwV_QgPA732gexTxkULyaLz6kR9uKRkEzfi9KnXMi9QdKPdGkAz6v5ITj9EYrY
Message-ID: <CADySD0EOuQ4pLP9amP8X8Bnvenua_dod811W7SEKPHn9aUFURQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][whinlatter][PATCH 13/15] nodejs: upgrade 22.21.1
 -> 22.22.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 09:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124123

On Wed, Feb 4, 2026 at 10:34=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 2/3/26 22:50, Gyorgy Sarvari wrote:
> >
> > On 2/3/26 10:55, Ankur Tyagi wrote:
> >> Hi Gyorgy,
> >>
> >> Getting following error when building for qemux86 with musl and clang
> >>
> >> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-l=
inux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl=
/i686-poky-linux-musl-ld:
> >> /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/=
atomic_base.h:1090:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessorBa=
seINS1_21TypedElementsAccessorILNS0_12ElementsKindE37EdEENS1_18ElementsKind=
TraitsILS4_37EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedArr=
ayEEESB_jj+0xe05):
> >> undefined reference to `__atomic_store'
> >> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-l=
inux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl=
/i686-poky-linux-musl-ld:
> >> /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-lin=
ux-musl/nodejs/22.22.0/sources/node-v22.22.0/out/Release/obj.host/v8_base_w=
ithout_compiler/deps/v8/src/objects/elements.o:
> >> in function `std::remove_volatile<double>::type
> >> std::__atomic_impl::load<double>(double const*, std::memory_order)':
> >> | /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bit=
s/atomic_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_121TypedElementsAcc=
essorILNS0_12ElementsKindE37EdE15GetInternalImplEPNS0_7IsolateENS0_6HandleI=
NS0_8JSObjectEEENS0_13InternalIndexE+0x7c):
> >> undefined reference to `__atomic_load'
> >> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-l=
inux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl=
/i686-poky-linux-musl-ld:
> >> /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/=
atomic_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessorBa=
seINS1_21TypedElementsAccessorILNS0_12ElementsKindE38EhEENS1_18ElementsKind=
TraitsILS4_38EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedArr=
ayEEESB_jj+0x549):
> >> undefined reference to `__atomic_load'
> >>
> >> Can you please have a look into it?
> > I don't think that I can unfortunately. It seems to be something with
> > the -latomic LDFLAG. I *think* that the problem is the library order in
> > the linker invocation. libatomic appears very early in the command,
> > before any other resource, and I think it should appear at the end. But
> > I'm not familiar with gyp, and nodejs takes 30 minutes to show that my
> > try about reordering the flags was unsuccessful.
> >
> > As a sidenote, it is not a regression from this patch, it has the same
> > issue with the current version also - but if it's a stopper for
> > Whinlatter, feel free to drop this. I might take another shot at it in
> > the future.
> >
>
> I had a sleep since, and it frequently helps with annoying problems.
>
> I have a potential fix[1], but first I want to run it thru master to see
> if anyone has a better idea. It can be cherry-picked if it makes its way
> to master successfully (which has the this problem also).
>
> Meanwhile feel free to test it if you want to, the patch should apply
> clean on Whinlatter.
>
> [1]: https://lists.openembedded.org/g/openembedded-devel/message/124121
>

That's great, thanks !
Will give it a try tomorrow.

> >> cheers
> >> Ankur
> >>
> >>
> >> On Tue, Feb 3, 2026 at 10:14=E2=80=AFAM Gyorgy Sarvari via
> >> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org=
>
> >> wrote:
> >>> From: Jason Schonberg <schonm@gmail.com>
> >>>
> >>> This is the December 2025 security release that the nodejs team relea=
sed
> >>> January 13, 2026.
> >>>
> >>>   3 high severity issues.
> >>>   4 medium severity issues.
> >>>   1 low severity issue.
> >>>
> >>> High priority fixes:
> >>>   CVE-2025-55131
> >>>   CVE-2025-55130
> >>>   CVE-2025-59465
> >>>
> >>> Medium priority fixes:
> >>>   CVE-2025-59466
> >>>   CVE-2025-59464
> >>>   CVE-2026-21636 *
> >>>   CVE-2026-21637
> >>>
> >>> Low priority fixes:
> >>>   CVE-2025-55132
> >>>
> >>> * note that this medium priority CVE only effects Nodejs v25.
> >>>
> >>> https://nodejs.org/en/blog/vulnerability/december-2025-security-relea=
ses
> >>>
> >>> Changelog: https://github.com/nodejs/node/releases/tag/v22.22.0
> >>>
> >>> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> (cherry picked from commit 0bb156371e433cf3e9fdc4291da2319d63a83575)
> >>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >>> ---
> >>>  .../oe-npm-cache                                                | 0
> >>>  ...oe-cache-native_22.21.bb =3D> nodejs-oe-cache-native_22.22.bb} | =
0
> >>>  .../nodejs/{nodejs_22.21.1.bb =3D> nodejs_22.22.0.bb}             | =
2 +-
> >>>  3 files changed, 1 insertion(+), 1 deletion(-)
> >>>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.21 =3D> n=
odejs-oe-cache-22.22}/oe-npm-cache (100%)
> >>>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.21=
.bb =3D> nodejs-oe-cache-native_22.22.bb} (100%)
> >>>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.21.1.bb =3D> nodej=
s_22.22.0.bb} (98%)
> >>>
> >>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe=
-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-c=
ache
> >>> similarity index 100%
> >>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-=
npm-cache
> >>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-np=
m-cache
> >>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_2=
2.21.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
> >>> similarity index 100%
> >>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22=
.21.bb
> >>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.2=
2.bb
> >>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb b/meta=
-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> >>> similarity index 98%
> >>> rename from meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> >>> rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> >>> index ccaf9f7bb2..443cdc430d 100644
> >>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> >>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> >>> @@ -39,7 +39,7 @@ SRC_URI:append:class-target =3D " \
> >>>  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
> >>>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patc=
h \
> >>>             "
> >>> -SRC_URI[sha256sum] =3D "487d73fd4db00dc2420d659a8221b181a7937fbc5bc7=
3f31c30b1680ad6ded6a"
> >>> +SRC_URI[sha256sum] =3D "4c138012bb5352f49822a8f3e6d1db71e00639d0c36d=
5b6756f91e4c6f30b683"
> >>>
> >>>  S =3D "${UNPACKDIR}/node-v${PV}"
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#124086): https://lists.openembedded.org/g/openemb=
edded-devel/message/124086
> >>> Mute This Topic: https://lists.openembedded.org/mt/117604901/3619737
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [ankur.tyagi85@gmail.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
>

