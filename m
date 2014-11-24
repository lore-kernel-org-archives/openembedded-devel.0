Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 186206AFB5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 19:39:43 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1XszU8-0004NJ-AK from Joe_MacDonald@mentor.com ;
	Mon, 24 Nov 2014 11:39:44 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.181.6;
	Mon, 24 Nov 2014 11:39:43 -0800
Received: by burninator (Postfix, from userid 1000)	id D38955810B1; Mon, 24
	Nov 2014 14:39:42 -0500 (EST)
Date: Mon, 24 Nov 2014 14:39:42 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Message-ID: <20141124193941.GD6210@mentor.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-7-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416811526-54855-7-git-send-email-biannm@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 6/6] [meta-oe] Port corosync from openembedded and upgrade to 1.4.7
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
X-List-Received-Date: Mon, 24 Nov 2014 19:39:44 -0000
X-Groupsio-MsgNum: 53013
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline

--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bian,

[[oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and upgrade to =
1.4.7] On 14.11.24 (Mon 14:45) Bian Naimeng wrote:

> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/corosync/corosync_1.4.7.bb | 31 ++++++++++++++++=
++++++
>  .../corosync/files/config-site.corosync            |  4 +++
>  meta-oe/recipes-support/corosync/files/groff.patch | 12 +++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-support/corosync/corosync_1.4.7.bb
>  create mode 100644 meta-oe/recipes-support/corosync/files/config-site.co=
rosync
>  create mode 100644 meta-oe/recipes-support/corosync/files/groff.patch

This probably belongs in meta-networking (unless there's strong opinion
it belongs somewhere else).  Did you have a look at what has been done
in meta-cgl (git://git.enea.com/linux/meta-cgl) with the recipe to see
if there was anything useful there?  I know meta-cgl isn't very well
publicized yet, but it is in the layer index.  If you haven't looked at
what's there yet, it may be worth having a look to see if any of it can
save you some time.

For what it's worth, there does seem to be rather a lot more in meta-cgl
and I think at least some of it still applies (eg. the volatiles file).

> diff --git a/meta-oe/recipes-support/corosync/corosync_1.4.7.bb b/meta-oe=
/recipes-support/corosync/corosync_1.4.7.bb
> new file mode 100644
> index 0000000..a3b8864
> --- /dev/null
> +++ b/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "The Corosync Cluster Engine and Application Programming Int=
erfaces"
> +DESCRIPTION =3D "This package contains the Corosync Cluster Engine Execu=
tive, several default \
> +APIs and libraries, default configuration files, and an init script."
> +HOMEPAGE =3D "http://corosync.github.io/corosync/"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI =3D "http://build.clusterlabs.org/corosync/releases/${BPN}-${PV}=
=2Etar.gz \
> +           file://config-site.corosync \
> +           file://groff.patch \
> +	   "

Please remove the tab before space above.

> +
> +SRC_URI[md5sum] =3D "da9b2cf0b55f08ac4cf7cd82ac2f977a"
> +SRC_URI[sha256sum] =3D "c1d005b2093e9a725abd1dfb2be936114b561c0b3145aca1=
1f58c1a733a05af8"
> +
> +LICENSE =3D "BSD"

I think this is actually a BSD-3-Clause license, isn't it?

> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D25656171d1e4054c636a9893067f8=
c30"
> +
> +CONFIG_SITE =3D "${WORKDIR}/config-site.corosync"
> +
> +DEPENDS =3D "groff-native nss"
> +
> +EXTRA_OECONF +=3D " --enable-nss "
> +CFLAGS_append +=3D " -fPIC "
> +
> +do_compile() {
> +    DESCPATH=3D"${STAGING_DATADIR_NATIVE}/groff/`groff -v | awk '{if(NR=
=3D=3D1)print $4}'`/font"
> +    oe_runmake DESCPATH=3D${DESCPATH}
> +}
> +
> +FILES_${PN}-dbg +=3D "${libexecdir}/lcrso/.debug"
> diff --git a/meta-oe/recipes-support/corosync/files/config-site.corosync =
b/meta-oe/recipes-support/corosync/files/config-site.corosync
> new file mode 100644
> index 0000000..3472dec
> --- /dev/null
> +++ b/meta-oe/recipes-support/corosync/files/config-site.corosync
> @@ -0,0 +1,4 @@
> +ac_cv_func_fnmatch_works=3Dyes
> +ac_cv_func_malloc_0_nonnull=3Dyes
> +ac_cv_func_realloc_0_nonnull=3Dyes
> +
> diff --git a/meta-oe/recipes-support/corosync/files/groff.patch b/meta-oe=
/recipes-support/corosync/files/groff.patch

Can you add a header to this patch please?

Thanks.

-J.

> new file mode 100644
> index 0000000..da1378a
> --- /dev/null
> +++ b/meta-oe/recipes-support/corosync/files/groff.patch
> @@ -0,0 +1,12 @@
> +diff -Nurp corosync-1.3.1.org/man/Makefile.am corosync-1.3.1/man/Makefil=
e.am
> +--- corosync-1.3.1.org/man/Makefile.am	2011-04-25 10:37:50.000000000 +08=
00
> ++++ corosync-1.3.1/man/Makefile.am	2014-11-24 10:33:36.583426707 +0800
> +@@ -126,7 +126,7 @@ HTML_DOCS =3D $(dist_man_MANS:%=3D%.html)
> + INDEX_HTML =3D index.html
> +=20
> + %.html: %
> +-	$(GROFF) -mandoc -Thtml $^ > $@
> ++	$(GROFF) -F $(DESCPATH) -mandoc -Thtml $^ > $@
> +=20
> + install-data-local:
> + 	$(INSTALL) -d $(DESTDIR)/${docdir}/html
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUc4l9AAoJEEn8ffcsOfaWAsMH/25WGUz8ZRBQTLoHuW8WhpFA
1aH/WMjDUJCSerEe4/+EhrqJWV63UiEj1Q/jEJNHwUIwk3Zxd8ow4RscFmEXK4ty
3bb8c8Za/ATdvYiJNEodhP9c6oK5wsOg/yKKuVPK2yjTn6iiMFKcDIXyQD9zGHI5
fQDokMxSgTXfrsKbhncPkwHkM8+iE+WTbJv7kEpbva9UhjUpLrhu4xRDh2u3kF/i
kgaI8DnZHnip9niDND9ZK+0WFDMJg835A+V8tywrE3fWDEZ5X5DUEwkHLXXDfLjJ
W415417Wp+XqEQ6hPHVllevMT653NFuMZuADuW/R9JAgfSub/Og1m2jGtfeUQjw=
=dp3P
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
