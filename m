Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.2148.1614878932468824312
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 09:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=hD3Gbttr;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (i59F7C02D.versanet.de [89.247.192.45])
	by linux.microsoft.com (Postfix) with ESMTPSA id E87DB20B83EA;
	Thu,  4 Mar 2021 09:28:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E87DB20B83EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1614878931;
	bh=Owz9aqfINS8yiupLcMuD0YhColRgOexX4hOE326vw0c=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=hD3GbttrJVgaSXn4vSbODlDsIjsA6deu4mdwRzksEQS7PiXxCD7DRvrS0PWAY3r7D
	 HiRoF8Vn8bSYNl98LL2pPRc+cRPz6D3iLcPvsdWhqXKOXa3Y0pDD+U1WSnD8RqO975
	 jf0TZzCTdXmhdNCjSjBguZWeCT9tGCiaC4EFDwlc=
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
 <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
 <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
 <CAJiuCcd4bvctA_JjL6bx6z+zhwsGiy1QPR9tyzgaB6spLwqPQQ@mail.gmail.com>
 <2543ce50-034e-a21f-2c60-95596e5b7595@linux.microsoft.com>
 <885244a0-e750-4527-3475-edbabd2bc46f@herbrechtsmeier.net>
 <CAJiuCceOvVCRXzKgrzez3NX4i96KK9jjcRteJOCR0eR3jTkFzg@mail.gmail.com>
 <bb4b50d2-cfe8-f704-a462-ba7d59de3764@linux.microsoft.com>
 <CAJiuCcdckZZi0o9g5-OG0fhO3X7D-GYBJidAngnWPzEQ9+ydHA@mail.gmail.com>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <f7f10848-8b8e-c824-f880-ddeaa874646b@linux.microsoft.com>
Date: Thu, 4 Mar 2021 18:28:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAJiuCcdckZZi0o9g5-OG0fhO3X7D-GYBJidAngnWPzEQ9+ydHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On 3/4/2021 11:05 AM, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi Anatol, Stefan,
>
> On Wed, 3 Mar 2021 at 16:27, Anatol Belski <anbelski@linux.microsoft.co=
m> wrote:
>> Hi,
>>
>> On 3/2/2021 8:13 PM, Cl=C3=A9ment P=C3=A9ron wrote:
>>
>> Hi Stefan,
>>
>> Le mar. 2 mars 2021 =C3=A0 19:38, Stefan Herbrechtsmeier <stefan@herbr=
echtsmeier.net> a =C3=A9crit :
>>> Hi,
>>>
>>> Am 02.03.21 um 19:22 schrieb Anatol Belski:
>>>> On 3/2/2021 5:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:
>>>>>> I don't use this feature from the grpc package, only linking again=
st the
>>>>>> libs. However I don't see why this should be an issue, as all the
>>>>>> *.cmake files are packaged. I see that in the RPMs but also in a r=
ecipe
>>>>>> of a dependent packgae like this
>>>>> Yes the cmake file is found but not the grpc_cpp_plugin.
>>>>>
>>>>> This is due to cmake looking for the grpc_cpp_plugin in the target
>>>>> sysroot instead of the native/host sysroot.
>>>>>
>>>>>> $ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cmake
>>>>>>
>>>>>> Or use recipe-sysroot-native depending on the consuming recipe.
>>>>>>
>>>>>> Just a wild guess here - does your recipe put 'grpc' into DEPENDS =
or
>>>>>> RDEPENDS, etc.
>>>>> In my recipe I put 'grpc' and 'grpc-native' into DEPENDS using
>>>>> PACKAGECONFIG
>>>>> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grp=
c
>>>>> grpc-native"
>>>>>
>>>>>> Also, do you inherit cmake in your recipe?
>>>>> Yes i am indeed inheriting cmake and also systemd in my recipe
>>>>>
>>>>>> It seems to me
>>>>>> that it's more about how to use cmake files in  a recipe, as the
>>>>>> particularly mentioned files are packaged and pulled in a consumin=
g
>>>>>> recipe.
>>>>> When I look in the files packaged the cmake file is indeed here.
>>>>> The issue is coming from the gRPCTargets.cmake
>>>>> (https://pastebin.com/bZay7cew)
>>>>> Line 159:
>>>>> # Create imported target gRPC::grpc_cpp_plugin
>>>>> add_executable(gRPC::grpc_cpp_plugin IMPORTED)
>>>>>
>>> [snip]
>>>
>>>> The executables seem only be useful for dev and thus only as native.=
 At
>>>> this point it seems it's about going deep into debugging your recipe=
, as
>>>> seems there's no solution laying on the surface.
>>> This is a knowing issue and I have try to fix grpc but yocto is not a
>>> platform grpc officially support:
>>> https://github.com/grpc/grpc/pull/22498
>>
>> thanks for chiming in, Stefan. So this is a known issue and upstream h=
as refused the patch.
>>
>> his patch makes sense to me
>>
>> Can't we include it in meta-oe ?
>>
>> I will apply it locally anyway.
>>
>> Cl=C3=A9ment, is it so far confirmed that your issue is fixed by teh p=
atch?
> Yes it is,
>
> Building my recipe just by adding the CMake patch.
>
> Just a question: is it normal that grpc_cpp_plugin host is not
> installed in the nativesdk automatically?
>
> Maybe we should separate in the recipe the gRPC compiler/plugins and
> gRPC libs no ? Like it's done by protobuf:
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-dev=
tools/protobuf/protobuf_3.15.2.bb#n74

I wouldn't know a reason why it doesn't go into the nativesdk,=20
sysroots/<target>/usr/bin has quite some executables in it. Perhaps the=20
logs would tell something, if that's intentional in the=20
cross-canadian.bbclass or somewhere else.

Regards

Anatol

