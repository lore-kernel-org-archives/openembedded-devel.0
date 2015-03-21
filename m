Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 07A8A60034;
	Sat, 21 Mar 2015 15:30:11 +0000 (UTC)
Received: by wegp1 with SMTP id p1so103750932weg.1;
	Sat, 21 Mar 2015 08:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=cIzcUmEVsc4FfVZmEXTqwhMfSadU2blcIyafkpSE4jk=;
	b=EqWrOb/yme4ypuVxK7CUmhuRvJegaF+P4HjCNKF+9hkshrk2uXV6hR7X/7jM96rjyu
	bwevhq6idtUjpNFFNHAInIaY1yxaIpqJR9JJ+bEXd86lgBmAlOOVJ2caXavUBoYDr59J
	uTupANgaKFVskTT5s/5VMoOKozJhdQSfBAwWyO2VDP664KiGLaLxSwaUkgQGDjeQjNH0
	mY+liQzMu3zW8pR6QY2T137nCUG1BI6vpG5S2hzP7afSnRbKWGYEKQWrYn8WzGJ1nE8I
	S97NhVG3RXJy4YRrcM1CVYLhdElbNSD38peI/+pMdjLcgmfsbgBX2PpMsEv9NJJEzKR5
	ezcw==
X-Received: by 10.194.57.206 with SMTP id k14mr172936318wjq.1.1426951812485;
	Sat, 21 Mar 2015 08:30:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nb4sm11037866wjc.20.2015.03.21.08.30.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Mar 2015 08:30:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Mar 2015 16:30:22 +0100
To: openembedded-devel@lists.openembedded.org, KhemRaj <raj.khem@gmail.com>
Message-ID: <20150321153022.GI4738@jama>
MIME-Version: 1.0
In-Reply-To: <20150303074258.52BFE50424@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : lirc: Add recipe for 0.9.2
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
X-List-Received-Date: Sat, 21 Mar 2015 15:30:13 -0000
X-Groupsio-MsgNum: 54836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="boAH8PqvUi1v1f55"
Content-Disposition: inline

--boAH8PqvUi1v1f55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2015 at 07:42:58AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: d68ffc6ef01a138c04c935a8599e5679ae56a917
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dd68ffc6ef01a138c04c935a8599e5679ae56a917
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sun Mar  1 22:25:08 2015 +0000
>=20
> lirc: Add recipe for 0.9.2
>=20
> There is a older version available at meta-guacamayo
> but its not distro specific and many distros might need it
> so meta-oe is right place for it.
>=20
> Change-Id: Ic6b45dd652187d72a1e1bf4fb5adc8ed9c80e52a
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Please fix following undeterministic dependencies:
lirc-0.9.2: lirc rdepends on libx11, but it isn't a build dependency? [buil=
d-deps]
lirc-0.9.2: lirc-plugins rdepends on libjack, but it isn't a build dependen=
cy? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on libusb-compat, but it isn't a build de=
pendency? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on portaudio-v19, but it isn't a build de=
pendency? [build-deps]


>=20
> ---
>=20
>  meta-oe/recipes-connectivity/lirc/lirc.inc         |  14 +
>  .../recipes-connectivity/lirc/lirc/lirc.tmpfiles   |   1 +
>  .../lirc/lirc/lirc_options.conf                    |  24 ++
>  meta-oe/recipes-connectivity/lirc/lirc/lircd.conf  | 315 +++++++++++++++=
++++++
>  meta-oe/recipes-connectivity/lirc/lirc/lircd.init  |  40 +++
>  .../recipes-connectivity/lirc/lirc/lircd.service   |  20 ++
>  .../recipes-connectivity/lirc/lirc/lircexec.init   |  37 +++
>  meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb    |  66 +++++
>  8 files changed, 517 insertions(+)
>=20
> Diff:   http://git.openembedded.org/?p=3Dmeta-openembedded.git/?a=3Dcommi=
tdiff;h=3Dd68ffc6ef01a138c04c935a8599e5679ae56a917
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--boAH8PqvUi1v1f55
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUNjo4ACgkQN1Ujt2V2gBxa+QCfYEPA6dqxMkiV4MXAl7RT5vjt
a5wAoLYCIT9AenIx+pD7cKVZHeNY8X0H
=EZoM
-----END PGP SIGNATURE-----

--boAH8PqvUi1v1f55--
