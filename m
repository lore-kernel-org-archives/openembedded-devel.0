Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8A76F61479
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 21:27:50 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so3750871eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 14:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MpryLweDGowa8steS7ap5zHR7fEDZPMmKpvCm32r0hk=;
	b=sMASKlC6bOzQ0tJJKWWsMB6v36A1xPhbbDG77DgUTwz398bNtIfUluWpQE/LC5BiQ6
	uvfw0Yisq1jvfU9PH2VMfcyBQAlN4jVxyjp/TnBwPmDqlDc/BNacCvnsw9ROPk7Jvz1v
	8fwmaz0HYCB3iRIrxO1zUg5rvuuoS+d8WD6GeDta9q7L+ticRcFTjm3kf7hIxeTnQY/h
	2BjZwidqM7a3RrpYCY4jzKKmkzCWKm1bgjQqpXgyVu3SVw55cvdvjLk/8UCRIZhV2Kqe
	n1Z5s6DSV1qy8t568vJVU3XsGHilegorScuNfQQeyXP8+oBQWRdpW4XdiWmXvrrNl3d0
	6lCQ==
X-Received: by 10.14.184.3 with SMTP id r3mr14924423eem.49.1379539670931;
	Wed, 18 Sep 2013 14:27:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm6168492eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Sep 2013 14:27:49 -0700 (PDT)
Date: Wed, 18 Sep 2013 23:29:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130918212927.GJ7313@jama>
References: <CALmOhgm8XfD31FZbAARZcpxFwH2arMX7PeNWa1TMhbzmi-pXqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALmOhgm8XfD31FZbAARZcpxFwH2arMX7PeNWa1TMhbzmi-pXqg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: qt5 qmake
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
X-List-Received-Date: Wed, 18 Sep 2013 21:27:51 -0000
X-Groupsio-MsgNum: 46238
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="va4/JQ6j8/8uipEp"
Content-Disposition: inline

--va4/JQ6j8/8uipEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2013 at 04:44:00PM -0400, Trevor Woerner wrote:
> If I want to run the devshell on a qt5 recipe from meta-qt5, I can't
> help notice that if I do:
>=20
>     $ which qmake
>=20
> I get
>=20
>     /usr/bin/qmake
>=20
> The qt5 qmake gets installed (in my case) to:
>=20
>     $TMPDIR/sysroots/x86_64-linux/usr/bin/qt5/

Recipes internally use absolute path to qmake and other tools (through
OE_QMAKE_PATH_QT_BINS variable) but it's true that adding it to PATH
shouldn't cause any troubles.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--va4/JQ6j8/8uipEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI6GzcACgkQN1Ujt2V2gBxCCACgoSPt8AJE0P2e3LJK+LiOP/FL
me8AniQttYBxk5/FWteNIQj8T5n5CAe9
=Yzhi
-----END PGP SIGNATURE-----

--va4/JQ6j8/8uipEp--
