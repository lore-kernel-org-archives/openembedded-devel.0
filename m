Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NAAMN-0006DK-Hd
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 23:47:50 +0100
Received: by pwj11 with SMTP id 11so3555805pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 14:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lNPnb5wX7P40VnSiMVfR1v6+5HqKBi/2qUN9v/8gmBU=;
	b=WHmBzpH5kskGHBjB+bgdKO6dk7AZz5VZEUuSHsFRynMftF2A2W9cvtiyCo0dlBPifF
	sYh7yUBUVfaDRsdI4l2XciMIHc5DZ1dEmooOiSXbkRHOa7Gc4qCTVvy/agepF8gh7I70
	3OKgYI6MvoI98zIVrqehnrJ/fLX8Mgrg5bVOI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=koCsaRwofKlQqmAtklUlokZBMzpareyw1Qs47ad0gU4MLY1hnceDyvDRSZ8DWQANx8
	sSyqE2KR9rD0P+BTlhkzZRveOgA80cOsjvyuXWxg2EwVnqR0PKcCyUDzl1AB+sP+ewLO
	nqtDoIopx8lfvcfSovRWz1WcJGh18wgp9TJT0=
MIME-Version: 1.0
Received: by 10.142.119.10 with SMTP id r10mr881985wfc.255.1258411583954; Mon, 
	16 Nov 2009 14:46:23 -0800 (PST)
In-Reply-To: <4AA75260.4010901@gmail.com>
References: <4AA75260.4010901@gmail.com>
Date: Tue, 17 Nov 2009 09:16:23 +1030
Message-ID: <6ec4247d0911161446n4c645ff1ia7e2ebeaa9b6c765@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add fbreader 0.10.7
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
X-List-Received-Date: Mon, 16 Nov 2009 22:47:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I'm a little surprised that this patch was ignored, and then someone
else imported fbreader 0.10.7. Without my useful patches (ignored
upstream too...).

-Graham

2009/9/9 Graham Gower <graham.gower@gmail.com>:
> Probably looks ugly on small screens, but as none of the other build targ=
ets
> would build for me, nor the older fbreader recipes, I adapted the
> desktop/gtk
> target for this latest version.
>
> Patches are mostly to fix tap scrolling bugs.
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> conf/checksums.ini =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 =A04 +
> .../fbreader/fbreader-0.10.7/clear-selection.patch | =A0 14 +++++
> .../fbreader-0.10.7/motion-threshold.patch =A0 =A0 =A0 =A0 | =A0 23 +++++=
+++
> .../fbreader-0.10.7/remove-recursion.patch =A0 =A0 =A0 =A0 | =A0 10 +++
> recipes/fbreader/fbreader-0.10.7/sane-events.patch | =A0 59
> ++++++++++++++++++++
> recipes/fbreader/fbreader_0.10.7.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
41 ++++++++++++++
> 6 files changed, 151 insertions(+), 0 deletions(-)
> create mode 100644 recipes/fbreader/fbreader-0.10.7/clear-selection.patch
> create mode 100644 recipes/fbreader/fbreader-0.10.7/motion-threshold.patc=
h
> create mode 100644 recipes/fbreader/fbreader-0.10.7/remove-recursion.patc=
h
> create mode 100644 recipes/fbreader/fbreader-0.10.7/sane-events.patch
> create mode 100644 recipes/fbreader/fbreader_0.10.7.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index a69b6b0..74580d6 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -6066,6 +6066,10 @@
> sha256=3De4db7a6305ffe2333fae08c940ded8f7e5b02999e0917b0ea4ef3764c80f58c8
> md5=3D2d2f3713cf3c17b71997064f39d4c888
> sha256=3De4db7a6305ffe2333fae08c940ded8f7e5b02999e0917b0ea4ef3764c80f58c8
>
> +[http://www.fbreader.org/fbreader-sources-0.10.7.tgz]
> +md5=3D145f4d2ba24c54288bad2d66ddd2baf2
> +sha256=3Dd7bcc7cafb1c78f00b380dc2facdb82c5a2fb1475e1ddfc8e5d44a2b855cec1=
a
> +
> [http://only.mawhrin.net/fbreader/obsolete/fbreader-sources-0.7.3d.tgz]
> md5=3D705a89bb03860fb312a7afa25db0310e
> sha256=3Dec9f93968147526a9b2dd17e31a6d2795356b2eeed309f796f655b37b98abd83
> diff --git a/recipes/fbreader/fbreader-0.10.7/clear-selection.patch
> b/recipes/fbreader/fbreader-0.10.7/clear-selection.patch
> new file mode 100644
> index 0000000..813b2ba
> --- /dev/null
> +++ b/recipes/fbreader/fbreader-0.10.7/clear-selection.patch
> @@ -0,0 +1,14 @@
> +--- fbreader-0.10.7.orig/zlibrary/text/src/view/ZLTextView.cpp
> ++++ fbreader-0.10.7/zlibrary/text/src/view/ZLTextView.cpp
> +@@ -479,6 +478,11 @@
> + bool ZLTextView::onStylusRelease(int x, int y) {
> + =A0 =A0 =A0 myDoubleClickInfo.update(x, y, false);
> + ++ =A0 =A0 =A0if (myDoubleClickInfo.Count =3D=3D 2) {
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* fast tap */
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mySelectionModel.clear();
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0application().refreshWindow();
> ++ =A0 =A0 =A0}
> + =A0 =A0 =A0 if (myDoubleClickInfo.Count > 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return onStylusClick(x, y, myDoubleClickInf=
o.Count);
> + =A0 =A0 =A0 }
> diff --git a/recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
> b/recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
> new file mode 100644
> index 0000000..0359aba
> --- /dev/null
> +++ b/recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
> @@ -0,0 +1,23 @@
> +http://www.mikecrash.com/index.php?name=3DNews&file=3Darticle&id=3D107
> +
> +diff -ur fbreader-0.10.7/fbreader/src/fbreader/FBView.cpp
> fbreader-0.10.7dfsg/fbreader/src/fbreader/FBView.cpp
> +--- fbreader-0.10.7/fbreader/src/fbreader/FBView.cpp =A0 2009-03-30
> 23:26:07.000000000 +1030
> ++++ fbreader-0.10.7dfsg/fbreader/src/fbreader/FBView.cpp =A0 =A0 =A0 200=
9-05-29
> 13:07:36.000000000 +0930
> +@@ -151,7 +154,7 @@
> + =A0 =A0 =A0 }
> + + =A0 =A0 =A0 myIsReleasedWithoutMotion =3D
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0myIsReleasedWithoutMotion && (abs(x - press=
edX()) <=3D 5) &&
> (abs(y - pressedY()) <=3D 5);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0myIsReleasedWithoutMotion && (abs(x - press=
edX()) <=3D 50) &&
> (abs(y - pressedY()) <=3D 50);
> + =A0 =A0 =A0 if (isReleasedWithoutMotion() &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fbreader().EnableTapScrolli=
ngOption.value() &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (!ZLBooleanOption(ZLCategor=
yKey::EMPTY,
> ZLOption::PLATFORM_GROUP, ZLOption::FINGER_TAP_DETECTABLE, false).value()=
 ||
> +@@ -185,7 +188,7 @@
> + + bool FBView::onStylusMovePressed(int x, int y) {
> + =A0 =A0 =A0 if (myIsReleasedWithoutMotion) {
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((abs(x - pressedX()) > 5) || (abs(y - p=
ressedY()) > 5))
> {
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((abs(x - pressedX()) > 50) || (abs(y - =
pressedY()) >
> 50)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 myIsReleasedWithoutMotion =
=3D false;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 activateSelection(pressedX(=
), pressedY());
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> diff --git a/recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
> b/recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
> new file mode 100644
> index 0000000..cab3bb4
> --- /dev/null
> +++ b/recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
> @@ -0,0 +1,10 @@
> +--- fbreader-0.10.7/zlibrary/core/src/application/ZLApplication.cpp.orig
> ++++ fbreader-0.10.7/zlibrary/core/src/application/ZLApplication.cpp
> +@@ -210,7 +210,6 @@
> + void ZLApplicationWindow::refresh() {
> + =A0 =A0 =A0 refreshToolbar(WINDOW_TOOLBAR);
> + =A0 =A0 =A0 refreshToolbar(FULLSCREEN_TOOLBAR);
> +- =A0 =A0 =A0processAllEvents();
> + }
> + + void ZLApplicationWindow::refreshToolbar(ToolbarType type) {
> diff --git a/recipes/fbreader/fbreader-0.10.7/sane-events.patch
> b/recipes/fbreader/fbreader-0.10.7/sane-events.patch
> new file mode 100644
> index 0000000..8f583e9
> --- /dev/null
> +++ b/recipes/fbreader/fbreader-0.10.7/sane-events.patch
> @@ -0,0 +1,59 @@
> +--- fbreader-0.10.7.orig/zlibrary/ui/src/gtk/view/ZLGtkViewWidget.cpp
> ++++ fbreader-0.10.7/zlibrary/ui/src/gtk/view/ZLGtkViewWidget.cpp
> +@@ -23,6 +23,7 @@
> + + #include <ZLibrary.h>
> + #include <ZLLanguageUtil.h>
> ++#include <stdlib.h>
> + + #include "ZLGtkViewWidget.h"
> + #include "ZLGtkPaintContext.h"
> +@@ -54,7 +55,15 @@
> + =A0 =A0 =A0 }
> + }
> + ++static int mouse_is_down =3D 0;
> ++
> + static void mousePressed(GtkWidget *area, GdkEventButton *event, gpoint=
er
> data) {
> ++ =A0 =A0 =A0if (event->button =3D=3D 3)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* ignore gtkstylus long touch events */
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> ++
> ++ =A0 =A0 =A0mouse_is_down =3D 1;
> ++
> + =A0 =A0 =A0 gtk_window_set_focus(GTK_WINDOW(gtk_widget_get_toplevel(are=
a)),
> area);
> + =A0 =A0 =A0 ZLGtkViewWidget *viewWidget =3D (ZLGtkViewWidget*)data;
> + =A0 =A0 =A0 int x =3D (int)event->x;
> +@@ -65,6 +74,12 @@
> + }
> + + static void mouseReleased(GtkWidget*, GdkEventButton *event, gpointer
> data) {
> ++ =A0 =A0 =A0if (event->button =3D=3D 3)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* ignore gtkstylus long touch events */
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> ++
> ++ =A0 =A0 =A0mouse_is_down =3D 0;
> ++
> + =A0 =A0 =A0 ZLGtkViewWidget *viewWidget =3D (ZLGtkViewWidget*)data;
> + =A0 =A0 =A0 int x =3D (int)event->x;
> + =A0 =A0 =A0 int y =3D (int)event->y;
> +@@ -73,6 +88,19 @@
> + }
> + + static void mouseMoved(GtkWidget*, GdkEventMotion *event, gpointer da=
ta)
> {
> ++ =A0 =A0 =A0static gdouble last_x=3D0, last_y=3D0;
> ++
> ++ =A0 =A0 =A0if (!mouse_is_down)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* we couldn't possibly want this mouse mov=
e event */
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> ++
> ++ =A0 =A0 =A0if (abs(last_x-event->x) < 5 && abs(last_y-event->y) < 5)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* give the touchscreen tolerance for small=
 movement */
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> ++
> ++ =A0 =A0 =A0last_x =3D event->x;
> ++ =A0 =A0 =A0last_y =3D event->y;
> ++
> + =A0 =A0 =A0 ZLGtkViewWidget *viewWidget =3D (ZLGtkViewWidget*)data;
> + =A0 =A0 =A0 int x, y;
> + =A0 =A0 =A0 GdkModifierType state;
> diff --git a/recipes/fbreader/fbreader_0.10.7.bb
> b/recipes/fbreader/fbreader_0.10.7.bb
> new file mode 100644
> index 0000000..256467e
> --- /dev/null
> +++ b/recipes/fbreader/fbreader_0.10.7.bb
> @@ -0,0 +1,41 @@
> +DESCRIPTION =3D "FBreader is an ebook reader"
> +HOMEPAGE =3D "http://www.fbreader.org"
> +SECTION =3D "x11/utils"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPLv2"
> +DEPENDS =3D "gtk+ expat bzip2 libfribidi liblinebreak virtual/libiconv"
> +
> +SRC_URI =3D "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
> + =A0 =A0 =A0 =A0 =A0file://motion-threshold.patch;patch=3D1 \
> + =A0 =A0 =A0 =A0 =A0file://remove-recursion.patch;patch=3D1 \
> + =A0 =A0 =A0 =A0 =A0file://sane-events.patch;patch=3D1 \
> + =A0 =A0 =A0 =A0 =A0file://clear-selection.patch;patch=3D1 \
> + =A0 =A0 =A0 =A0 =A0"
> +
> +READER_ARCH =A0 =A0 =A0=3D "desktop"
> +READER_GUI =A0 =A0 =A0 =3D "gtk"
> +READER_STATUS =A0 =A0=3D "release"
> +
> +FILES_${PN} +=3D "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlib=
rary"
> +FILES_${PN}-dbg +=3D "${libdir}/zlibrary/ui/.debug"
> +
> +CFLAGS_append =3D "INSTALLDIR=3D/usr"
> +EXTRA_OEMAKE =3D "CC=3D'${CXX}' LD=3D'${CXX}' OE_CFLAGS=3D'${CXXFLAGS}'
> INCPATH=3D'${STAGING_INCDIR}' LIBPATH=3D'${STAGING_LIBDIR}'"
> +
> +inherit pkgconfig
> +
> +do_configure() {
> + =A0 =A0 =A0 echo "TARGET_ARCH =3D ${READER_ARCH}" > ${S}/makefiles/targ=
et.mk
> + =A0 =A0 =A0 echo "UI_TYPE =3D ${READER_GUI}" >> ${S}/makefiles/target.m=
k
> + =A0 =A0 =A0 echo "TARGET_STATUS =3D ${READER_STATUS}" >> ${S}/makefiles=
/target.mk
> +}
> +
> +do_compile_append() {
> + =A0 =A0 =A0 # enable tap scrolling
> + =A0 =A0 =A0 sed -i -e 's/Enabled" value=3D"false/Enabled" value=3D"true=
/' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${S}/fbreader/data/default/config.desktop.x=
ml
> +}
> +
> +do_install () {
> + =A0 =A0 =A0 oe_runmake DESTDIR=3D${D} install
> +}
> --
> 1.6.0.3
>
>


