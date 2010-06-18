Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OPkAF-0002sd-KC
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jun 2010 00:36:05 +0200
Received: (qmail invoked by alias); 18 Jun 2010 22:31:22 -0000
Received: from p508848B7.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.72.183]
	by mail.gmx.net (mp050) with SMTP; 19 Jun 2010 00:31:22 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+Wk14AYRKW/y+rvnZoY2hNW3Uqx1NQCgpDRv8Y7n
	Otd/2IQrTgmyZL
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jun 2010 00:29:04 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201006161433.54486.schnitzeltony@gmx.de>
	<0e3c01cb0f15$4152daf0$c3f890d0$@Distant-earth.com>
	<AANLkTin4w8yx7M4rU1D9KtrET4YbjgoAILWRVQ_C8BDq@mail.gmail.com>
In-Reply-To: <AANLkTin4w8yx7M4rU1D9KtrET4YbjgoAILWRVQ_C8BDq@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201006190029.04684.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xfce 4.6.2 recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jun 2010 22:36:06 -0000
X-Groupsio-MsgNum: 20278
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_wM/GMiL6w5gCbNf"

--Boundary-00=_wM/GMiL6w5gCbNf
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 18 June 2010 08:54:13 pm Khem Raj wrote:
> On Fri, Jun 18, 2010 at 11:37 AM, John Willis
> 
> hmmm I think I pushed first version of your patch accidentally. Can
> you rebase the new patch on top of what got pushed.
> 
> Thx
> -Khem

My newbe spamming causes confusion - I promise to send better quality & less retries next time...

Khem:

To check what you have checked in I did:

git-pull
git-checkout -b checkpatch 7565ef3e4a53f715f16bdf6237061bcb9d6da33b    (creating a local branch 'checkpatch' right before my patch and check it out)
git-apply <last-patch-send-and-acked>
git-add .
git-commit -a -m "Foo"
git-diff org.openembedded.dev recipes/xfce-base/ > Diff

I attach 'Diff'. As far as I can see the only lines added are caused by space / tab replacement.

I think you committed the correct contents.

--Boundary-00=_wM/GMiL6w5gCbNf
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="Diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Diff"

diff --git a/recipes/xfce-base/exo_0.3.107.bb b/recipes/xfce-base/exo_0.3.1=
07.bb
index 41c2a58..ccc20c4 100644
--- a/recipes/xfce-base/exo_0.3.107.bb
+++ b/recipes/xfce-base/exo_0.3.107.bb
@@ -8,18 +8,18 @@ inherit xfce46 python-dir
 XFCE_VERSION =3D "4.6.2"
=20
 SRC_URI +=3D " \
-    file://exo-no-tests.patch \
-    file://configure.patch \
+ =C2=A0 =C2=A0file://exo-no-tests.patch \
+ =C2=A0 =C2=A0file://configure.patch \
 "
=20
 # Note: Python checking is broken
 do_configure_prepend() {
-	sed -i -e s:'`$PKG_CONFIG --variable=3Ddefsdir pygtk-2.0`':\"${STAGING_DA=
TADIR}/pygtk/2.0/defs\":g ${S}/configure.in
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sed -i -e s:'`$PKG_CONFIG --vari=
able=3Ddefsdir pygtk-2.0`':\"${STAGING_DATADIR}/pygtk/2.0/defs\":g ${S}/con=
figure.in
 }
=20
 FILES_${PN} +=3D "${datadir}/xfce4/ \
-                ${PYTHON_SITEPACKAGES_DIR}/* \
-                ${prefix}/share/pygtk/2.0/defs/exo-0.3/exo.defs \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_SITEPACKA=
GES_DIR}/* \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${prefix}/share/py=
gtk/2.0/defs/exo-0.3/exo.defs \
 "
=20
 FILES_${PN}-dbg +=3D "${PYTHON_SITEPACKAGES_DIR}/*/.debug/*"
diff --git a/recipes/xfce-base/thunar_1.0.2.bb b/recipes/xfce-base/thunar_1=
.0.2.bb
index d35c44d..69626da 100644
--- a/recipes/xfce-base/thunar_1.0.2.bb
+++ b/recipes/xfce-base/thunar_1.0.2.bb
@@ -17,11 +17,11 @@ S =3D "${WORKDIR}/Thunar-${PV}/"
 EXTRA_OECONF +=3D "--disable-dependency-tracking --enable-dbus"
=20
 FILES_${PN} +=3D "${libdir}/thunarx-1/*.so \
-		${libdir}/thunarx-1/*.la \
-                ${datadir}/dbus-1 \
-                ${datadir}/thumbnailers \
-                ${datadir}/Thunar \
-                ${datadir}/xfce4"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0${libdir}/thunarx-1/*.la \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1 =
\
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/thumbna=
ilers \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/Thunar =
\
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4"
 FILES_${PN}-dbg +=3D "${libdir}/thunarx-1/.debug/ ${libexecdir}/xfce4/pane=
l-plugins/.debug/"
=20
 SRC_URI[md5sum] =3D "c91073202d373a1f9951a1240083c36d"
diff --git a/recipes/xfce-base/xfce-utils_4.6.2.bb b/recipes/xfce-base/xfce=
-utils_4.6.2.bb
index 08048c4..e0245b7 100644
--- a/recipes/xfce-base/xfce-utils_4.6.2.bb
+++ b/recipes/xfce-base/xfce-utils_4.6.2.bb
@@ -6,25 +6,25 @@ PR =3D "r0"
 inherit xfce46
=20
 FILES_${PN} +=3D " \=20
-        ${bindir}/* \
-        ${datadir}/dbus-1/* \
-        ${datadir}/xfce4/AUTHORS \
-        ${datadir}/xfce4/BSD \
-        ${datadir}/xfce4/COPYING \
-        ${datadir}/xfce4/GPL \
-	${datadir}/xfce4/INFO* \
-        ${datadir}/xfce4/LGPL \
-        ${datadir}/xfce4/AUTHORS.html \
-        ${datadir}/xfce4/BSD.html \
-        ${datadir}/xfce4/COPYING.html \
-        ${datadir}/xfce4/GPL.html \
-	${datadir}/xfce4/INFO.html \
-        ${datadir}/xfce4/LGPL.html \
-        ${datadir}/xsessions/xfce.desktop \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/* \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/* \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/AUTHORS \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/BSD \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/COPYING \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/GPL \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0${datadir}/xfce4/INFO* \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/LGPL \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/AUTHORS.html \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/BSD.html \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/COPYING.html \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/GPL.html \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0${datadir}/xfce4/INFO.html \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/LGPL.html \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xsessions/xfce.desktop \
 "
=20
-# NOTE:  This package takes a --with-browser for the default browser
-# NOTE:  Works with gdm also gtkhtml
+# NOTE: =C2=A0This package takes a --with-browser for the default browser
+# NOTE: =C2=A0Works with gdm also gtkhtml
=20
 SRC_URI[md5sum] =3D "5d23407700d7e8c9751e17a5bc955109"
 SRC_URI[sha256sum] =3D "54efc2038bfbd5acaadfc91ed91fb3dfd6cec64f9402f364ac=
cce7bcafe2ba7a"
diff --git a/recipes/xfce-base/xfce4-panel_4.6.4.bb b/recipes/xfce-base/xfc=
e4-panel_4.6.4.bb
index fe402b8..fbbb17d 100644
--- a/recipes/xfce-base/xfce4-panel_4.6.4.bb
+++ b/recipes/xfce-base/xfce4-panel_4.6.4.bb
@@ -13,18 +13,18 @@ SRC_URI[sha256sum] =3D "cc9b70bdc73ab80f46655a34cdbaf87=
6a67cd90b50230cbf4d77a3106a
 EXTRA_OECONF +=3D " --enable-startup-notification"
=20
 do_install() {
-    oe_runmake DESTDIR=3D${D} install
+ =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D} install
 }
=20
 python populate_packages_prepend() {
-	plugin_dir =3D bb.data.expand('${libdir}/xfce4/panel-plugins/', d)
-	plugin_name =3D bb.data.expand('${PN}-plugin-%s', d)
-	do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
-	                  '${PN} plugin for %s', extra_depends=3D'', prepend=3DTr=
ue,
-	                  aux_files_pattern=3D['${datadir}/xfce4/panel-plugins/%s=
.desktop',
-	                                     '${sysconfdir}/xdg/xfce/panel/%s-*',
-	                                     '${datadir}/icons/hicolor/48x48/apps=
/*-%s.png',
-	                                     '${bindir}/*%s*'])
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0plugin_dir =3D bb.data.expand('$=
{libdir}/xfce4/panel-plugins/', d)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0plugin_name =3D bb.data.expand('=
${PN}-plugin-%s', d)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0do_split_packages(d, plugin_dir,=
 '^lib(.*).so$', plugin_name,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'${PN} plugin for %s', extra_depends=3D'', p=
repend=3DTrue,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aux_files_pattern=3D['${datadir}/xfce4/panel=
-plugins/%s.desktop',
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 '${sysconfdir}/xdg/xfce/panel/%s-*',
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 '${bindir}/*%s*'])
 }
=20
 PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
diff --git a/recipes/xfce-base/xfdesktop_4.6.2.bb b/recipes/xfce-base/xfdes=
ktop_4.6.2.bb
index c3a3bca..e476956 100644
--- a/recipes/xfce-base/xfdesktop_4.6.2.bb
+++ b/recipes/xfce-base/xfdesktop_4.6.2.bb
@@ -8,13 +8,13 @@ PR =3D "r0"
 inherit xfce46
=20
 do_configure() {=20
-   oe_runconf
+ =C2=A0 oe_runconf
 }
=20
 FILES_xfdesktop-backdrops =3D "${datadir}/xfce4/backdrops/*"
 FILES_${PN} +=3D "${libdir}/xfce4/panel-plugins/*.so \
-                ${libdir}/xfce4/panel-plugins/xfce4-menu-plugin \
-                ${datadir}/xfce4/panel-plugins/*.desktop"
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/xfce4/pa=
nel-plugins/xfce4-menu-plugin \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xfce4/p=
anel-plugins/*.desktop"
 FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/panel-plugins/.debug"
=20
 SRC_URI[md5sum] =3D "e800ea9fee7a5c5eaf2ae96e23a83e3a"
diff --git a/recipes/xfce-base/xfwm4_4.6.2.bb b/recipes/xfce-base/xfwm4_4.6=
.2.bb
index 3ea7f52..313097a 100644
--- a/recipes/xfce-base/xfwm4_4.6.2.bb
+++ b/recipes/xfce-base/xfwm4_4.6.2.bb
@@ -16,8 +16,8 @@ EXTRA_OECONF +=3D " --enable-startup-notification"
 PACKAGES_DYNAMIC +=3D "xfwm4-theme-*"
=20
 python populate_packages_prepend () {
-	themedir =3D bb.data.expand('${datadir}/themes', d)
-	do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s=
', allow_dirs=3DTrue)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0themedir =3D bb.data.expand('${d=
atadir}/themes', d)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0do_split_packages(d, themedir, '=
^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s', allow_dirs=3DTrue)
 }
=20
 ALTERNATIVE_NAME =3D "x-window-manager"

--Boundary-00=_wM/GMiL6w5gCbNf--
