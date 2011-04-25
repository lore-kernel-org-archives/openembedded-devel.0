Received: from mx02.stofanet.dk ([212.10.10.12])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <sgh@sgh.dk>)
	id 1QEJ5d-0007vp-3o for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 12:32:25 +0200
Received: from 5634f1b4.rev.stofanet.dk ([86.52.241.180] helo=asrock)
	by mx02.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1QEJ3G-0002qf-2G
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 12:29:58 +0200
Received: from phoenix.localnet (unknown [192.168.0.226])
	by asrock (Postfix) with ESMTPS id 2D7958AC67
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 12:29:58 +0200 (CEST)
From: =?utf-8?q?S=C3=B8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 12:29:57 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
References: <1303725452-1908-1-git-send-email-sgh@sgh.dk>
	<ip3h06$kfq$1@dough.gmane.org>
In-Reply-To: <ip3h06$kfq$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201104251229.57261.sgh@sgh.dk>
Subject: Re: [PATCH] wvstreams: Added recipe for wxstreams 4.6.1.
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
X-List-Received-Date: Mon, 25 Apr 2011 10:32:25 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I will edit the recipe a bit. It is just a copy of the 4.6.0 recipe.

Mandag den 25. april 2011 12:04:54 skrev Koen Kooi:
> On 25-04-11 11:57, S=C3=B8ren Holm wrote:
>=20
> > +LICENSE =3D "LGPL"
>=20
> That needs a version number, e.g. LGPLv2.1
>=20
> > +DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
>=20
> There's no < 0.9.8 in the tree anymore
>=20
> > +# dbus detection currently broken in configure.ac; remember to add "db=
us (>=3D 1.2.14)" to DEPENDS  when fixed
>=20
> has it been fixed?
>=20
> > +EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --without-=
dbus"
>=20
> The pam stuff needs to be converted into something like:
>=20
> DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)=
}"
>=20
> ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam',
> '--without-pam', d)}
>=20
> > +
> > +PACKAGES_prepend =3D "libuniconf libuniconf-dbg "
> > +PACKAGES_prepend =3D "uniconfd uniconfd-dbg "
> > +PACKAGES_prepend =3D "libwvstreams-base libwvstreams-base-dbg "
> > +PACKAGES_prepend =3D "libwvstreams-extras libwvstreams-extras-dbg "
>=20
> Change that to a single PACKAGES =3D+
>=20
>=20
> > +do_configure() {
> > +        autoreconf
> > +        oe_runconf
> > +}
>=20
> Why not stock autotools_do_configure?
>=20


