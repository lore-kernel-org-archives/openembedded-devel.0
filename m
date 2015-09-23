Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 05C0B756C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:16:56 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so240704719wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hlH5lMfOuvu6aSuortQNZfyXQuAmgrXrCbv5fhPn+eM=;
	b=aUYmtlkWItET0sK6bbktpJGkv/+XBo9/dcD8EQjSFQ3PuLvxZOfgAskSbXyzM3kPf6
	w2BfNGGv3UyTASiU4/K6BqClq7Jpm9UKtxlkwJNjCRVT8C+TZu57ehXqTeeaCMS3REt7
	7oVGSVrqhQ4F3jwYrYQVilb4DXRu0y9fZ/t715fqy19v49wvFVrtfuRgNI6sJBJXiH42
	+PXIrVX+2PbS8gWyMmqPnW+WpIoiq0WrGclBX5dxKwd8O9DnJvkZqBt7dx/CWLQBPD9c
	7tPxtuuBsI7OsnB3d/zK/8Fd2G8BeJBg6xPXNDR98RliEQNxuQvUqwYQLdvzVHGeg8LU
	pvEg==
X-Received: by 10.180.23.71 with SMTP id k7mr4230316wif.11.1443017816074;
	Wed, 23 Sep 2015 07:16:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xw2sm7519753wjc.12.2015.09.23.07.16.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 07:16:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Sep 2015 16:17:05 +0200
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Message-ID: <20150923141705.GH2384@jama>
References: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/3] libgudev fixes
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
X-List-Received-Date: Wed, 23 Sep 2015 14:16:58 -0000
X-Groupsio-MsgNum: 57520
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline

--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 10:59:32AM +0200, Adrian Freihofer wrote:
> Exclude usage of libgudev with older systemd versions providing libgudev =
as
> well.
> Fix networkmanager and modemmanager to use libgudev instead of udev.

There are more libgudev dependencies according to QA log from last world
build:

gstreamer1.0-plugins-bad-1.4.5: gstreamer1.0-plugins-bad-uvch264 rdepends o=
n libgudev, but it isn't a build dependency? [build-deps]
gstreamer1.0-plugins-good-1.4.5: gstreamer1.0-plugins-good-video4linux2 rde=
pends on libgudev, but it isn't a build dependency? [build-deps]
gst-plugins-good-0.10.31: gst-plugins-good-video4linux2 rdepends on libgude=
v, but it isn't a build dependency? [build-deps]
clutter-gst-3.0-3.0.8: clutter-gst-3.0 rdepends on libgudev, but it isn't a=
 build dependency? [build-deps]
gammu-1.32.0: gammu rdepends on libgudev, but it isn't a build dependency? =
[build-deps]
devicekit-power-014: devicekit-power rdepends on libgudev, but it isn't a b=
uild dependency? [build-deps]
network-manager-applet-1.0.4: network-manager-applet rdepends on libgudev, =
but it isn't a build dependency? [build-deps]
cheese-2.30.1: cheese rdepends on libgudev, but it isn't a build dependency=
? [build-deps]

are you interested in fixing some of these? Maybe some will be fixed transi=
tively from networkmanager

Thanks!

Regards,
>=20
> Adrian Freihofer (3):
>   libgudev: exclude use with systemd <=3D220
>   networkmanager: depend on libgudev not on udev
>   modemmanager: depend on libgudev not on udev
>=20
>  meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb     | 2 =
+-
>  meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb | 2 =
+-
>  meta-oe/recipes-gnome/libgudev/libgudev_230.bb                      | 2 =
++
>  3 files changed, 4 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.4.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYCtGAACgkQN1Ujt2V2gBzNowCgulD3ca7FOhi/50JCo3pHgcP5
23UAnRI05FTQii19eqqSEMf0r21y1LGG
=bH8k
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--
