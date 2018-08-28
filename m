Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4948072EB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:23:02 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id m199-v6so1373144wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 02:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=JXRHlgst0k3r8j+B3/AJq828up7Jl92cXGLxONdK9+4=;
	b=moQbSxCN+eQgE4uqTo1TH/05Ckveni/1U3p3QuujO7VYk+kDA3UugCp1GLiJb7n5dz
	WAyooAuEAppjRBIky7/AnSMLcnbFeiB51BUc8/J2Vvijx7N9HSBYefYaOZv9dDxvdu3Z
	wSvTadgomEelsdNIcP4xpceRuzPjyKkPsvlfXc3l2uvOKXn0ZEyJTYARwQvLCn8GRK5f
	sB2Yi5BHVh0lhG6l/8ExGL62GaJNg+cNEHcZjE/W87G+ueBUf87beQ2C36a9EtkwnmFf
	C2q12ALZVg24AelpYQ6E/vqg1/+Iq55+powxxKe9H82T/KybrEgjnZaXQJeaIfZnGooB
	pbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=JXRHlgst0k3r8j+B3/AJq828up7Jl92cXGLxONdK9+4=;
	b=IpCscSbh6sAByTshymNxRuYSS779Il86Vhaqq8/bgQE962xmJhv6K7et+EFARl31E5
	V4MUtD7hcZGuIWqcd8PEmn60MZtA5OSAQwziDIu6caAO5p7PwQ8t5ibGjNQlT2j4gti/
	AdKJ93d2yYgGCpudbOmADOozw3WoE0j3KiJvYRxXJCLTEmyu2a3/7CTlSkWlzU+YQbvS
	EhCyg38elowfdiAGwcFPP9VrqXaHBcSlqXQ+VDA7sULStS2uSEvJ1cIp1WGRYxdUoE2k
	c9r0B25q1GsFMzBPnESD/ctX7QkCywNB00f/g9HeyCkaVkgsDYwEHxOQzHz3kDS7m3wb
	9PYQ==
X-Gm-Message-State: APzg51DvonmCem2tc0BsOCd/JCceu3Pj0miOrvpJu2HmQzispikPaHep
	cjqiZGLejq3IPQV6aPBACQkUw+GhJgDccE+arbwmUA==
X-Google-Smtp-Source: ANB0Vdbegc4H7Y5IjtVPfFinaQF6rWu/b4OeIgnItRouROUDt5heoLCLOjXF50aWBu0zgS36/n+FFYcfXF6DP8t0PgI=
X-Received: by 2002:a1c:4887:: with SMTP id
	v129-v6mr732535wma.129.1535448182997; 
	Tue, 28 Aug 2018 02:23:02 -0700 (PDT)
MIME-Version: 1.0
Sender: rehsack@gmail.com
Received: by 2002:a5d:6511:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 02:23:02
	-0700 (PDT)
In-Reply-To: <CAMKF1srxejEKKqRiW5zsKcqRM_u5mhe8_sA0bS8DkKcaF2p3Og@mail.gmail.com>
References: <20180827142738.18615-1-sno@netbsd.org>
	<20180827142738.18615-2-sno@netbsd.org>
	<CAMKF1srxejEKKqRiW5zsKcqRM_u5mhe8_sA0bS8DkKcaF2p3Og@mail.gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Date: Tue, 28 Aug 2018 11:23:02 +0200
X-Google-Sender-Auth: BHcotLpohAdl_RqVpZf_Jm6UlTI
Message-ID: <CAANR1XFcXYd13bCvEEDTfrfb5MWqziSkqcytDRCdV0oN=Q61cA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH 2/2] libcrypt-openssl-rsa-perl: Update to 0.30
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
X-List-Received-Date: Tue, 28 Aug 2018 09:23:02 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-27 18:42 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Mon, Aug 27, 2018 at 7:28 AM Jens Rehsack <sno@netbsd.org> wrote:
>>
>> Update recipe for CPAN hosted Perl5 module Crypt::OpenSSL::RSA
>> from 0.28 to 0.30 to fix build issues when using openssl 1.1 and
>> to express our love to the Perl Programming Language.
>>
>> Changes since 0.28: https://metacpan.org/changes/release/TODDR/Crypt-OpenSSL-RSA-0.30
>>
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>>  ...rsa-perl_0.28.bb => libcrypt-openssl-rsa-perl_0.30.bb} | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>  rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.28.bb => libcrypt-openssl-rsa-perl_0.30.bb} (64%)
>>
>> diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
>> similarity index 64%
>> rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
>> rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
>> index f0c610f3a..0a2ad8aa4 100644
>> --- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
>> +++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
>> @@ -1,14 +1,14 @@
>>  SUMMARY = "Crypt Openssl RSA cpan module"
>>  SECTION = "libs"
>>  LICENSE = "Artistic-1.0 | GPL-1.0+"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
>>
>
> what changed to cause this ? may be mention it in
> commit message

They simply changed the content of the LICENSE file - there is no real change.

>>  SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
>>
>> -SRC_URI[md5sum] = "86217a5036fc63779c30420b5fd84129"
>> -SRC_URI[sha256sum] = "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be"
>> +SRC_URI[md5sum] = "10bca2fc6d0ba1aa329f227424ae87d5"
>> +SRC_URI[sha256sum] = "23e13531397af102db4fd24bcf70137add7c85c23cca697c43aa71c2959a29ac"
>>
>> -DEPENDS += "openssl"
>> +DEPENDS += "libcrypt-openssl-guess-native openssl"
>>
>>  RDEPENDS_${PN}="libcrypt-openssl-random-perl"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

