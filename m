Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0966D815
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 21:44:38 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so5210580eaj.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 13:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lXZxqZ74ceY+oTkJIXb8UOdedxwwefv4PMJoVmIGqtE=;
	b=kH6gtLerIEDmcLKwIiyu/24MTeUiEDWS65oFk7yXd5GIPVdN1Wm2dhWSoB4ebk6WOY
	2wgbdS90pwNiIjuhYcgeqPYYNseEEvYQNlBm822tWvSfo1ueO550AU5aAOw/63htpgSt
	8DPiyP0k60G7dA9122MdpcPUyJLljCB885K79xfThKcyvLmuQ7N/powDSO/ZlCGqZ03k
	t9u/A3aeGaY/V9OPKUFTP4z+Y49pN5dSD6ARPJB1lEXVuXL8iblpD1NrUkqDsPQkq/a6
	oK5gxwLLr3vt2uZFZ0XnKNO6EFsSRgRDd1YnCFC3oX9E0wmZdpWcaJBR4dGle0as8zdr
	5iRw==
X-Received: by 10.15.22.66 with SMTP id e42mr900895eeu.99.1385588676695;
	Wed, 27 Nov 2013 13:44:36 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b41sm74563eef.16.2013.11.27.13.44.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Nov 2013 13:44:35 -0800 (PST)
Date: Wed, 27 Nov 2013 22:44:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131127214440.GR2870@jama>
References: <548EF836-E57E-42CC-8E0A-0D77045DE0AE@gmail.com>
MIME-Version: 1.0
In-Reply-To: <548EF836-E57E-42CC-8E0A-0D77045DE0AE@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: Meta-qt5 sdk
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
X-List-Received-Date: Wed, 27 Nov 2013 21:44:38 -0000
X-Groupsio-MsgNum: 47288
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uNvczuo8OWfsyO2w"
Content-Disposition: inline

--uNvczuo8OWfsyO2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2013 at 09:26:37PM +0100, Simone wrote:
> Hello to all,
> I'm new to this mailing list.
>=20
> I'm writing because i want to ask the actual status of meta-qt5 layer.
> Actuallly, we are able to build qt5 with examples for our fsl based platf=
orm.
> The problem is that, compared to qt4, there is no meta-toolchain-qt5 avai=
lable.
> The problem is how to configure host system (development pc with qtcreato=
r) for cross compiling application and deploy/debugging them to remote ARM =
target.
>=20
> As for qt4, it would be necessary the famous toolchain that contain all l=
ibraries, paths and links for qt5, to cross develop application for arm tar=
get.
>=20
> Is this job planned to do by someone?
> If not, there is an alternative solution (maybe documented) to configure =
qtcreator manually?
>=20
> I think it would be very useful also for a lot of other people.

Yes it would, please check
https://github.com/meta-qt5/meta-qt5/wiki/SDK

and test/review proposed solution.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uNvczuo8OWfsyO2w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKWZ8gACgkQN1Ujt2V2gByBYwCfcuoZr0BpT1S6TZMkGUow112X
/wcAoKRf+oS8Ue6E4/E0c84UfkTr7NAO
=l35X
-----END PGP SIGNATURE-----

--uNvczuo8OWfsyO2w--
