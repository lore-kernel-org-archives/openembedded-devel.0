Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0C571B99
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Apr 2017 20:56:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3w1QbJ06lVz1qrFX;
	Sun,  9 Apr 2017 22:56:28 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3w1QbH6gWnz3jgXx;
	Sun,  9 Apr 2017 22:56:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 5BDN3SkAx9lX; Sun,  9 Apr 2017 22:56:24 +0200 (CEST)
X-Auth-Info: zJwrTC6aOpASQiFXABV00r+9XNdcI5iUR8p9R2NOtpA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun,  9 Apr 2017 22:56:24 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20170407213646.29455-1-marex@denx.de>
	<CAMKF1spjhmOsDzpMd=Oc3aO_OTP_MaKhCu2WJpdrex0M+49szA@mail.gmail.com>
Message-ID: <15d14919-db33-6cb2-e8fd-4327a0081fde@denx.de>
Date: Sun, 9 Apr 2017 22:55:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spjhmOsDzpMd=Oc3aO_OTP_MaKhCu2WJpdrex0M+49szA@mail.gmail.com>
Subject: Re: [PATCH] fbida: Fix compile-host-path error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Apr 2017 20:56:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 04/09/2017 08:56 PM, Khem Raj wrote:
> On Fri, Apr 7, 2017 at 2:37 PM Marek Vasut <marex@denx.de> wrote:
> 
>> Remove the explicit reference to /usr/local/* in Variables.mk.
>> This is completely bogus and causes failure during cross-compilation.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>>  meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |  4 ++-
>>  .../fbida/files/0001-Avoid-using-host-path.patch   | 34
>> ++++++++++++++++++++++
>>  2 files changed, 37 insertions(+), 1 deletion(-)
>>  create mode 100644
>> meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
>>
>> diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
>> b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
>> index c14fc9b68..459a1e8d2 100644
>> --- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
>> +++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
>> @@ -10,7 +10,9 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>>
>>  DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif"
>>
>> -SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz"
>> +SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz \
>> +          file://0001-Avoid-using-host-path.patch \
>> +          "
>>  SRC_URI[md5sum] = "09460b964b58c2e39b665498eca29018"
>>  SRC_URI[sha256sum] =
>> "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d0b6cb6"
>>
>> diff --git
>> a/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
>> b/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
>> new file mode 100644
>> index 000000000..cdf2c25d3
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
>> @@ -0,0 +1,34 @@
>> +From 8d8fa9f22d9f6a95523bac63ac3af724faf5ff92 Mon Sep 17 00:00:00 2001
>> +From: Marek Vasut <marex@denx.de>
>> +Date: Fri, 7 Apr 2017 23:26:09 +0200
>> +Subject: [PATCH] Avoid using host-path
>> +
>> +Remove the explicit reference to /usr/local/* , this is completely
>> +bogus and causes trouble during cross-compilation.
>> +
>> +Signed-off-by: Marek Vasut <marex@denx.de>
>> +Upstream-Status: Inappropriate [upstream requires this]
> 
> 
> This status is confusing

This comment is confusing.

Hint: What do you expect me to put in there ?

Anyway, this fixes a bug, so feel free to tweak it and apply .

-- 
Best regards,
Marek Vasut

