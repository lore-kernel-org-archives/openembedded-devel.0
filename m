Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0536F6060E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 12:29:28 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g23so163866654wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 04:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
	:to; bh=w00vhkqEDEjJyLLChrUh7pBegN+I3H5cGFNe9og1rMw=;
	b=Px2YirnLQBB1b7FfzebyIntm0A6EAbOYVQHbIOd0KpZaeLP/Io+Vz9SsHNnlB08/kR
	Mv0973yj9LIgXIoEQ5mCCVvC0UG9wuC8PqK5E492zx3/u6GYf14mOIOI45fHSvYJQLSe
	KUNNJCv8Gd7EUciXorljtMZ1oGmjs+3rahqUl+CwID+NRVpFlV9utGBSIaJzTUGpwCi4
	gXz4UGMoT+sxVJ/5IV8iiAjZUZTDc78yUkztp27OV71dYGgHNKU4eOsQr8U4jNSlkDNX
	sSGipyq1GAbauctzYocYNQ4MjDRggYa2rCocFQuw0jnFc7f55MBlfCQQ0Z1hfoXs9bh+
	5mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=w00vhkqEDEjJyLLChrUh7pBegN+I3H5cGFNe9og1rMw=;
	b=kAkvOpZ2VNGj4rZ/uoXNmv4fd6CqWfsnobeXj6mWNXwdhZfJRQrFcSmdj7zO6WTOrk
	jJDzBHBzLu8zzTgij7XAAzeHB/vgM6l9WmmPSfOoHCKHbvnMxQiNGQrfSgU+2nQEG41+
	JOKOugeNTKXlaRVdffgl02c7vrlIEbKrnb+j4tB9ddZ5ebiHY3VVYXoaI8Ii8vAviqqC
	V60VUyHztNaYzQ8yrCsl1MFGzd9rOsro1NkqxfReI2IMJBq0GBr6EhcTf7pvGVe2EpqP
	UjBgMs2/Rb8LE9njzTUYCM4uHfaDtLqJPytDBgQ7bROFRj6Sx3KpT6eL7ZUIcZ2vn18l
	OakA==
X-Gm-Message-State: ABUngvemKuUVaOCKgrWGxAVuwDgk/mPYCg8VOANeAy122IVHbGSZVKpL2hvX7DoWqLxa+A==
X-Received: by 10.28.127.9 with SMTP id a9mr3721420wmd.95.1479212969599;
	Tue, 15 Nov 2016 04:29:29 -0800 (PST)
Received: from [192.168.10.204] ([62.157.143.22])
	by smtp.gmail.com with ESMTPSA id u18sm3199816wmd.1.2016.11.15.04.29.28
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Nov 2016 04:29:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1611141643001.32623@localhost.localdomain>
Date: Tue, 15 Nov 2016 13:29:27 +0100
Message-Id: <9D035763-8338-45EA-85A0-20F7CD6329DD@gmail.com>
References: <alpine.LFD.2.20.1611141643001.32623@localhost.localdomain>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: curious about "superfluous" meta-cpan recipes
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
X-List-Received-Date: Tue, 15 Nov 2016 12:29:29 -0000
X-Groupsio-MsgNum: 63823
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F9157CDF-1E64-4A62-924E-7A3A793B7AB7";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_F9157CDF-1E64-4A62-924E-7A3A793B7AB7
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Hi Robert,

> Am 14.11.2016 um 22:45 schrieb Robert P. J. Day <rpjday@crashcourse.ca>:
> 
> 
>  to follow up on a point i made earlier, it seems that a number of
> recipes in meta-cpan are, these days, unnecessary as they are
> available in the standard OE or meta-oe layers. i took a quick look
> and found the following examples:
> 
> meta-cpan			OE/meta-oe equivalent		type
> 
> 
> uri-perl			liburi-perl			oe-core
> encode-locale-perl		libencode-locale-perl		meta-perl
> io-socket-ssl-perl		libio-socket-ssl-perl		meta-perl
> compress-raw-bzip2-perl		perl-module-compress-raw-bzip2	MODULE
> compress-raw-zlib-perl		perl-module-compress-raw-zlib	MODULE
> io-compress-perl		perl-module-io-compress-*	MODULE(???)
> dbd-sqlite-perl			libdbd-sqlite-perl		meta-perl
> dbi-perl			libdbi-perl			meta-perl
> capture-tiny-perl		libcapture-tiny-perl		meta-perl
> class-method-modifiers-perl	libclass-method-modifiers-perl	meta-perl
> extutils-config-perl		libextutils-config-perl		meta-perl
> extutils-cppguess-perl		libextutils-cppguess-perl	meta-perl
> extutils-helpers-perl		libextutils-helpers-perl	meta-perl
> extutils-installpaths-perl	libextutils-installpaths-perl	meta-perl
> extutils-parsexs-perl		libextutils-parsexs-perl	meta-perl
> getopt-long-perl		perl-module-getopt-long		MODULE
> mime-types-perl			libmime-types-perl		meta-perl
> 
>  so you can see that a number of meta-cpan recipes appear to be
> effectively available in basic OE. does that make them unnecessary? is
> there any reason to have meta-cpan recipes that basically reproduce
> what is already available? (other than version numbers, of course.)

you're slightly to fast. There is a clear reason for that what you
identified as superfluous: reliability.

Experienced users expected, one can easily add an liburi-perl_%.bbappend
or an uri-perl_%.bbappend containing a PROVIDES+="...".
But noone is enforced to remove such a PROVIDES...

What drives me to package cpan distributions which are already in
meta-oe? The way they're packaged. meta-cpan containes recipes in
a way as they're meant by CPAN authors, not by Debian or oe-contributors.

Best regards
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_F9157CDF-1E64-4A62-924E-7A3A793B7AB7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJYKv+oAAoJEESZlq7c5QqdILcQAKojeZJjoy6NXcy60qWkoqc0
7ePtDx76GIGmWb3KNoEPDHU7MczP1qbPCz8EydfMyoHh8n5oNEJlD1YtgZd3wgEa
CJxvT55Jj+416BmB8Q2Fg9vdkXfTbIL701vQ82Vm5WBdVOk7kL3zj1wd3FLn0A82
XxelJzx5qb90gz62ZO0x4KJ35jUrJlJAJobxwIHyxPzeE09S4ZaQEOuWh88GTYCg
w9zPN9hdg99PCCSHLcDfGuAj2VSb0jWr8Q1ctolTCBo0uU4gHAVBC6cyioI6w/2M
1MkTkgoDjyqx/FINu5pyMFOtNl4s5R9xPFXo1yWnh+7leKv9bhPLpX8iWWqcc62m
BVsjryietKRHLzceMmLud2u7tn3jSvQKZrwl6w6NKdlQjpjoeDFNwfunVYs4GrXh
HQ61A36wp7XwmdLAdquXtaWCbQef/195OfuZGUFvQRM1HBrE71T0Dh59Fo8uHBfd
1t3hRBvhPj4a1fmcj3lnlXeXBGxrU4NiqgcPP3GLFH1Nf8Z6y3BCiQqsVvr8Hz9W
kigrxZxkPk6M3lAA0nj3e2Qe9p7Zy1JUpBKTl3h5di9PSqu8lQPLSiEJqZidyk74
Y/ednmsuqrRz3srWzC1Sv5PWZY6vNayNVTpj2qGDwcnj2SsKJEpqyYlG48Bq9l7x
QAij7QNn44VAdPNK1/tw
=gJN0
-----END PGP SIGNATURE-----

--Apple-Mail=_F9157CDF-1E64-4A62-924E-7A3A793B7AB7--
