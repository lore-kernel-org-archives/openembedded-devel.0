Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UBqGR-0001qI-Pu
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 18:30:32 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 4BD4AEA042;
	Sat,  2 Mar 2013 18:32:17 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id C85EB6041F; Sat,  2 Mar 2013 18:13:55 +0100 (CET)
Date: Sat, 2 Mar 2013 18:13:55 +0100
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130302171355.GE5249@hermes>
References: <cover.1362223895.git.apelete@seketeli.net>
	<79357068d009b46c93485c118c12886a394a78f7.1362223895.git.apelete@seketeli.net>
	<20130302131749.GZ3279@jama> <20130302153227.GD5249@hermes>
	<20130302154609.GA3279@jama>
MIME-Version: 1.0
In-Reply-To: <20130302154609.GA3279@jama>
X-Operating-System: Debian GNU/Linux 7.0
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Tom King <ka6sox@gmail.com>
Subject: Re: [2011.03-maintenance][PATCH 2/7] git: update SRC_URI
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
X-List-Received-Date: Sat, 02 Mar 2013 17:30:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Tom,

Le 02-Mar-13, Martin Jansa a =E9crit:
> On Sat, Mar 02, 2013 at 04:32:27PM +0100, Apelete Seketeli wrote:
> > Le 02-Mar-13, Martin Jansa a =E9crit:
> > > On Sat, Mar 02, 2013 at 12:57:03PM +0100, Apelete Seketeli wrote:
> > > > Update SRC_URI to build.shr-project.org since git source packages=
 are
> > > > no longer available from kernel.org.
> > > > ---
> > > >  recipes/git/git.inc |    2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> > > > index eb59a2c..ae656e1 100644
> > > > --- a/recipes/git/git.inc
> > > > +++ b/recipes/git/git.inc
> > > > @@ -2,7 +2,7 @@ DESCRIPTION =3D "The git revision control system =
used by the Linux kernel develope
> > > >  SECTION =3D "console/utils"
> > > >  LICENSE =3D "GPLv2"
> > > > =20
> > > > -SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/software/scm/git/git-=
${PV}.tar.bz2;name=3Dsrc"
> > > > +SRC_URI =3D "http://build.shr-project.org/sources/git-${PV}.tar.=
bz2;name=3Dsrc"
> > >=20
> > > I don't know how long I'll keep "old" PREMIRROR there, it would be
> > > better to send missing archives to Tom King to add them to
> > > sources.oe.org which is more official source (and probably already
> > > listed in default MIRRORS)
> >=20
> > How do I send Tom King the missing archives ?
> > I'll reformat the patches into a v2 as soon as this is fixed.
>=20
> You can send him URLs to needed archives on yocto and shr premirrors=20
> and he will wget it from there.

Could you please add the following archives to
sources.openembedded.org ? I need them to fix non-working SRC_URIs in
many recipes:

http://downloads.yoctoproject.org/mirror/sources/libcap-2.20.tar.bz2
http://downloads.yoctoproject.org/mirror/sources/Linux-PAM-1.1.1.tar.bz2
http://downloads.yoctoproject.org/mirror/sources/netbase_4.21.tar.gz
http://build.shr-project.org/sources/udev-151.tar.gz
http://build.shr-project.org/sources/udev-162.tar.gz
http://build.shr-project.org/sources/udev-165.tar.gz
http://build.shr-project.org/sources/git-1.7.3.5.tar.bz2

Please let me know when the archives are available at
sources.openembedded.org, I'll reformat this patchset into v2 and
resend the pull request then.

Thanks.
--=20
        Apelete


