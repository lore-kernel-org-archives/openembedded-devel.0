Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id C0DA97756F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 18:27:56 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id g202so53869429pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 11:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=N7hx8TtChyc7iEM0Sbgodat5jZNgnOlnq/5f+PghA0o=;
	b=STLzR4s/Lt4uMqm4rcXvQUkCh+YxrVma7Lmq86D5fZDcRPJRtwvi5c2yjg+k6jHbWq
	z6O10nBsBpjVkp9nJu3ZECt/rVrTCva8K+cjd6HNAyN6U60OAWD8CjLCKJAEPL7ac5bA
	KFM9rBNhjxbs/22+8f1juQCiJDE1Et3m44lSsYRl3RkcN4ekpZHqhBjy8vITUJYVJXog
	a/jm7WL7J+fnzKhWCtBEpGi42S+ts0qigGV/X/Pw0N3+cdBU9W472r+eQPw+QOi4GR0v
	5bcWIJECiEaQhl00MKobaqlLekWHB8yF08b7rBMlbNRcWNAsUiDbzvxPFv02QJhIovqR
	/lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=N7hx8TtChyc7iEM0Sbgodat5jZNgnOlnq/5f+PghA0o=;
	b=a1cWydg140UYd/c2IRDYWkrFi/+b4UFTfXZeOv3YGjdqH9eFKycoHpQsdNrREbRyCb
	ezcbYtU7KxeC005NlKDhc1L97iQb3J5sBhCKsjeEPcqTk3KjH7LNXJiHSFNHV6iuzrEl
	1F/DjOp4FbCRQO7A9GxopaRgPtl46NpkvXNnvLLNYEaq4G/rRDSZAXzEXKyoTB4L+1Za
	NKej7iWIDC7IMwPaSaAvlVKfQExwBYv0remTBE2Lh/i+I0TwlTdtU/llwLhF5zSHpzBl
	0Px0F2HU2SrLXY/ZcKU73+b0076GiLdrcp9nCzUp4RDBf+BnOiTS7OPowQbIDCwHL1sM
	pOoA==
X-Gm-Message-State: AE9vXwNhfZkFUVotPXVa7J89+abhmRPTXNdcSZQu60VnOrjkOT1HDQ2sCKFJZaOMFiS5UA==
X-Received: by 10.98.130.137 with SMTP id w131mr74596288pfd.5.1473186476962;
	Tue, 06 Sep 2016 11:27:56 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:99d4:c55f:fbd3:66fa?
	([2601:647:4c00:3edf:99d4:c55f:fbd3:66fa])
	by smtp.gmail.com with ESMTPSA id 7sm42737785pfk.6.2016.09.06.11.27.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Sep 2016 11:27:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1473066311.17211.5.camel@andred.net>
Date: Tue, 6 Sep 2016 11:27:58 -0700
Message-Id: <BB47DDEC-1144-4A97-9338-38A89C4D3D94@gmail.com>
References: <1473066311.17211.5.camel@andred.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: persistent storage & RO rootfs
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
X-List-Received-Date: Tue, 06 Sep 2016 18:27:56 -0000
X-Groupsio-MsgNum: 62984
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FCF281E0-8ACC-48CA-AE9E-3B4195E4EF9D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FCF281E0-8ACC-48CA-AE9E-3B4195E4EF9D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 5, 2016, at 2:05 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
>=20
> Hi,
>=20
> I want to use a read-only rootfs, but some packages will need =
persistent
> storage, which typically involves /var/lib/<package>
>=20
> Two solutions come to mind:
> - bbappend each involved recipe and set the --localstatedir =
./configure
>   option as needed
> - symlink /var/lib/<package> to my persistent storage dir as needed
>=20
> Anything else? What is typically done in such a case?

you could also use VOLATILE_BINDS

>=20
>=20
> Cheers,
> Andre'
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_FCF281E0-8ACC-48CA-AE9E-3B4195E4EF9D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfPCq4ACgkQuwUzVZGdMxRotQCeNOZdllgWkM6WGaWeMC1QcMgv
WIAAn1DFHlC10cWWhHa83CfnT/+ji/S8
=hBOg
-----END PGP SIGNATURE-----

--Apple-Mail=_FCF281E0-8ACC-48CA-AE9E-3B4195E4EF9D--
