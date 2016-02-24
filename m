Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id F090E76B7C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:45:58 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id g62so12498643wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 08:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FS1QxDiDMcb1cnO/x6oftHd8urliPk8LZlTJMOqcaxQ=;
	b=mhvU+6QimbcQGze7k+CUU2dXB8Xr5QMI1qzT0tm56QySjSp8MLg48vJmrzN+TH775Z
	ICsghgN+YFSYNnp1DPUY9exc7dXoINOxf+MqpzYXZbsDqxN6Fr0TkhUF3s+ttqjw6VcP
	MZ+iDzcJHuTjXnm8r2gNQu+YwLTvKEBQLivdCL7mDZby2sfEZlZscOrqXYs5HHf1d8hL
	ojNS0Necu7w1ZGUI+Yi0YSNdrpFfTPtyd9+SXxMEpt/oB9Io30Bi6qknuOri15k+bZSA
	LBzqDgXgd7t2BTKFxZeDMYR0NtOquGnUDmR78V3MxP2fJQfv7sqJ97PVg7mjy3KV9cLX
	mm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=FS1QxDiDMcb1cnO/x6oftHd8urliPk8LZlTJMOqcaxQ=;
	b=c7+xJ7fmD2dPi0jDKniQ1Y+y8A65pbdCz+0uWyBWswQ28UnA/NtD/RXx3Wbs2mnOf8
	/n59UZJeWX6MXqddXIIZ+pskT0GM85vFcZmNiWN+1hVozkxWksknrGaH//R4mEHEgKuG
	7p2m69AUMA9fsggm+YMcyFpA+sfdqk2i4wuiDcqaceddauDA1OEcDKQOLFcIqRYUePzy
	xP1jNfIwn6cvXl7XDheFwxGxa7hRT09Umy0lDQ0sKVR61zQZhIxLjP/TkEo3yaKSS+YG
	lQdnI2nUf9RFuf/dSH0a7KUPo3oQIqDV+jQAzIEqzR0qqxYLkq6HoYdQHrGJ8pd5Fj2Y
	/4eQ==
X-Gm-Message-State: AG10YOQVIXxXhXFw5QRBfaeZ4O2U706hccE+fFHH65MxIVhij7mj1MysqodC9eyx9wGWJw==
X-Received: by 10.194.58.234 with SMTP id u10mr40616347wjq.174.1456332359033; 
	Wed, 24 Feb 2016 08:45:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id w66sm4307339wmd.2.2016.02.24.08.45.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 08:45:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 17:47:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160224164704.GH2560@jama>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 00/34] Initial gobject introspection support for meta-openembedded
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
X-List-Received-Date: Wed, 24 Feb 2016 16:46:00 -0000
X-Groupsio-MsgNum: 60191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PW0Eas8rCkcu1VkF"
Content-Disposition: inline

--PW0Eas8rCkcu1VkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 04:19:39PM +0200, Alexander Kanavin wrote:
> This patch adds gobject introspection support to recipes in meta-openembe=
dded.
> To make it work, you need to fetch the following poky branch and build ag=
ainst it:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakanavin/=
gobject-introspection-experimental

Many people aren't using poky and don't want to play with combo-layer or
format-patch/am combo to reapply the patches from poky repo to oe-core
repo.

As you're definitely used to such strange environment, can you please
push corresponding branch for oe-core to openembedded-core-contrib repo
as well?

Thanks!

> For general information about gobject introspection support in openembedd=
ed, see here:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-November/1=
13390.html
>=20
> NOTE to meta-oe maintainers: this patchset is meant for testing and revie=
w. It depends
> on changes to oe-core that are not yet available in master branch, and th=
erefore
> it should not be merged yet.

I should start reading the cover letters :), will remove this from
master-next until openembedded-core-contrib branch is available.

> The following changes since commit dafd61fa87c31fab97e36f71974fc097a1841c=
91:
>=20
>   net-snmp: fix cross-compile breakage, add libnl pkgconfig option (2016-=
02-22 15:51:20 -0500)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib akanavin/gobject-i=
ntrospection-fixes
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dakanavin/gobject-introspection-fixes
>=20
> Alexander Kanavin (34):
>   evolution-data-server: fix gobject introspection
>   evince: update to 3.18.2
>   gnome-bluetooth: update to 3.18.2
>   gnome-desktop: remove pygtk dependency
>   gnumeric: fix gobject introspection support
>   libgdata: update to 0.16.1
>   libgsf: fix gobject introspection
>   libwnck: fix gobject introspection
>   libxklavier: fix gobject introspection
>   goffice: fix gobject introspection
>   tracker: fix gobject introspection
>   gupnp: fix gobject introspection
>   rygel: fix gobject introspection
>   media-service-demo: remove the recipe
>   python-gst: remove the 0.10 recipe
>   gstreamer-0.10: disable gobject introspection
>   libmediaart: fix gobject introspection
>   bluez4: use real introspection instead of legacy pygobject
>   modemmanager: fix vala support
>   networkmanager: fix introspection and vala support
>   telepathy-glib: fix gobject introspection support
>   libgee: fix gobject introspection support
>   polkit: fix gobject introspection support
>   gtkextra: fix gobject introspection support
>   libunique: fix gobject introspection support
>   babl: update to 0.1.16
>   gegl: update to 0.3.4
>   gimp: accept newer versins of babl and gegl
>   omgps: remove the recipe
>   poppler-data: fix do_install()
>   poppler: fix gobject introspection
>   udisks2: fix gobject introspection
>   upower: fix gobject introspection
>   python-dbusmock: use real introspection instead on legacy pygobject
>=20
>  .../recipes-gnome/eds/evolution-data-server_git.bb |   6 +-
>  .../evince/0001-help-remove-YELP-macro.patch       |  24 ++++
>  .../evince/0001-tiff-fix-compile-warning.patch     |  33 ------
>  ...ove-pkg-config-check-for-gnome-icon-theme.patch |  35 ------
>  .../evince/evince/cross-compile-fix.patch          |  25 -----
>  .../evince/{evince_2.32.0.bb =3D> evince_3.18.2.bb}  |  29 ++---
>  .../0001-bluetooth-input-Fix-compile-errors.patch  |  37 ------
>  ...luetooth-client-use-valid-interface-names.patch | 122 ---------------=
-----
>  .../0003-Fix-build-with-libnotify-0.7.0.patch      |  47 --------
>  .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |  38 -------
>  .../gnome-bluetooth/gnome-bluetooth_3.18.2.bb      |  20 ++++
>  .../gnome-desktop/gnome-desktop_2.32.1.bb          |   6 +-
>  ...n-drop-introspection-macros-replace-them-.patch |  84 ++++++++++++++
>  .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      |   5 +-
>  .../{libgdata_0.7.1.bb =3D> libgdata_0.16.1.bb}      |  21 +++-
>  ...c-drop-a-copy-paste-of-introspection.m4-m.patch | 103 +++++++++++++++=
++
>  meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb  |   2 +
>  meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb |   2 +-
>  .../recipes-gnome/libxklavier/libxklavier_5.3.bb   |   2 -
>  ...igure.ac-fix-paths-to-introspection-tools.patch |  41 +++++++
>  .../recipes-support/goffice/goffice_0.10.1.bb      |   2 +
>  .../recipes-support/tracker/tracker_0.14.2.bb      |   7 +-
>  .../recipes-connectivity/gupnp/gssdp.inc           |  12 +-
>  .../recipes-connectivity/gupnp/gupnp-av.inc        |   9 +-
>  .../recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb |   4 +-
>  .../recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb  |   6 +-
>  .../recipes-connectivity/gupnp/gupnp.inc           |  12 +-
>  .../recipes-connectivity/gupnp/no-vala.inc         |   5 -
>  .../recipes-connectivity/rygel/rygel_0.28.2.bb     |   2 +-
>  .../dleyna/media-service-demo_git.bb               |  18 ---
>  .../gstreamer-0.10/gst-plugins.inc                 |   2 +-
>  .../gstreamer-0.10/gst-rtsp_0.10.8.bb              |   2 +
>  .../gstreamer-0.10/gstreamer_0.10.36.bb            |   1 +
>  .../gstreamer-0.10/python-gst/python-path.patch    |  28 -----
>  .../gstreamer-0.10/python-gst_0.10.22.bb           |  29 -----
>  .../recipes-support/libmediaart/libmediaart.inc    |   2 +-
>  ...pygobject-instead-ofgobject-introspection.patch |  27 -----
>  meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb |   1 -
>  .../modemmanager/modemmanager_1.4.12.bb            |   2 +-
>  .../networkmanager/networkmanager_1.0.10.bb        |   8 +-
>  .../telepathy/telepathy-glib_0.24.0.bb             |   2 +-
>  meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb   |   4 +-
>  meta-oe/recipes-extended/polkit/polkit_0.113.bb    |  14 ++-
>  meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb   |   4 +-
>  ...-use-LIBTOOL-instead-of-hardcoded-libtool.patch |  27 +++++
>  meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb |   6 +-
>  .../babl/{babl_0.1.10.bb =3D> babl_0.1.16.bb}        |   4 +-
>  .../gegl/{gegl_0.2.0.bb =3D> gegl_0.3.4.bb}          |  22 ++--
>  .../gimp/gimp/bump_Babl-GEGL_versions.patch        |  53 +++++++++
>  meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb       |   1 +
>  ...g_type_init-is-deprecated-for-glib-2.35.0.patch |  33 ------
>  .../omgps/omgps/fix.build.with.gcc.4.9.patch       |  22 ----
>  .../omgps/omgps/fix.build.with.glib.2.34.patch     | 125 ---------------=
------
>  .../omgps/omgps/fix.capability.patch               |  62 ----------
>  .../recipes-navigation/omgps/omgps/gcc-4.4.patch   |  71 ------------
>  .../omgps/omgps/gdk-pixbuf-2.26.5.patch            |  15 ---
>  .../omgps/omgps/sysfs.node.2.6.32.patch            |  14 ---
>  .../omgps/omgps/use.unused.variable.patch          |  15 ---
>  meta-oe/recipes-navigation/omgps/omgps_svn.bb      |  29 -----
>  .../recipes-support/poppler/poppler-data_0.4.7.bb  |   2 +-
>  meta-oe/recipes-support/poppler/poppler_0.37.0.bb  |   6 +-
>  meta-oe/recipes-support/udisks/udisks2_2.1.5.bb    |   4 +-
>  meta-oe/recipes-support/upower/upower_0.9.14.bb    |   4 +-
>  ...-t-use-gobject-introspection-for-bindings.patch |  29 -----
>  .../python/python-dbusmock_0.10.1.bb               |   1 -
>  65 files changed, 484 insertions(+), 946 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remo=
ve-YELP-macro.patch
>  delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-=
compile-warning.patch
>  delete mode 100644 meta-gnome/recipes-gnome/evince/evince/Remove-pkg-con=
fig-check-for-gnome-icon-theme.patch
>  delete mode 100644 meta-gnome/recipes-gnome/evince/evince/cross-compile-=
fix.patch
>  rename meta-gnome/recipes-gnome/evince/{evince_2.32.0.bb =3D> evince_3.1=
8.2.bb} (60%)
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blueto=
oth/0001-bluetooth-input-Fix-compile-errors.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blueto=
oth/0002-bluetooth-client-use-valid-interface-names.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blueto=
oth/0003-Fix-build-with-libnotify-0.7.0.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blueto=
oth_2.32.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blueto=
oth_3.18.2.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric/0001-confi=
gure.in-drop-introspection-macros-replace-them-.patch
>  rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.7.1.bb =3D> libgdat=
a_0.16.1.bb} (43%)
>  create mode 100644 meta-gnome/recipes-gnome/libgsf/files/0001-configure.=
ac-drop-a-copy-paste-of-introspection.m4-m.patch
>  create mode 100644 meta-gnome/recipes-support/goffice/goffice/0001-confi=
gure.ac-fix-paths-to-introspection-tools.patch
>  delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/no-vala.inc
>  delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/media-servi=
ce-demo_git.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/pyt=
hon-gst/python-path.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/pyt=
hon-gst_0.10.22.bb
>  delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-l=
egacy-pygobject-instead-ofgobject-introspection.patch
>  create mode 100644 meta-oe/recipes-gnome/libunique/libunique/0001-Makefi=
le.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
>  rename meta-oe/recipes-graphics/babl/{babl_0.1.10.bb =3D> babl_0.1.16.bb=
} (72%)
>  rename meta-oe/recipes-graphics/gegl/{gegl_0.2.0.bb =3D> gegl_0.3.4.bb} =
(46%)
>  create mode 100644 meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_ver=
sions.patch
>  delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/0001-g_type_in=
it-is-deprecated-for-glib-2.35.0.patch
>  delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.build.with=
=2Egcc.4.9.patch
>  delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.build.with=
=2Eglib.2.34.patch
>  delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.capability=
=2Epatch
>  delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
>  delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.2=
6.5.patch
>  delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6=
=2E32.patch
>  delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/use.unused.var=
iable.patch
>  delete mode 100644 meta-oe/recipes-navigation/omgps/omgps_svn.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python-dbusmock/0=
001-Don-t-use-gobject-introspection-for-bindings.patch
>=20
> --=20
> 2.7.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PW0Eas8rCkcu1VkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbN3ocACgkQN1Ujt2V2gByRyACeNRSavo9yqjLLNwfwOUHYEhKR
ipcAn23e2zaWbgHvER/MvaiQSQ+Xuedd
=dqzK
-----END PGP SIGNATURE-----

--PW0Eas8rCkcu1VkF--
