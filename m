Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id E395665D77
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:11:01 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2843660eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wkiInjNIM413l75bk3fYS9Q2tR4DY+EqyO7EuvIYbzE=;
	b=Xj0wZF9S/Uf+8kY5RFerKDekcBrhGrEv4GhEbetpbfe60ADGw0oa578VAwHfWcFiEy
	6O4YKpCvMB7lUAy4CNW63tuQsdcd8gqVSR/6uWr1H5YeLAT5lZbHgTThkHu+LMct3wnG
	vx3NNd0FE8IwcJ9fRoy14nz4Mgo/Zbx4Rq16u/LxyhrUctF9tj21LlYVBr9BNTsoiHry
	jm8qoIUYes4mcXHwQU84QdEcOUzrek3Iws1ZzFRwr2WN69H/M2rbjmAIrke0HWFOdX+S
	VD7Se69EaTMSAm6cxwJExsNDaPdpIiOTccm6Y+uBeeNoYw+iwDQLNMPbFU8sQH5jbcdF
	nCyA==
X-Received: by 10.14.224.6 with SMTP id w6mr37584277eep.60.1397985062710;
	Sun, 20 Apr 2014 02:11:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x46sm92297244een.17.2014.04.20.02.11.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:11:01 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:11:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420091106.GT2486@jama>
References: <1397098475-17901-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397098475-17901-1-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 0/3] Update smartmontools and add some fix
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
X-List-Received-Date: Sun, 20 Apr 2014 09:11:03 -0000
X-Groupsio-MsgNum: 49301
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UsbkURXZxe2ekgES"
Content-Disposition: inline

--UsbkURXZxe2ekgES
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 10:54:32AM +0800, Kai Kang wrote:
> Kai Kang (3):
>   smartmontools: update to 6.2
>   smartmontools: add init script
>   smartmontools: add PACKAGECONFIG and runtime dependency

All 3 merged, thanks

>=20
>  .../smartmontools/files/initd.smartd               | 108 +++++++++++++++=
++++++
>  .../{smartmontools_6.1.bb =3D> smartmontools_6.2.bb} |  36 ++++++-
>  2 files changed, 139 insertions(+), 5 deletions(-)
>  create mode 100755 meta-oe/recipes-extended/smartmontools/files/initd.sm=
artd
>  rename meta-oe/recipes-extended/smartmontools/{smartmontools_6.1.bb =3D>=
 smartmontools_6.2.bb} (19%)
>=20
> --=20
> 1.8.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UsbkURXZxe2ekgES
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTjyoACgkQN1Ujt2V2gByKJwCeKly0xuD9lgZD3tyaKS44gZo8
Q+EAni+H5rWImg0I0Ro3oxyY7QtWovoh
=aQ5c
-----END PGP SIGNATURE-----

--UsbkURXZxe2ekgES--
