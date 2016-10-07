Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 684BF719B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 16:23:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t25so3083228pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=CEsHHq94t/tLzbakGYe5q1AeRBa6MbnTPV7midRJRYs=;
	b=UHgK/tRNnv73hCXUMW7RiDQRiFgP2w6qKHRWyTE4x2bdiBy7nUk2UkXDLBoq3MCtJp
	PqmKMUk45f/tiO98OtCqxJQxIuJ3ghlAqY8BpAG8A3mhB0gj8FmOT6997iO4IEL0Cx+V
	pc1Hx/elvoCOlhB1DGvQ4/xofQalu+YHWHcA8UO2EfuBnEYEuVwaD798YZCQj1q2vix9
	7N8q138SmUTGM52Yjw/JhLqnXMjuH4Ctf3Gw7d1h5p9tNcbVfOwdmVk3euLXHapGmnb/
	DIMfdaphFXawY0FESv/jWMEcRvJdmp7fBe+McrAMMh4mby9ybCNliP0ZufQ3EVBlcb0Y
	1HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=CEsHHq94t/tLzbakGYe5q1AeRBa6MbnTPV7midRJRYs=;
	b=WVEKGS6w2dqvZVtY6c96jqCGg09GF4a7su0u/YSLXSaHP4RZPBHklrAx+iCF+dRP3f
	Ek4X+btcsnutueieFgDSw3+kI9E+67vRc8v+Ie3tuw0dRWE6DKKJcjLBxObfxuQtKIJc
	7aSyjd5pBSTxDD4H1aFJIFP+dKX0ej1R/QN1zIVss+ayPsNTiHqK6hltCIkH8oxsl3cz
	KmLKQ/I7kRUWKHMVpV1WJgEj1DRBQuA+C//UAApKbs6jGjxdCeaRCQU9TE/Io+OWvdzR
	sB9r5ZNWyACebsjKrnFDskPEzcId3FRZwyoRhtxmqFkMHkrrB6IVB8JjJdvl3PJds1eR
	lo4w==
X-Gm-Message-State: AA6/9Rmbs0Jy7J4YD616yhHUOY+Z2BzqGJAMJa11//dBZ2LXBwGz2G2e/WG1d5xc0oJuEg==
X-Received: by 10.98.184.26 with SMTP id p26mr29534483pfe.68.1475857409437;
	Fri, 07 Oct 2016 09:23:29 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:cd9d:6261:adca:4b85?
	([2601:646:8882:b8c:cd9d:6261:adca:4b85])
	by smtp.gmail.com with ESMTPSA id
	f86sm15118251pfd.83.2016.10.07.09.23.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Oct 2016 09:23:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAqTWWTLjydwr4-yzsrutTOVOSCYziWzx2P43svsq0S27LFPZA@mail.gmail.com>
Date: Fri, 7 Oct 2016 09:23:27 -0700
Message-Id: <CFF7DF6C-0418-4E89-BC99-98A7101F5237@gmail.com>
References: <CAMKF1soNE54yHLS5tm25yZa68d=vitr7ETHjEWbqK10_-etxFw@mail.gmail.com>
	<20161007085121.16502-2-igor.socec@pelagicore.com>
	<7F3E06C7-3B86-4BA4-B157-F06436A518C9@gmail.com>
	<CAAqTWWTLjydwr4-yzsrutTOVOSCYziWzx2P43svsq0S27LFPZA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH] jansson: update to 2.9
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
X-List-Received-Date: Fri, 07 Oct 2016 16:23:28 -0000
X-Groupsio-MsgNum: 63419
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DBBB98BD-AF01-45F0-92DC-C6EF9A62F359";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DBBB98BD-AF01-45F0-92DC-C6EF9A62F359
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 7, 2016, at 8:50 AM, Igor Socec <igor.socec@pelagicore.com> =
wrote:
>=20
> On Fri, Oct 7, 2016 at 5:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> what changed in license?
>>=20
>=20
> The copyright date changed from 2012 to 2016, see below:
>=20
> 2.4: =
https://github.com/akheron/jansson/blob/3279aacdeed2aac96741c02e2ddecbb5ae=
087ff8/LICENSE
>=20
> 2.9: https://github.com/akheron/jansson/blob/master/LICENSE

add this info to commit msg and send a v2

>=20
> Cheers,
> --
> Igor Socec
> Software Engineer
>=20
> PELAGICORE | Experience Change
> Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
> Mobile: +46 (0)76 8666477
> E-Mail: igor.socec@pelagicore.com
>=20
> Registered Office Gothenburg Sweden
> Registration No. 556780-4199
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_DBBB98BD-AF01-45F0-92DC-C6EF9A62F359
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlf3y/8ACgkQuwUzVZGdMxSasACdGLs2DbTrsp3NBq15z70Tc+Ov
BIMAn2urNBr97o/OAH2HRJyCbeHm3Tut
=i85F
-----END PGP SIGNATURE-----

--Apple-Mail=_DBBB98BD-AF01-45F0-92DC-C6EF9A62F359--
