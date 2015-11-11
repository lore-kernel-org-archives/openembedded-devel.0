Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id DE351771AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 21:08:29 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so129234153wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gxVdB6JO7kNtOdOLRYlsKbeyn87fjpMIEgxgtDqTaUA=;
	b=YrcmpbiA1SfGg4aG6kZBgrZqsxXAJWzvvhgeZZ0iNpStLlctUbUWk2MTEBGr6U2orz
	N9mWXMhujmmdH9fjDE45KFaEslwLEdPEKILTVAEi7lqYHTTL8PlH0rGDUEBK/yXVxSOF
	RayV13GMQyLmLS9oZIAxB2XPI4wr8fTavCTYHloXPafP+ZLSG8fXp/4yc/6dKOBObAGw
	kJH5dYDJsf0P0OFto8CkyIUB1qlHj4QU8cZNBumKzQ0JfvgMluQp6UrgFIqixOQwKCwU
	r89KCBhQS/oqz3KFElkaQ/m9xCQgpqt9hGUJe8113aQCdzHkPMNYRzC4Jn0/Ga6F30RB
	hYqQ==
X-Received: by 10.194.119.162 with SMTP id kv2mr12161743wjb.62.1447276109262; 
	Wed, 11 Nov 2015 13:08:29 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hk1sm10897731wjb.6.2015.11.11.13.08.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 13:08:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Nov 2015 22:08:39 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151111210839.GC2564@jama>
References: <7F78FF81-F48C-45D0-9F1A-2D719A20CC48@gmail.com>
	<CAMKF1srTimQy2RtDk+=nnA7p+jC80u0eBTd9_v+9_FLfWt0MPA@mail.gmail.com>
	<B3996A75-A243-4E48-9318-C1730ED9141B@gmail.com>
	<CAMKF1sqPitU4ZUXZ--qyefnesyu2SqZQvbRGMCG1RRP+BOmw0w@mail.gmail.com>
	<75C83D4F-AE17-44CC-9523-761A33C7F7D1@gmail.com>
	<CAMKF1soRPp6yxDK+iF_SB0EO=Dvzx9oKDiRgRJqw0WXv2BbbAA@mail.gmail.com>
	<662EEA96-421F-46A1-97F1-F07CE05D08FA@gmail.com>
	<CAMKF1sruZfx4tO+_cwmzrM0XQj39L3mCyXK_WfSOdx8yfWnFvA@mail.gmail.com>
	<6B63E7FC-B65B-450B-871D-182CCAE06796@gmail.com>
	<CAMKF1srbaj5SrkyX_p83GOFbhA4fJrim_qwhmX-hzfs=CKQoOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srbaj5SrkyX_p83GOFbhA4fJrim_qwhmX-hzfs=CKQoOQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Volker =?iso-8859-1?Q?M=F6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 1/3] samba: fix dependencies and QA issues
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
X-List-Received-Date: Wed, 11 Nov 2015 21:08:33 -0000
X-Groupsio-MsgNum: 58525
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline

--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 12:53:22PM -0800, Khem Raj wrote:
> On Wed, Nov 11, 2015 at 12:20 PM, Jens Rehsack <rehsack@gmail.com> wrote:
> >
> >> Am 11.11.2015 um 20:48 schrieb Khem Raj <raj.khem@gmail.com>:
> >>
> >> On Wed, Nov 11, 2015 at 11:22 AM, Jens Rehsack <rehsack@gmail.com> wro=
te:
> >>>
> >>>> Am 11.11.2015 um 20:12 schrieb Khem Raj <raj.khem@gmail.com>:
> >>>>
> >>>> On Wed, Nov 11, 2015 at 10:54 AM, Jens Rehsack <rehsack@gmail.com> w=
rote:
> >>>>> In this special case I intend to say no, because:
> >>>>>
> >>>>> The lsb support is limited to startup only - and the distro features
> >>>>> controlling startup are "sysvinit" and "systemd", respectively.
> >>>>>
> >>>>> Mixing systemd with linuxstdbase in overrides is possible but insta=
lling
> >>>>> two init-script not knowing each other is likely asking for trouble=
=2E Maybe
> >>>>> I'm wrong with that :)
> >>>>
> >>>> and only sysvinit is valid for LSB, if you use systemd then lsb is
> >>>> violated anyway
> >>>> you can encode that logic for completion if you want
> >>>
> >>> Currently I'd like not to complicate things before jethro :)
> >>>
> >>> When you have an example somewhere how it can be sanely done, and it'=
s easily
> >>> adopted - I'm happy to send an update for that. Otherwise I intend to=
 wait
> >>> after release and take the patch as it is to fix remaining issues bef=
ore
> >>> release is done.
> >>
> >> jethro announcement went out yesterday so ..
> >>
> >> https://lists.yoctoproject.org/pipermail/yocto/2015-November/027342.ht=
ml
> >
> > Cool - so it's shipped with a 3 month known bug https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D8127 ... anyway ;)
> >
> > So, do you have an example around how to reasonable add your suggestion=
 to check for lsb override?
> >
>=20
> PACKAGECONFIG_linuxstdbase =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'sysvinit', 'foo', '', d)} "
>=20

You don't want to override default PACKAGECONFIG right?

PACKAGECONFIG_append_linuxstdbase =3D " ${@bb.utils.contains('DISTRO_FEATUR=
ES', 'sysvinit', 'foo', '', d)}"

> on these line ...
>=20
> > Cheers
> > --
> > Jens Rehsack - rehsack@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZDrlYACgkQN1Ujt2V2gBxkfwCdGE1Nec1JV+PhNZxyydflkXzF
4LIAnA06IGJ6KcIome7sCzZD9pkbCPoT
=Kn1P
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
