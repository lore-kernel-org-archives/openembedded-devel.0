Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id A776A71FC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 12:01:32 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id r20so2462511wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 04:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Kk3jIDWRj4zLBMUDFbhjtBp4GHdbOPiXlAh/f+qQono=;
	b=wJ4PtSg64Py7FpBZy/X+F3Dv+OtwXPE8iET/8uLm4M0NqRKqxQSlJqGtW1IgojisBz
	Y3vVyvD3IofLgniANnHknku1y/HvxLFfkx8zw8zqf4jd5kEEwM/CbYuk5twxzXNE55k1
	QYwrENGvW93QXnlJ8jJNTmKChMmZXOoooXRGpJOp2yi1crIBCwKxakqnyyqVbfYo5kBv
	wD/jNWS/36Eq0o7nVw8B6NlSHJP0/GlxjB1Y24iz+R00aFqw4+v+sa3jWmLWtGNKx4MG
	kvklvo9ZCtpQ7zY2IrFcJpraF4P9ReJO2vJuzlPpMTEZ+WFc6EFR90ZTE+k3dsSmq/FE
	lDiA==
X-Received: by 10.180.150.138 with SMTP id ui10mr7082647wib.32.1415966493388; 
	Fri, 14 Nov 2014 04:01:33 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hk9sm39367045wjb.46.2014.11.14.04.01.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Nov 2014 04:01:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Nov 2014 13:01:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141114120138.GE2458@jama>
References: <1415956804-56497-1-git-send-email-biannm@cn.fujitsu.com>
	<1415956804-56497-4-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1415956804-56497-4-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 3/3] Porting eggdbus from openembedded.
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
X-List-Received-Date: Fri, 14 Nov 2014 12:01:34 -0000
X-Groupsio-MsgNum: 52881
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Content-Disposition: inline

--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2014 at 05:20:04PM +0800, Bian Naimeng wrote:
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch | 34 ++++++++++++++++=
++
>  meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch | 28 +++++++++++++++
>  meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb        | 41 ++++++++++++++++=
++++++
>  3 files changed, 103 insertions(+)
>  create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
>  create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
>  create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb
>=20
> diff --git a/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch b/meta-oe=
/recipes-core/eggdbus/eggdbus/gtk-doc.patch
> new file mode 100644
> index 0000000..abd7ff4
> --- /dev/null
> +++ b/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
> @@ -0,0 +1,34 @@
> +Upstream-Status: Inappropriate [configuration]=20
> +
> +Index: eggdbus-0.6/docs/eggdbus/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- eggdbus-0.6.orig/docs/eggdbus/Makefile.am
> ++++ eggdbus-0.6/docs/eggdbus/Makefile.am
> +@@ -87,11 +87,7 @@ HTML_IMAGES =3D 				\
> + # Extra options to supply to gtkdoc-fixref
> + FIXXREF_OPTIONS=3D
> +=20
> +-if ENABLE_GTK_DOC
> +-include $(top_srcdir)/gtk-doc.make
> +-else
> + CLEANFILES =3D
> +-endif
> +=20
> + CLEANFILES +=3D   *~				\
> + 		eggdbus-scan.*			\
> +Index: eggdbus-0.6/docs/tests/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- eggdbus-0.6.orig/docs/tests/Makefile.am
> ++++ eggdbus-0.6/docs/tests/Makefile.am
> +@@ -65,11 +65,7 @@ HTML_IMAGES =3D 				\
> + # Extra options to supply to gtkdoc-fixref
> + FIXXREF_OPTIONS=3D
> +=20
> +-if ENABLE_GTK_DOC
> +-include $(top_srcdir)/gtk-doc.make
> +-else
> + CLEANFILES =3D
> +-endif
> +=20
> + CLEANFILES +=3D   *~				\
> + 		tests-scan.*			\
> diff --git a/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch b/meta-oe=
/recipes-core/eggdbus/eggdbus/marshal.patch
> new file mode 100644
> index 0000000..a605a34
> --- /dev/null
> +++ b/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
> @@ -0,0 +1,28 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +Index: eggdbus-0.6/src/eggdbus/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- eggdbus-0.6.orig/src/eggdbus/Makefile.am
> ++++ eggdbus-0.6/src/eggdbus/Makefile.am
> +@@ -130,7 +130,7 @@ BUILT_SOURCES =3D								\
> + 	$(NULL)
> +=20
> + eggdbus-built-sources.stamp : eggdbus-binding-tool Makefile.am org.free=
desktop.DBus.xml org.freedesktop.DBus.Peer.xml org.freedesktop.DBus.Propert=
ies.xml org.freedesktop.DBus.Introspectable.xml eggdbus-glib-genmarshal
> +-	EGG_DBUS_GENMARSHAL=3D$(top_builddir)/src/eggdbus/eggdbus-glib-genmars=
hal $(top_builddir)/src/eggdbus/eggdbus-binding-tool							\
> ++	EGG_DBUS_GENMARSHAL=3Deggdbus-glib-genmarshal eggdbus-binding-tool				=
			\
> + 		--namespace EggDBus									\
> + 		--dbus-namespace org.freedesktop.DBus							\
> + 		--interfaces-only									\
> +Index: eggdbus-0.6/src/tests/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- eggdbus-0.6.orig/src/tests/Makefile.am
> ++++ eggdbus-0.6/src/tests/Makefile.am
> +@@ -25,7 +25,7 @@ BUILT_SOURCES =3D 							\
> + 	$(NULL)
> +=20
> + test-built-sources.stamp : Makefile.am $(top_builddir)/src/eggdbus/eggd=
bus-binding-tool com.example.Frob.xml com.example.Tweak.xml com.example.Twi=
ddle.xml
> +-	EGG_DBUS_GENMARSHAL=3D$(top_builddir)/src/eggdbus/eggdbus-glib-genmars=
hal $(top_builddir)/src/eggdbus/eggdbus-binding-tool									\
> ++	EGG_DBUS_GENMARSHAL=3Deggdbus-glib-genmarshal eggdbus-binding-tool				=
					\
> + 	  --namespace       "Test"										\
> + 	  --dbus-namespace  "com.example"									\
> + 	  --include-header  testtypes.h										\
> diff --git a/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb b/meta-oe/recipe=
s-core/eggdbus/eggdbus_0.6.bb
> new file mode 100644
> index 0000000..cfc9f8a
> --- /dev/null
> +++ b/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb
> @@ -0,0 +1,41 @@
> +SUMMARY =3D "An alternative to dbug-glib."
> +DESCRIPTION =3D "An alternative to dbus-glib. It is designed specificall=
y to \
> +make it comfortable to work with very large and potentially \
> +complex D-Bus services like e.g. DeviceKit-disks"
> +
> +HOMEPAGE =3D "http://cgit.freedesktop.org/~david/eggdbus"
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb \
> +                    file://src/eggdbus/eggdbus.h;md5=3D6b312aef57ed8d738=
b3f131ad037d6c2"
> +PR =3D "r0"

Will drop PR and change indentation to use 4 spaces.

> +
> +DEPENDS =3D "dbus glib-2.0 dbus-glib eggdbus-native"
> +DEPENDS_virtclass-native =3D "dbus-native glib-2.0-native dbus-glib-nati=
ve"
> +
> +BASE_SRC_URI =3D "http://cgit.freedesktop.org/~david/${BPN}/snapshot/${B=
PN}-${PV}.tar.bz2 \
> +		file://gtk-doc.patch \
> +		"
> +
> +SRC_URI =3D "${BASE_SRC_URI} \
> +	   file://marshal.patch;apply=3Dyes \
> +	  "
> +
> +SRC_URI_virtclass-native =3D "${BASE_SRC_URI}"
> +
> +SRC_URI[md5sum] =3D "0a111faa54dfba2cf432c2c8e8a76e06"
> +SRC_URI[sha256sum] =3D "3ad26e271c1a879bafcd181e065fe0ed53b542299a773c31=
88c9edb25b895ed1"
> +
> +inherit autotools gtk-doc
> +
> +EXTRA_OECONF =3D " --disable-man-pages "
> +
> +BBCLASSEXTEND =3D "native"
> +
> +PARALLEL_MAKE =3D ""
> +
> +do_configure_prepend() {
> +	# Create ChangeLog to walk around automake error.
> +        # " Makefile.am: error: required file './ChangeLog' not found "
> +	touch ${S}/ChangeLog
> +}
> +
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

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRl7yIACgkQN1Ujt2V2gBwhkQCgoBXZaa8Uks8LMGZWWTHI/I1T
iDYAoJiRSChH9dz3Ng1+svUt5EvoVQjL
=lRJi
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--
