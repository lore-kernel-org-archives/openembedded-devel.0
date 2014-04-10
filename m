Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id E68AE65D43
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 11:22:15 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so2894996eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 04:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kelFxVgUhckSRkeTUBXyOEf/LWP7Ergr3AUE0qF3S7w=;
	b=FBWJaOtGRvob0xMtJUBIxy7XS0QHJZHy1hz6HniZ0M7XxihFEkVDYz6rIBo+zDdC5y
	LZI4O5GSV6k1EpomLp1rwwrwJ0/3Z9pXu2TRxhJgEuOYlc58mNeXIbKhlRPWpnzlsoXQ
	qRoeiv74wqr30QrP11B3c9p36IMSViPkJ4/U7RGPLSANHO9s+zpf0GjQ4LAFlYOI7QnU
	MHPcTlJghzTSQAwYLz1a0GLsC+GbWuUkJn7mTBeqsgxchnUY7ML7JVHgYSRdECECOL8O
	e7kSvr8gpZRpoxfAUZN9U7TJw0LCc4qa8ScxAxn54i+FLf7rUVwvgY4+RPoTpOGju4CW
	V86Q==
X-Received: by 10.15.64.132 with SMTP id o4mr20234951eex.14.1397128935700;
	Thu, 10 Apr 2014 04:22:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h47sm9232288eey.13.2014.04.10.04.22.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 04:22:14 -0700 (PDT)
Date: Thu, 10 Apr 2014 13:22:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140410112222.GR2132@jama>
References: <1397124314-37150-1-git-send-email-krzysztof.m.sywula@intel.com>
	<534670FC.5000901@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <534670FC.5000901@communistcode.co.uk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] dejagnu: recipe taken from openembedded
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
X-List-Received-Date: Thu, 10 Apr 2014 11:22:19 -0000
X-Groupsio-MsgNum: 49164
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H88uUF932U8Oj0a6"
Content-Disposition: inline

--H88uUF932U8Oj0a6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 11:22:52AM +0100, Jack Mitchell wrote:
> On 10/04/14 11:05, krzysztof.m.sywula@intel.com wrote:
> > From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> >=20
> > Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> > ---
> >  meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb |  3 +++
> >  meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb        | 12 ++++++++=
++++
> >  2 files changed, 15 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4=
=2E4.bb
> >  create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> >=20
> > diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb b=
/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
> > new file mode 100644
> > index 0000000..23cc10e
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
> > @@ -0,0 +1,3 @@
> > +require dejagnu_${PV}.bb
> > +S =3D "${WORKDIR}/dejagnu-${PV}"
> > +inherit native

dejagnu-native_1.4.4.bb should be converted to use BBCLASSEXTEND.

> > diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb b/meta-o=
e/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> > new file mode 100644
> > index 0000000..b202ae4
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> > @@ -0,0 +1,12 @@
> > +DESCRIPTION =3D "GNU unit testing framework, written in Expect and Tcl"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd899=
1e50b"
> > +SECTION =3D "devel"
> > +PR =3D "r1"
>=20
> You don't need the PR any more.
>=20
> > +
> > +inherit autotools
> > +
> > +SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
>=20
> ${BP} can be used instead of ${BPN}-${PV}

>=20
> > +
> > +SRC_URI[md5sum] =3D "053f18fd5d00873de365413cab17a666"
> > +SRC_URI[sha256sum] =3D "d0fbedef20fb0843318d60551023631176b27ceb1e11de=
7468a971770d0e048d"
> >=20
>=20
>=20
> --=20
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   Cambridgeshire, UK
>   http://www.embed.me.uk
> --=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H88uUF932U8Oj0a6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNGfu4ACgkQN1Ujt2V2gBxCOwCfY/Md9UAPhNQ9BhRkrI4ZAtfj
vJ4Anj7vxx0g5mnUtCy9ncAxFngZZWQU
=Zsj6
-----END PGP SIGNATURE-----

--H88uUF932U8Oj0a6--
