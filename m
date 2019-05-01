Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6797D9AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 15:56:46 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x15so8362451pln.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=+423glXvUdhxRHXdoz0DrdP7YZhd9fLEjEqnXaRWkwU=;
	b=OoPY+PzYepSLKtlWZ1Hibxmm7suoNfpMYYlhbP9lmuPQGeclth0a9OyUYNuqufyZLr
	mh8ZSyYGydeQqq9qX4/BOHYNQP4zIOoY/yQTxfFDca1Cb7UdNZE/UyS6kgOjeGJYt165
	XDKOMGJE8sQksU50Qf5LTtKfRk647oHem9iqYlADBZjqnbzk70kowbGaqcsW1KaVwZh0
	ngWjpf+A4ttZjfSmOSAwlwfU3uwEdvKcHbSF4/W1xWAl0MM+yqzEUdu3G+zw5+8gjCBw
	pAHz9K0HZn3OuGlJFOJydAmBxIN7OkfXkK7p7GznvqdJrQtaN9UH1CjQ4GtuYBHzr7NL
	NyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=+423glXvUdhxRHXdoz0DrdP7YZhd9fLEjEqnXaRWkwU=;
	b=bS0Z46FXS/vhfS9ArLoVX28a7gH6SsQx468oc6NLqSHrihN1zxcc7k3K8ynt6egGah
	mTHL/d1sd1h7uuW/KINTsG/Lk9WwrmUXchHFamfbAJYmyC9b6sQqoIsK6JaYJps5udIG
	s0g4WIr0zXDWsCCO3RgBuFvKgJp8RQE9GtfXEADlsV2HCspBN7c9pjceT+gwxSJTKpDe
	P+DS9R1ahE8/+MpoxTUmWK+QcjkmQyu5S859xStgHS23FajyMqt9oiVAV9YpK6BmhOXJ
	T6DMCbAXmXLKA9YcapSLMZhiuyje7CyQ6JrfJ/F8GTF6bfPtZ8W7B66REQML7HmR+wXk
	QU4w==
X-Gm-Message-State: APjAAAV/ek9VuPLXkLJMTSnvNfms+sRb21ZGrv9ogvSbAqEZIXAR7TYy
	yBZivPqtI0mmjZGdrVXZ2K5IU+UC
X-Google-Smtp-Source: APXvYqxet3IH/aNstQ7kHAIvEhn1nNUXT6tg+AXfiiFTOaxHeQDqaJU94h1AQpIZgxkxSwFKeOOmig==
X-Received: by 2002:a17:902:2cc1:: with SMTP id
	n59mr14951998plb.22.1556726206934; 
	Wed, 01 May 2019 08:56:46 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8977:bf2:211e:20be?
	([2601:202:4180:c33:8977:bf2:211e:20be])
	by smtp.gmail.com with ESMTPSA id
	g32sm5218276pgl.16.2019.05.01.08.56.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 08:56:46 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>, Joshua Watt <jpewhacker@gmail.com>
References: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
	<20190501152748.GY31207@bill-the-cat>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <044a379d-73f2-2f5d-3539-004becfebaa9@gmail.com>
Date: Wed, 1 May 2019 08:56:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501152748.GY31207@bill-the-cat>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Wed, 01 May 2019 15:56:46 -0000
X-Groupsio-MsgNum: 77374
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="kUUQ8zOXG4NcSPJMrHa6ASDWHGTZrlISV"

--kUUQ8zOXG4NcSPJMrHa6ASDWHGTZrlISV
Content-Type: multipart/mixed; boundary="0ObJcAD2C5NuxDcIiSWq28bB3NHE5pqvx";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Tom Rini <trini@konsulko.com>, Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-ID: <044a379d-73f2-2f5d-3539-004becfebaa9@gmail.com>
Subject: Re: [oe] [warrior][PATCH] README: updated Maintainers list for
 Warrior
References: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
 <20190501152748.GY31207@bill-the-cat>
In-Reply-To: <20190501152748.GY31207@bill-the-cat>

--0ObJcAD2C5NuxDcIiSWq28bB3NHE5pqvx
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 5/1/19 8:27 AM, Tom Rini wrote:
> On Wed, May 01, 2019 at 07:52:00AM -0700, Armin Kuster wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  README                      |  2 +-
>>  meta-filesystems/README     | 12 ++++++------
>>  meta-gnome/README           | 10 +++++-----
>>  meta-initramfs/README       |  8 ++++----
>>  meta-multimedia/README      | 10 +++++-----
>>  meta-networking/MAINTAINERS | 32 +++-----------------------------
>>  meta-networking/README      |  6 +++---
>>  meta-oe/README              |  8 ++++----
>>  meta-perl/README            | 10 ++++------
>>  meta-python/README          | 12 +++++-------
>>  meta-webserver/README       |  8 ++++----
>>  meta-xfce/README            | 10 +++++-----
>>  12 files changed, 49 insertions(+), 79 deletions(-)
>>
>> diff --git a/README b/README
>> index 7318f09..881115e 100644
>> --- a/README
>> +++ b/README
>> @@ -1,6 +1,6 @@
>>  Collection of layers for the OE-core universe
>> =20
>> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
>> +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
>> =20
>>  This repository is a collection of layers to suppliment OE-Core
>>  with additional packages, Each layer have designated maintainer
>> diff --git a/meta-filesystems/README b/meta-filesystems/README
>> index 87cb685..d9f07df 100644
>> --- a/meta-filesystems/README
>> +++ b/meta-filesystems/README
>> @@ -10,30 +10,30 @@ Dependencies
>>  This layer depends on:
>> =20
>>    URI: git://git.openembedded.org/bitbake
>> -  branch: master
>> +  branch: 1.40
> I may be starting off on the wrong patch here, but, did 1.40 or
> bitbake.conf ever get patched up such that rm_work doesn't cause
> world-rebuilds every time?  I recall when digging into this before ther=
e
> was a "maybe if we tweak $something it'll be happy again with this olde=
r
> bitbake".  Thanks!

V2 sent.=A0 Thanks for the review.

Thanks,
- armin
>



--0ObJcAD2C5NuxDcIiSWq28bB3NHE5pqvx--

--kUUQ8zOXG4NcSPJMrHa6ASDWHGTZrlISV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJcycG8AAoJEO6LtJn0Vuf5vzsQAIAfWQAruLbpl+i2xlpkyDtT
JyKov5btm6ScWR11d0REPSywa42PiyxkKAhxNlbGwOyGDZ4hUToyJelYOWxzz93y
xzXXG8cc2QhqPVn+CU3yj0cgdC7WoxAwBP3w4ajR8ASkLSA5Ptb53/VaKbcZXTwh
8PWfEXMg2JWgkQ7+prH3SkvRYxULrEC5Y7oHEWOqGc+VIChh/IUwfuutY0mu2HAT
EgMMiq8ZP97bqDRzCFXCAtrBKw0/OJRURBp/UK6CboEBL8IibOAQ05lEQ5K1m0wM
7deCi5BYbDqIJVwlJn9DtTv8czEVksjJmp0v+i9Vjwz4QlM1f4MgX9SYzjDjmMQ+
6DGZ+/z/kSNGRcy3xsUMhzHK+Ipro4kWqDRQWQ+6xYUoLoIsgmwoNXdXEzMOiUsl
7JmJ2wivh9diZpcSwaQjj1sHlGWvFbCN93rm5oOGzyYlYegNEPsobkKHgInJUY43
l2rFTwEMBf7TDdTVwwkKYo4AKBOzXIMXPbsHdlXgniRP1Zck3mzqAatZd4QI2+mG
sO88JI/8GTkzUEYe/eEundrzK0Ac/TBRK/e0INh4aKzGe4Oe2k8zT9+6tFD8Dsna
SeKNr2fW3aS6HbqJoBdUUCQYetnx5Opc9wNW2QIkuqBRMM7ql1buMyHlc78xow3e
qpxjB3TVynxKXKXHn8Ul
=Npbv
-----END PGP SIGNATURE-----

--kUUQ8zOXG4NcSPJMrHa6ASDWHGTZrlISV--
