Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7emH-00082K-Nf
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 05:26:04 +0100
Received: by mail-pb0-f52.google.com with SMTP id ma3so1997641pbc.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 20:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C9M5aI1I/12LvpZuNOToxaph00dMs5QM1epIAa/U21M=;
	b=NGM0pYpinjreqNn/TFR9GZw1d3BwJQzgBEnD9wWOgGrAv8nZ6PpnbfWCuBFiEBIgL6
	cNk/1STXbTkEcnRt6HKEQ9qANNASIrAY19Rpk+CkGC2QyTXml9QI8Y0+D+NWDnsSGjCl
	B/uicC/FGW7qjlYHOVNoQ4XvJueMdyA21EH+ho+2N/+8U2c9ozpWWiGtE01SmWZxMqCe
	nOQW0T5K58KLy0shGX4WbtVCSpTTNUdpdSU6zcpvzlZYk8RNfRRH+xZl40mDasioQG8W
	teGby3OfHJIpRMea9vpHmHvX2tfUFEe9j6qaEGqkGOlb7f1M8E1mhVytIf6xVR88wm+S
	4ecw==
X-Received: by 10.68.31.73 with SMTP id y9mr36524456pbh.102.1361246992051;
	Mon, 18 Feb 2013 20:09:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y10sm16536560pbf.39.2013.02.18.20.09.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 20:09:50 -0800 (PST)
Date: Tue, 19 Feb 2013 05:09:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130219040952.GR3300@jama>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360234263-18278-9-git-send-email-marcin.juszkiewicz@linaro.org>
	<20130216052306.GW3300@jama>
MIME-Version: 1.0
In-Reply-To: <20130216052306.GW3300@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 8/8] google-perftools: add 2.0
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
X-List-Received-Date: Tue, 19 Feb 2013 04:26:05 -0000
X-Groupsio-MsgNum: 43237
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JkdIF91f86UUr6LJ"
Content-Disposition: inline

--JkdIF91f86UUr6LJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 16, 2013 at 06:23:06AM +0100, Martin Jansa wrote:
> On Thu, Feb 07, 2013 at 11:51:03AM +0100, Marcin Juszkiewicz wrote:
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>=20
> Fails to install with newer autotools:
>=20
> | /usr/bin/install: will not overwrite just-created
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-l=
inux-gnueabi/gperftools/2.0-r0/image/usr/include/google/tcmalloc.h'
> with `src/windows/google/tcmalloc.h'
> | make[1]: *** [install-googleincludeHEADERS] Error 1
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130215_060633.log/

Also the subject and maybe also the directory should be gperftools not
google-perftools.

>=20
> > ---
> >  meta-oe/recipes-support/google-perftools/gperftools_2.0.bb | 11 ++++++=
+++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/google-perftools/gperftools=
_2.0.bb
> >=20
> > diff --git a/meta-oe/recipes-support/google-perftools/gperftools_2.0.bb=
 b/meta-oe/recipes-support/google-perftools/gperftools_2.0.bb
> > new file mode 100644
> > index 0000000..1717752
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/google-perftools/gperftools_2.0.bb
> > @@ -0,0 +1,11 @@
> > +DESCRIPTION =3D "Fast, multi-threaded malloc() and nifty performance a=
nalysis tools"
> > +HOMEPAGE =3D "http://code.google.com/p/gperftools/"
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D762732742c73dc6c7fbe8632f06=
c059a"
> > +
> > +SRC_URI =3D "${DEBIAN_MIRROR}/main/g/google-perftools/google-perftools=
_${PV}.orig.tar.gz"
> > +
> > +SRC_URI[md5sum] =3D "13f6e8961bc6a26749783137995786b6"
> > +SRC_URI[sha256sum] =3D "7de3dd91f018825b1e7d332af1edace15c6211f430186f=
ebede1835069861080"
> > +
> > +inherit autotools
> > --=20
> > 1.8.0
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JkdIF91f86UUr6LJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEi+xAACgkQN1Ujt2V2gBwcnwCeMJALpFYGAjgF7SoLwPBT85Vx
g8sAoIWjPSr3YaftS08vTAC6X1su8izG
=6aUR
-----END PGP SIGNATURE-----

--JkdIF91f86UUr6LJ--
