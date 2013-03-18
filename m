Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UHfq6-00073K-FH
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 20:35:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2IJIWjc010148
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2013 12:18:32 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 18 Mar 2013 12:18:32 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id C15937FE2;
	Mon, 18 Mar 2013 15:17:53 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id AC9EB22641; Mon,
	18 Mar 2013 15:18:31 -0400 (EDT)
Date: Mon, 18 Mar 2013 15:18:31 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130318191831.GB14025@windriver.com>
References: <1363592406-27335-1-git-send-email-koen@dominion.thruhere.net>
	<20130318183325.GA14025@windriver.com>
	<2884D477-780D-4EBD-A28A-A5F30E0E6A03@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <2884D477-780D-4EBD-A28A-A5F30E0E6A03@dominion.thruhere.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "<openembedded-devel@lists.openembedded.org>"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] cifs-utils: add 5.9
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
X-List-Received-Date: Mon, 18 Mar 2013 19:35:41 -0000
X-Groupsio-MsgNum: 43587
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline

--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] cifs-utils: add 5.9] On 13.03.18 (Mon 19=
:36) Koen Kooi wrote:

>=20
>=20
> Op 18 mrt. 2013 om 19:33 heeft Joe MacDonald <Joe.MacDonald@windriver.com=
> het volgende geschreven:
>=20
> > Hey Koen,
> >=20
> > [[oe] [meta-networking][PATCH] cifs-utils: add 5.9] On 13.03.18 (Mon 08=
:40) Koen Kooi wrote:
> >=20
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> meta-networking/recipes-support/cifs/cifs-utils_git.bb | 15 ++++++++++=
+++++
> >> 1 file changed, 15 insertions(+)
> >> create mode 100644 meta-networking/recipes-support/cifs/cifs-utils_git=
=2Ebb
> >>=20
> >> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/=
meta-networking/recipes-support/cifs/cifs-utils_git.bb
> >> new file mode 100644
> >> index 0000000..c78527e
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> >> @@ -0,0 +1,15 @@
> >> +DESCRIPTION =3D "A a package of utilities for doing and managing moun=
ts of the Linux CIFS filesystem."
> >> +HOMEPAGE =3D "http://wiki.samba.org/index.php/LinuxCIFS_utils"
> >> +
> >> +LICENSE =3D "GPLv3 && LGPLv3"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
> >> +
> >> +PV =3D "5.9"
> >> +
> >> +SRCREV =3D "353d491dcb5d69d31434abeb962c8e9a49c36867"
> >> +SRC_URI =3D "git://git.samba.org/cifs-utils.git"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit autotools
> >> +
> >=20
> > I had to make two changes to this recipe to address the following QA:
> >=20
> > WARNING: cifs-utils-5.9-r0: Failed to parse it's LICENSE field.
> > WARNING: QA Issue: cifs-utils: Files/directories were installed but not=
 shipped
> >  /usr/bin
> >  /usr/sbin
> >=20
> > First one's easy, I changed:
> >=20
> > +LICENSE =3D "GPLv3 && LGPLv3"
> >=20
> > to
> >=20
> > +LICENSE =3D "GPLv3 & LGPLv3"
> >=20
> > The second one I wasn't completely sure I was capturing what you
> > intended to do with this, but I added this to the bottom of your recipe:
> >=20
> > +do_install_append() {
> > +    # Remove empty /usr/*bin directory since the mount helper is insta=
lled to /sbin
> > +    rmdir ${D}${bindir} ${D}${sbindir}
> > +}
> >=20
> > This actually kind of seems like the wrong thing to do, but it also
> > looks like cifs-utils don't care what sbindir and bindir point at.
> >=20
> > If you're okay with this, I'll merge the modified patch I have in tree
> > now, or you can send an updated patch, whichever you prefer.
>=20
> Yes, thanks for fixing that!

No problem.  So, merged.  Thanks.

--=20
-Joe MacDonald.
:wq

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFHaIcACgkQPN8S4W6ZZncYhQCdG+GtNN2RNqd0qpvIWSGUjO2U
sSwAnRQEduC+bXkwKVVdy+j7wkkv9MJ9
=d3Jt
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
