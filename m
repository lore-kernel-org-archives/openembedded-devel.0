Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF5960107
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 12:20:59 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id w77so14463215wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 04:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uF0BJUJfNdbyL5Wz5Myb3mP92vBo1TIIob4Y7wrX4dM=;
	b=kYKWiC5IWaDOJEn6J02jGTIvP47+jyJ3230VxJSQViYDiG/PKUrEDM4dicwVzz0zJl
	uq9TUmklU8iw8jjPS6bjDhWRXF93JrxmMoiYSNBl7q8yqk7AdEcrgBrJJ7RKET2bZeEg
	T4MmN6oeM+ethH4o8SRuAw7vOhjRBHxhgMnC+2WtSM9kPvg6MzBrb6H8br8ya9D/6ZgR
	+wpTe5y1Gw1LIAcK3sBcUs6iMgy6J9Xr6lrRb+6CbX+t5apAiB/Yp77fljgqdmGYcetM
	u4Xau8dtYmlfXLPeSQAnpCzKMdHqrJqvfmSMO+uxPvGKrdyGcdhMydqgVoVAP2txBk9i
	NlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uF0BJUJfNdbyL5Wz5Myb3mP92vBo1TIIob4Y7wrX4dM=;
	b=cP6ZBiNQUEVDCrbNWdDp3XeYMRvCGTtlC8xls1aq2oWA8e4oA130hhfo/V73gJYgzY
	V89CK+hFYAxyfC7sEzEpvveU/jVuKJTiudmD2I6FRBxMEb1jgf01HLJy4LWptsC2LWUD
	bO87IfyeN0M5L5l2diStmd2A6yxDEpHcKxaVbEjz/xl4vKNorlKAMa7GwVZeLGjy2c5F
	XhjRsV8rY5uoJpMpPOBc/VVprjmx0NUQbkW4Bq5GsIiq3B38kBqq5501YjgIGeYhx9oL
	oVUqU8+aJOIOEB3uYFYmSmLJOJnL6VCVmVQzn84yhopmKQcPzoq91S73OaA4qHop3C3Z
	S0ow==
X-Gm-Message-State: APf1xPBdBs48YzSByXiAPnghRQE9S6lCqwaba/JWBwVuvZ+Rhsx28SFo
	wxOLs3vXpU1SLTv0RoEzO4MbsA==
X-Google-Smtp-Source: AG47ELsDSztuoJKRpTft6/ZDJnOXtU7r8V5pjUnATuhEmA2gozS0YV9wU/Ap8wvVtS5u+acnHH4zpQ==
X-Received: by 10.223.209.197 with SMTP id m5mr9882011wri.121.1520166060702;
	Sun, 04 Mar 2018 04:21:00 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	d23sm4763436wma.20.2018.03.04.04.20.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 04 Mar 2018 04:20:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 4 Mar 2018 13:21:02 +0100
To: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
Message-ID: <20180304122102.GA1370@jama>
References: <1519830661-28223-1-git-send-email-carlos.rodriguez@ridgerun.com>
MIME-Version: 1.0
In-Reply-To: <1519830661-28223-1-git-send-email-carlos.rodriguez@ridgerun.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v5] gstd: Add Gst-Deamon recipe
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
X-List-Received-Date: Sun, 04 Mar 2018 12:21:00 -0000
X-Groupsio-MsgNum: 71088
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2018 at 09:11:01AM -0600, Carlos Rodriguez wrote:
> GStreamer Daemon, also called gstd, is a GStreamer framework
> for controlling audio and video streaming using TCP connection
> messages. Qt applications, web interfaces, and GStreamer element
> test suites show different ways the framework can be utilized.
> GStreamer Daemon is gst-launch on steroids where you can create a
> GStreamer pipeline, play, pause, change speed, skip around, and
> even change element parameter settings all while the pipeline
> is active.
>=20
> Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
> ---
>  .../gstd/0001-gstd-yocto-compatibility.patch       | 65 ++++++++++++++++=
++++++
>  .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb   | 27 +++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd=
/0001-gstd-yocto-compatibility.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd=
_1.0.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-g=
std-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreame=
r-1.0/gstd/0001-gstd-yocto-compatibility.patch
> new file mode 100644
> index 0000000..8e13242
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yoc=
to-compatibility.patch
> @@ -0,0 +1,65 @@
> +From eaf51d6420c63713f62025583681007c3502d387 Mon Sep 17 00:00:00 2001
> +From: Carlos <carlos.rodriguez@ridgerun.com>
> +Date: Fri, 15 Dec 2017 10:14:05 -0600
> +Subject: [PATCH] gstd:yocto compatibility
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
> +---
> + autogen.sh                      | 8 +++++++-
> + docs/reference/gstd/Makefile.am | 2 +-
> + gstd/Makefile.am                | 2 +-
> + 3 files changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/autogen.sh b/autogen.sh
> +index 66dbd42..793ee2f 100755
> +--- a/autogen.sh
> ++++ b/autogen.sh
> +@@ -21,7 +21,11 @@
> + # ACLOCAL, AUTOPOINT and/or LIBTOOLIZE to the right versions, or leave =
them
> + # unset and get the defaults
> +=20
> +-gtkdocize || exit 1
> ++test -n "$srcdir" || srcdir=3D`dirname "$0"`
> ++test -n "$srcdir" || srcdir=3D.
> ++
> ++olddir=3D`pwd`
> ++cd "$srcdir"
> +=20
> + autoreconf --verbose --force --install || {
> +  echo 'autogen.sh failed';
> +@@ -31,3 +35,5 @@ autoreconf --verbose --force --install || {
> + echo
> + echo "Now run './configure' with your system settings followed by 'make=
' to compile this module."
> + echo
> ++
> ++cd "$olddir"
> +diff --git a/docs/reference/gstd/Makefile.am b/docs/reference/gstd/Makef=
ile.am
> +index f860fa1..153a13b 100644
> +--- a/docs/reference/gstd/Makefile.am
> ++++ b/docs/reference/gstd/Makefile.am
> +@@ -66,7 +66,7 @@ GTKDOC_LIBS=3D$(top_builddir)/gstd/libgstd-core.la
> +=20
> +=20
> + # This includes the standard gtk-doc make rules, copied by gtkdocize.
> +-include $(top_srcdir)/docs/gtk-doc.make
> ++# include $(top_srcdir)/docs/gtk-doc.make
> +=20
> + # Comment this out if you want 'make check' to test you doc status
> + # and run some sanity checks
> +diff --git a/gstd/Makefile.am b/gstd/Makefile.am
> +index 13c551d..11fe202 100644
> +--- a/gstd/Makefile.am
> ++++ b/gstd/Makefile.am
> +@@ -49,7 +49,7 @@ bin_PROGRAMS =3D gstd
> +=20
> + gstd_SOURCES =3D gstd.c
> + gstd_CFLAGS =3D $(GST_CFLAGS) $(GIO_CFLAGS) $(GJSON_CFLAGS)
> +-gstd_LDFLAGS =3D $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS) -Wl,-rpath -Wl,$=
(libdir)
> ++gstd_LDFLAGS =3D $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS)
> + gstd_LDADD =3D libgstd-core.la
> +=20
> + gstdincludedir =3D $(includedir)/gstd
> +--=20
> +1.9.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb=
 b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> new file mode 100644
> index 0000000..61540a4
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Gstreamer Daemon 1.0"
> +DESCRIPTION =3D "GStreamer framework for controlling audio and video str=
eaming using TCP connection messages"
> +HOMEPAGE =3D "https://developer.ridgerun.com/wiki/index.php?title=3DGstd=
-1.0"
> +SECTION =3D "multimedia"
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins=
-bad gstreamer1.0-rtsp-server json-glib libdaemon"
> +
> +SRCBRANCH ?=3D "master"
> +SRCREV =3D "097a086a8606dcb368c7d38c7ec4fefc2497401b"
> +SRC_URI =3D "git://github.com/RidgeRun/gstd-1.x.git;protocol=3Dhttps;bra=
nch=3D${SRCBRANCH} \
> +	   file://0001-gstd-yocto-compatibility.patch"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG_CONFARGS =3D " \

PACKAGECONFIG_CONFARGS is used for parameters from PACKAGECONFIG, it
doesn't make sense to use it like this.

Use EXTRA_OECONF.

Older version of this change was merged to master, please send follow-up
change to fix it.

> +	--disable-gtk-doc \
> +"
> +
> +inherit autotools pkgconfig gettext
> +
> +do_configure() {
> +        ${S}/autogen.sh
> +        oe_runconf

Use 4 spaces for indentations.

> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWpvkrQAKCRA3VSO3ZXaA
HC6JAJ0QUeMB3cg9a89ZqbT4I/pTHeFUeQCfTmvF8e/Q4bpSZsPsMb+l00nhUvg=
=ZRGO
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
