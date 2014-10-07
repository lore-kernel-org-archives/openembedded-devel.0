Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id A22C5717B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 15:24:07 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id d1so8322996wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Oct 2014 08:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gC9FAdy47o3xsAMtm4Odgt7WPdQ29gg1yImozvMEZOY=;
	b=nfYhVj6u0ZUjg7nmqJN2qLKXmEaQOul7b4J8QSrsX/A5pXuogQUd+P6M1x8ENGIpmj
	NQGG5Q5eiym/IEIxFiYqCBih6L8i0knk07HJknln90TFFdbYz5TicO0jSCBikT0WuO/9
	y5jWRENUnZcH0qLMzLfGstpk3Z1BvX6h6zICNM2j9eU2MD5Gza8khFuHKYl0eHTWfmPk
	sU/Hv52L3m/PjUGgstNYf5qTZIJAZpEm5qlYs2k40kUEmSBBOR97jypf+ne2FkuV6Cox
	CmHXj4cqlTXmYvRTKO1Rg8nzWC0VvxxgTNezGZEh62EvzmkgRUtX6RgfdM3GMKd3YiJq
	+fuA==
X-Received: by 10.180.20.69 with SMTP id l5mr5388032wie.45.1412695447036;
	Tue, 07 Oct 2014 08:24:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l10sm15101707wif.20.2014.10.07.08.24.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Oct 2014 08:24:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Oct 2014 17:25:08 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20141007152508.GD12322@jama>
References: <CA+chaQdOUkViSuuZF+Fn1hfz+1P7ijgFYGTjgaRGUWTdVLCVZA@mail.gmail.com>
	<1412657597-13020-1-git-send-email-Martin.Jansa@gmail.com>
	<1801470.RIdAKMambK@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1801470.RIdAKMambK@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2] modphp, xdebug: blacklist because of conflict with php
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
X-List-Received-Date: Tue, 07 Oct 2014 15:24:09 -0000
X-Groupsio-MsgNum: 52402
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline

--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2014 at 09:39:34AM +0100, Paul Eggleton wrote:
> On Tuesday 07 October 2014 06:53:17 Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-webserver/recipes-php/modphp/modphp5.inc     | 3 +++
> >  meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb | 1 +
> >  2 files changed, 4 insertions(+)
> >=20
> > diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc
> > b/meta-webserver/recipes-php/modphp/modphp5.inc index 6932429..8707950
> > 100644
> > --- a/meta-webserver/recipes-php/modphp/modphp5.inc
> > +++ b/meta-webserver/recipes-php/modphp/modphp5.inc
> > @@ -14,6 +14,9 @@ S =3D "${WORKDIR}/php-${PV}"
> >=20
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D52dd90569008fee5bcdbb22d945=
b1108"
> >=20
> > +PNBLACKLIST[modphp] =3D "CONFLICT: 466 header files conflict with php"
> > +# e.g. sysroots/qemux86-64/usr/include/php/main/win95nt.h
> > +
>=20
> I'm sorry, but we are not going to blacklist this recipe for everyone. I=
=20
> appreciate that stricter tests mean these can't be built side-by-side, th=
at's=20
> just unfortunate and something we will have to live with for now.

It was motivated by discussion with RP and Ross on #yocto.

23:52:26 < JaMa|Off> RP: would it make sense to change populate-sysroot con=
flicts to use package_qa_handle_error function so it would be fatal QA erro=
r (by default) with option to disable it?
23:53:31 < JaMa|Off> RP: I think part of this problem was that normal bb.wa=
rn messages are less visible than QA messages (which are also collected in =
qa.log) so easy to check after the build
23:55:49 < RP> JaMa|Off: To be honest, I don't want people to turn that on =
off. The issues are too nasty
23:56:42 < RP> s/on/one/
23:56:46 < JaMa|Off> OK, fair enough, I agree it's nasty
23:57:32 < JaMa|Off> it's last 6 failures in world builds (after including =
all my pending fixes), I've sent the list earlier today
23:57:45 < RP> JaMa|Off: if it stops there and then, the issue can usually =
be recovered. If you continue past that you no longer know what in the sysr=
oot is corrupted
23:58:47 < JaMa|Off> the problem is that if I go with PNBLACKLIST (to black=
list one from the conflicting duo) then I'm blacklisting something which al=
one is fine (unless you're building the other=20
                     recipe as well)
23:59:41 < JaMa|Off> e.g. Paul won't be happy if I blacklist modphp, just b=
ecause it conflicts with php and vice-versa
00:20:27 < rburton> JaMa|Off: blacklisting both php and modphp is clearly t=
he answer, and improves the world
00:22:43 < JaMa|Off> should I send patch for oe-core to blacklist xz and lz=
ma as well? :)

You can still disable that PNBLACKLIST in your local.conf or distro.conf.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ0BdQACgkQN1Ujt2V2gBzQogCgqB8MZRa0M0aCsRKtXx408Swj
U9cAoIijdnLt7ew3MyK8E0VpQlPuofYj
=yYQ6
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
