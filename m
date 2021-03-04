Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.4522.1614852315217468749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 02:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RW18L1KW;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: peron.clem@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id p8so21888458ejb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Mar 2021 02:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6wcy7+xJiuMezfuw/8WKeV/NK2Yhx5oFHr1L5Aktz+Q=;
        b=RW18L1KWkeSCTi1K20APKPhJMXxkotyMxQZeKSN2BJ2hhexIR50oykldwu4YykX4NB
         qAdUq6H6w32MkI8xem5e4jYD0g4S0iRVtpGyD4hHBEy5PYVkBle3UfNbZtcN42daJCEW
         JAn2TTSEiTunuEAQxpemzLix3c7wf1GOrykYgslqvJyeyvOcVCfcQ9Mv+HM8qvmqmVxO
         dRvf9/I7aYM2MG6fz+z31wJ6zJC5HlNoLeyaZAi06BbaDlnsgLnC9kLOy/zZVQUSgGT/
         aYFrqoZnCVml5gmDRqzF6X+xEq0cMvZK+dBns1q3SJV0iuSz/kx4yrXs/fi7Wt0Pruwm
         wL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6wcy7+xJiuMezfuw/8WKeV/NK2Yhx5oFHr1L5Aktz+Q=;
        b=VbUbU+aYv95b19H5NhzeMDIiGe9qWD09d5+el4KzA9cnohiGllq7NOtXbUl17nTxMt
         IP0iENGVrWNJ0TJEPS8tz0JwXZISBrMkSJR310iJeCRub3SzCJOAo2TJcyzk4wyee2+Z
         IIR8FzLguYsK04Ixh0WMkWLTTlm17Xy6WnG2RCR2yjkRDbi7nmnE043fRr91WqvYO7TH
         pWs3dwMmWr6kpbSYCn+dr5gWZ7/nOoHaORK3KGBblzrOhY5fZyL7bHSoOEk6JgNhA79G
         z/1AI58jfW1QWdBbGxBJO5Ll4F4a8nHq/3vyM6CPEs/bP0OKOH4GtPRNtuiD5is7i9dO
         QNQA==
X-Gm-Message-State: AOAM530AD+9CA4AADDyU4X0OOkK44B119A2JP//0k6tZN7hlX38cnn7d
	DgJWagdRhajJlDo7GtgXR78jqwaTj52Lzaa9oUo=
X-Google-Smtp-Source: ABdhPJzg4l+wjNeFbrKRBfauWwiYe8c81DKLy0qAl/ozHafuWZpKDclUPtB15ZyvR3ZdAqH3dtaTQwi7RLYnSFC6DJc=
X-Received: by 2002:a17:906:5597:: with SMTP id y23mr3399813ejp.165.1614852313468;
 Thu, 04 Mar 2021 02:05:13 -0800 (PST)
MIME-Version: 1.0
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
 <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
 <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
 <CAJiuCcd4bvctA_JjL6bx6z+zhwsGiy1QPR9tyzgaB6spLwqPQQ@mail.gmail.com>
 <2543ce50-034e-a21f-2c60-95596e5b7595@linux.microsoft.com>
 <885244a0-e750-4527-3475-edbabd2bc46f@herbrechtsmeier.net>
 <CAJiuCceOvVCRXzKgrzez3NX4i96KK9jjcRteJOCR0eR3jTkFzg@mail.gmail.com> <bb4b50d2-cfe8-f704-a462-ba7d59de3764@linux.microsoft.com>
In-Reply-To: <bb4b50d2-cfe8-f704-a462-ba7d59de3764@linux.microsoft.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 4 Mar 2021 11:05:02 +0100
Message-ID: <CAJiuCcdckZZi0o9g5-OG0fhO3X7D-GYBJidAngnWPzEQ9+ydHA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: Anatol Belski <anbelski@linux.microsoft.com>, 
	Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anatol, Stefan,

On Wed, 3 Mar 2021 at 16:27, Anatol Belski <anbelski@linux.microsoft.com> w=
rote:
>
> Hi,
>
> On 3/2/2021 8:13 PM, Cl=C3=A9ment P=C3=A9ron wrote:
>
> Hi Stefan,
>
> Le mar. 2 mars 2021 =C3=A0 19:38, Stefan Herbrechtsmeier <stefan@herbrech=
tsmeier.net> a =C3=A9crit :
>>
>> Hi,
>>
>> Am 02.03.21 um 19:22 schrieb Anatol Belski:
>> >
>> > On 3/2/2021 5:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:
>> >>> I don't use this feature from the grpc package, only linking against=
 the
>> >>> libs. However I don't see why this should be an issue, as all the
>> >>> *.cmake files are packaged. I see that in the RPMs but also in a rec=
ipe
>> >>> of a dependent packgae like this
>> >> Yes the cmake file is found but not the grpc_cpp_plugin.
>> >>
>> >> This is due to cmake looking for the grpc_cpp_plugin in the target
>> >> sysroot instead of the native/host sysroot.
>> >>
>> >>> $ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cmake
>> >>>
>> >>> Or use recipe-sysroot-native depending on the consuming recipe.
>> >>>
>> >>> Just a wild guess here - does your recipe put 'grpc' into DEPENDS or
>> >>> RDEPENDS, etc.
>> >> In my recipe I put 'grpc' and 'grpc-native' into DEPENDS using
>> >> PACKAGECONFIG
>> >> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc
>> >> grpc-native"
>> >>
>> >>> Also, do you inherit cmake in your recipe?
>> >> Yes i am indeed inheriting cmake and also systemd in my recipe
>> >>
>> >>> It seems to me
>> >>> that it's more about how to use cmake files in  a recipe, as the
>> >>> particularly mentioned files are packaged and pulled in a consuming
>> >>> recipe.
>> >> When I look in the files packaged the cmake file is indeed here.
>> >> The issue is coming from the gRPCTargets.cmake
>> >> (https://pastebin.com/bZay7cew)
>> >> Line 159:
>> >> # Create imported target gRPC::grpc_cpp_plugin
>> >> add_executable(gRPC::grpc_cpp_plugin IMPORTED)
>> >>
>>
>> [snip]
>>
>> > The executables seem only be useful for dev and thus only as native. A=
t
>> > this point it seems it's about going deep into debugging your recipe, =
as
>> > seems there's no solution laying on the surface.
>>
>> This is a knowing issue and I have try to fix grpc but yocto is not a
>> platform grpc officially support:
>> https://github.com/grpc/grpc/pull/22498
>
>
> thanks for chiming in, Stefan. So this is a known issue and upstream has =
refused the patch.
>
> his patch makes sense to me
>
> Can't we include it in meta-oe ?
>
> I will apply it locally anyway.
>
> Cl=C3=A9ment, is it so far confirmed that your issue is fixed by teh patc=
h?

Yes it is,

Building my recipe just by adding the CMake patch.

Just a question: is it normal that grpc_cpp_plugin host is not
installed in the nativesdk automatically?

Maybe we should separate in the recipe the gRPC compiler/plugins and
gRPC libs no ? Like it's done by protobuf:
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtool=
s/protobuf/protobuf_3.15.2.bb#n74

Regards,
Clement


>
> I could note from my side, that carrying a patch to CMake scripts in gene=
ral is a pain, as the syntax is not very patch friendly. For GRPC - the CMa=
ke script is also huge. But also, i've no use for the pattern so couldn't t=
ell how urgent this scenario would be.
>
>
> Thanks
>
> Anatol
>
>
>
>
>
