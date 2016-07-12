Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CD16D6067C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:24:20 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bMybl-0000E6-Ha from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2016 07:24:21 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 Jul 2016 07:24:21 -0700
Received: by burninator (Postfix, from userid 1000)	id 5C84A58041C; Tue, 12
	Jul 2016 10:24:20 -0400 (EDT)
Date: Tue, 12 Jul 2016 10:24:20 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20160712142419.GB4066@mentor.com>
References: <1468307717-13359-1-git-send-email-xiao.zhang@windriver.com>
	<57849B9A.5010305@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <57849B9A.5010305@mlbassoc.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [recipes-extended][PATCH] pax: strip off file name's trailing slash
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
X-List-Received-Date: Tue, 12 Jul 2016 14:24:24 -0000
X-Groupsio-MsgNum: 62134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline

--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [recipes-extended][PATCH] pax: strip off file name's trailing sla=
sh] On 16.07.12 (Tue 09:26) Gary Thomas wrote:

> On 2016-07-12 09:15, Zhang Xiao wrote:
> >When extracting packaes, the trailing slash of the file name
> >has no means but may cause some issue on system call lstat.
> >Remove it.
> >
> >Upstream-Status: Pending
> >
> >Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> >---
> >  .../pax-strip-off-file-name-s-trailing-slash.patch | 48 ++++++++++++++=
++++++++
> >  meta/recipes-extended/pax/pax_3.4.bb               |  4 +-
> >  2 files changed, 51 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-extended/pax/pax/pax-strip-off-file-na=
me-s-trailing-slash.patch
> >
> >diff --git a/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-tra=
iling-slash.patch b/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s=
-trailing-slash.patch
> >new file mode 100644
> >index 0000000..a602b30
> >--- /dev/null
> >+++ b/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-trailing-s=
lash.patch
> >@@ -0,0 +1,48 @@
> >+From aa8ba118869b75a2a9cd681b2f0362d9d8f1c7ec Mon Sep 17 00:00:00 2001
> >+From: Zhang Xiao <xiao.zhang@windriver.com>
> >+Date: Tue, 12 Jul 2016 11:34:45 +0800
> >+Subject: [PATCH] pax: strip off file name's trailing slash
> >+
> >+When extracting packaes, the trailing slash of the file name
> >+has no means but may cause some issue on system call lstat.
> >+Remove it.
> >+
> >+Upstream-Status: Pending
> >+
> >+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> >+---
> >+ src/pat_rep.c | 11 ++++++++++-
> >+ 1 file changed, 10 insertions(+), 1 deletion(-)
> >+
> >+diff --git a/src/pat_rep.c b/src/pat_rep.c
> >+index b9a4636..4cbf6bf 100644
> >+--- a/src/pat_rep.c
> >++++ b/src/pat_rep.c
> >+@@ -605,7 +605,7 @@ int
> >+ mod_name(ARCHD *arcn)
> >+ {
> >+ 	int res =3D 0;
> >+-
> >++	char *pt;
> >+ 	/*
> >+ 	 * Strip off leading '/' if appropriate.
> >+ 	 * Currently, this option is only set for the tar format.
> >+@@ -639,6 +639,15 @@ mod_name(ARCHD *arcn)
> >+ 	}
> >+
> >+ 	/*
> >++	 * strip off trailing slash.
> >++	 */
> >++	pt =3D &(arcn->name[strlen(arcn->name) - 1]);
>=20
> This looks incorrect if the file name is only a single character.  You
> should only attempt this if strlen(arcn->name) >=3D 2

Also, isn't this already covered:

pax-3.4/src/pat_rep.c:

 363       /*
 364        * strip off any trailing /, this should really never happen
 365        */
 366       len =3D pt->plen - 1;
 367       if (*(pt->pstr + len) =3D=3D '/') {
 368          *(pt->pstr + len) =3D '\0';
 369          pt->plen =3D len;
 370       }
 371       pt->flgs =3D DIR_MTCH | MTCH;
 372       arcn->pat =3D pt;
 373       return(0);

At the very least, it's probably worth doing it in the same way as it is
elsewhere in the file.

-J.

>=20
> >++	if (*pt =3D=3D '/') {
> >++		 *pt =3D '\0';
> >++		arcn->nlen =3D strlen(arcn->name);
> >++	}
> >++
> >++	/*
> >+ 	 * IMPORTANT: We have a problem. what do we do with symlinks?
> >+ 	 * Modifying a hard link name makes sense, as we know the file it
> >+ 	 * points at should have been seen already in the archive (and if it
> >+--
> >+1.8.5.2.233.g932f7e4
> >+
> >diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extende=
d/pax/pax_3.4.bb
> >index 9d1abfb..7ce43ce 100644
> >--- a/meta/recipes-extended/pax/pax_3.4.bb
> >+++ b/meta/recipes-extended/pax/pax_3.4.bb
> >@@ -16,7 +16,9 @@ DEPENDS_append_libc-musl =3D " fts "
> >
> >  SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.=
bz2/fbd9023b590b45ac3ade95870702a0d6/${BP}.tar.bz2 \
> >  	file://fix_for_compile_with_gcc-4.6.0.patch \
> >-	file://pax-3.4_fix_for_x32.patch"
> >+	file://pax-3.4_fix_for_x32.patch \
> >+	file://pax-strip-off-file-name-s-trailing-slash.patch \
> >+"
> >
> >  SRC_URI_append_libc-musl =3D " file://0001-Fix-build-with-musl.patch \
> >                               file://0001-use-strtoll-instead-of-strtoq=
=2Epatch \
> >
>=20
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
--=20
-Joe MacDonald.
:wq

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXhP2TAAoJEEn8ffcsOfaW0UkIALKrTtTdQOCIgnZrX7yBLhSy
1dW7NIAmBqN834XZzW70HtblQoqRqpyqJN+lORAWhia3XFbS1goZomBXUpwDzQvq
coJw+HJD8MVESVGVHtKhI+nKQQgzzpVMfT/7RPxoZgZ6yTrJlYDTUu3gzZ6V3k3i
6V+xsi19MFYQHq6EzEq6Gq+j+ogVp3z9bqjIq4uhWqFctEwzXefVmMbCQEqgAWjK
UOiJSSWxFQnE8x35IqM7216Jpq03B+OzoMkNp+pFJRaIww7kXRn8mhBfdUD+klPy
oToBTOdT6TrQKZYYQt30bPx84U4nNoro9lfbQw1Ed46538N2xgRP3xYGKKQFyz4=
=p3Ev
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
