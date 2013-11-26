Return-Path: <joe@deserted.net>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4018D6DD0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 02:53:43 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id x13so8407080ief.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2013 18:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=3w84W+enOmLgrXmNSsFCK/g7IOOO+DQV5k6diWAesJo=;
	b=hY5c/g5ZleA0DN/D71tASdx+46vD+mK9ZxKQ0NhwrcKiFHBZ/W2gmgKFNF8+Owpo32
	icBSTCPP1xM+GaYbGuZc/1KRmeHnetdIQxTgccuB55Eyi4caK7mPXW7vlJnQD16T7Gi7
	iLZO8GuBMh6zVDa5ShrO2aJDwI6aHTLu0JSRnN07Cv3YnVMd1a8I0RsfFN9zgaOqcEcH
	YlM8rkW1kUWtVpcUIs4hqZwa9ji0Fc84PpRwtrqyxqTtEGElSfdmMKpZFMeJ8bSbwOPQ
	FOz6DZUjesFh1BY5nVzZhcykv1dvNOnb1ny01t8fqHdWMkLngK4t3KA+0YNdHtIk4k3S
	86Rg==
X-Gm-Message-State: ALoCoQmax9IJ3qEJMj1dZtn31YodqjRrrzrHif4zHyFq+jDJ4t0T4IXr+T/zUD+6lIA0UWNReKcz
X-Received: by 10.50.29.4 with SMTP id f4mr15377544igh.11.1385434422310;
	Mon, 25 Nov 2013 18:53:42 -0800 (PST)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	u1sm29321327ige.1.2013.11.25.18.53.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Nov 2013 18:53:41 -0800 (PST)
Date: Mon, 25 Nov 2013 21:53:39 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131126025337.GA5596@deserted.net>
References: <1384878348-16319-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1384878348-16319-1-git-send-email-paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] lowpan-tools: fix do_install failure
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
X-List-Received-Date: Tue, 26 Nov 2013 02:53:43 -0000
X-Groupsio-MsgNum: 47260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

-J.

[[oe] [meta-networking][PATCH] lowpan-tools: fix do_install failure] On 13.=
11.19 (Tue 16:25) Paul Eggleton wrote:

> We don't have a proper help2man so building the manpages fails; just
> disable building them to fix this as we do elsewhere.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../lowpan-tools/lowpan-tools/no-help2man.patch    | 41 ++++++++++++++++=
++++++
>  .../lowpan-tools/lowpan-tools_git.bb               |  3 +-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-t=
ools/no-help2man.patch
>=20
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no=
-help2man.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools=
/no-help2man.patch
> new file mode 100644
> index 0000000..9ecd707
> --- /dev/null
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2m=
an.patch
> @@ -0,0 +1,41 @@
> +Disable building manpages so that make install doesn't fail due to lack =
of help2man
> +
> +Upstream-Status: Inappropriate [config]
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 46c4017..d6ed312 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -9,11 +9,6 @@ izcoordinator_DESC =3D "simple coordinator for IEEE 802=
=2E15.4 network"
> + iz_DESC =3D "configure an IEEE 802.15.4 interface"
> + izchat_DESC =3D "simple chat program using IEEE 802.15.4"
> +=20
> +-if MANPAGES
> +-dist_man_MANS =3D $(manpages)
> +-endif
> +-EXTRA_DIST =3D $(manpages)
> +-
> + izattach_SOURCES =3D serial.c
> +=20
> + iz_SOURCES =3D iz.c iz-common.c iz-mac.c iz-phy.c
> +@@ -27,18 +22,6 @@ izcoordinator_LDADD =3D ../addrdb/libaddrdb.la $(LDAD=
D) $(NL_LIBS) $(LEXLIB)
> + iz_CFLAGS =3D $(AM_CFLAGS) $(NL_CFLAGS) -D_GNU_SOURCE
> + iz_LDADD =3D $(LDADD) $(NL_LIBS)
> +=20
> +-izattach.8: $(izattach_SOURCES) $(top_srcdir)/configure.ac
> +-	-$(HELP2MAN) -o $@ -s 8 -N -n $(izattach_DESC) $(builddir)/izattach
> +-
> +-izcoordinator.8: $(izcoordinator_SOURCES) $(top_srcdir)/configure.ac
> +-	-$(HELP2MAN) -o $@ -s 8 -N -n $(izcoordinator_DESC) $(builddir)/izcoor=
dinator
> +-
> +-iz.8: $(iz_SOURCES) $(top_srcdir)/configure.ac
> +-	-$(HELP2MAN) -o $@ -s 8 -N -n $(iz_DESC) $(builddir)/iz
> +-
> +-izchat.1: $(izchat_SOURCES) $(top_srcdir)/configure.ac
> +-	-$(HELP2MAN) -o $@ -s 1 -N -n $(izchat_DESC) $(builddir)/izchat
> +-
> + install-data-hook:
> + 	$(mkinstalldirs) $(DESTDIR)`dirname $(leasefile)`
> + 	$(mkinstalldirs) $(DESTDIR)`dirname $(pidfile)`
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_gi=
t.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> index 152ee49..5fc0de3 100644
> --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
>  DEPENDS =3D "libnl python"
> =20
>  PV =3D "0.3+git${SRCPV}"
> -SRC_URI =3D "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee=
/linux-zigbee"
> +SRC_URI =3D "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee=
/linux-zigbee \
> +           file://no-help2man.patch"
>  SRCREV =3D "a1d9615adde6d1a568813c24a128273ed755af04"
> =20
>  S =3D "${WORKDIR}/git"
--=20
-Joe MacDonald.
:wq

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKUDRsACgkQwFvcllog0XxjKACcCRw5bclTka9U/zhNqrY3VG9g
VykAoLi61+vvIJglvAJgPk1u8tOf08/u
=Zoms
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
