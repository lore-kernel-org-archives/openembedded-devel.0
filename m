Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UG4xj-0001No-EF
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Mar 2013 11:00:40 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 10BB9EA040
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2013 10:58:49 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 2532B61ACE; Thu, 14 Mar 2013 10:43:58 +0100 (CET)
Date: Thu, 14 Mar 2013 10:43:58 +0100
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130314094357.GF6272@hermes>
References: <cover.1362831936.git.apelete@seketeli.net>
	<73f5d1d2501d60fb20e3290d758e35aaf6b91e4c.1362831936.git.apelete@seketeli.net>
	<3C660C3C-34A4-4805-B6C0-E49AC8EEED55@gmail.com>
	<20130309195424.GA6272@hermes> <20130313170447.GE3260@jama>
MIME-Version: 1.0
In-Reply-To: <20130313170447.GE3260@jama>
X-Operating-System: Debian GNU/Linux 7.0
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH v2 1/2] gnutls: update SRC_URI
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
X-List-Received-Date: Thu, 14 Mar 2013 10:00:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 13-Mar-13, Martin Jansa a =E9crit:
> On Sat, Mar 09, 2013 at 08:54:24PM +0100, Apelete Seketeli wrote:
> > Le 09-Mar-13, Khem Raj a =E9crit:
> > >=20
> > > On Mar 9, 2013, at 4:38 AM, Apelete Seketeli <apelete@seketeli.net>=
 wrote:
> > >=20
> > > > -SRC_URI =3D "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz=
2;name=3Dgnutls"
> > > > +SRC_URI =3D "ftp://ftp.gnutls.org/gcrypt/gnutls/v2.10/gnutls-${P=
V}.tar.bz2;name=3Dgnutls"
> > >=20
> > > can we use PV instead of 2.10 ? if not then move SRC_URI out of .in=
c into .bb
> >=20
> > PV is actually 2.10.4 here, it can't be used instead of 2.10 it seems=
.
> > I'll move SRC_URI into .bb then.
>=20
> In couple of recipes we're using:
> SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).sp=
lit('.')[1]}"
> SRC_URI =3D "http://download.gnome.org/sources/${PN}/${SHRT_VER}/${PN}-=
${PV}.tar.gz"
>=20
> This could be applied here too.

When I updated this SRC_URI I actually wondered if there was a way to
filter the version in a generic fashion, but couldn't come up with
any. This is it, thanks for the tip. I will fix SRC_URI in .inc then,
instead of moving it into .bb like I did.

Cheers.
--=20
        Apelete


