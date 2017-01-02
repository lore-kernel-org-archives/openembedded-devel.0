Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f179.google.com (mail-wj0-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id CCF0F60778
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 14:29:08 +0000 (UTC)
Received: by mail-wj0-f179.google.com with SMTP id tq7so188737564wjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 06:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8oEHpVd97PWs1x9cAqqvQXga/f/HRZNLDHIpPFg+m8Y=;
	b=Rvzlb1MXlfzWy1WUx3GRzQypMMKjdbJ1yYxDb+5LpkwIoBzIWZV282yGv5YC4c3SIP
	TlZDhwcVyn0f/8NVbuhBeHcSZytD9ImOebI6c29XPLpPKqZ0B9l8zBizvn4rqjBqp6LG
	av+aE9PuIRmtqD3gtHvlIWmyv2cn5MJbqiy/NBMe61xGiVVhgSN98gVLoE5OOT4r63zS
	h/URMXqSMbjrMyf5PupgdAhLdCT+F6qj6196erbt5RR13+7ur91mll6aC/J0XR80YuH3
	shvkiSZj7c+xAwGM4byDtR2BWLAfGO3TFoiiOp621Y6MzAyeV2vNutYJBvBOfeEMk/bk
	xj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8oEHpVd97PWs1x9cAqqvQXga/f/HRZNLDHIpPFg+m8Y=;
	b=bpomlRjScpMBfP+Usx3gEorH8ykY3ocOkz8KP5xfK0sJcf5o+Cru4NGKFSLHvq5f9/
	hX8Wf+aUs1gEj+85DBnbul2wS7c3mG0Xu6TPl2XHKBdLBL96XTKRTStTl5SmPflAeeWJ
	uBB3dfF+frOfoK0qEntrhRbPlUzQHf4xZWQyf+xtWZybHUd5Vi8MTsNI0T5HIzUMiRVJ
	mhWjyyerhxwzhr2Jl5DkcA8XtrqdDVLz6XMB8ml8QSYVZ7w7D48bq7hhewQhdyCYm+OO
	BkXWpT3nlH3RROLFcNTuuRq6sf+65Ah6cvGLqmJvNfZu8wHVmT/gRjgxCySw+Z5QtYVD
	UT5w==
X-Gm-Message-State: AIkVDXKP2qztsUugAUuGQjOWbbXqhxPzvaDPtfB5lET3HK09FAxMHak+tUtsTQtiT9iIjw==
X-Received: by 10.194.87.230 with SMTP id bb6mr57748083wjb.163.1483367348691; 
	Mon, 02 Jan 2017 06:29:08 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	pd2sm87965179wjb.31.2017.01.02.06.29.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jan 2017 06:29:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Jan 2017 15:29:08 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170102142908.GB3954@jama>
References: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
	<CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
	<CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: apache2_2.4.23.bb fetcher crashes
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
X-List-Received-Date: Mon, 02 Jan 2017 14:29:10 -0000
X-Groupsio-MsgNum: 64597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 02, 2017 at 04:20:37PM +0200, matti kaasinen wrote:
> Olkesandr,
> Actually it was regarding that jquery library that I patched today. That
> really was pretty trivial fix if fix at all =AD- just to make it more for=
mal.
> However, I really do not know if it is just to update Apache version or is
> there something else to do. Pure revision change would be trivial for me,
> too, or actually a new recipe should be made. Other choice would be trying
> to find that older version of Apache and fix source URL accordingly.
> It seems that old version is in archive:
> https://archive.apache.org/dist/httpd/
> I'm fine making the patch to update SRC to point to apache archive.
> However, recipe seems using several patches that I do not care creating f=
or
> the new release now. That should do someone more devoted to apache
> functionality, I suppose.
> -Matti

Or just read last 2 weeks on this ML to find:
https://patchwork.openembedded.org/patch/135494/
and related discussion and just ask for backporting this to krogoth
branch

>=20
>=20
> 2017-01-02 15:46 GMT+02:00 Oleksandr Kravchuk <
> oleksandr.kravchuk@pelagicore.com>:
>=20
> > Matti -
> >
> > As I have previously suggested, you can make a patch and send it to
> > this mailing list. Here is an instruction:
> > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> >
> > Would you like to try to do it yourself or you actually want us to fix =
it?
> >
> > On 2 January 2017 at 14:15, matti kaasinen <matti.kaasinen@gmail.com>
> > wrote:
> > > Hi!
> > >
> > > http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2 has been remove=
d.
> > > Latest/current version on http://www.apache.org/dist/httpd/ page is
> > > httpd-2.4.25.tar.bz2. This crashes fetcher of
> > > meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.23=
=2Ebb
> > > that is Krogoth recipe for apache2.
> > >
> > > Thanks,
> > > Matti
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWGpjsgAKCRA3VSO3ZXaA
HFGAAJ0Vj1yG/azkZMS/rTLpQaivWlECkwCfQ2g53K5RkrjT/XiD1e1xT457C8s=
=mUCr
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
