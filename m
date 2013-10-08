Return-Path: <joe@deserted.net>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4B95A6CBAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 17:18:50 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id bv4so3990145qab.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 10:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=yFn4bn6ZEzsNvf2AzuJ3Z270amvjhVD8G1YmDDZ0E1k=;
	b=JavOKeVlT/gzvRq6q4qbHp2t9pFxy6PARdNb8i1CDoeKnOIDgsIqCGNIrIYbRck9zx
	fR9utBbvaoatOawG61sp3v0lXX5OWXW46fDST1FbKeDbDQ6W89bVc+fe44npdjprbRGI
	TSOtnwm1WcdEiMBWCszLXduDCJQsMfiBSopIuPJ/opy6mrTysPPq8UyRnM9wDMV/OxQe
	+4lkp5QnIA4a4kqEAnlpsHJMf7oQav9Tr7ca05Z3xwtYzDvANQPTjvhTUONnddoBW0/z
	ybmneOmQUd0bjOUvvBm0chLI1dZg6ImPh3e0EDWGZ7JqAAKArO0Fqzs0M4R8efvtqUvR
	G6zA==
X-Gm-Message-State: ALoCoQl8nI/kUlG7vCPG1GhTJt5X4g5WEyWWUa7S1SPP4h5VVnBDbM23jJUzxK3U8R5WOyEr5Cwt
X-Received: by 10.229.79.137 with SMTP id p9mr3825720qck.12.1381252731802;
	Tue, 08 Oct 2013 10:18:51 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id e7sm76039244qag.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 10:18:51 -0700 (PDT)
Date: Tue, 8 Oct 2013 13:18:48 -0400
From: Joe MacDonald <joe@deserted.net>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20131008171847.GB6619@deserted.net>
References: <1381239308-8682-1-git-send-email-joe@deserted.net>
	<52540AA5.8080808@windriver.com>
	<CAOMwXhNLQKhAJMvKT4TYJrKRf5npt7MWK1sMULNpgSsrYyJBEg@mail.gmail.com>
	<CAOMwXhOL7XopAd7dvJ-OLctZiy_uAXa0BA07OHR2573kkYD2sA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhOL7XopAd7dvJ-OLctZiy_uAXa0BA07OHR2573kkYD2sA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] openflow: import and tweak
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
X-List-Received-Date: Tue, 08 Oct 2013 17:18:51 -0000
X-Groupsio-MsgNum: 46560
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Laszlo,

[Re: [meta-networking][PATCH] openflow: import and tweak] On 13.10.08 (Tue =
15:31) Laszlo Papp wrote:

> Just to give an example about one of those critical issues: the recipe fo=
r 1.0
> is even broken, as that should *not* use ./boot.sh.

Okay.  It didn't cause obvious problems for me and it seemed to be
working for the guys using meta-virtualization, but I'm completely
willing to believe it's not the right thing to do here.  If you have an
alternative suggestion or could help me understand the impact, please
let me know.

> On Tue, Oct 8, 2013 at 3:17 PM, Laszlo Papp <lpapp@kde.org> wrote:
>=20
>     In short: please do not get this in if I may ask.
>=20
>     The recipe from meta-virtual is flawed in my opinion and should be dr=
opped,
>     and then rewritten,

I recall you saying that, though I haven't encountered large problems
with it yet.  I'd appreciate any guidance you have to offer, of course,
including a full rewrite.

>     especially since "Bruce" was so concerned about
>     license, reference and copyrights stuff. I would not mix his code int=
o a
>     new layer for those issues.

I'm not terribly concerned about attribution and copyright since he
seems to have agreed with my approach here.

>     By the way, I also mentioned that I would rewrite that. Is there any =
reason
>     why I did not get enough time for that contribution? I mean I have no=
t even
>     been contacted about my status. Why did you not try to avoid the
>     cross-work?

The last time this came around the thread was already pretty long before
I even started with it and the last I'd seen suggested to me that you
weren't interested in having this integrated anymore.  I still thought
there was value in it, so I started from your base and tried to address
the open issues from the thread.  Time-wise, a month has passed for
something it sounded like would be done in a few days.  I took that at
confirmation that you were no longer pursuing this.

Absolutely no slight was intended.

-J.

>=20
>=20
>     On Tue, Oct 8, 2013 at 2:37 PM, Bruce Ashfield <
>     bruce.ashfield@windriver.com> wrote:
>=20
>         On 13-10-08 09:35 AM, Joe MacDonald wrote:
>=20
>             Based on work by David Nystr=F6m (meta-virtualization) and La=
szlo
>             Papp
>             (meta-oe).
>=20
>             =A0 =A0 - Import OpenFlow 1.0 from meta-virtualization and pr=
ovide an
>             updated
>             =A0 =A0 =A0 version of the recipe for the head of tree in the=
 OpenFlow
>             git
>             =A0 =A0 =A0 repository.
>=20
>             =A0 =A0 - Minor tweak in both recipes for do_install_append()=
 spacing.
>=20
>             =A0 =A0 - Update 'libssl' PACKAGECONFIG flag in both to follo=
w the
>             'openssl'
>             =A0 =A0 =A0 convention used elsewhere in meta-oe.
>=20
>             =A0 =A0 - Create common include file for both versioned and g=
it
>             recipes.
>=20
>=20
>         Awesome. I was just wondering about this a few days ago. I'll pus=
h a
>         removal of the meta-virt recipe, once this has merged to
>         meta-networking.
>=20
>         Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>=20
>=20
>=20
>=20
>             Signed-off-by: Joe MacDonald <joe@deserted.net>
>             ---
>             =A0 .../recipes-protocols/openflow/openflow.inc =A0 =A0 =A0 =
=A0| =A0 35
>             ++++++++++++++++++++
>             =A0 .../recipes-protocols/openflow/openflow_1.0.bb =A0 =A0 | =
=A0 =A04 +++
>             =A0 .../recipes-protocols/openflow/openflow_git.bb =A0 =A0 | =
=A0 =A04 +++
>             =A0 3 files changed, 43 insertions(+)
>             =A0 create mode 100644 meta-networking/recipes-protocols/open=
flow/
>             openflow.inc
>             =A0 create mode 100644 meta-networking/recipes-protocols/open=
flow/
>             openflow_1.0.bb
>             =A0 create mode 100644 meta-networking/recipes-protocols/open=
flow/
>             openflow_git.bb
>=20
>             diff --git a/meta-networking/recipes-protocols/openflow/
>             openflow.inc b/meta-networking/recipes-protocols/openflow/
>             openflow.inc
>             new file mode 100644
>             index 0000000..43af54e
>             --- /dev/null
>             +++ b/meta-networking/recipes-protocols/openflow/openflow.inc
>             @@ -0,0 +1,35 @@
>             +SUMMARY =3D "OpenFlow communications protocol"
>             +DESCRIPTION =3D "\
>             +Open standard that enables researchers to run experimental
>             protocols in \
>             +contained networks. =A0OpenFlow is a communications interface
>             between \
>             +control and forwarding planes of a software-defined networki=
ng
>             architecture.\
>             +"
>             +HOMEPAGE =3D "http://www.openflow.org"
>             +
>             +SECTION =3D "networking"
>             +LICENSE =3D "GPLv2"
>             +
>             +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D
>             e870c934e2c3d6ccf085fd7cf0a1e2e2"
>             +
>             +SRC_URI =3D "git://gitosis.stanford.edu/openflow.git;protoco=
l=3Dgit"
>             +
>             +DEPENDS =3D "virtual/libc"
>             +
>             +EXTRA_OECONF +=3D "KARCH=3D${TARGET_ARCH}"
>             +
>             +PACKAGECONFIG ??=3D "openssl"
>             +PACKAGECONFIG[openssl] =3D "--enable-ssl,--disable-ssl, open=
ssl,
>             libssl"
>             +
>             +S =3D "${WORKDIR}/git"
>             +
>             +inherit autotools
>             +
>             +do_configure() {
>             + =A0 =A0./boot.sh
>             + =A0 =A0oe_runconf
>             +}
>             +
>             +do_install_append() {
>             + =A0 =A0# Remove /var/run as it is created on startup
>             + =A0 =A0rm -rf ${D}${localstatedir}/run
>             +}
>             diff --git a/meta-networking/recipes-protocols/openflow/
>             openflow_1.0.bb b/meta-networking/recipes-protocols/openflow/
>             openflow_1.0.bb
>             new file mode 100644
>             index 0000000..a7e254d
>             --- /dev/null
>             +++ b/meta-networking/recipes-protocols/openflow/openflow_1.0=
=2Ebb
>             @@ -0,0 +1,4 @@
>             +include ${BPN}.inc
>             +
>             +SRCREV =3D "5ccca75a69f99791659bcfbcf35353ab1921320a"
>             +PV =3D "1.0"
>             diff --git a/meta-networking/recipes-protocols/openflow/
>             openflow_git.bb b/meta-networking/recipes-protocols/openflow/
>             openflow_git.bb
>             new file mode 100644
>             index 0000000..6403bfb
>             --- /dev/null
>             +++ b/meta-networking/recipes-protocols/openflow/openflow_git=
=2Ebb
>             @@ -0,0 +1,4 @@
>             +include ${BPN}.inc
>             +
>             +SRCREV =3D "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
>             +PV =3D "1.0+git${SRCPV}"
>=20
>=20
>=20
>=20
>=20
>=20
>=20

--=20
-Joe MacDonald.
:wq

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJUPncACgkQwFvcllog0XwVtgCfU4BFoqSH0TXiaVYB5yfAvca0
GS8An1Ie3OkMzDOLtrufIqlpTM2NRfEk
=0DTu
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
