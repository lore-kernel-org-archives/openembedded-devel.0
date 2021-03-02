Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
 by mx.groups.io with SMTP id smtpd.web08.122.1614710316604622602
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 10:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: herbrechtsmeier.net, ip: 85.13.157.12, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.45] (i59F77E54.versanet.de [89.247.126.84])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id AAAFF11A0177;
	Tue,  2 Mar 2021 19:38:33 +0100 (CET)
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: Anatol Belski <anbelski@linux.microsoft.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
 <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
 <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
 <CAJiuCcd4bvctA_JjL6bx6z+zhwsGiy1QPR9tyzgaB6spLwqPQQ@mail.gmail.com>
 <2543ce50-034e-a21f-2c60-95596e5b7595@linux.microsoft.com>
From: "Stefan Herbrechtsmeier" <stefan@herbrechtsmeier.net>
Message-ID: <885244a0-e750-4527-3475-edbabd2bc46f@herbrechtsmeier.net>
Date: Tue, 2 Mar 2021 19:38:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2543ce50-034e-a21f-2c60-95596e5b7595@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

Am 02.03.21 um 19:22 schrieb Anatol Belski:
>=20
> On 3/2/2021 5:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:
>>> I don't use this feature from the grpc package, only linking against =
the
>>> libs. However I don't see why this should be an issue, as all the
>>> *.cmake files are packaged. I see that in the RPMs but also in a reci=
pe
>>> of a dependent packgae like this
>> Yes the cmake file is found but not the grpc_cpp_plugin.
>>
>> This is due to cmake looking for the grpc_cpp_plugin in the target
>> sysroot instead of the native/host sysroot.
>>
>>> $ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cmake
>>>
>>> Or use recipe-sysroot-native depending on the consuming recipe.
>>>
>>> Just a wild guess here - does your recipe put 'grpc' into DEPENDS or
>>> RDEPENDS, etc.
>> In my recipe I put 'grpc' and 'grpc-native' into DEPENDS using=20
>> PACKAGECONFIG
>> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc=20
>> grpc-native"
>>
>>> Also, do you inherit cmake in your recipe?
>> Yes i am indeed inheriting cmake and also systemd in my recipe
>>
>>> It seems to me
>>> that it's more about how to use cmake files in=C2=A0 a recipe, as the
>>> particularly mentioned files are packaged and pulled in a consuming=20
>>> recipe.
>> When I look in the files packaged the cmake file is indeed here.
>> The issue is coming from the gRPCTargets.cmake=20
>> (https://pastebin.com/bZay7cew)
>> Line 159:
>> # Create imported target gRPC::grpc_cpp_plugin
>> add_executable(gRPC::grpc_cpp_plugin IMPORTED)
>>

[snip]

> The executables seem only be useful for dev and thus only as native. At=
=20
> this point it seems it's about going deep into debugging your recipe, a=
s=20
> seems there's no solution laying on the surface.

This is a knowing issue and I have try to fix grpc but yocto is not a=20
platform grpc officially support:
https://github.com/grpc/grpc/pull/22498

The cmake package only works if you install the binaries but yocto=20
doesn't install binaries for the target because otherwise cmake couldn't=20
find the native binaries.

Regards
   Stefan
