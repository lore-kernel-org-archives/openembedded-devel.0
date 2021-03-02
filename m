Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.29.1614709366717787812
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 10:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=gfd+Q60j;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (i59F7A1E8.versanet.de [89.247.161.232])
	by linux.microsoft.com (Postfix) with ESMTPSA id 80A2C20B83EA;
	Tue,  2 Mar 2021 10:22:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 80A2C20B83EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1614709365;
	bh=Chag5GZZdoh2Ior6pkwaZezIwWwijdIk9u9B/QEl8lc=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=gfd+Q60jm+L4TvxrzemMHzb3biVch76GmmMsfMaN7S9a/KEwxIhsPFamre1YcusaZ
	 PwPGgrOMFoKXGKFQ8GNsWbz2B2PFG39YlqTR17nhax7m3EWMSqEEWp4jmamCyfZqD+
	 HrUXb+ZxCTvRuNVvGvKD0iqkXB3XUjZlpGa3CuMQ=
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
 <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
 <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
 <CAJiuCcd4bvctA_JjL6bx6z+zhwsGiy1QPR9tyzgaB6spLwqPQQ@mail.gmail.com>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <2543ce50-034e-a21f-2c60-95596e5b7595@linux.microsoft.com>
Date: Tue, 2 Mar 2021 19:22:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAJiuCcd4bvctA_JjL6bx6z+zhwsGiy1QPR9tyzgaB6spLwqPQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 3/2/2021 5:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:
>> I don't use this feature from the grpc package, only linking against t=
he
>> libs. However I don't see why this should be an issue, as all the
>> *.cmake files are packaged. I see that in the RPMs but also in a recip=
e
>> of a dependent packgae like this
> Yes the cmake file is found but not the grpc_cpp_plugin.
>
> This is due to cmake looking for the grpc_cpp_plugin in the target
> sysroot instead of the native/host sysroot.
>
>> $ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cmake
>>
>> Or use recipe-sysroot-native depending on the consuming recipe.
>>
>> Just a wild guess here - does your recipe put 'grpc' into DEPENDS or
>> RDEPENDS, etc.
> In my recipe I put 'grpc' and 'grpc-native' into DEPENDS using PACKAGEC=
ONFIG
> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc gr=
pc-native"
>
>> Also, do you inherit cmake in your recipe?
> Yes i am indeed inheriting cmake and also systemd in my recipe
>
>> It seems to me
>> that it's more about how to use cmake files in  a recipe, as the
>> particularly mentioned files are packaged and pulled in a consuming re=
cipe.
> When I look in the files packaged the cmake file is indeed here.
> The issue is coming from the gRPCTargets.cmake (https://pastebin.com/bZ=
ay7cew)
> Line 159:
> # Create imported target gRPC::grpc_cpp_plugin
> add_executable(gRPC::grpc_cpp_plugin IMPORTED)
>
> gRPC is trying to add the grpc_cpp_plugin for the Target which is not
> present in the final package.
> dpkg -c ./build/tmp/deploy/ipk/aarch64/grpc_1.35.0-r0_aarch64.ipk
> drwxr-xr-x root/root         0 2021-02-22 17:43 ./usr/
> drwxr-xr-x root/root         0 2021-02-22 17:43 ./usr/lib/
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libaddress_sorting.so.14 -> libaddress_sorting.so.14.0.0
> -rwxr-xr-x root/root     10000 2021-02-22 17:43
> ./usr/lib/libaddress_sorting.so.14.0.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43 ./usr/lib/libgpr.so.14
> -> libgpr.so.14.0.0
> -rwxr-xr-x root/root     59616 2021-02-22 17:43 ./usr/lib/libgpr.so.14.=
0.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libgrpc++.so.1 -> libgrpc++.so.1.35.0
> -rwxr-xr-x root/root    501680 2021-02-22 17:43 ./usr/lib/libgrpc++.so.=
1.35.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libgrpc++_alts.so.1 -> libgrpc++_alts.so.1.35.0
> -rwxr-xr-x root/root     22368 2021-02-22 17:43
> ./usr/lib/libgrpc++_alts.so.1.35.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libgrpc++_error_details.so.1 ->
> libgrpc++_error_details.so.1.35.0
> -rwxr-xr-x root/root     34896 2021-02-22 17:43
> ./usr/lib/libgrpc++_error_details.so.1.35.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libgrpc++_reflection.so.1 -> libgrpc++_reflection.so.1.35.0
> -rwxr-xr-x root/root    284960 2021-02-22 17:43
> ./usr/lib/libgrpc++_reflection.so.1.35.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libgrpc++_unsecure.so.1 -> libgrpc++_unsecure.so.1.35.0
> -rwxr-xr-x root/root    415672 2021-02-22 17:43
> ./usr/lib/libgrpc++_unsecure.so.1.35.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libgrpc.so.14 -> libgrpc.so.14.0.0
> -rwxr-xr-x root/root   3505864 2021-02-22 17:43 ./usr/lib/libgrpc.so.14=
.0.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libgrpc_plugin_support.so.1 ->
> libgrpc_plugin_support.so.1.35.0
> -rwxr-xr-x root/root    440528 2021-02-22 17:43
> ./usr/lib/libgrpc_plugin_support.so.1.35.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libgrpc_unsecure.so.14 -> libgrpc_unsecure.so.14.0.0
> -rwxr-xr-x root/root   1939384 2021-02-22 17:43
> ./usr/lib/libgrpc_unsecure.so.14.0.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43
> ./usr/lib/libgrpcpp_channelz.so.1 -> libgrpcpp_channelz.so.1.35.0
> -rwxr-xr-x root/root    617784 2021-02-22 17:43
> ./usr/lib/libgrpcpp_channelz.so.1.35.0
> lrwxrwxrwx root/root         0 2021-02-22 17:43 ./usr/lib/libupb.so.14
> -> libupb.so.14.0.0
> -rwxr-xr-x root/root    141768 2021-02-22 17:43 ./usr/lib/libupb.so.14.=
0.0
> drwxr-xr-x root/root         0 2021-02-22 17:43 ./usr/share/
> drwxr-xr-x root/root         0 2021-02-22 17:43 ./usr/share/grpc/
> -rw-r--r-- root/root    263903 2021-02-22 17:38 ./usr/share/grpc/roots.=
pem

The bins are packaged into -dev. In the rpm version, i see it packaged

$ rpm -qlp ./tmp/deploy/rpm/aarch64/grpc-dev-1.35.0-r0.aarch64.rpm |=20
grep grpc_cpp_plugin
/usr/bin/grpc_cpp_plugin

And same way they're to see

 =C2=A0ls -l ./tmp/work/*/*/*/recipe-sysroot-native/usr/bin/*grpc*

The executables seem only be useful for dev and thus only as native. At=20
this point it seems it's about going deep into debugging your recipe, as=20
seems there's no solution laying on the surface.

Regards

Anatol





