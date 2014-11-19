Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 17C696AC82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:55:44 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so1067583wgh.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pRg+yxMDvVi3FeeohvFm3QUPaadpeW6SEB97Pw+QBRE=;
	b=XWX7PFwWNkHg/V+vwJmLr7Bxf0jKslwrSDxVhNyC/3sUH6ZWdwKmyUkNsy6XTZJyFj
	YeQjwXuU1tNDZT0QGKkGm/FvFdmq/VnNoakv0BjflWKQu71bGSShgmURfFCAkcSHBAR2
	GDUhmGOAWt2HN8dN7J54FhKE1KqHZsCl8kfba6QESHtW8RNlJ8gVwQbuQWD/w8mmvh9O
	7BlAYraeetmUCrk94WVW6oD5AESwjeXLL0Cs8dauqClTEumrb0zfy3NkTz30VwAqhbTG
	f46VOWyD8hai3hinBvnFZMJZHviIJcoDkQ4tdQTvQUemUF8thTmHzNDWO/lXdf+0CHOl
	0rnw==
X-Received: by 10.194.77.233 with SMTP id v9mr57726218wjw.24.1416408945091;
	Wed, 19 Nov 2014 06:55:45 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fk16sm2534386wic.16.2014.11.19.06.55.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:55:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:55:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119145540.GK3315@jama>
References: <1415956804-56497-1-git-send-email-biannm@cn.fujitsu.com>
	<1415956804-56497-4-git-send-email-biannm@cn.fujitsu.com>
	<20141114120138.GE2458@jama>
MIME-Version: 1.0
In-Reply-To: <20141114120138.GE2458@jama>
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
X-List-Received-Date: Wed, 19 Nov 2014 14:55:52 -0000
X-Groupsio-MsgNum: 52937
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45wMVEkw4XUbiYON"
Content-Disposition: inline

--45wMVEkw4XUbiYON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2014 at 01:01:38PM +0100, Martin Jansa wrote:
> On Fri, Nov 14, 2014 at 05:20:04PM +0800, Bian Naimeng wrote:
> > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > ---
> >  meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch | 34 ++++++++++++++=
++++
> >  meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch | 28 +++++++++++++++
> >  meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb        | 41 ++++++++++++++=
++++++++
> >  3 files changed, 103 insertions(+)
> >  create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
> >  create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
> >  create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb
> >=20
> > diff --git a/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch b/meta-=
oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
> > new file mode 100644
> > index 0000000..abd7ff4
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
> > @@ -0,0 +1,34 @@
> > +Upstream-Status: Inappropriate [configuration]=20
> > +
> > +Index: eggdbus-0.6/docs/eggdbus/Makefile.am
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- eggdbus-0.6.orig/docs/eggdbus/Makefile.am
> > ++++ eggdbus-0.6/docs/eggdbus/Makefile.am
> > +@@ -87,11 +87,7 @@ HTML_IMAGES =3D 				\
> > + # Extra options to supply to gtkdoc-fixref
> > + FIXXREF_OPTIONS=3D
> > +=20
> > +-if ENABLE_GTK_DOC
> > +-include $(top_srcdir)/gtk-doc.make
> > +-else
> > + CLEANFILES =3D
> > +-endif
> > +=20
> > + CLEANFILES +=3D   *~				\
> > + 		eggdbus-scan.*			\
> > +Index: eggdbus-0.6/docs/tests/Makefile.am
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- eggdbus-0.6.orig/docs/tests/Makefile.am
> > ++++ eggdbus-0.6/docs/tests/Makefile.am
> > +@@ -65,11 +65,7 @@ HTML_IMAGES =3D 				\
> > + # Extra options to supply to gtkdoc-fixref
> > + FIXXREF_OPTIONS=3D
> > +=20
> > +-if ENABLE_GTK_DOC
> > +-include $(top_srcdir)/gtk-doc.make
> > +-else
> > + CLEANFILES =3D
> > +-endif
> > +=20
> > + CLEANFILES +=3D   *~				\
> > + 		tests-scan.*			\
> > diff --git a/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch b/meta-=
oe/recipes-core/eggdbus/eggdbus/marshal.patch
> > new file mode 100644
> > index 0000000..a605a34
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
> > @@ -0,0 +1,28 @@
> > +Upstream-Status: Inappropriate [configuration]
> > +
> > +Index: eggdbus-0.6/src/eggdbus/Makefile.am
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- eggdbus-0.6.orig/src/eggdbus/Makefile.am
> > ++++ eggdbus-0.6/src/eggdbus/Makefile.am
> > +@@ -130,7 +130,7 @@ BUILT_SOURCES =3D								\
> > + 	$(NULL)
> > +=20
> > + eggdbus-built-sources.stamp : eggdbus-binding-tool Makefile.am org.fr=
eedesktop.DBus.xml org.freedesktop.DBus.Peer.xml org.freedesktop.DBus.Prope=
rties.xml org.freedesktop.DBus.Introspectable.xml eggdbus-glib-genmarshal
> > +-	EGG_DBUS_GENMARSHAL=3D$(top_builddir)/src/eggdbus/eggdbus-glib-genma=
rshal $(top_builddir)/src/eggdbus/eggdbus-binding-tool							\
> > ++	EGG_DBUS_GENMARSHAL=3Deggdbus-glib-genmarshal eggdbus-binding-tool		=
					\
> > + 		--namespace EggDBus									\
> > + 		--dbus-namespace org.freedesktop.DBus							\
> > + 		--interfaces-only									\
> > +Index: eggdbus-0.6/src/tests/Makefile.am
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- eggdbus-0.6.orig/src/tests/Makefile.am
> > ++++ eggdbus-0.6/src/tests/Makefile.am
> > +@@ -25,7 +25,7 @@ BUILT_SOURCES =3D 							\
> > + 	$(NULL)
> > +=20
> > + test-built-sources.stamp : Makefile.am $(top_builddir)/src/eggdbus/eg=
gdbus-binding-tool com.example.Frob.xml com.example.Tweak.xml com.example.T=
widdle.xml
> > +-	EGG_DBUS_GENMARSHAL=3D$(top_builddir)/src/eggdbus/eggdbus-glib-genma=
rshal $(top_builddir)/src/eggdbus/eggdbus-binding-tool									\
> > ++	EGG_DBUS_GENMARSHAL=3Deggdbus-glib-genmarshal eggdbus-binding-tool		=
							\
> > + 	  --namespace       "Test"										\
> > + 	  --dbus-namespace  "com.example"									\
> > + 	  --include-header  testtypes.h										\
> > diff --git a/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb b/meta-oe/reci=
pes-core/eggdbus/eggdbus_0.6.bb
> > new file mode 100644
> > index 0000000..cfc9f8a
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb
> > @@ -0,0 +1,41 @@
> > +SUMMARY =3D "An alternative to dbug-glib."
> > +DESCRIPTION =3D "An alternative to dbus-glib. It is designed specifica=
lly to \
> > +make it comfortable to work with very large and potentially \
> > +complex D-Bus services like e.g. DeviceKit-disks"
> > +
> > +HOMEPAGE =3D "http://cgit.freedesktop.org/~david/eggdbus"
> > +LICENSE =3D "LGPLv2+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f390409=
283eb \
> > +                    file://src/eggdbus/eggdbus.h;md5=3D6b312aef57ed8d7=
38b3f131ad037d6c2"
> > +PR =3D "r0"
>=20
> Will drop PR and change indentation to use 4 spaces.
>=20
> > +
> > +DEPENDS =3D "dbus glib-2.0 dbus-glib eggdbus-native"
> > +DEPENDS_virtclass-native =3D "dbus-native glib-2.0-native dbus-glib-na=
tive"
> > +
> > +BASE_SRC_URI =3D "http://cgit.freedesktop.org/~david/${BPN}/snapshot/$=
{BPN}-${PV}.tar.bz2 \
> > +		file://gtk-doc.patch \
> > +		"
> > +
> > +SRC_URI =3D "${BASE_SRC_URI} \
> > +	   file://marshal.patch;apply=3Dyes \
> > +	  "
> > +
> > +SRC_URI_virtclass-native =3D "${BASE_SRC_URI}"

SRC_URI =3D "http://cgit.freedesktop.org/~david/${BPN}/snapshot/${BPN}-${PV=
}.tar.bz2 \
    file://gtk-doc.patch \
"
SRC_URI_append_class-target =3D "file://marshal.patch"

would do the same (changed in master-next)

> > +
> > +SRC_URI[md5sum] =3D "0a111faa54dfba2cf432c2c8e8a76e06"
> > +SRC_URI[sha256sum] =3D "3ad26e271c1a879bafcd181e065fe0ed53b542299a773c=
3188c9edb25b895ed1"
> > +
> > +inherit autotools gtk-doc
> > +
> > +EXTRA_OECONF =3D " --disable-man-pages "
> > +
> > +BBCLASSEXTEND =3D "native"
> > +
> > +PARALLEL_MAKE =3D ""
> > +
> > +do_configure_prepend() {
> > +	# Create ChangeLog to walk around automake error.
> > +        # " Makefile.am: error: required file './ChangeLog' not found "
> > +	touch ${S}/ChangeLog
> > +}

You should patch configure to pass foreign to automake instead.

> > +
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--45wMVEkw4XUbiYON
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsr2wACgkQN1Ujt2V2gBx+NwCZATz56ro64N6S7Jq1JCUdw46I
LIwAnjKmDC45T9r/VciIhrmfldwrsYKn
=j8ve
-----END PGP SIGNATURE-----

--45wMVEkw4XUbiYON--
