Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 31D1A71D97
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 14:09:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so4461996wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 06:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ZQRCVqjwb2F+RWmkaU2jyRsaq1i2P2Q5J3ZiAtxo4qY=;
	b=MMl67VJ+fmmjgvLCr57rdQ3qRiyUBZN/TPeJkq9Sp7zEzJgk60wJxe/q64ewwyjTaO
	m+pSLlzZtHyjOUQdlFwqhPRXVI00rMJzRWu4cSa/kgjbCYn8xwt2mUHszvxhdPaebVaK
	fnV3iGkOOLQHmt56k5GVDEGmMxR+kGacRt90Jitj84s6JBaKCG2Uvx+YFxf6COzZOMOg
	u7V5153Tklu85PrD76NZPbdulzEGFL9GYJ2p1MPcboe5K+oM94nosWLThEOXT8dGFf/Z
	WRF6zx7KoUCtmA7G3LMhgCY0QwFXp+2eA2Rb6FN/NQXksKS9kAdYGrqcCrjCm98QUlLW
	6bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ZQRCVqjwb2F+RWmkaU2jyRsaq1i2P2Q5J3ZiAtxo4qY=;
	b=sAhxgOua9ylVVirb8Mw7aXYDR4Ywub3o6UVFnzR6Bkrx6mrC5G0IiOLqdkDBXDvCXr
	upvfUDMcLT+8SygX2Ta7HSUWDGOQpHMoRIVH+nqCyFig54gnOzNyEMiIUW4oRumdSZ0l
	MMW8jWtiK1+/1cf32xbzXTzbuQS+T3JLqVZkhIguzA6iPXk3RDS4qliryjG8eAyCyI3C
	cnlcTgZJzqTO3lL2yAp3JnEC2Uq1X6Jqa11RI+NrUxF/yuNywM3Inds9AXbcXIXUuLKN
	RO89yTFnPsguvWxZiJjtngB05IgXOPeGfU/AbEsv06bnRqfz5kpaSWJqNeyKOn1gKMO6
	mpfQ==
X-Gm-Message-State: AIkVDXI8X4J6mLkun5I6XzlGvig9IaGvPF5AMu6M4KHONJHU21onC1/tDEJt6pjNME3+Ji4x9Bu+r7DPZkzWeg==
X-Received: by 10.28.46.74 with SMTP id u71mr7425591wmu.136.1486044545921;
	Thu, 02 Feb 2017 06:09:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.150.194 with HTTP; Thu, 2 Feb 2017 06:09:05 -0800 (PST)
In-Reply-To: <CADNbA1pRhAGixv0xkf1+08f7FvFOdfhYwjeCmZ3B5mgQeHG+3g@mail.gmail.com>
References: <20170202134911.23234-1-andreas.kling@gmail.com>
	<20170202134911.23234-2-andreas.kling@gmail.com>
	<CADNbA1pRhAGixv0xkf1+08f7FvFOdfhYwjeCmZ3B5mgQeHG+3g@mail.gmail.com>
From: Andy <andreas.kling@gmail.com>
Date: Thu, 2 Feb 2017 15:09:05 +0100
Message-ID: <CAE-gg=78meVcZ7Z7YdHS5_LZ5OojpWxyvBTAaMPR052_E2C7CA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH 2/2] m2crypto: depend on typing
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
X-List-Received-Date: Thu, 02 Feb 2017 14:09:06 -0000
Content-Type: text/plain; charset=UTF-8

you are right, this was a dependency during runtime of native, my
build of crda failed with
ERROR: Failed to import the "M2Crypto" module: No module named typing
How should the the RDPENDS look like? Obviously I was to stupid to
write it down correctly.

2017-02-02 15:00 GMT+01:00 Derek Straka <derek@asterius.io>:
> Is this meant to be a build time dependency?  If it were required to build,
> I would have expected to see a build failure.
>
> -Derek
>
> On Thu, Feb 2, 2017 at 8:49 AM, <andreas.kling@gmail.com> wrote:
>
>> From: Andy Kling <andreas.kling@peiker-cee.de>
>>
>>   m2crypto requires typing since 0.24.0-38-g8bbd0ec
>> ---
>>  meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
>> b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
>> index 5a9594f07..ca462229e 100644
>> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
>> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
>> @@ -12,7 +12,7 @@ SRC_URI += "file://0001-setup.py-link-in-
>> sysroot-not-in-host-directories.patch "
>>  PYPI_PACKAGE = "M2Crypto"
>>  inherit pypi setuptools siteinfo
>>
>> -DEPENDS += "openssl swig-native"
>> +DEPENDS += "openssl swig-native python-typing"
>>
>>  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}
>> -I${STAGING_INCDIR}"
>>  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

