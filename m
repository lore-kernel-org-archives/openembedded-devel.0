Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 97580719BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 19:53:15 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 197so23294173pfu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 12:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=DN6C1ltI8rN1PoDNUGUiIm4U6RlZf/cQ4IzIibo7sBY=;
	b=QblGExtNiM4CW5FeC3ejmOnVGSTzFavpDzXe9tDkugqdFP9PCOMAIlSg1YpR0FqkmW
	tyCzyurpCRgcPBSb0zzoyO0GmjNdrxaSfIrc+GD7yVxsV3jKCBjWoSTAu8WyhFUEIpcm
	/Fb+v6fymUz1OhddlnA9CdH2Syf3E4jVagQ/+/R1pQpxei5Y7wultJzEchxhg6obxWew
	GV9XuewojMc/eMkD1dptvdkRcmP+GcroCM7v11ZHE/DcmJu4lwZv+WZG//zMVtXGVaWU
	oRGjsEk/VXEAFf06xn2x3GomyPcK9bWm2tkJswPlrPgqI2lG47s/QRlA7I9mc3GOeOcK
	moYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=DN6C1ltI8rN1PoDNUGUiIm4U6RlZf/cQ4IzIibo7sBY=;
	b=EVFKwiLtR3Ao4HIfKRh6hr5YrQisKjnv2UZZfy2H3TmLltul4rbqHlEh/uJgT3mUf5
	Nun/vuTKjDo+ZqdFUD4P8wo5OX1yVjMqsoUc/cE7r6QtXR1uegqHviZz20xAo5Q/568d
	wK9f0K5nEHhgQN5B9Man9ggIAZWOMnBGFjKMuzvRdFKvXUF+mdPvmcWrU/yGavhHo+GX
	1cHLvdJkRM+FMBFKqbJpRGjHhhrDAwLL55YekCDiauYyQ6xAPCxvWszCg3b3A3ZAGH6q
	K7FZ0c/Pt9O+Gj42SQ8zoIgsYCHzZDMzdpM/lztWYBESg1BDwhpNuZ+vS1SluFhM0Uer
	1gvg==
X-Gm-Message-State: ABUngvdVAG38tcusJTTOJ+TQg1LgctCFBZxkcjaul/xfzK5D9wTt52RqmVKxUjoRaz6isw==
X-Received: by 10.99.111.2 with SMTP id k2mr14707508pgc.136.1477597996239;
	Thu, 27 Oct 2016 12:53:16 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:98cf:ea9b:f72:6b74?
	([2601:646:8882:b8c:98cf:ea9b:f72:6b74])
	by smtp.gmail.com with ESMTPSA id
	u17sm13661630pfi.1.2016.10.27.12.53.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Oct 2016 12:53:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <63F070ED13CF484B8FBF261782095790B773B606@USSTLZ-PMSG007.emrsn.org>
Date: Thu, 27 Oct 2016 12:53:08 -0700
Message-Id: <43DBDC8E-0A1D-4ADB-829E-DA03C0C76AA8@gmail.com>
References: <63F070ED13CF484B8FBF261782095790B773B3CF@USSTLZ-PMSG007.emrsn.org>
	<63F070ED13CF484B8FBF261782095790B773B606@USSTLZ-PMSG007.emrsn.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: Question for Krogoth mongodb (3.3.0+gitX) recipe
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
X-List-Received-Date: Thu, 27 Oct 2016 19:53:19 -0000
X-Groupsio-MsgNum: 63620
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D509896D-BDB1-4533-862E-46EE4B9647F3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D509896D-BDB1-4533-862E-46EE4B9647F3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 27, 2016, at 11:49 AM, Sam.Lin@Emerson.com wrote:
>=20
> Hi,
>=20
> For Krogoth mongodb 3.3.0+gitX recipe, it only can build "mongod" =
(database process) and "mongos" (sharding controller) components but =
missing "mongo" database shell. Please refer to =
https://github.com/mongodb/mongo/blob/master/README#L9  I am curious =
that will mongodb recipe support "mongo" database shell in future?

it still is the case, we use --js-engine=3Dnone, patches welcome to =
enable mongo which will need some js infra to work.

>=20
> Thanks,
> Sam Lin
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_D509896D-BDB1-4533-862E-46EE4B9647F3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgSWyoACgkQuwUzVZGdMxRKZACfTn3V2VW+cU7nACXht4zwhwHW
cQEAnjcZNdGlvizceVXLl4G5HdE5E2DU
=rRek
-----END PGP SIGNATURE-----

--Apple-Mail=_D509896D-BDB1-4533-862E-46EE4B9647F3--
