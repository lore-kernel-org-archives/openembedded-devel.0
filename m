Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 035026F5FB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 01:18:27 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so113091eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Knp3+JyBkicg5Sg7hWUAjyOEP9NDDU7OOYEs7mGY6j4=;
	b=xQPf+rWDTZK9x6lpCD1cWcGGS1P9mGlPCDzsGZdwu/HOmIQ3g1adqfOfytgejcc3SX
	Am71g3JR8IIV54rum4WLZh+VAtRwA7ALHCLzzrfDWb+CYkJvMp/xXMIr8dE4k/gXPcZ/
	RB66ClIM0GMo9ozlF8gqv1DIhueWz8LHLF0IeNoWt+G0Gygk0zTMi2FCh1HSbS0es+iF
	gg9p6yESbJ8bDcIDG2NEMtOL2nVAU85p9Gnm2OZpqBJywtXUsmAYK6xMsEds9PAOhip5
	essVWypRZ8P6fZVVj2HqjEXawenZInX2tWScp8tk6EefIUmdpUbj146tbVIgZCiaKM6m
	A9GA==
X-Received: by 10.14.88.7 with SMTP id z7mr589908eee.90.1394673507821;
	Wed, 12 Mar 2014 18:18:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm2266164eef.14.2014.03.12.18.18.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 18:18:26 -0700 (PDT)
Date: Thu, 13 Mar 2014 02:18:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: David Van Beveren <vbdavid@gmail.com>
Message-ID: <20140313011840.GD3759@jama>
References: <CANn_dptpURu7zPmoDwqFudBZ_hx3xv7jzcqoVv0O+JTVi=3A0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANn_dptpURu7zPmoDwqFudBZ_hx3xv7jzcqoVv0O+JTVi=3A0A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Qt5 recipes question
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
X-List-Received-Date: Thu, 13 Mar 2014 01:18:31 -0000
X-Groupsio-MsgNum: 48633
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline

--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2014 at 05:15:03PM -0700, David Van Beveren wrote:
> Hi Martin,

Hi,

> I noticed you as the maintainer of the Qt5 recipes. I am looking for an

openembedded-devel@lists.openembedded.org is better place to ask
questions like this (with [meta-qt5] in subject) more people are reading
ML and you can get answer faster when I'm not around.

I'll add oe-devel to CC now.

> example or a little guidance. I want to deploy Qt on my embedded box with
> GUI support removed. We have no display hardware available. As you can
> imagine, our embedded target has no GUI.
>=20
> We only care about nitove versions of the toolchain pieces (moc, qmake,
> headers, etc), along with base (less GUI), network and QtScript modules.
>=20
> My embedded target is a powerful multi-core box and I'm preferring to bui=
ld
> my app locally there rather than cross compiling.
>=20
> My baseline is Dylan. Can you tell me what recipes to add and what other
> configurations I might need to make to stop the GUI from building? I have
> the meta-qt5 repo in my config already.
>=20
> Thanks for your help. I think this non-GUI config would be a good example
> or canned recipe as a lot of embedded Qt projects don't have GUI.

With dora and master branches it's easier see PACKAGECONFIGs in qtbase.inc =
and
you can just disable all options you don't need to strip down the qt.

With dylan you need to set couple of QT_* variables and adjust *DEPENDS
accordingly, but the result should be the same.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMhB3AACgkQN1Ujt2V2gByPYwCdHgM0aRtb4iJl4hOTtIY/1YJH
6IgAoJVSWNXYLDAJmf1cViNxZwdg0A2K
=pW9k
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
