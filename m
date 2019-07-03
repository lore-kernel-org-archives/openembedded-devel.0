Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id B6DB57E85B
	for <Openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 08:09:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n9so1194486wmi.0
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jul 2019 01:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7StvO6pdZVziMwJ73vMIIFaFiDVRQYdrCXqjvlBx5kY=;
	b=SJxmx06g2G6sEiojsey2EEe+RXv51cjR8nAvC5M6vJHp4iedJj3ljJStnm4UOX3jBk
	0lc79XQrUJJQmWiCwtr08UxTxfEjCXkUmGkYgPTXc99Mms7bKKuzt3amBxpO2CY7BWAX
	pE8wwyok9ai1p1GbSmtzQAzE7IC2KsLaIJbvw0vQHUn2Bu1KH22i17HS7EDkzBi+Difc
	MbQjsxK1o7Kn0l9tFrPna3N4NeNoBXx/cvJzwA2xvRl8R7O8HbSyj3xcfOch6XEL80DS
	24tVzDLvyBQzeaIiuf4MBeCRFkRzQfMAOX/MCvLGc2Y6qtyYJQjNqYjwoWtD5DYV74vY
	mYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7StvO6pdZVziMwJ73vMIIFaFiDVRQYdrCXqjvlBx5kY=;
	b=PEXSa57rfC9c7jYCtVqtDYSHwrzrWelDwciqHkVnUyzpkYa5gBy9YlmPZycxkJLrkw
	n9J1kbbN4PkstFoio/JKflu3K4IHZeyE93EBV3hmwmbg0vI/Uu1zzqxpGJglnG98hEQk
	7vILEzOeDdcMC6DH3oQI1i8fa94x8W86ovksx7zBMwxtYk/XXQcscltPi27ycuXnKjXL
	L8GfVV9z7VOmdPz0I+D+v753gssMfbBjQVu72pt/frp4EkodbAGWrDKlTkQym/NLEVZY
	i6Y/smsdf+H1XTXEDqICdhGKwky64uxJuWiQBzPCD2rHpRFqL8D4E30iSbekGFYYix5K
	uqVA==
X-Gm-Message-State: APjAAAXe2yYB7fhVlURruCC92CGPkA66uRQmxvdDZ2ZCA2SS1CDkHimr
	BgOOkNd8UgJD6qq8zRdt0fP4UMh1
X-Google-Smtp-Source: APXvYqwvFaVhoLng9WR4f47rIFqgZcDbZmktBPU3+NdoMSISq87Tiw5sNStlfF6ViBkFx/eJiS5vlQ==
X-Received: by 2002:a1c:a483:: with SMTP id n125mr6681961wme.172.1562141341444;
	Wed, 03 Jul 2019 01:09:01 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id c6sm1477908wma.25.2019.07.03.01.09.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 01:09:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Jul 2019 10:09:01 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190703080901.GD1484@jama>
References: <CAMKF1sr9T0K71M5K4Qh+K-PrFv1dn5L0aNpn2hkN4usLY5hDpg@mail.gmail.com>
	<f69d8e4b-1603-e599-a56e-2b65a0eeb27e@gmail.com>
	<CAMKF1sqWjwdsArsPO1D3Ky3dFa8pkAO092hqdKLsPzbKBJd3JA@mail.gmail.com>
	<d28b367b-ebaa-9fba-6e48-c62438d92bbd@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d28b367b-ebaa-9fba-6e48-c62438d92bbd@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: Delays in patch merges
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
X-List-Received-Date: Wed, 03 Jul 2019 08:09:01 -0000
X-Groupsio-MsgNum: 78384
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Content-Disposition: inline

--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 02:10:23PM -0700, akuster808 wrote:
>=20
>=20
> On 5/27/19 12:02 PM, Khem Raj wrote:
> > Primarily master if we have stable merges I still have one day
>=20
> what is in warrior-next is good to go.

can we get the last batch of 20 commits merged from warrior-next to warrior?

I can try to merge it to see if I still have permissions to do that if you =
approve

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXRxinAAKCRA3VSO3ZXaA
HGZKAJsFU1uWRK0ONL8enH1Kca3v7tt4QACgopTGgJ5/mvW0HnGD2PBDiSIxpC0=
=AwCV
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
