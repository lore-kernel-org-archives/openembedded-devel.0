Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.9711.1614936960943514063
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 01:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ckuoBSyk;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: peron.clem@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id p8so2118163ejb.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Mar 2021 01:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xfKeFPKsL1VOyffljJ9ZoDHwEt0awRxQfic54YSfCfI=;
        b=ckuoBSykq5q5Jtky564wOJ0Tm+x+mMbqaRexp6nynHeB87rZn1pZVhPPzlB55ryImU
         7tBXSDJXOHNTz6ggw1wpgA7jcAleHYMTVcEpidaiSPPB/9QjtI2RA15779PO4wYD0MwP
         hnia+SgMcSZNelaXYMFTLrSyia2y//YeVak1mtkvFKBE9QfCGw3sA+eeUlOz4z8QXRW8
         FeW6Uia2+NJvV34An96IRbFZpA7VZU0bSafQbgTiN0INYmcefCBnC8UZ5IZZw4DWMHf5
         N3x55POQ8xMll4s3zgARcq5oi4E+/ZRjdFe7TaG+LrSMMIkH1tAApjIiQBOv2ojAnHby
         WkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xfKeFPKsL1VOyffljJ9ZoDHwEt0awRxQfic54YSfCfI=;
        b=lLj7DCEb50+0VqxThHF375GHtYMREp4fa4nMi1fgXE91kGjcrO4YVrpKoRcoLaGGrJ
         PHsj4uYyOm7E14Yn2A+EIUt+S0FLE8zNCy93SNJmzTf6iktk+rs9NuvqkjgXQotJ/xzK
         ZnfhfXyl84AHjIaKLPjQVIOhzKyCKWW45Y7McjhggWfe5Xa2S3rwR8YnW4yitxbdlo9U
         f/4uO07cad1PbCxocFRurs/NIW6hNtdSUPpb3HImOxauZJ9gkF1nKL9GT6xDLq5alZoZ
         +TSNWL2Jn9IwzI6LRb4fFMGhomGeq6w2UoNIaVVyz6Kss7BO+HyPbgLevf1IRKCpDnpz
         IERw==
X-Gm-Message-State: AOAM533yT1g6wGIcAMJAV7OzIJy7A505mltR+X58XKjCGkIx0Qtay/qe
	IkNwhpUA/6r1DnzdtohKqrMGqr7O/lGunJ3ZWAa5+Wv6rfKanQ==
X-Google-Smtp-Source: ABdhPJwlClaX/RIeBo8d/rSTljMLXIvgQRbjf3xwhDvwDvzC9AJJ+lXwGQD4lXGBsLOfPXOPmQtSZZDHxr8TqETufgc=
X-Received: by 2002:a17:906:5597:: with SMTP id y23mr1515879ejp.165.1614936959428;
 Fri, 05 Mar 2021 01:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
 <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
 <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
 <CAJiuCcd4bvctA_JjL6bx6z+zhwsGiy1QPR9tyzgaB6spLwqPQQ@mail.gmail.com>
 <2543ce50-034e-a21f-2c60-95596e5b7595@linux.microsoft.com>
 <885244a0-e750-4527-3475-edbabd2bc46f@herbrechtsmeier.net>
 <CAJiuCceOvVCRXzKgrzez3NX4i96KK9jjcRteJOCR0eR3jTkFzg@mail.gmail.com>
 <bb4b50d2-cfe8-f704-a462-ba7d59de3764@linux.microsoft.com>
 <CAJiuCcdckZZi0o9g5-OG0fhO3X7D-GYBJidAngnWPzEQ9+ydHA@mail.gmail.com> <f7f10848-8b8e-c824-f880-ddeaa874646b@linux.microsoft.com>
In-Reply-To: <f7f10848-8b8e-c824-f880-ddeaa874646b@linux.microsoft.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 5 Mar 2021 10:35:48 +0100
Message-ID: <CAJiuCceD0pAoeO9xkFgmLaQLDxFqx8m6No-R-YmzA4NaSk=5Vg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: Anatol Belski <anbelski@linux.microsoft.com>
Cc: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anatol,

On Thu, 4 Mar 2021 at 18:28, Anatol Belski <anbelski@linux.microsoft.com> w=
rote:
>
> Hi Cl=C3=A9ment,
>
> On 3/4/2021 11:05 AM, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Anatol, Stefan,
> >
> > On Wed, 3 Mar 2021 at 16:27, Anatol Belski <anbelski@linux.microsoft.co=
m> wrote:
> >> Hi,
> >>
> >> On 3/2/2021 8:13 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> >>
> >> Hi Stefan,
> >>
> >> Le mar. 2 mars 2021 =C3=A0 19:38, Stefan Herbrechtsmeier <stefan@herbr=
echtsmeier.net> a =C3=A9crit :
> >>> Hi,
> >>>
> >>> Am 02.03.21 um 19:22 schrieb Anatol Belski:
> >>>> On 3/2/2021 5:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> >>>>>> I don't use this feature from the grpc package, only linking again=
st the
> >>>>>> libs. However I don't see why this should be an issue, as all the
> >>>>>> *.cmake files are packaged. I see that in the RPMs but also in a r=
ecipe
> >>>>>> of a dependent packgae like this
> >>>>> Yes the cmake file is found but not the grpc_cpp_plugin.
> >>>>>
> >>>>> This is due to cmake looking for the grpc_cpp_plugin in the target
> >>>>> sysroot instead of the native/host sysroot.
> >>>>>
> >>>>>> $ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cmake
> >>>>>>
> >>>>>> Or use recipe-sysroot-native depending on the consuming recipe.
> >>>>>>
> >>>>>> Just a wild guess here - does your recipe put 'grpc' into DEPENDS =
or
> >>>>>> RDEPENDS, etc.
> >>>>> In my recipe I put 'grpc' and 'grpc-native' into DEPENDS using
> >>>>> PACKAGECONFIG
> >>>>> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grp=
c
> >>>>> grpc-native"
> >>>>>
> >>>>>> Also, do you inherit cmake in your recipe?
> >>>>> Yes i am indeed inheriting cmake and also systemd in my recipe
> >>>>>
> >>>>>> It seems to me
> >>>>>> that it's more about how to use cmake files in  a recipe, as the
> >>>>>> particularly mentioned files are packaged and pulled in a consumin=
g
> >>>>>> recipe.
> >>>>> When I look in the files packaged the cmake file is indeed here.
> >>>>> The issue is coming from the gRPCTargets.cmake
> >>>>> (https://pastebin.com/bZay7cew)
> >>>>> Line 159:
> >>>>> # Create imported target gRPC::grpc_cpp_plugin
> >>>>> add_executable(gRPC::grpc_cpp_plugin IMPORTED)
> >>>>>
> >>> [snip]
> >>>
> >>>> The executables seem only be useful for dev and thus only as native.=
 At
> >>>> this point it seems it's about going deep into debugging your recipe=
, as
> >>>> seems there's no solution laying on the surface.
> >>> This is a knowing issue and I have try to fix grpc but yocto is not a
> >>> platform grpc officially support:
> >>> https://github.com/grpc/grpc/pull/22498
> >>
> >> thanks for chiming in, Stefan. So this is a known issue and upstream h=
as refused the patch.
> >>
> >> his patch makes sense to me
> >>
> >> Can't we include it in meta-oe ?
> >>
> >> I will apply it locally anyway.
> >>
> >> Cl=C3=A9ment, is it so far confirmed that your issue is fixed by teh p=
atch?
> > Yes it is,
> >
> > Building my recipe just by adding the CMake patch.
> >
> > Just a question: is it normal that grpc_cpp_plugin host is not
> > installed in the nativesdk automatically?
> >
> > Maybe we should separate in the recipe the gRPC compiler/plugins and
> > gRPC libs no ? Like it's done by protobuf:
> > http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-dev=
tools/protobuf/protobuf_3.15.2.bb#n74
>
> I wouldn't know a reason why it doesn't go into the nativesdk,
> sysroots/<target>/usr/bin has quite some executables in it. Perhaps the
> logs would tell something, if that's intentional in the
> cross-canadian.bbclass or somewhere else.

I have explicitly renamed the -dev to -compiler.

And added the
TOOLCHAIN_HOST_TASK_append =3D " nativesdk-grpc-compiler"

now i have both :
./sysroots/x86_64-augmentedlidarsdk-linux/usr/bin/grpc_cpp_plugin
./sysroots/aarch64-poky-linux/usr/bin/grpc_cpp_plugin

Cool :)

Regards,
Clement


>
> Regards
>
> Anatol
>
