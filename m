Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SIgml-0001bD-5O
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 15:43:35 +0200
Received: by wgbdr12 with SMTP id dr12so2571435wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pUVAEZvSaprXk1EkcLsOtFAQz2C6pKKKiH1sazlE4l0=;
	b=cn/vlHhSzv/frbXDFUZd1KCzLd7AWkAfkcYWzzplQW/oc5SwDzuCugkX12qnoThFWz
	3LL9raAQrb197P0ttDkVzM2p9qQiGM/JKrQrhbB3DSaCehEaxUnH1naWX2dlkOD8A7en
	D9URgLxMVjT1dRd9Eq7lhhLAHwZoOdf0F53Q/l3ADCRDo2TLeetGkmczb3AffnLgYF6l
	E7sPAhaulgsN8NsobYCodCxiqoN6EnyD9pvipiVUTl/65bovv/rjcS5R+Zkqxp+YKEEe
	Fz9M/3QAJ0exIMWFuq3AHbJHXvtUU44NRtPeB7g+QVnqAeqdJN+htvNJ9BUYokoQgFKi
	Aj8w==
Received: by 10.180.88.169 with SMTP id bh9mr4841887wib.5.1334324053814;
	Fri, 13 Apr 2012 06:34:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm4805055wix.8.2012.04.13.06.34.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 06:34:13 -0700 (PDT)
Date: Fri, 13 Apr 2012 15:34:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120413133413.GG3651@jama.jama.net>
References: <cover.1334322354.git.Martin.Jansa@gmail.com>
	<4F8827C6.2040601@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4F8827C6.2040601@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 0/1] Possible fix for missing -native support for gtk+-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2012 13:43:35 -0000
X-Groupsio-MsgNum: 38247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline

--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2012 at 07:19:02AM -0600, Gary Thomas wrote:
> On 2012-04-13 07:09, Martin Jansa wrote:
> > Please note that this patch is old and not tested with current HEAD,
> > because I'm using different solution in SHR branches - BBCLASSEXTENDs i=
n oe-core
> > recipes instead of small bbappends which makes recipe upgrades harder b=
ecause of
> > inter-layer dependencies, see:
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/01962=
4.html
> > from this patchset
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/01961=
9.html
> >
> > But because fix for PACKAGECONFIG added DEPENDS is now in you can find =
this patch usefull
> > and maybe we'll be allowed to move at least some BBCLASSEXTENDs to oe-c=
ore later - after release.
> >
> > The following changes since commit 118734e096fda6c47172025969f3df4cfb0b=
33c3:
> >
> >    qte-toolchain: add qwte support (2012-04-13 10:50:40 +0200)
> >
> > are available in the git repository at:
> >    git://git.openembedded.org/meta-openembedded-contrib jansa/xorg
> >    http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/=
?h=3Djansa/xorg
> >
> > Martin Jansa (1):
> >    xorg: add more native BBCLASSEXTENDs for gtk+-native
> >
> >   .../xorg-lib/libxcomposite_0.4.3.bbappend          |    1 +
> >   .../xorg-lib/libxcursor_1.1.12.bbappend            |    1 +
> >   .../xorg-lib/libxdamage_1.1.3.bbappend             |    1 +
> >   .../xorg-lib/libxfixes_5.0.bbappend                |    1 +
> >   .../xorg-lib/libxrandr_1.3.2.bbappend              |    1 +
> >   .../xorg-proto/compositeproto_0.4.2.bbappend       |    1 +
> >   .../xorg-proto/damageproto_1.2.1.bbappend          |    1 +
> >   .../xorg-proto/fixesproto_5.0.bbappend             |    1 +
> >   .../xorg-proto/randrproto_1.3.2.bbappend           |    1 +
> >   9 files changed, 9 insertions(+), 0 deletions(-)
> >   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.=
4.3.bbappend
> >   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.1=
2.bbappend
> >   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3=
=2Ebbappend
> >   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb=
append
> >   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.=
bbappend
> >   create mode 100644 meta-oe/recipes-graphics/xorg-proto/compositeproto=
_0.4.2.bbappend
> >   create mode 100644 meta-oe/recipes-graphics/xorg-proto/damageproto_1.=
2.1.bbappend
> >   create mode 100644 meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0=
=2Ebbappend
> >   create mode 100644 meta-oe/recipes-graphics/xorg-proto/randrproto_1.3=
=2E2.bbappend
>=20
> Why can't these changes just go in the main recipes?  Surely adding
>    BBCLASSEXTEND =3D "native"
> to a recipe has no effect unless you need to build the -native version?
>=20
> Note: I too have been carrying such .bbappend files in my own layers for
> a long time.  It would be good to just admit that sometimes the -native
> form is needed and fix the primary recipes.

Read that thread on oe-core ML

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+IK1UACgkQN1Ujt2V2gBypJQCeNXA/aNDvCNZb3oSo98+0ZaDM
LGgAoLTzWporA60rJUHF6Hizj6JZ0jvR
=LUUd
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--
