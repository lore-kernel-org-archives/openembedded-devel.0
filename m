Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90CB97D043
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 00:41:28 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b8so16632507edm.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 17:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l9tNiM4SBx7sn0NzuxSVA1a4MpxkUoDDq+etCbAxKYk=;
	b=JlixKyhHS0uc3hq21yrIlWu+ZlWy9eqxl+UNDEtlM4uv7ywM2PMLM73rZ/KNoOnioR
	cgJETDoNWMzPSULggaUZuV6LCtRoZDO6M4EU0fTsyIxmRPnKjuok6AmThu8ZOjcX8KCZ
	yafTDQH8IdBhEu9dUwfX3dMPYM/drT21VqojV5TL5jaozyTSFTNj8JfN6IVgjJA959K5
	h/c/C3AV0Aun6tRv1fpdA3Ol/yFH8sy2nqzkjTrAJxuBLgEeg5w8fo1tcxj3o75lW9R5
	XNYSsVhgM7ldvz2r6fRUzRyGp09hGHAZ/K7r257fbNJtvbXHA9MTjXwG1lahV6aqFBlA
	mCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l9tNiM4SBx7sn0NzuxSVA1a4MpxkUoDDq+etCbAxKYk=;
	b=NgJRJkadej1goHzL+GXoTelFxtu5ZhB06iA1B0UtAB/IeIJ7EjVrBryp2mQZde+OL8
	5fShd59FE9EJySBQW67QjWoqU0wa0GRZEq55/kQxSAU+eUdb6tzuSKpilSLvBQlgjpzt
	aI4otmK5qM5XU3Dr8qYNpgC5GkREwdcQDvrb4Ih3+w7BLc7km0Iq7fM7/Kw5oIGhpvAw
	tytyOQlu2wD8aT6sKnbUMdxEzUNTyaDQyJtV7OXXys0krEjA0PCVK9+fV0svGfnXsZA1
	vrqCfEBKf4vJn4znNRTVo5MNWY9de92O20AP6/a4xIrIeNi6BJh4+IOWMDrqwcCqFhwR
	4BMg==
X-Gm-Message-State: APjAAAWg+6LuUz7kXPuZprdSJmp6MsyfwgTDqtBOru2ZWKBD0W2+P85x
	DjrqfjLmQmZ8xEw8hF67a7yhV9pkMn7eji770DM=
X-Google-Smtp-Source: APXvYqzV8j8NqXpzLyt2hrzlZcqjfcmdF2RjaYkzeVlwcaidbXDAxfaD7obve9EwYQ+gjrAHJ4OlqStutclVvJY6e1M=
X-Received: by 2002:a50:974d:: with SMTP id
	d13mr109338592edb.209.1558744889343; 
	Fri, 24 May 2019 17:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190524233948.20049-1-Martin.Jansa@gmail.com>
	<CAMKF1sr0TFOdj0=mTSQ9ixBup8K_QjsSPBTqd4kL7rS23b+NXw@mail.gmail.com>
In-Reply-To: <CAMKF1sr0TFOdj0=mTSQ9ixBup8K_QjsSPBTqd4kL7rS23b+NXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 25 May 2019 02:41:18 +0200
Message-ID: <CA+chaQdjacqx2W6tLZzPYL7kV9LBo24C19Y+PX5jUHTerfsW0Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libmikmod: fix SRC_URI
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
X-List-Received-Date: Sat, 25 May 2019 00:41:29 -0000
Content-Type: text/plain; charset="UTF-8"

You mean like in:
http://git.openembedded.org/meta-openembedded-contrib/commit/?h=jansa/master&id=5a1a79dcdfbf4f9ba22c93ded2ad2537ece02e23
?

Because that will be sent later when it's better tested and the upgrade
probably won't be backported to warrior/thud.

BTW: All versions except last one in 3.1 and 3.3 series (both from 2017)
were moved to outdated_versions.

Similarly now e.g. mesa 17.* is moved to archive/older-versions/17.x/ and
only 18.* is kept in archive/..

Luckily all these archives are on sources.oe.org, so people using that
won't see the issues.

On Sat, May 25, 2019 at 2:16 AM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Fri, May 24, 2019 at 4:40 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> * it was moved to outdated_versions directory
>>
>
> Why not update to a version which is not outdated
>
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
>> b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
>> index d53dff6a07..bbf58f9540 100644
>> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
>> +++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
>> "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
>>  DEPENDS = "alsa-lib texinfo"
>>
>>  SRC_URI = "\
>> -
>> ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
>> +
>> ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/${BPN}-${PV}.tar.gz
>> \
>>  "
>>  SRC_URI[md5sum] = "9dd9bed30c6f7607a55480234606071b"
>>  SRC_URI[sha256sum] =
>> "3f363e03f7b1db75b9b6602841bbd440ed275a548e53545f980df8155de4d330"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

