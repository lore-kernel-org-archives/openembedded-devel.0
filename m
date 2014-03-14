Return-Path: <joe@deserted.net>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id E2B6D6E717
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:47:20 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id to1so2450985ieb.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 05:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=GZu9ylEXhfWmtHpXBCRL8BL9YOXwtsBh8r9rJzLARpc=;
	b=FdOJp31HlqdT2bN4DhVAkc2DFEzNuKW40f0BCRFlgkECZV5baPT5mSVeqbTYsyNzQB
	fxaabiVGjweyaffDzCbJFXRZQGEUVQKaUTaHMxb88PaETdlZRHmauFK1/F5e9xhraHQK
	MaPAc/TXOwy84gtp37tx9rp761KWhVcpWdhXqph/OIoSO7WSr1NYd4WPmH+mZqvBgWaZ
	FtAq33Pay1Kvzf/XppfHig4bYwVldG+lmJGwHJl/2HAhWk8y8Z/PoAeITM6PKPikaxi9
	cnJqjzGDan0gSrDImVHyKkf2Vyru1yMIdkcDvme6W0WI8c1VqgsgmgPXLl/EXD3yHtU1
	aaFw==
X-Gm-Message-State: ALoCoQmVzdRx5v/dYfIFriDPpLy9QI5cnAnHt0kCpWoDKzQNW8l6xFyI5h7BqSBgdXY2DsIwgEDP
X-Received: by 10.50.141.199 with SMTP id rq7mr7447412igb.11.1394801241313;
	Fri, 14 Mar 2014 05:47:21 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	v2sm18986036igk.7.2014.03.14.05.47.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 05:47:20 -0700 (PDT)
Date: Fri, 14 Mar 2014 08:47:17 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140314124715.GB3469@deserted.net>
References: <1386874857-8596-1-git-send-email-joe@deserted.net>
	<531F372B.8010907@digi.com> <20140311170540.GA13065@deserted.net>
	<531F4A8C.2060205@digi.com>
MIME-Version: 1.0
In-Reply-To: <531F4A8C.2060205@digi.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH] vsftpd: install volatiles file based on init system
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2014 12:47:23 -0000
X-Groupsio-MsgNum: 48664
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline

--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] vsftpd: install volatiles file based on =
init system] On 14.03.11 (Tue 18:40) Javier Viguera wrote:

> Hi Joe,
>=20
> On 11/03/14 18:05, Joe MacDonald wrote:
> >Sorry, no, not yet.  At the end of the thread I think I had a workable
> >solution but I've not merged the result.  If you have an updated patch
> >that addresses all of the systemd/sysvinit/systemd+sysvinit
> >combinations, I'll be happy to merge it instead of my work.
>=20
> Unfortunately I have never played with *systemd*, so i don't have a patch
> handy.
>=20
> At the moment in my custom BSP layer i have workarounded it creating a
> bbappend with just:
>=20
> INSANE_SKIP_${PN} =3D "installed-vs-shipped"
>=20
> I know this is not the proper fix but at least it allows me to complete t=
he
> build. Otherwise it fails.

Understood.  I'll finish up my version that is intended to address the
other combinations as soon as I can and I'll follow up so you know the
status.

--=20
-Joe MacDonald.
:wq

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMi+lMACgkQwFvcllog0XxLaQCbBwm03Hp3hU3aIqjEfleiDTwq
DqkAoKZKjkBmlNPusljCy6u1DQjoD0IO
=lT1x
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
