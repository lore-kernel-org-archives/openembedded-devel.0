Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D371A60030
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 21:02:19 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1XvuaS-0001gb-C2 from Joe_MacDonald@mentor.com ;
	Tue, 02 Dec 2014 13:02:20 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.181.6; Tue, 2 Dec 2014
	13:02:17 -0800
Received: by burninator (Postfix, from userid 1000)	id 2721A5814AD; Tue,  2
	Dec 2014 16:02:17 -0500 (EST)
Date: Tue, 2 Dec 2014 16:02:17 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20141202210216.GG12784@mentor.com>
References: <1417168385-1943-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417168385-1943-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] ncftp : add new recipe
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
X-List-Received-Date: Tue, 02 Dec 2014 21:02:25 -0000
X-Groupsio-MsgNum: 53158
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwGu8mu1E+uYXPWP"
Content-Disposition: inline

--RwGu8mu1E+uYXPWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] ncftp : add new recipe] On 14.11.28 (Fri 17:=
53) Li xin wrote:

> ncftp is a sophisticated console ftp client.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  ...ix-error-expected-before-PRINTF_LONG_LONG.patch |   35 +
>  .../ncftp/Fix-errors-AR-Command-not-found.patch    |   54 +
>  .../recipes-daemons/ncftp/ncftp/acinclude.m4       | 4950 ++++++++++++++=
++++++
>  .../recipes-daemons/ncftp/ncftp_3.2.0.bb           |   24 +
>  4 files changed, 5063 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/Fix-error=
-expected-before-PRINTF_LONG_LONG.patch
>  create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/Fix-error=
s-AR-Command-not-found.patch
>  create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/acinclude=
=2Em4
>  create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp_3.2.0.bb
>=20
> diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/Fix-error-expect=
ed-before-PRINTF_LONG_LONG.patch b/meta-networking/recipes-daemons/ncftp/nc=
ftp/Fix-error-expected-before-PRINTF_LONG_LONG.patch
> new file mode 100644
> index 0000000..43f7a6b
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ncftp/ncftp/Fix-error-expected-befo=
re-PRINTF_LONG_LONG.patch
> @@ -0,0 +1,35 @@
> +From e56135c48f418a1036f05c2432872650e4942c54 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 28 Nov 2014 09:21:17 +0900
> +Subject: [PATCH 2/2] Fix error: expected ')' before 'PRINTF_LONG_LONG'
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>

Upstream-status, please.  Also, any idea why PRINTF_LONG_LONG is
undefined in this context?  Seems odd.

> +---
> + ncftp/cmds.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ncftp/cmds.c b/ncftp/cmds.c
> +index 1f491ac..259e660 100644
> +--- a/ncftp/cmds.c
> ++++ b/ncftp/cmds.c
> +@@ -945,7 +945,7 @@ EditCmd(const int argc, char **const argv, const Com=
mandPtr cmdp, const ArgvInfo
> + 			--n;
> + 			memset(&st, 0, sizeof(st));
> + 		}
> +-		(void) sprintf(modstr, "%u " PRINTF_LONG_LONG, (unsigned int) st.st_m=
time, (longest_int) st.st_size);
> ++		(void) sprintf(modstr, "%u %ld" , (unsigned int) st.st_mtime, (longes=
t_int) st.st_size);
> + 		if (AddLine(&modstrs, modstr) =3D=3D NULL) {
> + 			DisposeLineListContents(&modstrs);
> + 			DisposeLineListContents(&rfiles);
> +@@ -1006,7 +1006,7 @@ EditCmd(const int argc, char **const argv, const C=
ommandPtr cmdp, const ArgvInfo
> + 			(void) fprintf(stdout, "\n");
> + 			continue;
> + 		}
> +-		(void) sprintf(modstr, "%u " PRINTF_LONG_LONG, (unsigned int) st.st_m=
time, (longest_int) st.st_size);
> ++		(void) sprintf(modstr, "%u %ld" , (unsigned int) st.st_mtime, (longes=
t_int) st.st_size);
> + 		if (strcmp(modstr, mlp->line) =3D=3D 0) {
> + 			Trace(-1, "No changes made to \"%s\".\n", rpath);
> + 			continue;
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/Fix-errors-AR-Co=
mmand-not-found.patch b/meta-networking/recipes-daemons/ncftp/ncftp/Fix-err=
ors-AR-Command-not-found.patch
> new file mode 100644
> index 0000000..c5f6b91
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ncftp/ncftp/Fix-errors-AR-Command-n=
ot-found.patch
> @@ -0,0 +1,54 @@
> +From b09b891058d7a28b97be72f75e8b6866394b0615 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 28 Nov 2014 09:17:28 +0900
> +Subject: [PATCH 1/2] Fix errors "AR@: Command not found"
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>

Also need an upstream-status on this, but that one appears self-evident
so no further explanation is necessary.

> +---
> + Strn/Makefile.in     | 2 +-
> + libncftp/Makefile.in | 2 +-
> + sio/Makefile.in      | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Strn/Makefile.in b/Strn/Makefile.in
> +index ffe6806..e3c91fc 100644
> +--- a/Strn/Makefile.in
> ++++ b/Strn/Makefile.in
> +@@ -42,7 +42,7 @@ all: static
> + static: $(LIB)
> +=20
> + $(LIB): $(OBJS)
> +-	@CCDV@@AR@ r $(LIB) $(OBJS)
> ++	@CCDV@$(AR) r $(LIB) $(OBJS)
> + 	-@chmod 644 "$(LIB)"
> + 	-@RANLIB@ "$(LIB)"
> + 	-@echo "$(VER)" > Strn.version
> +diff --git a/libncftp/Makefile.in b/libncftp/Makefile.in
> +index 7fda7b6..e3da73d 100644
> +--- a/libncftp/Makefile.in
> ++++ b/libncftp/Makefile.in
> +@@ -49,7 +49,7 @@ all: $(LIBSET)
> +=20
> + $(LIB): $(OBJS)
> + 	-@/bin/rm -f $(LIB)
> +-	@CCDV@@AR@ r $(LIB) $(OBJS)
> ++	@CCDV@$(AR) r $(LIB) $(OBJS)
> + 	-@chmod 644 $(LIB)
> + 	-@@RANLIB@ $(LIB)
> + 	@/bin/ls -l $(LIB)
> +diff --git a/sio/Makefile.in b/sio/Makefile.in
> +index ff91508..f7d651d 100644
> +--- a/sio/Makefile.in
> ++++ b/sio/Makefile.in
> +@@ -51,7 +51,7 @@ all: $(LIB)
> +=20
> + $(LIB): $(OBJS)
> + 	-@/bin/rm -f $(LIB)
> +-	@CCDV@@AR@ r $(LIB) $(OBJS)
> ++	@CCDV@$(AR) r $(LIB) $(OBJS)
> + 	-@RANLIB@ $(LIB)
> + 	-@echo $(VER) > sio.version
> + 	-@chmod a+r $(LIB) sio.h usio.h
> +--=20
> +1.8.4.2
> +

> diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/acinclude.m4 b/m=
eta-networking/recipes-daemons/ncftp/ncftp/acinclude.m4
> new file mode 100644
> index 0000000..e7d4bd0
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ncftp/ncftp/acinclude.m4

Wow, is this really necessary?  To include the whole m4 file?

Remainder deleted.

> diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.0.bb b/meta-=
networking/recipes-daemons/ncftp/ncftp_3.2.0.bb
> new file mode 100644
> index 0000000..dd49478
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.0.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "A sophisticated console ftp client"
> +SECTION =3D "console/network"
> +PRIORITY =3D "optional"
> +LICENSE =3D "ClArtistic"
> +LIC_FILES_CHKSUM =3D "file://ncftp/cmds.c;beginline=3D3;endline=3D4;md5=
=3D9de76faeaedc4f908082e3f8142715f4"
> +
> +SRC_URI =3D "ftp://ftp.ncftp.com/ncftp/older_versions/ncftp-${PV}-src.ta=
r.bz2 \
                                        ^-----+------^
Why this? ------------------------------------+

I'd much rather see a 3.2.5 recipe.

-J.

> +    file://acinclude.m4 \
> +    file://Fix-errors-AR-Command-not-found.patch \
> +    file://Fix-error-expected-before-PRINTF_LONG_LONG.patch"
> +
> +inherit autotools-brokensep
> +
> +do_configure_prepend () {
> +    install -m 0644 ${WORKDIR}/acinclude.m4 acinclude.m4
> +}
> +do_install () {
> +    install -d ${D}${bindir} ${D}${sysconfdir} ${D}${mandir}
> +    oe_runmake 'prefix=3D${D}${prefix}' 'BINDIR=3D${D}${bindir}' \
> +        'SYSCONFDIR=3D${D}${sysconfdir}' 'mandir=3D${D}${mandir}' \
> +        install
> +}
> +SRC_URI[md5sum] =3D "384b7f01d725c89ccd30692628b3ac1b"
> +SRC_URI[sha256sum] =3D "2ebc7b51af96cb0fa8b703c7cb995bfb46ccf5312e335270=
d0420e260544c376"
> --=20
> 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--RwGu8mu1E+uYXPWP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUfijYAAoJEEn8ffcsOfaWEdAH/ivUwDdGkOPWQpREa6DDwTOR
1B45wMh+rGBg7RW865rvhO+m06L7SnF6SiU64lJCur22HIiCoY5qW46d0fufG6RN
lYSW5FPJuuIeWatZnAm1ykPvOl+zbBp6D8SNs3E6oHOAEoA+jw/Vq3P4JwC3IH9h
pMJ6rBeM/4KmotdARSuyzz+wkwU0guKOXrb5g02PtXKe+fWN0vQwvFKRAWxqUO2v
GIx6v04XFj2hMgP5h7e2SiKhvpvDsfD9xfEq9wgaoIy7C7oQ+cNXuFAO2f9y0QBB
SAuQaTTNrjgsrPfel8X6QKmIiOLKTd0q6v07ysQLVuZjAZwonBoZACNAS2n3H8c=
=KWDK
-----END PGP SIGNATURE-----

--RwGu8mu1E+uYXPWP--
