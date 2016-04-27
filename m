Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9CCA47328A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:08:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r12so13620881wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=u+/XWgs5Trzt2lKNYHCCUM8MtFVT8fUYKZdBsKND+w4=;
	b=doOyhrXrgVFfFbe9qZd0ielx6/6nSlF3OF2W4jDnf/SMUbmM4TEuaHjdyPT2+qEQcG
	WL9jNr/6lEFF3xSApqAAcR6HH3OeetGK84rFbVFwbazJCaowFPLSQT1GiTrmW0m2zMhl
	PWt7drEQoNtm1cNIG3WS2VD3wgE/D4ckadwhNnhC495XPMWrwNBnDZEdYgctWXBXsIeq
	j/5o/ZAJxgdKQFteLX8ht+rShyPGWmDw1YEn6CFJqCyNi2LLFeqmOLjpSpr5R7gTCDdz
	s+URhj1DZoEi11hIixltSUXIK17vtOMdVAWmE1aq7TCFXJ0w7kXlpYiVI1b0G3w6l/02
	Iodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=u+/XWgs5Trzt2lKNYHCCUM8MtFVT8fUYKZdBsKND+w4=;
	b=XKdthkInowQ78N/od62KDaYsRD0ujcLpttxJKIc7rnpcE8XlE8PMoQRXX+8vKitDkk
	Eb4v1FUMQsPZEn37oWiZXXQnIjDvC0ojR3PbNiKBrCMIHZs6Qw+bdwZfcpYfHR9iN/Gc
	uD4OY973FsRWLRzilwCAfYoTs1FNaXgxmioKqiOOD04DGaDoJABqjj9GseKfqdTlci5G
	QIZf8IvRg1jcdhRcTpAul8GSamkHTzOULkUjgzPvAE/IP/uDDFRbHxR8vSy7CiKkGJ+y
	4Kw4j+G58UVkGgyhTQjtHrWUczrt/A2uP0ZHh+WPCn7Km0fwsPkSg0blb3z0w9Nx9f/n
	1lKg==
X-Gm-Message-State: AOPr4FVFtiJndb0KKghZM3SjCrSDyCQJ9YM1WFPAz6jx+JWC8Xs/L7SXDxv5t3ntLnE78Q==
X-Received: by 10.194.201.37 with SMTP id jx5mr9306195wjc.60.1461766086068;
	Wed, 27 Apr 2016 07:08:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gr4sm4252983wjd.23.2016.04.27.07.08.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Apr 2016 07:08:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Apr 2016 16:08:35 +0200
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Message-ID: <20160427140835.GA25882@jama>
References: <1461602537-19434-1-git-send-email-bruno.bottazzini@intel.com>
	<20160427075206.GE2559@jama>
	<1461765122.3159.8.camel@bottazzini-ThinkPad-T430>
MIME-Version: 1.0
In-Reply-To: <1461765122.3159.8.camel@bottazzini-ThinkPad-T430>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] libmicrohttpd: update to 0.9.49
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
X-List-Received-Date: Wed, 27 Apr 2016 14:08:09 -0000
X-Groupsio-MsgNum: 61210
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 10:52:02AM -0300, Bottazzini, Bruno wrote:
> Hi Martin,

Hi,

> I haven't received this error when compiling libmicrohttpd in the
> version 0.9.49.
>=20
> Did you get this error?=20

Yes, otherwise I wouldn't be reporting this.

> Best Regards,
>=20
> On Wed, 2016-04-27 at 09:52 +0200, Martin Jansa wrote:
> > On Mon, Apr 25, 2016 at 01:42:17PM -0300, Bruno Bottazzini wrote:
> > > Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
> > > ---
> > >  .../{libmicrohttpd_0.9.34.bb =3D> libmicrohttpd_0.9.49.bb}          =
  | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >  rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.34.b=
b =3D> libmicrohttpd_0.9.49.bb} (82%)
> > >=20
> > > diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.=
34.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
> > > similarity index 82%
> > > rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.3=
4.bb
> > > rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.=
bb
> > > index e3c833b..7b29065 100644
> > > --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> > > +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
> > > @@ -6,10 +6,10 @@ SECTION =3D "net"
> > >  DEPENDS =3D "libgcrypt gnutls file"
> > > =20
> > >  SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.g=
z"
> > > -SRC_URI[md5sum] =3D "2947eee13c2c8affb95023a0cb6fda0c"
> > > -SRC_URI[sha256sum] =3D "29a2bfd4fd2ddf60c756b8c283291a134898e3cc1438=
43be421a040be1b25a88"
> > > +SRC_URI[md5sum] =3D "3209aa2ac6199b874a6325342b86edbc"
> > > +SRC_URI[sha256sum] =3D "9407d8252548ab97ace3276e0032f073820073c0599d=
43baff832902a8dab11c"
> > > =20
> > > -inherit autotools lib_package
> > > +inherit autotools lib_package pkgconfig
> >=20
> > I've reported this in 0.9.48 upgrade:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/1=
06672.html
> >=20
> > libmicrohttpd-0.9.49: libmicrohttpd: configure was passed unrecognised
> > options: --disable-spdy [unknown-configure-option]
> >=20
> > This time I'll make sure to hold this patch until it's resolved.
> >=20
> > >  # disable spdy, because it depends on openssl
> > >  EXTRA_OECONF +=3D "--disable-static --with-gnutls=3D${STAGING_LIBDIR=
}/../ --disable-spdy"
> > > --=20
> > > 2.7.1
> > >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcgx+MACgkQN1Ujt2V2gBx54ACfVliPzhc5b40ZzN5QsGOifqSq
FrUAn1PwgzPFBFotviyXKodHaN/N1NQq
=wjCN
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
