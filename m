Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7B360249
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 18:41:12 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so208139767wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 11:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yhR26BVNMn9f30fIdJ1O+jrMCa49WcBAwqMjZT1OViw=;
	b=n57HSVgq5jMUJtx1UyVqbKcr6LmGY4Ufd0cUwjPgFTv2n1e6r+ECi+iLwG+dQun9qu
	/YqkYz9UTgcan9nVDGslU3VM0UQb65n9//xlDiE1mt4O9IdLTFBenuFFVUm1fD4QuuP3
	CVkFlWcK3T8cwdkedjHHQgJTxNuWYia0y/ZWF+Hs6SopXqxF0HYR6qeBi++a4fwNVfpe
	QfkhhPhEZ5EUaKiHSDBmwf78p4nhJ6i9c8ww1qdI/ErKGRmwJoshDUvnPwbo4NSSV/Ab
	Bk2gG/krgAQhEcEo6f++W+Rkm32ENP96kRdJ74Sm5QYyqcPhggdog02FFn+0hzidNf0z
	yVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yhR26BVNMn9f30fIdJ1O+jrMCa49WcBAwqMjZT1OViw=;
	b=VPQLz378kmkg8CCEeM4l5QUccoGat6q4xbJoWxrajxOSOPyyOD4A6MhaoZmh8zHiFo
	cCqTcjNmiwK56VsnVo5/h5l7hcvO9/CIRbh0qOi74++6Hkro51F6icTz0Hl2Lle3OK9K
	wqOlo5xUKQdshnL9GeMajqVh+DwNswetB/ZiN5W+CWLyckPy+gbF3QabkEU1BL7Bxq+X
	ywQ5s102Z7Pe0AlyE8BfHQM1I2OQK4l6QMn03UePKpjk2gXPFMMNAGQdnCObShiIC+CG
	mjpnhPFoe+cBuOdKdTS7fTMH4VlDchHqU/LS3nrBCmmfriR0AELTX+k/OGs/SEug7wGV
	V4bg==
X-Gm-Message-State: AD7BkJI3r6w0jlIh+H9CgHAPvPy5g7N6yaDqjlA0m5ifz+VsXldOQIhFjySjQI9sOR/Rdg==
X-Received: by 10.28.187.212 with SMTP id l203mr5702029wmf.73.1458758472879;
	Wed, 23 Mar 2016 11:41:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u202sm23558822wmd.24.2016.03.23.11.41.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Mar 2016 11:41:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Mar 2016 19:45:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160323184544.GE2565@jama>
References: <20160309195049.GJ2542@jama> <20160317214927.GK2553@jama>
	<56F2C274.8070105@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56F2C274.8070105@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: akuster@mvista.com
Subject: Re: python-cryptography failing to build since openssl upgrade
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
X-List-Received-Date: Wed, 23 Mar 2016 18:41:17 -0000
X-Groupsio-MsgNum: 60628
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Content-Disposition: inline

--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 09:21:08AM -0700, akuster808 wrote:
>=20
>=20
> On 03/17/2016 02:49 PM, Martin Jansa wrote:
> > On Wed, Mar 09, 2016 at 08:50:49PM +0100, Martin Jansa wrote:
> >> Do we really need to use that version script for openssl?
> >>
> >> Here is another failure:
> >> http://errors.yoctoproject.org/Errors/Details/54984/
> >>
> >> in our local builds we use couple prebuild binaries from 3rdparty, whi=
ch
> >> now aren't compatible with openssl ABI (possibly because of
> >> version-script update:
> >> http://lists.openembedded.org/pipermail/openembedded-core/2016-March/1=
18433.html
> >> )
> >=20
> > Still failing:
> > http://errors.yoctoproject.org/Errors/Details/56595/
>=20
> will look into it today.

Thanks, I've tried to upgrade it to 1.2.3 (patch is on ML), but that also f=
ails, just
with different error:
http://errors.yoctoproject.org/Errors/Details/57058/

>=20
> - armin
> >=20
> >=20
> >=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlby5FcACgkQN1Ujt2V2gByGjQCfVToA+D5DzNO5r7FWB1L6SDAU
HkYAn1s/bcOdA6zOjQkepnx50zmY+WNK
=C6xV
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
