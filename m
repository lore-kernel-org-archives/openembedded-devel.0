Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1575F60E07
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:45:02 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w62so1647662wes.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OQCfQSdCSCq8qeV8EPF6xf7ygfA1ADJlqPWF1R6Gcz8=;
	b=P7gst4B64d6QAazbAlmfU1wHGPXhIJax7g9uolYa8EsRjqQQvl/0UTwzFyzAgUl7NA
	z6BWfOujnPnJdAvO3y7cq28sKha1FWqRrZxH4sQJWTkvq1XIXv8V82/uwfoaNY6lU3Z8
	C0Jz2f6OikEZWhX3U/7Ad+2hV7/TvLg+LWDGj1KDvNjsU3gwU+StYm8dscsZCMf34zAw
	ZA9nEK3A+cA5QzYcWLn8UuU73AnvT28mI9zG0YP8rk5LaBpPrSoE3eiCzyeynQYLNJTQ
	yTlWx0B1hCFXplHyC7dxOA+quwJYYr8tr9dLzknnSqc85IYG2HUHDA6xoSY/tWCMCCIl
	fAVA==
X-Received: by 10.194.240.34 with SMTP id vx2mr1928617wjc.128.1403689500342;
	Wed, 25 Jun 2014 02:45:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o2sm10421687wia.16.2014.06.25.02.44.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jun 2014 02:44:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jun 2014 11:45:02 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20140625094502.GT2437@jama>
References: <cover.1403596416.git.anders@chargestorm.se>
	<1b5c27f39444bed435c8c050b2fb6def74a5adb8.1403596416.git.anders@chargestorm.se>
	<2430004.5QNcodJTid@peggleto-mobl5.ger.corp.intel.com>
	<20140625092807.GA21830@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20140625092807.GA21830@ad.chargestorm.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver][PATCH 1/1] webmin: drop allarch
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
X-List-Received-Date: Wed, 25 Jun 2014 09:45:09 -0000
X-Groupsio-MsgNum: 50574
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5tINJiUS2/Dn5Rhr"
Content-Disposition: inline

--5tINJiUS2/Dn5Rhr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2014 at 11:28:07AM +0200, Anders Darander wrote:
> * Paul Eggleton <paul.eggleton@linux.intel.com> [140625 09:46]:
>=20
> > On Tuesday 24 June 2014 09:54:12 Anders Darander wrote:
> > > * runtime dependencies are TUNE_PKGARCH causing do_package_write_*
> > >   task to have different signature for MACHINEs with different
> > >   TUNE_PKGARCH
>=20
> > > -inherit allarch perlnative update-rc.d
> > > +inherit perlnative update-rc.d
>=20
> > So apart from me being reticent to make this change at all (for reasons=
 that=20
> > we've discussed before),=20
>=20
> Yes, I'm well aware of those discussions. I was actually thinking about
> CC:ing you on my reply to Martin, after he suggested something like this
> change.
>=20
> > there is another issue - allarch.bbclass does more than just setting
> > PACKAGE_ARCH, it also disables certain other functionality such as
> > debug symbol splitting which is superfluous for these kinds of
> > recipes; in my testing when I originally wrote the webmin recipe this
> > significantly reduced the time required to build the recipe. We can't
> > just drop this inherit without regard to that. (I'm sure the same
> > applies elsewhere, it's just that the size of webmin makes the impact
> > significant.)
>=20
> I'm all for saving time! (And I'm not personally concerned by this
> issue, as I'm currently only using webmin in a build tree for a signle
> machine).

you can probably use allarch and assign
PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
I don't remember how many savings will be disabled by this combination.

For multimachine builds these savings could be worse, because better to
spend a bit more time building everything just once per TUNE_PKGARCH and
don't touch it again (until the signature is changed) than keeping it
allarch, but still building it once per TUNE_PKGARCH (because of different
signature and then unpacking it from sstate *every-single-time* you're
building image for different MACHINE (so even without any change to
webmin recipe).

> Though, to get back to Martin Jansa's issue; if there isn't already an
> enhancment request file to the Yocto bugzilla, maybe it's time to file
> one regarding the possibillity of having an allarch package
> RDEPENDS/RRECOMMNEND a package with an ARCH or MACHINE tune...
=20
There is one already:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5970

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5tINJiUS2/Dn5Rhr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOqmh4ACgkQN1Ujt2V2gBwf2gCfft0DFG8Mgp2SqEJduORODRUA
bfEAn3dH80XKr0IDmzegcxWlsIhIGi6o
=VYUo
-----END PGP SIGNATURE-----

--5tINJiUS2/Dn5Rhr--
