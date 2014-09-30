Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 86AEC6B8F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 02:12:58 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id d1so2345637wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 19:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RV51nbjoAVpDowJZF6Y4iRkxcz/wPd58jUItUJCxAn4=;
	b=Q6fgupmI3dgnWUYbFwNxEQ3eTCBED/JaTGyFRoW5AYLvqQXShxWQ0Ovpc5Q21zXDaL
	w305nX6AaKhg/0M3yws7fLdRqkhTkzUs7hW3Cc3km0KW++jw47NloA/5bQjicO9nyj3c
	DDhQkZvTfB2OgDJivtb1yKRvTNSsaSBvFNEZen667F5qX9fzTKtlgy8ErBpWdLeJSy1Q
	d41TEZBf3/ruEiisp+6hlY9SCHrt4KkIox3NiqksPoJdFvk0gUsdyHRp5GEUAdEj17FS
	QBXBBGMt2EjVBgVESMU0WJejj/0rJgCGfW2cp/GwPuWNfSAYsJkWvrRN7VR1ZeHLjrho
	YCAA==
X-Received: by 10.194.103.41 with SMTP id ft9mr49573218wjb.93.1412043179449;
	Mon, 29 Sep 2014 19:12:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q3sm13474282wia.14.2014.09.29.19.12.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 19:12:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Sep 2014 04:13:51 +0200
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20140930021351.GX25706@jama>
References: <1411985350-20322-1-git-send-email-jackie.huang@windriver.com>
	<20140930003037.GW25706@jama>
	<1B858668EC6A94408DCA5225FDFA85AABD50F355@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABD50F355@ALA-MBB.corp.ad.wrs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openldap: update version to 2.4.39
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
X-List-Received-Date: Tue, 30 Sep 2014 02:13:06 -0000
X-Groupsio-MsgNum: 52286
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tpZe61tYkA9f+p/0"
Content-Disposition: inline

--tpZe61tYkA9f+p/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 02:07:06AM +0000, Huang, Jie (Jackie) wrote:
>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openemb=
edded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> > Sent: Tuesday, September 30, 2014 8:31 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to 2.4.39
> >=20
> > On Mon, Sep 29, 2014 at 06:09:10AM -0400, jackie.huang@windriver.com wr=
ote:
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > >
> > > Changed:
> > >  * Move slapd from ${libexecdir} to ${sbin}:
> > >    Installing slapd under ${sbin} is more FHS and LSB compliance
> > >  * Manage init script by inheriting update-rc.d, than postinst
> > >  * Add status for initscript
> > >  * Rename the patch named with commit id to
> > >    gnutls-Avoid-use-of-deprecated-function.patch
> > >  * Add a patch for CVE-2013-4449
> > >  * Add a patch to use /dev/urandom for entropy
> > >  * Allow tls obtains random bits from /dev/urandom:
> > >    The URANDOM_DEVICE is undefined for cross-compiling, define it as
> > >    /dev/urandom to allow tls obtains random bits from /dev/urandom.
> > >  * Add PACKAGECONFIG for mdb, ndb, relay and sock
> > >  * Remove unsupported config for ldbm
> > >  * Add license file
> >=20
> > Can you please resolve:
> > WARNING: QA Issue: openldap: Files/directories were installed but not s=
hipped
> >   /run [installed-vs-shipped]
>=20
> Could you show me how to reproduce this? I don't see this warning (I set =
installed-vs-shipped
> in ERROR_QA in fact, so it should be an error), and I checked that there =
is no /run directory
> generated for openldap.

You can try to configure your builds like world builds are:
http://www.openembedded.org/wiki/Bitbake_World_Status

My guess would be systemd in DISTRO_FEATURES (if you don't have it
already).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tpZe61tYkA9f+p/0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQqEd8ACgkQN1Ujt2V2gBxICwCdE2nT/C0/6wWA4nboobWZtees
nGkAoLki6iFZpZ5vtnlw7U3/IO5Zu0UK
=0vpJ
-----END PGP SIGNATURE-----

--tpZe61tYkA9f+p/0--
