Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id D8AD57D732
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 18:21:03 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id g7so13048196lfh.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 11:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=U+g2J5YosclM1nqupX4hnNffnpKgbSj2tu0PCQwGocc=;
	b=17EUAtQRVFEMIVDuPqgjCqLcozCV2UsncvU5ulhKjb2+g7CYc13gjRyfuWdeOay2P0
	8/qhgAIzI76KMREjhRc7U3YrBzYJeJuKla5oKb2Gx/hsklqZ2MDzX/bXpvmK/GS+jH4h
	ySErzYZ3x4SeJJv2RE13guLp+3K95b0C2gRfZsmMBokI+8nSpB+ST7I706Ods7XaFZhN
	DCBNXq7tbGtHWgicti5O66BRTR3xfM8aHKmryjQJVFJzfycfzfhbsUYz5aMlBiLHVogJ
	ofhHM0rKnbOySIygrI+qdKKjHwssVQ7lwdgLlNGLP9JvhC/MVWCgbgVKQZsEOzeyR+pg
	NEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=U+g2J5YosclM1nqupX4hnNffnpKgbSj2tu0PCQwGocc=;
	b=qWpcg0xHUqbMKzGM060KsjththHEcV0c72IrZgJHApiqCN2zi5CTFcKVNhIqBsTAX9
	Lwta06hxG/J+oI2dz4rlsq5IMdP2KvzH25iiZGEZvJGn5mqtmlzl9IVtbBsNX1yvJlpA
	WOxRRvLl6uF148+R9MkjWboxV06axsRNX6R4cgSvMdG0gqwiWqymue4j7YKcRZW9emEp
	lW8jd1Pv/CT1cnPDqCYrrfC5T0oRDWaFp9amXwVBzIHT9Ue5d4f/ewWI9ScAg4IfKOAC
	FTszcZVnwIhBPvuDZIyMv6na2Uom7mbhhC8W73x6bAvDmTEcT9pFa3rgx03AlGuB0Iw8
	j/Cg==
X-Gm-Message-State: APjAAAUurKcAeWHvQtj/IwOA1SnBf1vM1XrkINvUzdhHh/k9bvbZDsT5
	ipBMQgErFfmrphnT+CcUObMUW6k7ICM=
X-Google-Smtp-Source: APXvYqyTrUeD6F3cAghxq8sB9tWvdgJDM5/wmCFNkhA9PhvpLSvLDUQ39nHRZWkqvQ5JN9cwC6an5w==
X-Received: by 2002:ac2:554b:: with SMTP id l11mr4358821lfk.81.1554834063805; 
	Tue, 09 Apr 2019 11:21:03 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id l3sm1114571lfe.93.2019.04.09.11.21.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 11:21:03 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190408205138.29472-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sq3JHuxAH6cjG1AU6fYN7hj6jkiM836b3BGHr5=01UStA@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <25f17c05-3d19-5568-7812-33e6f5e1e289@oleksandr-kravchuk.com>
Date: Tue, 9 Apr 2019 20:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq3JHuxAH6cjG1AU6fYN7hj6jkiM836b3BGHr5=01UStA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] ell: remove recipe
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
X-List-Received-Date: Tue, 09 Apr 2019 18:21:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ell has to be added to poky first.

On 09/04/2019 20:17, Khem Raj wrote:
> ERROR: Nothing PROVIDES 'ell' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
> DEPENDS on or otherwise requires it)
> ERROR: Nothing RPROVIDES 'ell' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'ell' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['ell']
> NOTE: Runtime target 'packagegroup-meta-oe-multimedia' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-multimedia', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-dbs' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-dbs', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-devtools' is unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-devtools', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-bsp' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-bsp', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-extended' is unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-extended', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-core' is unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-core', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-security' is unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-security', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-gnome' is unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-gnome', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-kernel' is unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-kernel', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-graphics' is unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-graphics', 'ell']
> NOTE: Runtime target 'packagegroup-meta-oe-benchmarks' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-benchmarks', 'ell']
> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-crypto' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-crypto'
> NOTE: Runtime target 'packagegroup-meta-oe-crypto' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-crypto']
> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-support' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-support'
> NOTE: Runtime target 'packagegroup-meta-oe-support' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-support']
> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-test' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-test'
> NOTE: Runtime target 'packagegroup-meta-oe-test' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-test']
> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-connectivity' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-connectivity'
> NOTE: Runtime target 'packagegroup-meta-oe-connectivity' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-connectivity']
> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-navigation' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-navigation'
> NOTE: Runtime target 'packagegroup-meta-oe-navigation' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-navigation']
> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-ptest-packages' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-ptest-packages'
> NOTE: Runtime target 'packagegroup-meta-oe-ptest-packages' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-ptest-packages']
> ERROR: Nothing RPROVIDES 'iwd-dev' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'iwd-dev'
> NOTE: Runtime target 'iwd-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iwd-dev']
> ERROR: Nothing RPROVIDES 'iwd' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'iwd'
> NOTE: Runtime target 'iwd' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iwd']
>
> On Mon, Apr 8, 2019 at 1:51 PM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> This recipe will be moved to poky instead as newer versions of some of
>> its components depend on it.
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  meta-oe/recipes-core/ell/ell_0.17.bb | 17 -----------------
>>  1 file changed, 17 deletions(-)
>>  delete mode 100644 meta-oe/recipes-core/ell/ell_0.17.bb
>>
>> diff --git a/meta-oe/recipes-core/ell/ell_0.17.bb b/meta-oe/recipes-core/ell/ell_0.17.bb
>> deleted file mode 100644
>> index 27f11cfbe..000000000
>> --- a/meta-oe/recipes-core/ell/ell_0.17.bb
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -SUMMARY  = "Embedded Linux Library"
>> -DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
>> -LICENSE  = "LGPLv2.1"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
>> -SECTION = "libs"
>> -
>> -inherit autotools pkgconfig
>> -
>> -S = "${WORKDIR}/git"
>> -SRCREV = "ebc021cee3b2d20ca2af5e3ed02495da616b2fd3"
>> -SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
>> -
>> -do_configure_prepend () {
>> -    mkdir -p ${S}/build-aux
>> -}
>> -
>> -DEPENDS = "dbus"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

