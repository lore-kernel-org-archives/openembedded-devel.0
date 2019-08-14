Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id AB02D7CE73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2019 04:42:56 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x15so42087471pgg.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 21:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=cbFDh1FH7qkHZ2tv/OzZ6RsrghDO3ioOD+dSgo+/Vew=;
	b=Nf+jyBgG8cZjjZizHZtiwcGW+huld4c+tjFd8hKShr6j/4qdyOfKv5IxOtAqjRruaM
	5aBx9DsUifaLWdiZvHRhGGHhMJzI1hk9kO7v9m9Ncbps7CtSxugqIUDkMocf+SVXTSwg
	IoiZj4OZD9ywTLssX/xXsFjq8LWW3uSxxY3RV2xmOGOCGvtJWj5z+jwfd4bFBfyVT+s4
	NWWG/jEK4GuwT8eQSDIzAJDpCIpSunFhRtwETEE1SWbymFOHq+FAuCg+v0SeYfRuiIax
	w7s6IqN1dFp8xaZXwceDjANpAYpOJpAaBXZCjVtdoOlLLzFfi06xnB9ifwwLarRyGUPt
	HEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=cbFDh1FH7qkHZ2tv/OzZ6RsrghDO3ioOD+dSgo+/Vew=;
	b=pulilQm9R9sUkLUglVI2medl6jcgG9ERIX5A4fyW3O/ZHcdvve6TZmDeEMZ7aIMWqE
	WYFx/JqTBlRTydZsslsJGZQE0Md3iGbOARWVNc+l8HR5y4Ue5Z1muzxtgiLuwCs4CSPz
	EHRybrs3ANyyt0g/1xi2UpH/J7D2b8WckvhVtIccTJElY/qhIFlrP7PhWbrJZsqJlMtf
	nQGqCBPd75ESYT5kh4qnoimo/MkOjKrvJag+7bQ9dJztwQb7M5x+itBoGRRy8zXHyr15
	57abpmSZg2XMH+j1yAf4AsHMNHYzrxiOVUT3q4T0FP+ZlUcnmqZVeHY1JprQHTQoYHno
	W0jw==
X-Gm-Message-State: APjAAAV5Nn6sZhqoSrw/eJXsKq4tPjABm+QPzkzo9aMmIq3/3+iPFpcK
	iXpGIoPkT6+WoaHt6MaVb6PDPy2ZVBM=
X-Google-Smtp-Source: APXvYqwMGv22Vxw9NGebo+ta1ZQeIQjk+zOpHqFBbcfg83Ce33GTP2FhlRBhR2vB5abchWvlRbBFUA==
X-Received: by 2002:a63:ec48:: with SMTP id r8mr35745034pgj.387.1565757777058; 
	Tue, 13 Aug 2019 21:42:57 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::afc4? ([2601:646:8500:6bc6::afc4])
	by smtp.gmail.com with ESMTPSA id
	v22sm107699164pgk.69.2019.08.13.21.42.56
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 21:42:56 -0700 (PDT)
To: "Slater, Joseph" <joe.slater@windriver.com>, Adrian Bunk <bunk@stusta.de>
References: <20190812192220.238334-1-joe.slater@windriver.com>
	<20190813045003.GA5396@localhost>
	<007BD92917A2324FA403BCF9A464CF84FA87EF1C@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9b6458c3-65a2-6bd5-3475-da9193505838@gmail.com>
Date: Tue, 13 Aug 2019 21:43:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84FA87EF1C@ALA-MBD.corp.ad.wrs.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] php: zlib and zip support
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
X-List-Received-Date: Wed, 14 Aug 2019 04:42:56 -0000
X-Groupsio-MsgNum: 79092
Content-Type: multipart/mixed; boundary="------------5CAF2CAF16FBA3268CE84BD3"
Content-Language: en-US

--------------5CAF2CAF16FBA3268CE84BD3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 8/13/19 10:00 AM, Slater, Joseph wrote:
> That's probably best.  The bundled way won't be supported at some futur=
e date, anyway.      Joe
>=20

I think so too. Would you send a v2 ?

> -----Original Message-----
> From: Adrian Bunk <bunk@stusta.de>=20
> Sent: Monday, August 12, 2019 9:50 PM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 1/1] php: zlib and zip support
>=20
> On Mon, Aug 12, 2019 at 12:22:20PM -0700, Joe Slater wrote:
>> Add back zlib support.  Define zip support but do not enable it.
>> ...
>> +# For zip, select one or none.  oldzip uses a bundled library and is =
deprecated.
>> +#
>> +PACKAGECONFIG[newzip] =3D "--enable-zip --with-libzip=3D${STAGING_EXE=
CPREFIXDIR},,libzip"
>> +PACKAGECONFIG[oldzip] =3D "--enable-zip --without-libzip,"
>> ...
>=20
> Any reason why this can't be PACKAGECONFIG[zip] for the external libzip=
 only without any option for the bundled library?
>=20
> Bundled libraries are usually behind on security fixes, and php is a so=
ftware where this tends to matter.
>=20
> cu
> Adrian
>=20

--------------5CAF2CAF16FBA3268CE84BD3
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------5CAF2CAF16FBA3268CE84BD3--
