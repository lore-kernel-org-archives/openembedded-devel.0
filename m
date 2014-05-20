Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f49.google.com (unknown [209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id EDAFD6028A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 21:15:41 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id pv20so868827lab.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 14:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HHIwBVq0zUznaZ/PT6hNX3LXiDEzOFt6u3OCHBBvJ8A=;
	b=E5JtIAS4e/Ksbs7dv3dwmAIYni7n2TNA14xL8UXsSuT0kbPygsnDYY5Yfv1alvuumE
	4yuJob7jURejdtsLQH2wqUhl/NygsCIZ7U3DIeFpVnb0oWkzkNdqVJf1StLUhxTyzGwm
	T2TEZEucRpKua6A50p7vRUjt9h7wR5nEGTyuEOKJt+lG6kQZmudL+PjwTPIXNueeHpzW
	1hOUGNTEpm6YxQsXwPS6bmVswiToaJkCKHM2pxHIBjsyrRCl/faEbFhyXUpLrZZWUeaM
	g9K9k6fTTBOpS45LbXr98O8X4WqjW2kSvYzbZXYMc8g0L8WLlUbXnRS+snrT7D4arecs
	BrVg==
X-Received: by 10.152.87.136 with SMTP id ay8mr17590986lab.42.1400620541207;
	Tue, 20 May 2014 14:15:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f9sm23772301lae.16.2014.05.20.14.15.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 May 2014 14:15:39 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 May 2014 23:15:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Rob Calhoun <rob@calhoun.net>
Message-ID: <20140520211541.GC2424@jama>
References: <cover.1400614758.git.rcalhoun@shotspotter.com>
	<09265e0a9963f2b03e5d91aa7baa4dbf941c93c8.1400614758.git.rcalhoun@shotspotter.com>
MIME-Version: 1.0
In-Reply-To: <09265e0a9963f2b03e5d91aa7baa4dbf941c93c8.1400614758.git.rcalhoun@shotspotter.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] * Support gpsd version 3.10 * Refactor recipe into version-specific file and version-independent include file * Add explicit list of supported devices/chipsets. By default gpsd compiles in support for all known devices. By overriding this list, support for unwanted devices/chipsets can be dropped. * Make version-specific patch directories and test 3.7 patches against 3.10; remove patch present in 3.7 that disabled build of gpsd-doc because manfile generation now runs without error. Other patches appear to still be necessary * Fixup patch files so that they apply cleanly to gpsd 3.10 source, which has changed * refactor gpsd 3.7 recipe so that it refers to include file. * bump 3.7 $PR to r15 to show 3.7 recipe has changed substantially * set 3.10 $PR to r1 because this is a new version
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
X-List-Received-Date: Tue, 20 May 2014 21:15:44 -0000
X-Groupsio-MsgNum: 49981
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline

--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Missing subject line and please squash 2/2 into this. Please reply when
you were able to test it (build-time and run-time).

On Tue, May 20, 2014 at 12:54:47PM -0700, Rob Calhoun wrote:
> TODO: identify when udev is in use and add support for it automatically
> ---
>  ...prefix-includepy-with-sysroot-and-drop-sy.patch |  71 ++++++++
>  ...struct-respect-sysroot-also-in-SPLINTOPTS.patch |  30 ++++
>  .../gpsd-3.10/0004-SConstruct-remove-rpath.patch   |  42 +++++
>  meta-oe/recipes-navigation/gpsd/gpsd.inc           | 179 +++++++++++++++=
++++++
>  meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb       |  15 ++
>  meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb        | 140 +---------------
>  .../recipes-navigation/gpsd/supported-chipsets.inc |  28 ++++
>  7 files changed, 372 insertions(+), 133 deletions(-)
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConst=
ruct-prefix-includepy-with-sysroot-and-drop-sy.patch
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConst=
ruct-respect-sysroot-also-in-SPLINTOPTS.patch
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConst=
ruct-remove-rpath.patch
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd.inc
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
>  create mode 100644 meta-oe/recipes-navigation/gpsd/supported-chipsets.inc
>=20
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-pr=
efix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/=
gpsd/gpsd-3.10/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.pa=
tch
> new file mode 100644
> index 0000000..e557703
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-prefix-in=
cludepy-with-sysroot-and-drop-sy.patch
> @@ -0,0 +1,71 @@
> +From dd3ca38b27cce93f7e932abaa27b41371234fa90 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Tue, 24 Apr 2012 18:45:14 +0200
> +Subject: [PATCH] SConstruct: prefix includepy with sysroot and drop sysr=
oot
> + from python_lib_dir
> +
> +* without PYTHONPATH, distutil's sysconfig returns INCLUDEPY without sys=
root prefix
> +  and with PYTHONPATH from OE it's pointing to native python dir
> +
> +    $ export PYTHONPATH=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/=
lib/python2.7/
> +    $ python
> +    Python 2.7.2 (default, Apr 18 2012, 09:19:59)
> +    [GCC 4.6.2] on linux2
> +    Type "help", "copyright", "credits" or "license" for more informatio=
n.
> +    >>> from distutils import sysconfig
> +    >>> sysconfig.get_config_vars('INCLUDEPY')
> +    ['/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/python2.=
7']
> +    >>>
> +    $ unset PYTHONPATH
> +    $ python
> +    Python 2.7.2 (default, Apr 18 2012, 09:19:59)
> +    [GCC 4.6.2] on linux2
> +    Type "help", "copyright", "credits" or "license" for more informatio=
n.
> +    >>> from distutils import sysconfig
> +    >>> sysconfig.get_config_vars('INCLUDEPY')
> +    ['/python2.7']
> +    >>> import sysconfig
> +    >>> sysconfig.get_config_vars('INCLUDEPY')
> +    ['/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/python2.=
7']
> +* python_lib_dir =3D python_lib_dir.replace(env['sysroot'], '')
> +  returns path to target sysroot
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + SConstruct |    9 +++++++++
> + 1 files changed, 9 insertions(+), 0 deletions(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index 14e2f59..47c5753 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -1084,6 +1084,10 @@ else:
> +         if vars[i] is None:
> +             vars[i] =3D []
> +     (cc, cxx, opt, basecflags, ccshared, ldshared, so_ext, includepy, l=
dflags) =3D vars
> ++    if env['sysroot']:
> ++         print "Prefixing includepy '%s' with sysroot prefix" % include=
py
> ++         includepy =3D os.path.normpath("%s/%s/%s/%s" % (env['sysroot']=
, env['prefix'], env['includedir'], includepy))
> ++         print "'%s'" % includepy
> +     # FIXME: build of python wrappers doesn't pickup flags set for cove=
raging, manually add them here
> +     if env['coveraging']:
> +         basecflags +=3D ' -coverage'
> +@@ -1350,11 +1358,14 @@ if not env['python']:
> +     python_install =3D []
> + else:
> +     python_lib_dir =3D sysconfig.get_python_lib(plat_specific=3D1)
> ++    python_lib_dir =3D python_lib_dir.replace(env['sysroot'], '')
> +     python_module_dir =3D python_lib_dir + os.sep + 'gps'
> +     python_extensions_install =3D python_env.Install( DESTDIR + python_=
module_dir,
> +                                                     python_built_extens=
ions)
> +     if not env['debug'] and not env['profiling'] and env['strip']:
> +         python_env.AddPostAction(python_extensions_install, '$STRIP $TA=
RGET')
> ++    env.AddPostAction(python_extensions_install, '$CHRPATH -r "%s" "$TA=
RGET"' \
> ++                     % (python_lib_dir, ))
> +=20
> +     python_modules_install =3D python_env.Install( DESTDIR + python_mod=
ule_dir,
> +                                                 python_modules)
> +
> +--=20
> +1.7.8.5
> +
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-re=
spect-sysroot-also-in-SPLINTOPTS.patch b/meta-oe/recipes-navigation/gpsd/gp=
sd-3.10/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
> new file mode 100644
> index 0000000..06dd6e7
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-respect-s=
ysroot-also-in-SPLINTOPTS.patch
> @@ -0,0 +1,30 @@
> +From f5f262be8ae54bd0c0f52802f2007ec89163756f Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Tue, 24 Apr 2012 11:52:35 +0200
> +Subject: [PATCH 1/2] SConstruct: respect sysroot also in SPLINTOPTS
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> +---
> + SConstruct |    5 ++++-
> + 1 files changed, 4 insertions(+), 1 deletions(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index 14e2f59..47c5753 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -1414,7 +1425,10 @@ def Utility(target, source, action):
> + # Report splint warnings
> + # Note: test_bits.c is unsplintable because of the PRI64 macros.
> + # If you get preprocessor or fatal errors, add +showscan.
> +-splintopts =3D "-I/usr/include/libusb-1.0 +quiet"
> ++if not env['sysroot']:
> ++    splintopts =3D "-I/usr/include/libusb-1.0 +quiet"
> ++else:
> ++    splintopts =3D "-I%s/usr/include/libusb-1.0 +quiet" % env['sysroot']
> + # splint does not know about multi-arch, work around that
> + ma_status, ma =3D _getstatusoutput('dpkg-architecture -qDEB_HOST_MULTIA=
RCH')
> + if ma_status =3D=3D 0:
> +--=20
> +1.7.5.4
> +
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-re=
move-rpath.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruc=
t-remove-rpath.patch
> new file mode 100644
> index 0000000..83b98bb
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-remove-rp=
ath.patch
> @@ -0,0 +1,42 @@
> +From 7d736bbd517c12d19d7b85a5b0db84732b2f86da Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Tue, 24 Apr 2012 16:24:35 +0200
> +Subject: [PATCH 2/2] SConstruct: remove rpath
> +
> +* even with correct prefix (without DESTDIR) included it's redundant
> +  WARNING: QA Issue: libgps:
> +  /work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/u=
sr/lib/libgps.so.20.0
> +  contains probably-redundant RPATH /usr/lib
> +* and with prefix from scons.bbclass it's invalid
> +  WARNING: QA Issue: package libgps contains bad RPATH
> +  /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/=
image/usr/lib
> +  in file
> +  /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/=
packages-split/libgps/usr/lib/libgps.so.20.0
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> +---
> + SConstruct |    7 +++++--
> + 1 files changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index a1bddb9..3e7c607 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -1205,8 +1205,11 @@ if qt_env:
> +=20
> + # We don't use installdir here in order to avoid having DESTDIR affect =
the rpath
> + if env["shared"] and env["chrpath"]:
> +-    env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
> +-                      % (installdir('libdir', False), ))
> ++    if not env['sysroot']:
> ++        env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
> ++                          % (installdir('libdir', False), ))
> ++    else:
> ++        env.AddPostAction(binaryinstall, '$CHRPATH -d "$TARGET"')
> +=20
> + if not env['debug'] and not env['profiling'] and env['strip']:
> +     env.AddPostAction(binaryinstall, '$STRIP $TARGET')
> +--=20
> +1.7.5.4
> +
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd.inc b/meta-oe/recipes-n=
avigation/gpsd/gpsd.inc
> new file mode 100644
> index 0000000..ecff14c
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd.inc
> @@ -0,0 +1,179 @@
> +SUMMARY =3D "Daemon that parses and shares GPS devices"
> +DESCRIPTION =3D "gpsd is a service daemon that monitors one or more GPSe=
s or AIS receivers attached to a host computer \
> +through serial or USB ports, making all data on the location/course/velo=
city of the sensors available to be queried \
> +via TCP, messagebus, or shared memory"
> +AUTHOR =3D "Authors: Eric S. Raymond, Chris Kuethe, Gary Miller. Former =
authors whose bits have been plowed under by \
> +code turnover: Remco Treffcorn, Derrick Brashear, Russ Nelson."
> +HOMEPAGE =3D "http://www.catb.org/gpsd/"
> +SECTION =3D "console/network"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd217a23f408e91c94359447735bc1=
800"
> +DEPENDS =3D "dbus dbus-glib ncurses python libusb1 chrpath-replacement-n=
ative"
> +PROVIDES =3D "virtual/gpsd"
> +
> +EXTRANATIVEPATH +=3D "chrpath-native"
> +
> +# override gpsd-default to select device other than /dev/ttyS0
> +
> +SRC_URI =3D "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz=
 \
> +    file://gpsd-default \
> +    file://gpsd \
> +    file://60-gpsd.rules \
> +    file://gpsd.service \
> +"
> +
> +inherit scons update-rc.d python-dir pythonnative systemd
> +
> +INITSCRIPT_NAME =3D "gpsd"
> +INITSCRIPT_PARAMS =3D "defaults 35"
> +
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +
> +
> +SYSTEMD_OESCONS =3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'tru=
e', 'false',d)}"
> +
> +PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bl=
uez', '', d)}"
> +PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', =
'', d)}"
> +PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'usbhost', 'usb'=
, '', d)}"
> +# TODO: handle udev support automatically
> +
> +include supported-chipsets.inc
> +
> +# CONNECTIVITY
> +PACKAGECONFIG[bluez] =3D "bluez=3D'true',bluez=3D'false',bluez4"
> +PACKAGECONFIG[ipv6] =3D "ipv6=3D'true',ipv6=3D'false',"
> +PACKAGECONFIG[usb] =3D "usb=3D'true',usb=3D'false',udev libusb"
> +
> +# RECEIVERS
> +PACKAGECONFIG[ashtech] =3D "ashtech=3D'true',ashtech=3D'false'"
> +PACKAGECONFIG[earthmate] =3D "earthmate=3D'true',earthmate=3D'false'"
> +PACKAGECONFIG[evermore] =3D "evermore=3D'true',evermore=3D'false'"
> +PACKAGECONFIG[fury] =3D "fury=3D'true',fury=3D'false'"
> +PACKAGECONFIG[fv18] =3D "fv18=3D'true',fv18=3D'false'"
> +PACKAGECONFIG[garmin] =3D "garmin=3D'true',garmin=3D'false'"
> +PACKAGECONFIG[garmintxt] =3D "garmintxt=3D'true',garmintxt=3D'false'"
> +PACKAGECONFIG[geostar] =3D "geostar=3D'true',geostar=3D'false'"
> +PACKAGECONFIG[itrax] =3D "itrax=3D'true',itrax=3D'false'"
> +PACKAGECONFIG[mtk3301] =3D "mtk3301=3D'true',mtk3301=3D'false'"
> +PACKAGECONFIG[navcom] =3D "navcom=3D'true',navcom=3D'false'"
> +PACKAGECONFIG[ntrip] =3D "ntrip=3D'true',ntrip=3D'false'"
> +PACKAGECONFIG[oceanserver] =3D "oceanserver=3D'true',oceanserver=3D'fals=
e'"
> +PACKAGECONFIG[oncore] =3D "oncore=3D'true',oncore=3D'false'"
> +PACKAGECONFIG[rtcm104v2] =3D "rtcm104v2=3D'true',rtcm104v2=3D'false'"
> +PACKAGECONFIG[rtcm104v3] =3D "rtcm104v3=3D'true',rtcm104v3=3D'false'"
> +PACKAGECONFIG[sirf] =3D "sirf=3D'true',sirf=3D'false'"
> +PACKAGECONFIG[superstar2] =3D "superstar2=3D'true',superstar2=3D'false'"
> +PACKAGECONFIG[tnt] =3D "tnt=3D'true',tnt=3D'false'"
> +PACKAGECONFIG[tripmate] =3D "tripmate=3D'true',tripmate=3D'false'"
> +PACKAGECONFIG[tsip] =3D "tsip=3D'true',tsip=3D'false'"
> +PACKAGECONFIG[ublox] =3D "ublox=3D'true',ublox=3D'false'"
> +
> +
> +EXTRA_OESCONS =3D " \
> +    sysroot=3D${STAGING_DIR_TARGET} \
> +    libQgpsmm=3D'false' \
> +    debug=3D'true' \
> +    strip=3D'false' \
> +    systemd=3D'${SYSTEMD_OESCONS}' \
> +    ${EXTRA_OECONF} \
> +"
> +# this cannot be used, because then chrpath is not found and only static=
 lib is built
> +# target=3D${HOST_SYS}
> +
> +do_compile_prepend() {
> +    export PKG_CONFIG_PATH=3D"${PKG_CONFIG_PATH}"
> +    export PKG_CONFIG=3D"PKG_CONFIG_SYSROOT_DIR=3D\"${PKG_CONFIG_SYSROOT=
_DIR}\" pkg-config"
> +    export STAGING_PREFIX=3D"${STAGING_DIR_HOST}/${prefix}"
> +
> +    export BUILD_SYS=3D"${BUILD_SYS}"
> +    export HOST_SYS=3D"${HOST_SYS}"
> +}
> +
> +do_install() {
> +    export PKG_CONFIG_PATH=3D"${PKG_CONFIG_PATH}"
> +    export PKG_CONFIG=3D"PKG_CONFIG_SYSROOT_DIR=3D\"${PKG_CONFIG_SYSROOT=
_DIR}\" pkg-config"
> +    export STAGING_PREFIX=3D"${STAGING_DIR_HOST}/${prefix}"
> +
> +    export BUILD_SYS=3D"${BUILD_SYS}"
> +    export HOST_SYS=3D"${HOST_SYS}"
> +
> +    export DESTDIR=3D"${D}"
> +    # prefix is used for RPATH and DESTDIR/prefix for instalation
> +    ${STAGING_BINDIR_NATIVE}/scons prefix=3D${prefix} install ${EXTRA_OE=
SCONS}|| \
> +      bbfatal "scons install execution failed."
> +}
> +
> +do_install_append() {
> +    install -d ${D}/${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
> +    install -d ${D}/${sysconfdir}/default
> +    install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/g=
psd.default
> +
> +    #support for udev
> +    install -d ${D}/${sysconfdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rul=
es.d
> +    install -d ${D}${base_libdir}/udev/
> +    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
> +
> +    #support for python
> +    install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
> +    install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
> +
> +    #support for systemd
> +    install -d ${D}${systemd_unitdir}/system/
> +    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/syst=
em/${PN}.service
> +    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/sys=
tem/${PN}.socket
> +}
> +
> +pkg_postinst_${PN}-conf() {
> +    update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaul=
ts ${sysconfdir}/default/gpsd.default 10
> +}
> +
> +pkg_postrm_${PN}-conf() {
> +    update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gps=
d.default
> +}
> +
> +# Note: you probably want executables "gpsd", "gpsctl", "gpsmon" and lib=
rary "libgps".
> +# Select package "gpsd" for the former; add "libgps" for library support=
=2E "libgpsd" is generally not needed.
> +# Add "gpsd-udev" for hot-plug support. TODO: automatically add udev sup=
port when udev is a DISTRO_FEATURE.
> +
> +PACKAGES =3D+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gp=
sd-conf gpsd-gpsctl gps-utils"
> +
> +FILES_${PN}-dev +=3D "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfd=
ir/libgps.pc"
> +
> +FILES_python-pygps-dbg +=3D " ${libdir}/python*/site-packages/gps/.debug"
> +
> +RDEPENDS_${PN} =3D "gpsd-gpsctl"
> +RRECOMMENDS_${PN} =3D "gpsd-conf"
> +
> +SUMMARY_gpsd-udev =3D "udev relevant files to use gpsd hotplugging"
> +FILES_gpsd-udev =3D "${base_libdir}/udev ${sysconfdir}/udev/*"
> +RDEPENDS_gpsd-udev +=3D "udev gpsd-conf"
> +
> +SUMMARY_libgpsd =3D "C service library which supports querying GPS devic=
es directly; used by gpsd."
> +FILES_libgpsd =3D "${libdir}/libgpsd.so.*"
> +
> +SUMMARY_libgps =3D "C service library which supports communicating with =
an instance of the gpsd; almost certainly what you want."
> +FILES_libgps =3D "${libdir}/libgps.so.*"
> +
> +SUMMARY_gpsd-conf =3D "gpsd configuration files and init scripts"
> +FILES_gpsd-conf =3D "${sysconfdir}"
> +CONFFILES_gpsd-conf =3D "${sysconfdir}/default/gpsd.default"
> +
> +SUMMARY_gpsd-gpsctl =3D "Tools for controlling GPS via gpsd or directly =
and monitoring PPS status"
> +FILES_gpsd-gpsctl =3D "${bindir}/gpsctl ${bindir}/gpsmon"
> +
> +SUMMARY_gps-utils =3D "Utils used for simulating, monitoring,... a GPS (=
requires python)"
> +FILES_gps-utils =3D "${bindir}/*"
> +RDEPENDS_gps-utils =3D "python-pygps"
> +
> +SUMMARY_python-pygps =3D "Python bindings to gpsd"
> +FILES_python-pygps =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> +RDEPENDS_python-pygps =3D "python-core python-curses gpsd python-json"
> +
> +
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +RREPLACES_${PN} +=3D "${PN}-systemd"
> +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "${PN}.socket"
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/recip=
es-navigation/gpsd/gpsd_3.10.bb
> new file mode 100644
> index 0000000..715b5a7
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> @@ -0,0 +1,15 @@
> +include gpsd.inc
> +
> +# patches are version-specific, although currently these are the same as=
 those in 3.7
> +SRC_URI_append =3D "\
> +    file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.pat=
ch \
> +    file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
> +    file://0004-SConstruct-remove-rpath.patch \
> +"
> +
> +PR =3D "r1"
> +
> +SRC_URI[md5sum] =3D "fc5b03aae38b9b5b6880b31924d0ace3"
> +SRC_URI[sha256sum] =3D "706fc2c1cf3dfbf87c941f543381bccc9c4dc9f8240eec40=
7dcbf2f70b854320"
> +
> +
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipe=
s-navigation/gpsd/gpsd_3.7.bb
> index 97f3354..6b5e456 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> @@ -1,139 +1,13 @@
> -SUMMARY =3D "A TCP/IP Daemon simplifying the communication with GPS devi=
ces"
> -SECTION =3D "console/network"
> -LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd217a23f408e91c94359447735bc1=
800"
> -DEPENDS =3D "dbus dbus-glib ncurses python libusb1 chrpath-replacement-n=
ative"
> -PROVIDES =3D "virtual/gpsd"
> +include gpsd.inc
> =20
> -EXTRANATIVEPATH +=3D "chrpath-native"
> -
> -PR =3D "r14"
> -
> -SRC_URI =3D "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz=
 \
> +# assume patches are version-specific
> +SRC_URI_append =3D "\
> +    file://0001-SConstruct-disable-html-and-man-docs-building-becaus.pat=
ch \
> +    file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.pat=
ch \
>      file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
>      file://0004-SConstruct-remove-rpath.patch \
> -    file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.pat=
ch \
> -    file://0001-SConstruct-disable-html-and-man-docs-building-becaus.pat=
ch \
> -    file://gpsd-default \
> -    file://gpsd \
> -    file://60-gpsd.rules \
> -    file://gpsd.service \
>  "
> +PR =3D "r15"
> +
>  SRC_URI[md5sum] =3D "52d9785eaf1a51298bb8900dbde88f98"
>  SRC_URI[sha256sum] =3D "7800c478ee9d7ca7a502b0f892828561b1fbf7bc69d9d38c=
447c82c3628302ac"
> -
> -inherit scons update-rc.d python-dir pythonnative systemd
> -
> -INITSCRIPT_NAME =3D "gpsd"
> -INITSCRIPT_PARAMS =3D "defaults 35"
> -
> -SYSTEMD_OESCONS =3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'tru=
e', 'false',d)}"
> -
> -export STAGING_INCDIR
> -export STAGING_LIBDIR
> -
> -PACKAGECONFIG ??=3D "bluez"
> -PACKAGECONFIG[bluez] =3D "bluez=3D'true',bluez=3D'false',bluez4"
> -
> -EXTRA_OESCONS =3D " \
> -    sysroot=3D${STAGING_DIR_TARGET} \
> -    libQgpsmm=3D'false' \
> -    debug=3D'true' \
> -    strip=3D'false' \
> -    systemd=3D'${SYSTEMD_OESCONS}' \
> -    ${EXTRA_OECONF} \
> -"
> -# this cannot be used, because then chrpath is not found and only static=
 lib is built
> -# target=3D${HOST_SYS}
> -
> -do_compile_prepend() {
> -    export PKG_CONFIG_PATH=3D"${PKG_CONFIG_PATH}"
> -    export PKG_CONFIG=3D"PKG_CONFIG_SYSROOT_DIR=3D\"${PKG_CONFIG_SYSROOT=
_DIR}\" pkg-config"
> -    export STAGING_PREFIX=3D"${STAGING_DIR_HOST}/${prefix}"
> -
> -    export BUILD_SYS=3D"${BUILD_SYS}"
> -    export HOST_SYS=3D"${HOST_SYS}"
> -}
> -
> -do_install() {
> -    export PKG_CONFIG_PATH=3D"${PKG_CONFIG_PATH}"
> -    export PKG_CONFIG=3D"PKG_CONFIG_SYSROOT_DIR=3D\"${PKG_CONFIG_SYSROOT=
_DIR}\" pkg-config"
> -    export STAGING_PREFIX=3D"${STAGING_DIR_HOST}/${prefix}"
> -
> -    export BUILD_SYS=3D"${BUILD_SYS}"
> -    export HOST_SYS=3D"${HOST_SYS}"
> -
> -    export DESTDIR=3D"${D}"
> -    # prefix is used for RPATH and DESTDIR/prefix for instalation
> -    ${STAGING_BINDIR_NATIVE}/scons prefix=3D${prefix} install ${EXTRA_OE=
SCONS}|| \
> -      bbfatal "scons install execution failed."
> -}
> -
> -do_install_append() {
> -    install -d ${D}/${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
> -    install -d ${D}/${sysconfdir}/default
> -    install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/g=
psd.default
> -
> -    #support for udev
> -    install -d ${D}/${sysconfdir}/udev/rules.d
> -    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rul=
es.d
> -    install -d ${D}${base_libdir}/udev/
> -    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
> -
> -    #support for python
> -    install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
> -    install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
> -
> -    #support for systemd
> -    install -d ${D}${systemd_unitdir}/system/
> -    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/syst=
em/${PN}.service
> -    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/sys=
tem/${PN}.socket
> -}
> -
> -pkg_postinst_${PN}-conf() {
> -    update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaul=
ts ${sysconfdir}/default/gpsd.default 10
> -}
> -
> -pkg_postrm_${PN}-conf() {
> -    update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gps=
d.default
> -}
> -
> -PACKAGES =3D+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gp=
sd-conf gpsd-gpsctl gps-utils"
> -
> -FILES_${PN}-dev +=3D "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfd=
ir/libgps.pc"
> -
> -FILES_python-pygps-dbg +=3D " ${libdir}/python*/site-packages/gps/.debug"
> -
> -RDEPENDS_${PN} =3D "gpsd-gpsctl"
> -RRECOMMENDS_${PN} =3D "gpsd-conf gpsd-udev gpsd-machine-conf"
> -
> -SUMMARY_gpsd-udev =3D "udev relevant files to use gpsd hotplugging"
> -FILES_gpsd-udev =3D "${base_libdir}/udev ${sysconfdir}/udev/*"
> -RDEPENDS_gpsd-udev +=3D "udev gpsd-conf"
> -
> -SUMMARY_libgpsd =3D "C service library used for communicating with gpsd"
> -FILES_libgpsd =3D "${libdir}/libgpsd.so.*"
> -
> -SUMMARY_libgps =3D "C service library used for communicating with gpsd"
> -FILES_libgps =3D "${libdir}/libgps.so.*"
> -
> -SUMMARY_gpsd-conf =3D "gpsd configuration files and init scripts"
> -FILES_gpsd-conf =3D "${sysconfdir}"
> -CONFFILES_gpsd-conf =3D "${sysconfdir}/default/gpsd.default"
> -
> -SUMMARY_gpsd-gpsctl =3D "Tool for tweaking GPS modes"
> -FILES_gpsd-gpsctl =3D "${bindir}/gpsctl"
> -
> -SUMMARY_gps-utils =3D "Utils used for simulating, monitoring,... a GPS"
> -FILES_gps-utils =3D "${bindir}/*"
> -RDEPENDS_gps-utils =3D "python-pygps"
> -
> -SUMMARY_python-pygps =3D "Python bindings to gpsd"
> -FILES_python-pygps =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> -RDEPENDS_python-pygps =3D "python-core python-curses gpsd python-json"
> -
> -RPROVIDES_${PN} +=3D "${PN}-systemd"
> -RREPLACES_${PN} +=3D "${PN}-systemd"
> -RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "${PN}.socket"
> diff --git a/meta-oe/recipes-navigation/gpsd/supported-chipsets.inc b/met=
a-oe/recipes-navigation/gpsd/supported-chipsets.inc
> new file mode 100644
> index 0000000..dee898b
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/supported-chipsets.inc
> @@ -0,0 +1,28 @@
> +# gpsd probes for various binary chipsets in a predefined search order. =
To minimize build size
> +# and protocol probe time, override this file using .bbappend and remove=
 any unwanted chipsets
> +# For a list of all features run "scons -h"
> +# "nmea", "nmea2000" and "aivdm" (required for nmea2000) are always incl=
uded
> +
> +PACKAGECONFIG +=3D "ashtech"
> +PACKAGECONFIG +=3D "earthmate"
> +PACKAGECONFIG +=3D "evermore"
> +PACKAGECONFIG +=3D "fury"
> +PACKAGECONFIG +=3D "fv18"
> +PACKAGECONFIG +=3D "garmin"
> +PACKAGECONFIG +=3D "garmintxt"
> +PACKAGECONFIG +=3D "geostar"
> +PACKAGECONFIG +=3D "itrax"
> +PACKAGECONFIG +=3D "mtk3301"
> +PACKAGECONFIG +=3D "navcom"
> +PACKAGECONFIG +=3D "ntrip"
> +PACKAGECONFIG +=3D "oceanserver"
> +PACKAGECONFIG +=3D "oncore"
> +PACKAGECONFIG +=3D "rtcm104v2"
> +PACKAGECONFIG +=3D "rtcm104v3"
> +PACKAGECONFIG +=3D "sirf"
> +PACKAGECONFIG +=3D "superstar2"
> +PACKAGECONFIG +=3D "tnt"
> +PACKAGECONFIG +=3D "tripmate"
> +PACKAGECONFIG +=3D "tsip"
> +PACKAGECONFIG +=3D "ublox"
> +
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN7xf0ACgkQN1Ujt2V2gBw+lQCfajqbuk4pRndGyJnE+jCAOIkV
A4IAnRL0HXbuup522jA9hAine35WIlyB
=8/vl
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
