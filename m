Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbvOW-0008CS-Up
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:42:21 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3532736eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 07:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=f6tv2UCzuYJB5v3/WS6JHJAtScX5YCa+UShsLRuFaGA=;
	b=lPLqJHtci19GIlhKcPPC4j0NqGkOXde3SpXkj0C4Pe8KZcV74wu7b5A192J5K5V3+9
	NTF61HcBnz+82lL475CsmowznmLz+WKJHfjfWDZH2zfFi97LqJXw1DH3lvVt1C88A0u0
	8o3k9qceKqn4boz0dDPW/h5gf6lDka+jH+LXNThL8u6rh09x3mrP+RsVyP/Fz3MEYFFI
	bkp3uLgW4674vETESeJq7DahaO/zcF2BWpqdH73nXYrnnH5+WR6xcVVM5LOHBFsF9b6/
	2y2+jFyfWvliSxPEkB51fYbWyDPJ0WNRp/0aa2oOzq1+VRKL05G5j1dVlguGBzTb23eG
	4T4A==
Received: by 10.14.175.133 with SMTP id z5mr14721313eel.15.1353684493302;
	Fri, 23 Nov 2012 07:28:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm14223834eel.14.2012.11.23.07.28.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Nov 2012 07:28:12 -0800 (PST)
Date: Fri, 23 Nov 2012 16:28:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121123152811.GP12637@jama.jama.net>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1353684287-19180-2-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1353684287-19180-2-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/9] navit: remove from repository due to lack of gypsy
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
X-List-Received-Date: Fri, 23 Nov 2012 15:42:21 -0000
X-Groupsio-MsgNum: 41687
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TS2hpMIFW5hvDqU7"
Content-Disposition: inline

--TS2hpMIFW5hvDqU7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2012 at 04:24:39PM +0100, Marcin Juszkiewicz wrote:
> ERROR: Nothing PROVIDES 'gypsy' (but meta-openembedded/meta-oe/recipes-na=
vigation/navit/navit_svn.bb DEPENDS on or otherwise requires it)
> ERROR: Required build target 'navit' has no buildable providers.

NACK..
gypsy was removed from oe-core and patch to add it to meta-oe wasn't
merged yet.

>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-navigation/navit/navit-fpu.inc     |  6 --
>  meta-oe/recipes-navigation/navit/navit.inc         | 88 ----------------=
------
>  meta-oe/recipes-navigation/navit/navit/maps.xml    | 24 ------
>  meta-oe/recipes-navigation/navit/navit/navit.xml   | 45 -----------
>  meta-oe/recipes-navigation/navit/navit/osd.xml     | 15 ----
>  meta-oe/recipes-navigation/navit/navit/plugins.xml |  6 --
>  meta-oe/recipes-navigation/navit/navit/speech.xml  |  8 --
>  .../navit/taking-address-of-temporary-array.patch  | 76 ----------------=
---
>  meta-oe/recipes-navigation/navit/navit_svn.bb      | 10 ---
>  9 files changed, 278 deletions(-)
>  delete mode 100644 meta-oe/recipes-navigation/navit/navit-fpu.inc
>  delete mode 100644 meta-oe/recipes-navigation/navit/navit.inc
>  delete mode 100644 meta-oe/recipes-navigation/navit/navit/maps.xml
>  delete mode 100644 meta-oe/recipes-navigation/navit/navit/navit.xml
>  delete mode 100644 meta-oe/recipes-navigation/navit/navit/osd.xml
>  delete mode 100644 meta-oe/recipes-navigation/navit/navit/plugins.xml
>  delete mode 100644 meta-oe/recipes-navigation/navit/navit/speech.xml
>  delete mode 100644 meta-oe/recipes-navigation/navit/navit/taking-address=
-of-temporary-array.patch
>  delete mode 100644 meta-oe/recipes-navigation/navit/navit_svn.bb
>=20
> diff --git a/meta-oe/recipes-navigation/navit/navit-fpu.inc b/meta-oe/rec=
ipes-navigation/navit/navit-fpu.inc
> deleted file mode 100644
> index d963702..0000000
> --- a/meta-oe/recipes-navigation/navit/navit-fpu.inc
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -
> -def get_navit_fpu_setting(bb, d):
> -    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
> -        return "--enable-avoid-float"
> -    return ""
> -
> diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes=
-navigation/navit/navit.inc
> deleted file mode 100644
> index dc2370b..0000000
> --- a/meta-oe/recipes-navigation/navit/navit.inc
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -DESCRIPTION =3D "Navit is a car navigation system with routing engine."
> -LICENSE =3D "GPLv2 LGPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ded539d099d6ce08de6ea0dfed9ecb=
333 \
> -                    file://LGPL-2;md5=3D3214f080875748938ba060314b4f727d=
 \
> -                    file://GPL-2;md5=3D751419260aa954499f7abaabaa882bbe \
> -"
> -
> -SECTION =3D "x11/applications"
> -DEPENDS =3D "glib-2.0 gtk+ qt4-x11-free gd gypsy librsvg-native"
> -RDEPENDS_${PN} =3D " ${PN}-icons ${PN}-config "
> -RDEPENDS_${PN}-gui-qml =3D "qt4-plugin-imageformat-svg"
> -RRECOMMENDS_${PN} =3D "gpsd ${PN}-dbus ${PN}-speech-cmdline ${PN}-gui-in=
ternal ${PN}-graphics-gtk"
> -RSUGGESTS_${PN} =3D "flite-alsa espeak ${PN}-speech-dbus ${PN}-gui-gtk $=
{PN}-gui-qml ${PN}-graphics-sdl ${PN}-graphics-qt ${PN}-maptool"
> -
> -PE =3D "1"
> -INC_PR =3D "r9"
> -
> -inherit autotools gettext
> -
> -EXTRA_OECONF +=3D " \
> -  --disable-binding-python \
> -  --disable-samplemap \
> -  --enable-avoid-unaligned \
> -  --enable-graphics-qt-qpainter \
> -  --enable-gui-qml \
> -  --enable-svg2png-scaling-flag=3D32 \
> -  --disable-speech-speech-dispatcher \
> -  --enable-cache-size=3D20971520 \
> -"
> -
> -#  --enable-avoid-float \
> -#check for TARGET_FPU=3Dsoft and inform configure of the result so it ca=
n disable some floating points
> -require navit-fpu.inc
> -EXTRA_OECONF +=3D "${@get_navit_fpu_setting(bb, d)}"
> -
> -PACKAGES =3D+ "${PN}-maptool ${PN}-config ${PN}-dbus ${PN}-speech-cmdlin=
e ${PN}-speech-dbus ${PN}-gui-gtk ${PN}-gui-internal ${PN}-gui-qml ${PN}-gr=
aphics-sdl ${PN}-graphics-gtk ${PN}-graphics-qt ${PN}-icons"
> -
> -EXTRA_AUTORECONF =3D " -I m4"
> -
> -CONFFILES_${PN}-config +=3D "${datadir}/navit/navit.default.xml \
> -                    ${datadir}/navit/navit.xml \
> -                    ${datadir}/navit/maps.xml \
> -                    ${datadir}/navit/osd.xml \
> -                    ${datadir}/navit/speech.xml \
> -                    ${datadir}/navit/plugins.xml \
> -                   "
> -
> -SRC_URI +=3D "file://navit.xml \
> -            file://maps.xml \
> -            file://osd.xml \
> -            file://speech.xml \
> -            file://plugins.xml \
> -           "
> -
> -FILES_${PN} +=3D "${libdir}/${PN}/*/*.so ${datadir}/icons"
> -FILES_${PN}-dbg +=3D "${libdir}/${PN}/*/.debug"
> -FILES_${PN}-maptool =3D " ${bindir}/maptool "
> -FILES_${PN}-config =3D " ${datadir}/navit/*.xml "
> -FILES_${PN}-dbus =3D " ${datadir}/dbus-1/services/ ${libdir}/${PN}/bindi=
ng/libbinding_dbus.so "
> -FILES_${PN}-speech-cmdline =3D " ${libdir}/${PN}/speech/libspeech_cmdlin=
e.so "
> -FILES_${PN}-speech-dbus =3D " ${libdir}/${PN}/speech/libspeech_dbus.so "
> -FILES_${PN}-gui-gtk =3D " ${libdir}/${PN}/gui/libgui_gtk.so "
> -FILES_${PN}-gui-qml =3D " ${libdir}/${PN}/gui/libgui_qml.so ${datadir}/n=
avit/skins/ "
> -FILES_${PN}-gui-internal =3D " ${libdir}/${PN}/gui/libgui_internal.so "
> -FILES_${PN}-graphics-sdl =3D " ${libdir}/${PN}/graphics/libgraphics_sdl.=
so "
> -FILES_${PN}-graphics-qt =3D " ${libdir}/${PN}/graphics/libgraphics_qt_qp=
ainter.so "
> -FILES_${PN}-graphics-gtk =3D " ${libdir}/${PN}/graphics/libgraphics_gtk_=
drawing_area.so "
> -FILES_${PN}-icons =3D "/usr/share/navit/xpm/"
> -
> -do_configure_prepend() {
> -  # MOC=3D`$PKG_CONFIG QtGui --variable=3Dmoc_location` returns only /us=
r/bin/moc4 which is not available on hosts without Qt
> -  sed -i "s#MOC=3D#MOC=3D${STAGING_DIR_NATIVE}#g" ${S}/configure.in
> -}
> -
> -do_install_append() {
> -	# fix QA issue
> -	sed -i 's#Categories=3DGTK;Utility;Geography;#Categories=3DGraphics;#g'=
 ${D}${datadir}/applications/navit.desktop
> -
> -	rm ${D}${libdir}/${PN}/*/*.la
> -
> -        #Use split config
> -        mv ${D}${datadir}/navit/navit.xml ${D}${datadir}/navit/navit.def=
ault.xml
> -        install -m 0644 ${WORKDIR}/navit.xml ${D}${datadir}/navit/navit.=
xml
> -        install -m 0644 ${WORKDIR}/maps.xml ${D}${datadir}/navit/maps.xml
> -        install -m 0644 ${WORKDIR}/osd.xml ${D}${datadir}/navit/osd.xml
> -        install -m 0644 ${WORKDIR}/speech.xml ${D}${datadir}/navit/speec=
h.xml
> -        install -m 0644 ${WORKDIR}/plugins.xml ${D}${datadir}/navit/plug=
ins.xml
> -}
> diff --git a/meta-oe/recipes-navigation/navit/navit/maps.xml b/meta-oe/re=
cipes-navigation/navit/navit/maps.xml
> deleted file mode 100644
> index 6f59f20..0000000
> --- a/meta-oe/recipes-navigation/navit/navit/maps.xml
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -                <!-- If you have the reiseplaner maps installed, set ena=
bled=3D"yes" in the next line and set the path correctly -->
> -                <mapset enabled=3D"no">
> -                        <map type=3D"mg" enabled=3D"yes" data=3D"/opt/re=
iseplaner/travel/DE.map"/>
> -                        <map type=3D"mg" enabled=3D"yes" data=3D"/opt/re=
iseplaner/travel/DE.map/smp1.smp"/>
> -                        <map type=3D"mg" enabled=3D"yes" data=3D"/opt/re=
iseplaner/travel/DE.map/smp2.smp"/>
> -                        <map type=3D"mg" enabled=3D"yes" data=3D"/opt/re=
iseplaner/travel/DE.map/smp3.smp"/>
> -                        <map type=3D"mg" enabled=3D"yes" data=3D"/opt/re=
iseplaner/travel/DE.map/smp4.smp"/>
> -                        <map type=3D"mg" enabled=3D"yes" data=3D"/opt/re=
iseplaner/travel/DE.map/smp5.smp"/>
> -                </mapset>
> -
> -                <!-- If you dont want to use the sample map, either set =
enabled=3D"no" in the next line or remove the xml file from the maps direct=
ory -->
> -                <mapset enabled=3D"no">
> -                        <xi:include href=3D"$NAVIT_SHAREDIR/maps/*.xml"/>
> -                </mapset>
> -
> -                <!-- Mapset template for openstreetmaps -->
> -                <mapset enabled=3D"yes">
> -                        <map type=3D"binfile" enabled=3D"yes" data=3D"/m=
edia/mmc2/MapsNavit/osm_europe.bin"/>
> -                </mapset>
> -
> -                <!-- Mapset template for garmin maps -->
> -                <mapset enabled=3D"no">
> -                        <map type=3D"garmin" enabled=3D"yes" data=3D"/pa=
th/to/img" debug=3D"4"/>
> -                </mapset>
> diff --git a/meta-oe/recipes-navigation/navit/navit/navit.xml b/meta-oe/r=
ecipes-navigation/navit/navit/navit.xml
> deleted file mode 100644
> index 58c8c22..0000000
> --- a/meta-oe/recipes-navigation/navit/navit/navit.xml
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> -<!DOCTYPE config SYSTEM "navit.dtd">
> -<config xmlns:xi=3D"http://www.w3.org/2001/XInclude">
> -	<xi:include href=3D"/usr/share/navit/plugins.xml"/>
> -	<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xpo=
inter(/config/debug)"/>
> -
> -	<navit center=3D"4808 N 1134 E" zoom=3D"256" tracking=3D"1" orientation=
=3D"-1" recent_dest=3D"10" drag_bitmap=3D"1">
> -		<graphics type=3D"gtk_drawing_area"/>
> -		<gui type=3D"gtk" enabled=3D"no" menubar=3D"1" toolbar=3D"1" statusbar=
=3D"1"/>
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/gui[@type=3D'internal'])"/>
> -		<!-- or comment gtk version above and try:
> -		opkg install navit-graphics-qt
> -		opkg install navit-gui-qml
> -		<graphics type=3D"qt_qpainter"/>
> -		<gui type=3D"qml" enabled=3D"yes" menubar=3D"1" toolbar=3D"1" statusba=
r=3D"1"/>
> -		-->
> -		<xi:include href=3D"/usr/share/navit/osd.xml"/>
> -		<log enabled=3D"no" type=3D"textfile_debug" data=3D"debug_%Y%m%d-%i.tx=
t" flush_size=3D"1000" flush_time=3D"30"/>
> -		<vehicle name=3D"Local GPS" profilename=3D"car" enabled=3D"yes" active=
=3D"1" source=3D"gpsd://localhost" gpsd_query=3D"w+xj">
> -			<!-- <log type=3D"gpx" attr_types=3D"position_time_iso8601,position_d=
irection,position_speed,profilename,position_radius" data=3D"track_%Y%m%d-%=
i.gpx" flush_size=3D"1000" flush_time=3D"30"/> -->
> -		</vehicle>
> -
> -		<vehicle name=3D"Demo" profilename=3D"car" enabled=3D"no" active=3D"ye=
s" source=3D"demo://"/>
> -
> -		<!-- For the cumulative displacement filter to be enabled, set cdf_his=
tsize=3D"x" here, with x being an integer somewhere around 4 -->
> -		<tracking cdf_histsize=3D"0"/>
> -
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/vehicleprofile[@name=3D'car'])"/>
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/vehicleprofile[@name=3D'bike'])"/>
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/vehicleprofile[@name=3D'pedestrian'])"/>
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/vehicleprofile[@name=3D'horse'])"/>
> -
> -		<route destination_distance=3D"50"/>
> -
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/navigation)"/>
> -
> -		<xi:include href=3D"/usr/share/navit/speech.xml"/>
> -		<xi:include href=3D"/usr/share/navit/maps.xml"/>
> -
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/layout[@name=3D'Car'])"/>
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/layout[@name=3D'Car-dark'])"/>
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/layout[@name=3D'Bike'])"/>
> -		<xi:include href=3D"/usr/share/navit/navit.default.xml" xpointer=3D"xp=
ointer(/config/navit/layout[@name=3D'T@H'])"/>
> -	</navit>
> -</config>
> diff --git a/meta-oe/recipes-navigation/navit/navit/osd.xml b/meta-oe/rec=
ipes-navigation/navit/navit/osd.xml
> deleted file mode 100644
> index 2d0f9ff..0000000
> --- a/meta-oe/recipes-navigation/navit/navit/osd.xml
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -                <!-- osd items allow to position display and control ite=
ms directly on top of the map: -->
> -                <osd enabled=3D"no" type=3D"compass"/>
> -                <osd enabled=3D"no" type=3D"eta"/>
> -                <osd enabled=3D"no" type=3D"navigation_distance_to_targe=
t"/>
> -                <osd enabled=3D"no" type=3D"navigation"/>
> -                <osd enabled=3D"no" type=3D"navigation_distance_to_next"=
/>
> -                <osd enabled=3D"no" type=3D"navigation_next_turn"/>
> -
> -                <!-- Commands include gui_internal_menu, gui_internal_fu=
llscreen, zoom_in and zoom_out.
> -                         Usage of negative values change the button orig=
ins. x=3D"0" y=3D"0" specifies the top left, x=3D"-0" y=3D"-0" the bottom r=
ight corner.
> -                         It's always the top left corner of the icon, so=
 you need to consider the icon's size when you enter the values. -->
> -                <osd enabled=3D"no" type=3D"button" x=3D"0" y=3D"0" comm=
and=3D"gui.fullscreen()" src=3D"toggle_fullscreen.xpm"/>
> -                <osd enabled=3D"no" type=3D"button" x=3D"-96" y=3D"0" co=
mmand=3D"gui.menu()" src=3D"menu.xpm"/>
> -                <osd enabled=3D"no" type=3D"button" x=3D"-96" y=3D"-96" =
command=3D"zoom_in()" src=3D"zoom_in.xpm"/>
> -                <osd enabled=3D"no" type=3D"button" x=3D"0" y=3D"-96" co=
mmand=3D"zoom_out()" src=3D"zoom_out.xpm"/>
> diff --git a/meta-oe/recipes-navigation/navit/navit/plugins.xml b/meta-oe=
/recipes-navigation/navit/navit/plugins.xml
> deleted file mode 100644
> index 015b055..0000000
> --- a/meta-oe/recipes-navigation/navit/navit/plugins.xml
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -<plugins>
> -	<plugin path=3D"$NAVIT_LIBDIR/*/${NAVIT_LIBPREFIX}lib*.so" ondemand=3D"=
yes"/>
> -	<plugin path=3D"$NAVIT_LIBDIR/autoload/${NAVIT_LIBPREFIX}lib*.so"/>
> -	<plugin path=3D"$NAVIT_LIBDIR/*/${NAVIT_LIBPREFIX}libbinding_dbus.so" a=
ctive=3D"yes"/>
> -	<plugin path=3D"$NAVIT_LIBDIR/*/${NAVIT_LIBPREFIX}libgraphics_null.so" =
active=3D"no"/>
> -</plugins>
> diff --git a/meta-oe/recipes-navigation/navit/navit/speech.xml b/meta-oe/=
recipes-navigation/navit/navit/speech.xml
> deleted file mode 100644
> index 28c4990..0000000
> --- a/meta-oe/recipes-navigation/navit/navit/speech.xml
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -                <!-- Navit provides speech output in text format.
> -                         If you have a speech synthesizer like festival =
lite installed, you can get turn by turn directions out of navit. Please se=
t the "cps"-value to how many characters your tts engine approximately spea=
ks per second.
> -                         The default is text output to the shell -->
> -                <!-- <speech type=3D"cmdline" data=3D"echo 'Fix the spee=
ch tag in navit.xml to let navit say:' '%s'" cps=3D"15"/> -->
> -                <!-- <speech type=3D"cmdline" data=3D"espeak -s 150 -v c=
zech '%s' &amp;"/> -->
> -                <!-- <speech type=3D"cmdline" data=3D"flite -t '%s'"/> -=
->
> -                <!-- <speech type=3D"cmdline" data=3D"/usr/local/bin/say=
=2Esh '%s'"/> -->
> -                <speech type=3D"cmdline" data=3D"espeak '%s' &amp;"/>
> diff --git a/meta-oe/recipes-navigation/navit/navit/taking-address-of-tem=
porary-array.patch b/meta-oe/recipes-navigation/navit/navit/taking-address-=
of-temporary-array.patch
> deleted file mode 100644
> index 8d3a416..0000000
> --- a/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-=
array.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -Upstream-Status: Pending
> -
> -Description: Fix g++ error "taking address of temporary array"
> -Author: Gilles Filippini <pini@debian.org>
> -Forwarded: no
> -Bug-Debian: http://bugs.debian.org/676006
> -Last-Update: 2012-06-05
> -Index: navit/navit/graphics/qt_qpainter/RenderArea.cpp
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- navit.orig/navit/graphics/qt_qpainter/RenderArea.cpp	2012-06-05 23:1=
6:42.000000000 +0200
> -+++ navit/navit/graphics/qt_qpainter/RenderArea.cpp	2012-06-05 23:15:47.=
000000000 +0200
> -@@ -239,13 +239,14 @@
> - #else
> - 	const char *text=3Dstr.toUtf8().constData();
> - #endif
> -+	char text1[2] =3D { '\0', '\0' };
> - 	dbg(0,"enter text=3D'%s' 0x%x (%d) key=3D%d\n", text, text[0], strlen(=
text), event->key());
> - 	if (!text || !text[0] || text[0] =3D=3D 0x7f) {
> - 		dbg(0,"special key\n");
> - 		switch (event->key()) {
> - 		case 4099:
> - 			{
> --				text=3D(char []){NAVIT_KEY_BACKSPACE,'\0'};
> -+				text1[0] =3D NAVIT_KEY_BACKSPACE;
> - 			}
> - 			break;
> - 		case 4101:
> -@@ -253,7 +254,7 @@
> - 		QT_QPAINTER_CUSTOM_RETURN
> - #endif
> - 			{
> --				text=3D(char []){NAVIT_KEY_RETURN,'\0'};
> -+				text1[0] =3D NAVIT_KEY_RETURN;
> - 			}
> - 			break;
> - 		case 4114:
> -@@ -261,7 +262,7 @@
> - 		QT_QPAINTER_CUSTOM_LEFT
> - #endif
> - 			{
> --				text=3D(char []){NAVIT_KEY_LEFT,'\0'};
> -+				text1[0] =3D NAVIT_KEY_LEFT;
> - 			}
> - 			break;
> - 		case 4115:
> -@@ -269,7 +270,7 @@
> - 		QT_QPAINTER_CUSTOM_UP
> - #endif
> - 			{
> --				text=3D(char []){NAVIT_KEY_UP,'\0'};
> -+				text1[0] =3D NAVIT_KEY_UP;
> - 			}
> - 			break;
> - 		case 4116:
> -@@ -277,7 +278,7 @@
> - 		QT_QPAINTER_CUSTOM_RIGHT
> - #endif
> - 			{
> --				text=3D(char []){NAVIT_KEY_RIGHT,'\0'};
> -+				text1[0] =3D NAVIT_KEY_RIGHT;
> - 			}
> - 			break;
> - 		case 4117:
> -@@ -285,10 +286,11 @@
> - 		QT_QPAINTER_CUSTOM_DOWN
> - #endif
> - 			{
> --				text=3D(char []){NAVIT_KEY_DOWN,'\0'};
> -+				text1[0] =3D NAVIT_KEY_DOWN;
> - 			}
> - 			break;
> - 		}
> -+		if (text1[0]) text =3D text1;
> - 	}
> - 	callback_list_call_attr_1(this->cbl, attr_keypress, (void *)text);
> - 	event->accept();
> diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/reci=
pes-navigation/navit/navit_svn.bb
> deleted file mode 100644
> index a8df317..0000000
> --- a/meta-oe/recipes-navigation/navit/navit_svn.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require navit.inc
> -
> -SRCREV =3D "5159"
> -PV =3D "0.2.0+svnr${SRCPV}"
> -PR =3D "${INC_PR}.3"
> -
> -S =3D "${WORKDIR}/${PN}"
> -SRC_URI +=3D "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/tr=
unk;module=3Dnavit;protocol=3Dhttp \
> -  file://taking-address-of-temporary-array.patch \
> -"
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TS2hpMIFW5hvDqU7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCvlgsACgkQN1Ujt2V2gBxNRwCcC/m6qJ8Z9P8vm4UrimB1gB8b
nDsAn2FpEKrwgaM0yIhBeuxzLfVkV0hQ
=Liju
-----END PGP SIGNATURE-----

--TS2hpMIFW5hvDqU7--
