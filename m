Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.8304.1614691953240774689
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 05:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=H5eX+obl;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (i59F7A1E8.versanet.de [89.247.161.232])
	by linux.microsoft.com (Postfix) with ESMTPSA id EE3C020B83EA;
	Tue,  2 Mar 2021 05:32:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EE3C020B83EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1614691952;
	bh=AKLS1Cu8wvAkMzL0OeGZyEQfvr/BznfHuoGXj9nydLg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=H5eX+oblZZFZiz3Besy/AC08bhKNtsttW7rw3BtA7QBxPfi7FOapQ8VZl2zGlkiQr
	 HMdMeB/CEYPiRxocbQheMu+i4MPHPOn7hC5iumJrJexHfDFR7+3egLGGpjObwj2GK2
	 T14KY+817yJwRXjHRPvHC6SBrxkzCQ23q4l53zg8=
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
 <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
Date: Tue, 2 Mar 2021 14:32:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

Thanks for the question.

On 2/22/2021 5:49 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi Anatol,
>
>
> On Fri, 19 Feb 2021 at 13:40, Anatol Belski
> <anbelski@linux.microsoft.com> wrote:
>> This is a really huge jump in versions, but this package has been not
>> upgraded for quite some time. The previous patches are not necessary
>> anymore, they're integrated upstream.
> This version of gRPC generate a new CMake gRPCTargets.cmake
> recipe-sysroot/usr/lib/cmake/grpc/gRPCTargets.cmake
>
> This generate an error in my build:
> Because this CMake declare a
> recipe-sysroot/usr/bin/grpc_cpp_plugin
>
> but this file does not exist.  Possible reasons include:
> |
> |   * The file was deleted, renamed, or moved to another location.
> |
> |   * An install or uninstall procedure did not complete successfully.
> |
> |   * The installation package was faulty and contained
>
> In my project i'm using the CMake example from gRPC
> https://github.com/grpc/grpc/blob/master/examples/cpp/cmake/common.cmak=
e#L114
>
> This error is triggered by:
> find_package(gRPC 1.35.0 CONFIG REQUIRED)
>
> FYI My recipes depends on grpc and grpc-native
> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc gr=
pc-native"
>
> Do you have an example of a gRPC recipe?

I don't use this feature from the grpc package, only linking against the=20
libs. However I don't see why this should be an issue, as all the=20
*.cmake files are packaged. I see that in the RPMs but also in a recipe=20
of a dependent packgae like this

$ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cmake

Or use recipe-sysroot-native depending on the consuming recipe.

Just a wild guess here - does your recipe put 'grpc' into DEPENDS or=20
RDEPENDS, etc. Also, do you inherit cmake in your recipe? It seems to me=20
that it's more about how to use cmake files in=C2=A0 a recipe, as the=20
particularly mentioned files are packaged and pulled in a consuming recip=
e.

Regards

Anatol






