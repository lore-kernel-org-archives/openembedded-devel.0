Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4C74F71633
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2015 06:35:37 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so69826739wgy.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=lQjhf4uxDiS8aKKMTQ410MbIAEkyBOhbCqqhDYUG4dI=;
	b=aVQ75MH41KQ3iEV1y3VFU6Q4Xf77Xv0+SrCmCspm4DM7FRCKYjMY6If39YdRbGOrsc
	WY5VWytiLykEZfaXkjAus4lC76Wqj7pR8m9k+b4buYakmLOczaa7LvHTexg2GnDwnQXO
	4sqyIFlJzyJn21rMh/jYpJbPveELJPKoih2MbJYhPDQJV83eG8WnW570lRH7sg0GJTtf
	tSL2QyiXyCS28FXvLWVg8EoCJT0TcGONGfj0/OaeVC63S8tuBgiwNcpKo2XsRonyVi3z
	0ihcTSIyBr3P0vlsXSRoNiIGLdgfsCk8XtrUFxdL44jXIU5SPfbBi0SCqpYSLs67+veH
	PiYQ==
X-Received: by 10.194.7.97 with SMTP id i1mr3840718wja.107.1429943738400;
	Fri, 24 Apr 2015 23:35:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id dq4sm1998163wid.17.2015.04.24.23.35.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Apr 2015 23:35:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 25 Apr 2015 08:36:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150425063615.GA2357@jama>
References: <1429807713-14290-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1429807713-14290-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] gpsd: Update to 3.14.
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
X-List-Received-Date: Sat, 25 Apr 2015 06:35:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2015 at 12:48:33PM -0400, Philip Balister wrote:
>  * _NO_ATOMICS patches are from upstream
>  * Update the SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
>  * Fix some QA warnings
>  * Add PACKAGECONFIG for qt support

This breaks navit:
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/na=
vit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c: In func=
tion 'vehicle_gpsd_callback':
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/na=
vit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c:130:40: =
error: 'struct gps_data_t' has no member named 'ss'
|                                 if (data->ss[i] > 0)
|                                         ^
can you check if upgrading navit fixes the issue?

>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  ..._STDC_NO_ATOMICS__-before-using-stdatomic.patch | 25 ++++++++++
>  ...refix-includepy-with-sysroot-and-drop-sy.patch} | 18 +++----
>  ...struct-respect-sysroot-also-in-SPLINTOPTS.patch |  0
>  ...for-C11-and-check-we-have-C11-before-usin.patch | 57 ++++++++++++++++=
++++++
>  .../0002-SConstruct-remove-rpath.patch             |  0
>  ...k-for-C11-not-for-not-C11-in-stdatomic.h-.patch | 26 ++++++++++
>  ...disable-html-and-man-docs-building-becaus.patch |  0
>  .../gpsd/{gpsd_3.10.bb =3D> gpsd_3.14.bb}            | 17 ++++---
>  8 files changed, 128 insertions(+), 15 deletions(-)
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-=
for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch
>  rename meta-oe/recipes-navigation/gpsd/{gpsd-3.10/0003-SConstruct-prefix=
-includepy-with-sysroot-and-drop-sy.patch =3D> gpsd-3.14/0001-SConstruct-pr=
efix-includepy-with-sysroot-and-drop-sy.patch} (86%)
>  rename meta-oe/recipes-navigation/gpsd/{gpsd-3.10 =3D> gpsd-3.14}/0001-S=
Construct-respect-sysroot-also-in-SPLINTOPTS.patch (100%)
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-=
test-for-C11-and-check-we-have-C11-before-usin.patch
>  rename meta-oe/recipes-navigation/gpsd/{gpsd-3.10 =3D> gpsd-3.14}/0002-S=
Construct-remove-rpath.patch (100%)
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops=
-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch
>  rename meta-oe/recipes-navigation/gpsd/{gpsd-3.10 =3D> gpsd-3.14}/0004-S=
Construct-disable-html-and-man-docs-building-becaus.patch (100%)
>  rename meta-oe/recipes-navigation/gpsd/{gpsd_3.10.bb =3D> gpsd_3.14.bb} =
(87%)
>=20
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__S=
TDC_NO_ATOMICS__-before-using-stdatomic.patch b/meta-oe/recipes-navigation/=
gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.pa=
tch
> new file mode 100644
> index 0000000..82ac5aa
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Check-for-__STDC_NO_=
ATOMICS__-before-using-stdatomic.patch
> @@ -0,0 +1,25 @@
> +From c30716be9e615513fe66993fd3cdc818c3d70410 Mon Sep 17 00:00:00 2001
> +From: "Gary E. Miller" <gem@rellim.com>
> +Date: Sun, 15 Mar 2015 11:51:45 -0700
> +Subject: [PATCH 1/3] Check for __STDC_NO_ATOMICS__ before using stdatomi=
c.h
> +
> +---
> + SConstruct | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index adf473d..566c14a 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -633,7 +633,7 @@ else:
> +         announce("You do not have kernel CANbus available.")
> +         env["nmea2000"] =3D False
> +=20
> +-    if config.CheckHeader("stdatomic.h"):
> ++    if not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and confi=
g.CheckHeader("stdatomic.h"):
> +         confdefs.append("#define HAVE_STDATOMIC_H 1\n")
> +     else:
> + 	confdefs.append("/* #undef HAVE_STDATOMIC_H */\n")
> +--=20
> +2.1.0
> +
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0003-SConstruct-pr=
efix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/=
gpsd/gpsd-3.14/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.pa=
tch
> similarity index 86%
> rename from meta-oe/recipes-navigation/gpsd/gpsd-3.10/0003-SConstruct-pre=
fix-includepy-with-sysroot-and-drop-sy.patch
> rename to meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-prefi=
x-includepy-with-sysroot-and-drop-sy.patch
> index 1d8c14b..2ea3226 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0003-SConstruct-prefix-in=
cludepy-with-sysroot-and-drop-sy.patch
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-prefix-in=
cludepy-with-sysroot-and-drop-sy.patch
> @@ -1,8 +1,8 @@
> -From ad7b06d375730b30f181c5efb3bf21418f296f73 Mon Sep 17 00:00:00 2001
> +From 1e2cea8945bc2183fbe1a012dcd633a352125952 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Tue, 24 Apr 2012 18:45:14 +0200
> -Subject: [PATCH 3/4] SConstruct: prefix includepy with sysroot and drop
> - sysroot from python_lib_dir
> +Subject: [PATCH] SConstruct: prefix includepy with sysroot and drop sysr=
oot
> + from python_lib_dir
> =20
>  * without PYTHONPATH, distutil's sysconfig returns INCLUDEPY without sys=
root prefix
>    and with PYTHONPATH from OE it's pointing to native python dir
> @@ -39,10 +39,10 @@ Signed-off-by: Peter A. Bigot <pab@pabigot.com>
>   1 file changed, 9 insertions(+)
> =20
>  diff --git a/SConstruct b/SConstruct
> -index ff46713..0e518e7 100644
> +index 6c93311..cde8b3d 100644
>  --- a/SConstruct
>  +++ b/SConstruct
> -@@ -1089,6 +1089,12 @@ else:
> +@@ -1148,6 +1148,12 @@ else:
>           basecflags +=3D ' -coverage'
>           ldflags +=3D ' -coverage'
>           ldshared +=3D ' -coverage'
> @@ -55,15 +55,15 @@ index ff46713..0e518e7 100644
>       # in case CC/CXX was set to the scan-build wrapper,
>       # ensure that we build the python modules with scan-build, too
>       if env['CC'] is None or env['CC'].find('scan-build') < 0:
> -@@ -1353,11 +1359,14 @@ if not env['python']:
> +@@ -1408,11 +1414,14 @@ if not env['python']:
>       python_install =3D []
>   else:
> -     python_lib_dir =3D sysconfig.get_python_lib(plat_specific=3D1)
> +     python_lib_dir =3D env['python_libdir']
>  +    python_lib_dir =3D python_lib_dir.replace(env['sysroot'], '')
>       python_module_dir =3D python_lib_dir + os.sep + 'gps'
>       python_extensions_install =3D python_env.Install( DESTDIR + python_=
module_dir,
>                                                       python_built_extens=
ions)
> -     if not env['debug'] and not env['profiling'] and env['strip']:
> +     if not env['debug'] and not env['profiling'] and not env['nostrip']=
 and not sys.platform.startswith('darwin'):
>           python_env.AddPostAction(python_extensions_install, '$STRIP $TA=
RGET')
>  +    env.AddPostAction(python_extensions_install, '$CHRPATH -r "%s" "$TA=
RGET"' \
>  +                     % (python_lib_dir, ))
> @@ -71,5 +71,5 @@ index ff46713..0e518e7 100644
>       python_modules_install =3D python_env.Install( DESTDIR + python_mod=
ule_dir,
>                                                   python_modules)
>  --=20
> -1.8.5.5
> +2.1.0
> =20
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-re=
spect-sysroot-also-in-SPLINTOPTS.patch b/meta-oe/recipes-navigation/gpsd/gp=
sd-3.14/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
> similarity index 100%
> rename from meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-res=
pect-sysroot-also-in-SPLINTOPTS.patch
> rename to meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-SConstruct-respe=
ct-sysroot-also-in-SPLINTOPTS.patch
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-fo=
r-C11-and-check-we-have-C11-before-usin.patch b/meta-oe/recipes-navigation/=
gpsd/gpsd-3.14/0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.pa=
tch
> new file mode 100644
> index 0000000..22ee1bd
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-Add-a-test-for-C11-a=
nd-check-we-have-C11-before-usin.patch
> @@ -0,0 +1,57 @@
> +From 99444b3d2c4a4f7fd7128e60461005780d0c5c83 Mon Sep 17 00:00:00 2001
> +From: "Gary E. Miller" <gem@rellim.com>
> +Date: Sun, 15 Mar 2015 12:05:15 -0700
> +Subject: [PATCH 2/3] Add a test for C11 and check we have C11 before usi=
ng
> + stdatomic.h
> +
> +---
> + SConstruct | 19 ++++++++++++++++++-
> + 1 file changed, 18 insertions(+), 1 deletion(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index 566c14a..faa8651 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -473,6 +473,20 @@ def CheckCompilerDefines(context, define):
> +     context.Result(ret)
> +     return ret
> +=20
> ++# Check if this compiler is C11 or better
> ++def CheckC11(context):
> ++    context.Message( 'Checking if compiler is C11 ...' )
> ++    ret =3D context.TryLink("""
> ++	#if (__STDC_VERSION__ < 201112L)=20
> ++        #error Not C11
> ++        #endif
> ++        int main(int argc, char **argv) {
> ++            return 0;
> ++        }
> ++    """,'.c')
> ++    context.Result(ret)
> ++    return ret
> ++
> + def GetLoadPath(context):
> +     context.Message("Getting system load path ...")
> +=20
> +@@ -491,6 +505,7 @@ else:
> +                                              'CheckXsltproc' : CheckXsl=
tproc,
> +                                              'CheckCompilerOption' : Ch=
eckCompilerOption,
> +                                              'CheckCompilerDefines' : C=
heckCompilerDefines,
> ++                                             'CheckC11' : CheckC11,
> +                                              'CheckHeaderDefines' : Che=
ckHeaderDefines})
> +=20
> +=20
> +@@ -633,7 +648,9 @@ else:
> +         announce("You do not have kernel CANbus available.")
> +         env["nmea2000"] =3D False
> +=20
> +-    if not config.CheckCompilerDefines("__STDC_NO_ATOMICS__") and confi=
g.CheckHeader("stdatomic.h"):
> ++    # check for C11 or better, and __STDC__NO_ATOMICS__ is no defined
> ++    # before looking for stdatomic.h
> ++    if not config.CheckC11() and  not config.CheckCompilerDefines("__ST=
DC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
> +         confdefs.append("#define HAVE_STDATOMIC_H 1\n")
> +     else:
> + 	confdefs.append("/* #undef HAVE_STDATOMIC_H */\n")
> +--=20
> +2.1.0
> +
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-re=
move-rpath.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-SConstruc=
t-remove-rpath.patch
> similarity index 100%
> rename from meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-rem=
ove-rpath.patch
> rename to meta-oe/recipes-navigation/gpsd/gpsd-3.14/0002-SConstruct-remov=
e-rpath.patch
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-=
for-C11-not-for-not-C11-in-stdatomic.h-.patch b/meta-oe/recipes-navigation/=
gpsd/gpsd-3.14/0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.pa=
tch
> new file mode 100644
> index 0000000..8bb0928
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0003-Whoops-check-for-C11=
-not-for-not-C11-in-stdatomic.h-.patch
> @@ -0,0 +1,26 @@
> +From 674c50ee54fd7cd304e8b3c4b33d3ff1272ed191 Mon Sep 17 00:00:00 2001
> +From: "Gary E. Miller" <gem@rellim.com>
> +Date: Sun, 15 Mar 2015 12:17:51 -0700
> +Subject: [PATCH 3/3] Whoops, check for C11, not for not C11 in stdatomic=
=2Eh
> + test.
> +
> +---
> + SConstruct | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index faa8651..f4ea145 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -650,7 +650,7 @@ else:
> +=20
> +     # check for C11 or better, and __STDC__NO_ATOMICS__ is no defined
> +     # before looking for stdatomic.h
> +-    if not config.CheckC11() and  not config.CheckCompilerDefines("__ST=
DC_NO_ATOMICS__") and config.CheckHeader("stdatomic.h"):
> ++    if config.CheckC11() and  not config.CheckCompilerDefines("__STDC_N=
O_ATOMICS__") and config.CheckHeader("stdatomic.h"):
> +         confdefs.append("#define HAVE_STDATOMIC_H 1\n")
> +     else:
> + 	confdefs.append("/* #undef HAVE_STDATOMIC_H */\n")
> +--=20
> +2.1.0
> +
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-di=
sable-html-and-man-docs-building-becaus.patch b/meta-oe/recipes-navigation/=
gpsd/gpsd-3.14/0004-SConstruct-disable-html-and-man-docs-building-becaus.pa=
tch
> similarity index 100%
> rename from meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-dis=
able-html-and-man-docs-building-becaus.patch
> rename to meta-oe/recipes-navigation/gpsd/gpsd-3.14/0004-SConstruct-disab=
le-html-and-man-docs-building-becaus.patch
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/recip=
es-navigation/gpsd/gpsd_3.14.bb
> similarity index 87%
> rename from meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> rename to meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> index 93cf1ae..f92d132 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> @@ -10,15 +10,18 @@ EXTRANATIVEPATH +=3D "chrpath-native"
>  SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>      file://0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
>      file://0002-SConstruct-remove-rpath.patch \
> -    file://0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.pat=
ch \
> +    file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.pat=
ch \
>      file://0004-SConstruct-disable-html-and-man-docs-building-becaus.pat=
ch \
> +    file://0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.pat=
ch \
> +    file://0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.pat=
ch \
> +    file://0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.pat=
ch \
>      file://gpsd-default \
>      file://gpsd \
>      file://60-gpsd.rules \
>      file://gpsd.service \
>  "
> -SRC_URI[md5sum] =3D "fc5b03aae38b9b5b6880b31924d0ace3"
> -SRC_URI[sha256sum] =3D "706fc2c1cf3dfbf87c941f543381bccc9c4dc9f8240eec40=
7dcbf2f70b854320"
> +SRC_URI[md5sum] =3D "bc7467009b99e07ba461377b5da6c039"
> +SRC_URI[sha256sum] =3D "504fc812f3c1525a1a48e04bf4d77f9a8066c201448d9808=
9df89d58ef53a8cb"
> =20
>  inherit scons update-rc.d python-dir pythonnative systemd bluetooth
> =20
> @@ -30,14 +33,15 @@ SYSTEMD_OESCONS =3D "${@base_contains('DISTRO_FEATURE=
S', 'systemd', 'true', 'false
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
> =20
> -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'bluetooth', '$=
{BLUEZ}', '', d)}"
> +PACKAGECONFIG ??=3D "qt ${@base_contains('DISTRO_FEATURES', 'bluetooth',=
 '${BLUEZ}', '', d)}"
>  PACKAGECONFIG[bluez4] =3D "bluez=3D'true',bluez=3D'false',bluez4"
> -
> +PACKAGECONFIG[qt] =3D "qt=3D'yes',qt=3D'no',qt4-x11-free"
>  EXTRA_OESCONS =3D " \
>      sysroot=3D${STAGING_DIR_TARGET} \
>      libQgpsmm=3D'false' \
>      debug=3D'true' \
>      strip=3D'false' \
> +    chrpath=3D'yes' \
>      systemd=3D'${SYSTEMD_OESCONS}' \
>      ${EXTRA_OECONF} \
>  "
> @@ -99,7 +103,8 @@ pkg_postrm_${PN}-conf() {
> =20
>  PACKAGES =3D+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gp=
sd-conf gpsd-gpsctl gps-utils"
> =20
> -FILES_${PN}-dev +=3D "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfd=
ir/libgps.pc"
> +FILES_${PN}-dev +=3D "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfd=
ir/libgps.pc \
> +                    ${libdir}/libQgpsmm.prl"
> =20
>  FILES_python-pygps-dbg +=3D " ${libdir}/python*/site-packages/gps/.debug"
> =20
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

