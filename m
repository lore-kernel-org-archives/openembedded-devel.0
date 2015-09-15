Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5400172A78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 14:23:58 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Zbr9K-0000rs-My from Joe_MacDonald@mentor.com ;
	Tue, 15 Sep 2015 07:23:58 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Sep 2015 07:23:58 -0700
Received: by burninator (Postfix, from userid 1000)	id F2CEA582837; Tue, 15
	Sep 2015 10:22:49 -0400 (EDT)
Date: Tue, 15 Sep 2015 10:22:49 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Message-ID: <20150915142249.GH8885@mentor.com>
References: <1439531817-34541-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FDA8E4C8F5@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDA8E4C8F5@G08CNEXMBPEKD01.g08.fujitsu.local>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dnsmasq: upgrade 2.72->2.75
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
X-List-Received-Date: Tue, 15 Sep 2015 14:23:59 -0000
X-Groupsio-MsgNum: 57366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G44BJl3Aq1QbV/QL"
Content-Disposition: inline

--G44BJl3Aq1QbV/QL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lei,

[Re: [oe] [meta-oe][PATCH] dnsmasq: upgrade 2.72->2.75] On 15.09.15 (Tue 01=
:58) Lei, Maohui wrote:

> Hi
>=20
> Excuse me. This patch has been in master-next for a long time. Why not
> been merged into master?

Probably the same reason as why Kai's inetutils patch lingered on for so
long.  Anything for meta-networking without a meta-networking tag in the
subject line has an elevated risk of being overlooked.  Sorry about
that, it's been merged now.

-J.

>=20
>=20
> Cheers
> Lei
>=20
>=20
>=20
> > -----Original Message-----
> > From: Lei, Maohui=20
> > Sent: Friday, August 14, 2015 1:57 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Lei, Maohui=20
> > Subject: [oe] [meta-oe][PATCH] dnsmasq: upgrade 2.72->2.75
> >=20
> > -parallel-make.patch is not needed any more,so delete.
> >=20
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > ---
> >  .../dnsmasq/dnsmasq/parallel-make.patch               | 19 -----------=
--------
> >  .../recipes-support/dnsmasq/dnsmasq_2.72.bb           | 10 ----------
> >  .../recipes-support/dnsmasq/dnsmasq_2.75.bb           |  9 +++++++++
> >  3 files changed, 9 insertions(+), 29 deletions(-)  delete mode 100644
> > meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch
> >  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.7=
2.bb
> >  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.7=
5.bb
> >=20
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-m=
ake.patch
> > b/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch
> > deleted file mode 100644
> > index 6d5b722..0000000
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.pat=
ch
> > +++ /dev/null
> > @@ -1,19 +0,0 @@
> > -The dnsmasq target depends on .configured and $(objs). .configured doe=
s an rm --f *.o.
> > Yet the only thing telling make to build the .configured target before =
-the $(objs) target
> > was the order of the dependencies of the dnsmasq target. We -can't rely=
 on that order
> > when doing a paralllel make build, so add an explicit -rule to enforce =
that order.
> > -
> > -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > -Upstream-status: Pending
> > -
> > ---- dnsmasq-2.68.orig/Makefile
> > -+++ dnsmasq-2.68/Makefile
> > -@@ -139,6 +139,8 @@ bloatcheck : $(BUILDDIR)/dnsmasq_baselin
> > -	@rm -f *.o
> > -	@touch $@
> > -
> > -+$(objs): .configured
> > -+
> > - $(objs:.o=3D.c) $(hdrs):
> > -	ln -s $(top)/$(SRC)/$@ .
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
> > b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
> > deleted file mode 100644
> > index bd59194..0000000
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -require dnsmasq.inc
> > -
> > -SRC_URI +=3D "\
> > -    file://parallel-make.patch \
> > -    file://lua.patch \
> > -"
> > -
> > -SRC_URI[dnsmasq-2.72.md5sum] =3D "cf82f81cf09ad3d47612985012240483"
> > -SRC_URI[dnsmasq-2.72.sha256sum] =3D
> > "635f1b47417d17cf32e45cfcfd0213ac39fd09918479a25373ba9b2ce4adc05d"
> > -
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> > b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> > new file mode 100644
> > index 0000000..a11aabb
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> > @@ -0,0 +1,9 @@
> > +require dnsmasq.inc
> > +
> > +SRC_URI +=3D "\
> > +    file://lua.patch \
> > +"
> > +
> > +SRC_URI[dnsmasq-2.75.md5sum] =3D "d99ac126d4fe910c679d88430559669b"
> > +SRC_URI[dnsmasq-2.75.sha256sum] =3D
> > "f8252c0a0ba162c2cd45f81140c7c17cc40a5fca2b869d1a420835b74acad294"
> > +
> > --
> > 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--G44BJl3Aq1QbV/QL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEbBAEBAgAGBQJV+Cm5AAoJEEn8ffcsOfaWohwH+IAgy7D3DQQGvxlu4+SvCIhJ
rnDGGWx2uASRSZheLP6/UPQFvE3qnbt4fFvG7JYVHa9sDXGni8QJRCmIoUMghvaH
plNBwtUiDrZB/9qFuycQuY4DBgX1hF6RlXMg00XY4tk+mF+aCRWsbWe0sR7bH4J9
LRBwNKslatME+G3L7doXx3jhHbrH9afOkZ4xnQXKNGg9GkYJ3m2nhqZdW8uNP7zI
guZUF7JAiDVAQAaXPzyXRWMiYrYR5sLHXu16u40zXYfyj2IGd3aOaqpUjFg+dpny
6/E6v5g+23s1Vsyl2Gl9TLeatzAYyvPLXdZy0jnm6djivmWTP9mNGKGq+GN/9Q==
=jVp6
-----END PGP SIGNATURE-----

--G44BJl3Aq1QbV/QL--
