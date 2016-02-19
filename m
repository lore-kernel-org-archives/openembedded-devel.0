Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFA07728A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 18:02:43 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id e127so54911695pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 10:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=S0itfGzBxHug0oxKGuCmYXvA0h3ktvy2g+2owrIRU2A=;
	b=OKnLQ63SESWW7/4n5JYCTvJO9yX0/3td61Erz2aazNkVWDnTozzp3uOStiAsYY/zBq
	fs+OPkLsOxwFy3mSXj1U2FEsVfrrkPnbufJ//mqzN6JvZV7l8Ri+qTFF6JqNx8JzXO4j
	499iZ8M386MEm+L47aBnZAT8efs1SHZHatXlE/j2k0jrn63vk436oYPibOxcpryP2TLI
	u8H6N+9i8peWZ11wUffcBnhdOfDWcDVUVBEVdjID9e7sMNpE93zcXjfhSCXoGFZUrIhj
	quTnnCVyJ86CgCYHGLUutaXdaV2/iB28j2EaMZB8At8Ej9vf6enaGFrdPEeLPdXXBCyE
	RCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=S0itfGzBxHug0oxKGuCmYXvA0h3ktvy2g+2owrIRU2A=;
	b=avmbtmFmN0/77F57Dbft33JMOONdypAp2FayOTh7BCpp2CbV9D0wUokLMSOSIsX2a+
	Qn6iOjb/8f7HMOjTJS0InY/SS3FSVXpfvKetHz1MuX7HC3NXs2wkOUt+l5jJiaUkSmbO
	bhJCTnJ7nzuZhO3S0+vRzNNhYSazqbCn+xnM+0EaHubnUnEtTO+VpZvUBuZhZ0XiszHY
	ifYn+lajmf9w5H3D1sDsfDko4Bw3tzlF8mnRuQh2hqtZEapVF8MLlZBmrYQGUnInfTWx
	CCDEYbgtGyNcDXRC38zX30p7e1/bfhtQyU3E1qbUpC0XRWVtj+RHu4NiB5biu0ZD/XRA
	OC9w==
X-Gm-Message-State: AG10YOQ1IwdOaElocM6tUtgCP2vHFgvdh8zCbmNNvzylpqf8u1Y+1Oacxyn5PssVbyyM9g==
X-Received: by 10.98.32.150 with SMTP id m22mr19801112pfj.27.1455904964431;
	Fri, 19 Feb 2016 10:02:44 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:185a:94e1:7952:6dd4?
	([2601:646:8802:5d5c:185a:94e1:7952:6dd4])
	by smtp.gmail.com with ESMTPSA id
	i23sm19210105pfj.68.2016.02.19.10.02.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Feb 2016 10:02:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKpXkzdSki8exzpbge08Uns1M3rQcc2C1UTPGpuA-WUKOQ@mail.gmail.com>
Date: Fri, 19 Feb 2016 10:02:38 -0800
Message-Id: <D98FF053-0891-406C-9C55-C5BE4A148A22@gmail.com>
References: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
	<6E3439D2-FEE9-4286-88C5-0D7E3E2AF4B2@gmail.com>
	<CAP9ODKpXkzdSki8exzpbge08Uns1M3rQcc2C1UTPGpuA-WUKOQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-python] Python Flask recipes
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
X-List-Received-Date: Fri, 19 Feb 2016 18:02:44 -0000
X-Groupsio-MsgNum: 60048
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BC277CC3-40D7-45A2-AF37-C836EE9A34AC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BC277CC3-40D7-45A2-AF37-C836EE9A34AC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 19, 2016, at 5:32 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> On Fri, Feb 19, 2016 at 1:46 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Feb 18, 2016, at 10:33 AM, Fabio Berton =
<fabio.berton@ossystems.com.br> wrote:
>>> I noticed that a few days ago were added some python-flask recipes.
>>>=20
>>> I've been maintaining a layer with python-flask recipes, hosted here
>>> =
http://code.ossystems.com.br/gitweb?p=3Dmeta-python-flask.git;a=3Dsummary
>>>=20
>>> There are recipes in meta-python-flask that were added to =
meta-python
>>> and I want to simplify maintenance and avoid duplicate recipes.
>>>=20
>>> So, do I send recipes from meta-python-flask to meta-python or we =
move all
>>> python-flask recipes from meta-python to meta-python-flask, using a =
layer
>>> only for Flask web framework?
>>=20
>> Here is a hierarchy one can envision
>>=20
>> 1. Core python runtime support - Oe-core
>> 2. python extended modules and infrastructure - meta-python
>>=20
>> now if you think this framework is quite commonly used and is kind of =
core
>> to python world, its fine to have it in meta-python, if you think its
>> too specific then move the common packages to meta-python
>> and maintain it as a separate layer
>=20
> Agreed but this is a specific framework which is not 'core' to python.
> Do you think we ought to merge those on meta-python or keep them split
> out?


Just review it and common pieces can move to meta-python, so you can
remove unnecessary recipe copies in multiple layers in future. I don=E2=80=
=99t
have a strong opinion on the framework itself. It can probably stay in
its own layer if its not so commonly used.

--Apple-Mail=_BC277CC3-40D7-45A2-AF37-C836EE9A34AC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbHWMIACgkQuwUzVZGdMxSW1ACdF/096UqMjC0ms9HzN5H+zfRM
0rIAn1JJm2jFT/AJ9Ybr1lCvO3a4qHx5
=+YwO
-----END PGP SIGNATURE-----

--Apple-Mail=_BC277CC3-40D7-45A2-AF37-C836EE9A34AC--
