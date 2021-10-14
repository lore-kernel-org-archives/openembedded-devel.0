Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6979C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 23:41:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.2691.1634254900292277297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 16:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=rbaa1I5z;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9D1478362B;
	Fri, 15 Oct 2021 01:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634254891;
	bh=xtRlKQ6YgsAFvhMLhfDxvCt3EQMkL1f0q/5auzSoeHE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=rbaa1I5zC62O1MGhgJVwp/guIzxBi8bKR1uwHr5ORZoD/5H8mD/0ttT0aH0uRUg80
	 Y68+tvVGvJAY+BIJeSWI1WjwjIKd3TtEVrJxGJVx2MpdKAwXSdtqmI8s39U7PkXtdN
	 rfMVmh9w+2x0BSVZaPBVon8z2C7yDbNz4zWTkgOX8MWXnd76nQX+w98SQSFN9qo3jt
	 FWfm3+9IuTcGkqU8l81X7O4WlU5ha9Hdv5iRc1Hc5nVkOXc5b70Y0z7Z3uTebNMMUn
	 1D2qYGHlEZFshZ4YnsV4BpX5wDlCujKTTGVcYAEc3R+cgKNK+sAQy4iI/4YXy5Y73M
	 OIYTjGgxnpgCA==
Subject: Re: [oe] [meta-oe][PATCH] apitrace: Conditionally enable X11 support
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
References: <20211014224120.84927-1-marex@denx.de>
 <CA+chaQcH9R06Q4N5z021=dTdAKT35MgVKgcOP_U60smu6L=7wA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <9698672a-edb9-f66a-ba8e-e4355829f4fe@denx.de>
Date: Fri, 15 Oct 2021 01:41:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CA+chaQcH9R06Q4N5z021=dTdAKT35MgVKgcOP_U60smu6L=7wA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 23:41:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93314

On 10/14/21 11:32 PM, Martin Jansa wrote:
> Why not use PACKAGECONFIG for this? It won't set the EXTRA_OECMAKE
> automatically, but will handle the depends correctly (and will be easy to
> switch of if someone with x1 and opengl in DISTRO_FEATURES still doesn't
> wan to have X11 enabled here for whatever reason).
> 
> On Fri, Oct 15, 2021 at 12:41 AM Marek Vasut <marex@denx.de> wrote:
> 
>> In case DISTRO_FEATURES contain both x11 and opengl, enable X11 support
>> in apitrace, because all the requirements are satisfied.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
>> b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
>> index 57ec1f8e0..f097f78a9 100644
>> --- a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
>> +++ b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
>> @@ -13,12 +13,13 @@ SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git
>> <http://github.com/$%7BBPN%7D/$%7BBPN%7D.git> \
>>   S = "${WORKDIR}/git"
>>
>>   DEPENDS += "zlib libpng python3-native"
>> +DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
>> 'libx11', '', d)} "
>>
>>   inherit cmake
>>
>>   EXTRA_OECMAKE += "\
>>       -DENABLE_GUI=OFF \
>> -    -DENABLE_X11=OFF \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
>> '-DENABLE_X11=ON', '-DENABLE_X11=OFF', d)} \
>>       -DENABLE_STATIC_LIBGCC=OFF \
>>       -DENABLE_STATIC_LIBSTDCXX=OFF \
>>       -DPython3_ROOT_DIR=/usr/bin/python3-native \
>> --
>> 2.33.0

I would expect that someone who uses apitrace and enables x11 would also 
want that tracing functionality in by default, which can be handled by 
default packageconfig , sure. It felt like adding packageconfig with 
this x11 enabled by default in there (if DISTRO_FEATURES contain opengl 
and x11) would add extra complexity for little actual gain.

