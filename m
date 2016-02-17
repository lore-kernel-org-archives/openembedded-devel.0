Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2042A6E668
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:44:39 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id g62so47657866wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TP//HZMdDmZGPm90VVuKGu9ceESk4GGK1feRbIqa3JY=;
	b=iLryqdvwOn6rtDoC8zYQlohDjuFQov7IwXUFAFv9WdAbh790/pyqnsT2VD5omDq5Qf
	GfatJxjYkT97SXOgbKOYFm2X9yBuGSRUdBnrM3qsAmLJw6wosPBRi+ZLujCJ6ZB8/NPR
	5NIEEzqDUgvFnW745ExTTmfOpHb/qn1B1wwD4gzA4aQQK0mj0CpOMCxp5Nykf+5VKTap
	D2sT0R1+gVHenuPJoAgeKxshrRtD7rd2SvaUw3QKb3iYotcHfhM6RzlpDXRauwV0Vogw
	w/hphfLuJnn0agSGdV5kAb4OKE5zbEqoyaADAQY1ICjVRF9FpDlzJYwzTUfJOg7eCYPB
	nDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=TP//HZMdDmZGPm90VVuKGu9ceESk4GGK1feRbIqa3JY=;
	b=S88AyHjY/WHurRPz48zyJtJipX/pdGFw+wkzzoq68k2kZcmpQPRncmSyFY7JVS6HPC
	mhF/TP86ZhuADcJvPBT23PtpYN7NLjoP7YSOe/RJ7VWLnZlm2qaSAidzsW4iCQiaSRPX
	yNI//ds1ZjrgyyS23KvbHKfH3Nqo5XmiNLsG83IhUY7NuIbuTMrx+Ei0MfZjAbS8vKd4
	KL+8kDONZQ0oo3Tvohoi4tWStm2CFcv7KXrBvCzGIvKZAzRBumtW9BMAdGCV68Jm37f+
	URgiMLFyxenMqs7K3e+rYxiUVgjQ7aUHfpnAMzu3DA3cn7KFc2rmt8vfBBds2q6Iev8R
	5DsA==
X-Gm-Message-State: AG10YOS2mM0zaF58hUAK+5BVgeW2EOJJf929Iv6FVfHOfXoyMx0FdOKjAWxvnxWy2UiwRw==
X-Received: by 10.28.102.69 with SMTP id a66mr24035585wmc.8.1455745479900;
	Wed, 17 Feb 2016 13:44:39 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id c7sm5008222wmd.13.2016.02.17.13.44.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Feb 2016 13:44:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 Feb 2016 22:44:56 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160217214456.GB2574@jama>
References: <1454055810-25770-1-git-send-email-simon.aittamaa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1454055810-25770-1-git-send-email-simon.aittamaa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] Fixed installation of qtbase-files.
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
X-List-Received-Date: Wed, 17 Feb 2016 21:44:42 -0000
X-Groupsio-MsgNum: 60002
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline

--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2016 at 09:23:30AM +0100, Simon Aittamaa wrote:
> This patch fixes three problems
>     1) Running on a case-sensitive system would result in an error
>        due to invalid casing of pattern to install.
>     2) Using install on symlinks would cause multiple copies of the
>        same file to be installed on the target-system, since install
>        doesn't preserve symlinks. This wastes a lot of space and it
>        causes ldconfig to complain about non-symlinked files.
>     3) Leakage of user-ids, i.e. cp -a would preserve the uid/gid of
>        whoever built the files, which is usually not what you want.

Does anyone have test-case which shows why this copy is needed?

I wanted to remove .la files (in qmake5_base_do_install) and this copies th=
em back to ${D} which is annoying.

So I've removed this cp line and checked what gets missing and it turns
out that nothing important is missing and even more importantly the fixed *=
prl files
are overwritten with their original version.

So unless someone shouts good reason to keep this I'll just drop it.

OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase $ diff -rq 5.5.99+=
5.6.0-rc+gitAUTOINC+ac8a3b948d-r0*/image                                   =
        Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib=
: libQt5Bootstrap.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
BootstrapDBus.a
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
BootstrapDBus.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
BootstrapDBus.prl
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
Concurrent.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
Core.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
DBus.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
Gui.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
Network.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
OpenGL.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
OpenGLExtensions.la
Files 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5Ope=
nGLExtensions.prl and 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/li=
b/libQt5OpenGLExtensions.prl differ
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
PlatformSupport.la
Files 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5Pla=
tformSupport.prl and 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib=
/libQt5PlatformSupport.prl differ
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
PrintSupport.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
Sql.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
Test.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
Widgets.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
XcbQpa.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5=
Xml.la
OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase $ diff -uNr 5.5.99=
+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5OpenGLExtension=
s.prl 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5OpenGLEx=
tensions.prl
--- 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5OpenG=
LExtensions.prl      2016-02-17 22:34:16.397812156 +0100
+++ 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5OpenGLExte=
nsions.prl   2016-02-17 22:38:56.637811683 +0100
@@ -3,4 +3,4 @@
 QMAKE_PRL_TARGET =3D libQt5OpenGLExtensions.a
 QMAKE_PRL_CONFIG =3D silent lex yacc depend_includepath testcase_targets i=
mport_plugins import_qpa_plugin qt warn_on release link_prl incremental cro=
ss_compile qpa no_mocdepend release qt_no_framework linux unix posix \$(OE_=
QMAKE_COMPILER) gcc cross_compile compile_examples qpa largefile use_gold_l=
inker sse2 sse3 ssse3 sse4_1 sse4_2 avx avx2 pcre prefix_build force_indepe=
ndent force_bootstrap create_prl link_prl prepare_docs qt_docs_targets no_p=
rivate_qt_headers_warning QTDIR_build exceptions_off testcase_exceptions qt=
_example_installs warning_clean c++11 static opengl relative_qt_rpath git_b=
uild qmake_cache target_qt c++11 strict_c++ c++14 c++1z hide_symbols bsymbo=
lic_functions qt_install_headers need_fwd_pri qt_install_module create_cmak=
e compiler_supports_fpmath create_pc create_libtool have_target staticlib t=
hread opengl moc resources
 QMAKE_PRL_VERSION =3D 5.6.0
-QMAKE_PRL_LIBS =3D -L/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase=
/5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/build/lib -lQt5Gui -lQt5Core -lpt=
hread -lGL
+QMAKE_PRL_LIBS =3D  -lQt5Gui -lQt5Core -lpthread -lGL
OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase $ diff -uNr 5.5.99=
+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5PlatformSupport=
=2Eprl 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5Platfor=
mSupport.prl
--- 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5Platf=
ormSupport.prl       2016-02-17 22:34:16.438812156 +0100
+++ 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5PlatformSu=
pport.prl    2016-02-17 22:38:56.969811683 +0100
@@ -3,4 +3,4 @@
 QMAKE_PRL_TARGET =3D libQt5PlatformSupport.a
 QMAKE_PRL_CONFIG =3D silent lex yacc depend_includepath testcase_targets i=
mport_plugins import_qpa_plugin qt warn_on release link_prl incremental cro=
ss_compile qpa no_mocdepend release qt_no_framework linux unix posix \$(OE_=
QMAKE_COMPILER) gcc cross_compile compile_examples qpa largefile use_gold_l=
inker sse2 sse3 ssse3 sse4_1 sse4_2 avx avx2 pcre prefix_build force_indepe=
ndent force_bootstrap create_prl link_prl prepare_docs qt_docs_targets no_p=
rivate_qt_headers_warning QTDIR_build exceptions_off testcase_exceptions qt=
_example_installs warning_clean c++11 static internal_module egl opentype q=
pa/genericunixfontdatabase relative_qt_rpath git_build qmake_cache target_q=
t c++11 strict_c++ c++14 c++1z hide_symbols bsymbolic_functions qt_install_=
headers need_fwd_pri qt_install_module compiler_supports_fpmath create_libt=
ool have_target staticlib qpa/basicunixfontdatabase thread opengl dbusadapt=
ors dbusinterfaces moc resources
 QMAKE_PRL_VERSION =3D 5.6.0
-QMAKE_PRL_LIBS =3D -L/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase=
/5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/build/lib -lQt5Gui -lQt5DBus -lQt=
5Core -lpthread -lgthread-2.0 -pthread -lglib-2.0 -lqtfreetype -lz -lpng -l=
Xrender -lXext -lX11 -lm -ludev -lEGL -lGL
+QMAKE_PRL_LIBS =3D  -lQt5Gui -lQt5DBus -lQt5Core -lpthread -lgthread-2.0 -=
pthread -lglib-2.0 -lqtfreetype -lz -lpng -lXrender -lXext -lX11 -lm -ludev=
 -lEGL -lGL

>=20
> Signed-off-by: Simon Aittamaa <simon.aittamaa@gmail.com>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 3ef5923..62c0ab5 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -229,10 +229,10 @@ do_install_append() {
>      # install fonts manually if they are missing
>      if [ ! -d ${D}/${OE_QMAKE_PATH_QT_FONTS} ]; then
>          mkdir -p ${D}/${OE_QMAKE_PATH_QT_FONTS}
> -        cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
> +        cp -d ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
>          chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
>      fi
> -    install -m 0644 ${B}/lib/libqt* ${D}${libdir}
> +    cp -d ${B}/lib/libQt* ${D}${libdir}
>      # Remove example.pro file as it is useless
>      rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
> =20
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

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbE6dcACgkQN1Ujt2V2gBydaQCfZTx+euwVl+0JLe6SeS/Mb7d6
IbUAniE0o6dmGsbxNQSQ237LPSVlzn/X
=zIBi
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
