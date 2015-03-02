Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 25C277384D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 08:26:20 +0000 (UTC)
Received: by widex7 with SMTP id ex7so12819347wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 00:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nfGEsSl0TaA4CnhrjBCD0CAtMg3l8UNRHt9z6aszTUM=;
	b=N0FhehZerlhjlCqxRejALjiEHbfR9uPLKjN3lpiBdicil5M4Xn8/l7iWGb+aud1uk2
	lgxESfbfuKRn4tXGiOE9ltqDrDao+ySqJYXKG6IjI5q7YPF3CZURzJ4NwdsMlWrkwTwB
	GvqGgx2io3BnH/VTzVQhiN7VidDHul9Ryntys21AeJJv+LPJBkpyF49I+jaF3hHR3/NU
	NsUrwlmSJnGlHel6+Rr3hI013r2mtN6dNkneyVCl7mu9xFq9vV6RxDPdr/dpHUvltJwn
	VUGGu68ttC8Obhc4fRp9zUkJJ+wuCj62juNMDntVoyVELC9VUTAZRRvMtsCKuRH0PT+b
	utMw==
X-Received: by 10.194.58.84 with SMTP id o20mr57121201wjq.75.1425284781335;
	Mon, 02 Mar 2015 00:26:21 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u16sm18188851wjr.5.2015.03.02.00.26.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 00:26:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Mar 2015 09:26:43 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150302082643.GW2309@jama>
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
	<1424512336-47007-4-git-send-email-sven.ebenfeld@gmail.com>
	<20150301061927.GR2309@jama> <54F31AC9.5020308@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54F31AC9.5020308@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 3/7] libgee: Update to Version 0.16.1
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
X-List-Received-Date: Mon, 02 Mar 2015 08:26:22 -0000
X-Groupsio-MsgNum: 54573
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OEa2bCMk+rg6xBXy"
Content-Disposition: inline

--OEa2bCMk+rg6xBXy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2015 at 02:57:29PM +0100, Sven Ebenfeld wrote:
> Am 01.03.2015 um 07:19 schrieb Martin Jansa:
> > On Sat, Feb 21, 2015 at 10:52:11AM +0100, Sven Ebenfeld wrote:
> >> ---
> >>  meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb | 10 ++++++++++
> >>  meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb  | 10 ----------
> >>  2 files changed, 10 insertions(+), 10 deletions(-)
> >>  create mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
> >>  delete mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
> >=20
> > be aware that this change breaks some components, because libgee's
> > pkgconfig file was renamed from gee-1.0 to gee-0.8 in
> > https://github.com/GNOME/libgee/commit/e6fc195b449f1462bd6eea962799b814=
ad2c519b
> >=20
>=20
> You are right, the website of libgee states incompatibility between
> these two versions. But I've only found two recipes in oe-core and
> meta-openembedded, that had libgee as dependency.
>=20
> Vala-Dbus-binding-tool in version 0.4.1 required the newer libgee
> version. The other recipe (sry, I don't remember which one it was)
> compiled well even with the change to the newer version.
>=20
> If there are recipe that can't be switchted to the newer version of
> libgee, I think we should rename the recipes to libgee0.6_0.6.4 and
> libgee0.8_0.16.1.

freesmartphone is heavily using libgee+vala and libfsoframework was
failing in world build.

There is wip branch for libgee 0.8 compatibility, but not enough to fix
the do_compile issue (fixes only configuration).

https://github.com/freesmartphone/cornucopia/tree/wip/gee-0.8

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OEa2bCMk+rg6xBXy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT0HsMACgkQN1Ujt2V2gBxU7gCfTdGIPpQFNH0QMRpDS6zsYg9x
a5gAn0TQiihd+b9WujXjMHw7o5G4zVvx
=INuT
-----END PGP SIGNATURE-----

--OEa2bCMk+rg6xBXy--
