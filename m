Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id BA4586C49A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 17:01:26 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id g189so1163162pgc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 09:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=8q9d3dCu+KDHq+GW25DqXUwaWY2gSSwe1yRlqm269I0=;
	b=X4hV8whBLRVhGyGncsB9APB2XClDkfSqvaGSccijatKQlXKDVTZdRLj69VUP67cBoP
	YIJzIMVXf04gCKbCKrKLePkrsd1UCwlkkMl1I/488+OWlq2S1I6q6IBElG6HWYaFivU9
	esjbaTT2Ze5lzbVGjF4xLnBZPzxFGUFJvXmnfDpxOW4Voq/bvKoAUarrSfik8f3vspnF
	K6Yf4VuT6Uvhf3JpuQpmRJFjcYRbagmp9fWof+0prLHGT34B36aTLV/Gi6JwkMnMw17Q
	eMahnUSbeS0lpCpX126TvKjSpvFf4nHTA4GPSgBbkYaIdZLrTFj9WB+hpOT29LU1z8ZE
	lalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=8q9d3dCu+KDHq+GW25DqXUwaWY2gSSwe1yRlqm269I0=;
	b=YEu0cxFh/YtKwzi0SdOJEqWz4XAqaerPX/JYz7mZ9azAV6qK0GT5UDi2JA+heOFe2a
	B3oxODrI/pmm2X82Hq3K45415EhjDA3Kq1nup49qSsm4hDZlQVfcakw11xgqzQbHSs+w
	FrdPY0LlH99ylGnFLHbQgjHszxeo84CxNAs2kwiqiZhC+Lzw5az9QAVoocxjtE9hXJ6P
	Of5mvCYFZokzCzHnfdXn1G6S9ePfXkn/bywIxmNqgEiNmSyq8FJSf0A/YrVetPg72coA
	E0AuSVTuEE3Y5CF9+wBSzq8A6ywDqdnHh880QLtIGkqA+iBkAogODdUe+AVO2V9rGtpV
	cfOA==
X-Gm-Message-State: AA+aEWah62Yib/3xvDSyCImsSKuptsVTwhFYu/FDsi8t32+hYGq1vxe0
	9yK4oK+/svtR6NIiOuGzcoEml5qw
X-Google-Smtp-Source: AJdET5fILOloaXVCH8z/LW1Uh347ozX+NaoRpDI2Sst1oATKQCyxxG8ufJrI8AO3/r/gGXgGMePJLA==
X-Received: by 2002:a63:ce08:: with SMTP id y8mr2571026pgf.388.1542733287423; 
	Tue, 20 Nov 2018 09:01:27 -0800 (PST)
Received: from [192.168.0.33] (97-121-174-158.clsp.qwest.net. [97.121.174.158])
	by smtp.gmail.com with ESMTPSA id
	q35sm31642524pgk.12.2018.11.20.09.01.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 09:01:26 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>, fabien.lahoudere@collabora.com
References: <1542730446-30253-1-git-send-email-fabien.lahoudere@collabora.com>
	<CA+chaQfN9Y+0TwfdcUc0mCzibX-U94SS9gR4NKGvF-FpCR5ekg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <45f1378d-c17c-58ab-68bb-0b030e9cd8b1@gmail.com>
Date: Tue, 20 Nov 2018 10:01:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfN9Y+0TwfdcUc0mCzibX-U94SS9gR4NKGvF-FpCR5ekg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] evince: Drop x11 requirement
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
X-List-Received-Date: Tue, 20 Nov 2018 17:01:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 11/20/18 8:36 AM, Martin Jansa wrote:
> This was already removed once in:
>
> commit 33c822a7c11df08f35dda18a44aae730f93c6130
> Author: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> Date:   Wed Sep 6 18:53:07 2017 +0200
>
>     evince: Remove X dependency
>
>     gnome-desktop is the only X dependency for evince.
>     In order to build evince for Wayland based system without X support=
,
>     gnome-desktop is added to DEPENDS only if x11 exists in DISTRO_FEAT=
URES.
>     So x11 is dropped from REQUIRED_DISTRO_FEATURES.
>
>     Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> and then returned here:
> commit 62376d673aa86b5f8ffb26c8a74046ee87ef4f66
> Author: Armin Kuster <akuster808@gmail.com>
> Date:   Wed Mar 7 08:08:57 2018 -0800
>
>     evince: only include when x11 in DISTRO_FEATURES
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> What's going on? But if everybody agrees on removing it, then you shoul=
d
> remove the distro_features_check inherit as well.

Please run the yocto-check-layer.=C2=A0 Maybe another solution needs to
submitted to get this to pass.

- armin
>
> On Tue, Nov 20, 2018 at 5:24 PM Fabien Lahoudere <
> fabien.lahoudere@collabora.com> wrote:
>
>> evince works fine in a wayland only distribution.
>> x11 requirement is not needed.
>>
>> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
>> ---
>>  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
>> b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
>> index 8bf8a04..01f581a 100644
>> --- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
>> +++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
>> @@ -6,8 +6,6 @@ DEPENDS =3D "gtk+3 libsecret
>> ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-d
>>
>>  inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspectio=
n
>> distro_features_check systemd
>>
>> -REQUIRED_DISTRO_FEATURES =3D "x11"
>> -
>>  SRC_URI =3D
>> "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}=
=2Etar.${GNOME_COMPRESS_TYPE};name=3Darchive
>> \
>>             file://0001-help-remove-YELP-macro.patch \
>>             file://0001-Add-format-attribute-to-_synctex_malloc.patch =
\
>> --
>> 1.8.3.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>



