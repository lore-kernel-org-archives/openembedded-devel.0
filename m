Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NARRp-0005fS-LE for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 18:02:37 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NARQQ-0004ac-Qp
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 18:01:06 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 18:01:01 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 18:01:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 17 Nov 2009 18:00:37 +0100
Message-ID: <hdukrm$9c6$1@ger.gmane.org>
References: <4AA75260.4010901@gmail.com>
	<6ec4247d0911161446n4c645ff1ia7e2ebeaa9b6c765@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <6ec4247d0911161446n4c645ff1ia7e2ebeaa9b6c765@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
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
X-List-Received-Date: Tue, 17 Nov 2009 17:02:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-11-09 23:46, Graham Gower wrote:
> I'm a little surprised that this patch was ignored, and then someone
> else imported fbreader 0.10.7. Without my useful patches (ignored
> upstream too...).

Sorry about that, I didn't know there was an fbreader patch already 
floating around (teaches me to look at patchwork first) when merging 
stuff over from the AI repo. Do you want to rebase your patch?

regards,

Koen


>
> -Graham
>
> 2009/9/9 Graham Gower<graham.gower@gmail.com>:
>> Probably looks ugly on small screens, but as none of the other build targets
>> would build for me, nor the older fbreader recipes, I adapted the
>> desktop/gtk
>> target for this latest version.
>>
>> Patches are mostly to fix tap scrolling bugs.
>>
>> Signed-off-by: Graham Gower<graham.gower@gmail.com>
>> ---
>> conf/checksums.ini                                 |    4 +
>> .../fbreader/fbreader-0.10.7/clear-selection.patch |   14 +++++
>> .../fbreader-0.10.7/motion-threshold.patch         |   23 ++++++++
>> .../fbreader-0.10.7/remove-recursion.patch         |   10 +++
>> recipes/fbreader/fbreader-0.10.7/sane-events.patch |   59
>> ++++++++++++++++++++
>> recipes/fbreader/fbreader_0.10.7.bb                |   41 ++++++++++++++
>> 6 files changed, 151 insertions(+), 0 deletions(-)
>> create mode 100644 recipes/fbreader/fbreader-0.10.7/clear-selection.patch
>> create mode 100644 recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
>> create mode 100644 recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
>> create mode 100644 recipes/fbreader/fbreader-0.10.7/sane-events.patch
>> create mode 100644 recipes/fbreader/fbreader_0.10.7.bb
>>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index a69b6b0..74580d6 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -6066,6 +6066,10 @@
>> sha256=e4db7a6305ffe2333fae08c940ded8f7e5b02999e0917b0ea4ef3764c80f58c8
>> md5=2d2f3713cf3c17b71997064f39d4c888
>> sha256=e4db7a6305ffe2333fae08c940ded8f7e5b02999e0917b0ea4ef3764c80f58c8
>>
>> +[http://www.fbreader.org/fbreader-sources-0.10.7.tgz]
>> +md5=145f4d2ba24c54288bad2d66ddd2baf2
>> +sha256=d7bcc7cafb1c78f00b380dc2facdb82c5a2fb1475e1ddfc8e5d44a2b855cec1a
>> +
>> [http://only.mawhrin.net/fbreader/obsolete/fbreader-sources-0.7.3d.tgz]
>> md5=705a89bb03860fb312a7afa25db0310e
>> sha256=ec9f93968147526a9b2dd17e31a6d2795356b2eeed309f796f655b37b98abd83
>> diff --git a/recipes/fbreader/fbreader-0.10.7/clear-selection.patch
>> b/recipes/fbreader/fbreader-0.10.7/clear-selection.patch
>> new file mode 100644
>> index 0000000..813b2ba
>> --- /dev/null
>> +++ b/recipes/fbreader/fbreader-0.10.7/clear-selection.patch
>> @@ -0,0 +1,14 @@
>> +--- fbreader-0.10.7.orig/zlibrary/text/src/view/ZLTextView.cpp
>> ++++ fbreader-0.10.7/zlibrary/text/src/view/ZLTextView.cpp
>> +@@ -479,6 +478,11 @@
>> + bool ZLTextView::onStylusRelease(int x, int y) {
>> +       myDoubleClickInfo.update(x, y, false);
>> + ++      if (myDoubleClickInfo.Count == 2) {
>> ++              /* fast tap */
>> ++              mySelectionModel.clear();
>> ++              application().refreshWindow();
>> ++      }
>> +       if (myDoubleClickInfo.Count>  0) {
>> +               return onStylusClick(x, y, myDoubleClickInfo.Count);
>> +       }
>> diff --git a/recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
>> b/recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
>> new file mode 100644
>> index 0000000..0359aba
>> --- /dev/null
>> +++ b/recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
>> @@ -0,0 +1,23 @@
>> +http://www.mikecrash.com/index.php?name=News&file=article&id=107
>> +
>> +diff -ur fbreader-0.10.7/fbreader/src/fbreader/FBView.cpp
>> fbreader-0.10.7dfsg/fbreader/src/fbreader/FBView.cpp
>> +--- fbreader-0.10.7/fbreader/src/fbreader/FBView.cpp   2009-03-30
>> 23:26:07.000000000 +1030
>> ++++ fbreader-0.10.7dfsg/fbreader/src/fbreader/FBView.cpp       2009-05-29
>> 13:07:36.000000000 +0930
>> +@@ -151,7 +154,7 @@
>> +       }
>> + +       myIsReleasedWithoutMotion =
>> +-              myIsReleasedWithoutMotion&&  (abs(x - pressedX())<= 5)&&
>> (abs(y - pressedY())<= 5);
>> ++              myIsReleasedWithoutMotion&&  (abs(x - pressedX())<= 50)&&
>> (abs(y - pressedY())<= 50);
>> +       if (isReleasedWithoutMotion()&&
>> +                       fbreader().EnableTapScrollingOption.value()&&
>> +                       (!ZLBooleanOption(ZLCategoryKey::EMPTY,
>> ZLOption::PLATFORM_GROUP, ZLOption::FINGER_TAP_DETECTABLE, false).value() ||
>> +@@ -185,7 +188,7 @@
>> + + bool FBView::onStylusMovePressed(int x, int y) {
>> +       if (myIsReleasedWithoutMotion) {
>> +-              if ((abs(x - pressedX())>  5) || (abs(y - pressedY())>  5))
>> {
>> ++              if ((abs(x - pressedX())>  50) || (abs(y - pressedY())>
>> 50)) {
>> +                       myIsReleasedWithoutMotion = false;
>> +                       activateSelection(pressedX(), pressedY());
>> +               }
>> diff --git a/recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
>> b/recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
>> new file mode 100644
>> index 0000000..cab3bb4
>> --- /dev/null
>> +++ b/recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
>> @@ -0,0 +1,10 @@
>> +--- fbreader-0.10.7/zlibrary/core/src/application/ZLApplication.cpp.orig
>> ++++ fbreader-0.10.7/zlibrary/core/src/application/ZLApplication.cpp
>> +@@ -210,7 +210,6 @@
>> + void ZLApplicationWindow::refresh() {
>> +       refreshToolbar(WINDOW_TOOLBAR);
>> +       refreshToolbar(FULLSCREEN_TOOLBAR);
>> +-      processAllEvents();
>> + }
>> + + void ZLApplicationWindow::refreshToolbar(ToolbarType type) {
>> diff --git a/recipes/fbreader/fbreader-0.10.7/sane-events.patch
>> b/recipes/fbreader/fbreader-0.10.7/sane-events.patch
>> new file mode 100644
>> index 0000000..8f583e9
>> --- /dev/null
>> +++ b/recipes/fbreader/fbreader-0.10.7/sane-events.patch
>> @@ -0,0 +1,59 @@
>> +--- fbreader-0.10.7.orig/zlibrary/ui/src/gtk/view/ZLGtkViewWidget.cpp
>> ++++ fbreader-0.10.7/zlibrary/ui/src/gtk/view/ZLGtkViewWidget.cpp
>> +@@ -23,6 +23,7 @@
>> + + #include<ZLibrary.h>
>> + #include<ZLLanguageUtil.h>
>> ++#include<stdlib.h>
>> + + #include "ZLGtkViewWidget.h"
>> + #include "ZLGtkPaintContext.h"
>> +@@ -54,7 +55,15 @@
>> +       }
>> + }
>> + ++static int mouse_is_down = 0;
>> ++
>> + static void mousePressed(GtkWidget *area, GdkEventButton *event, gpointer
>> data) {
>> ++      if (event->button == 3)
>> ++              /* ignore gtkstylus long touch events */
>> ++              return;
>> ++
>> ++      mouse_is_down = 1;
>> ++
>> +       gtk_window_set_focus(GTK_WINDOW(gtk_widget_get_toplevel(area)),
>> area);
>> +       ZLGtkViewWidget *viewWidget = (ZLGtkViewWidget*)data;
>> +       int x = (int)event->x;
>> +@@ -65,6 +74,12 @@
>> + }
>> + + static void mouseReleased(GtkWidget*, GdkEventButton *event, gpointer
>> data) {
>> ++      if (event->button == 3)
>> ++              /* ignore gtkstylus long touch events */
>> ++              return;
>> ++
>> ++      mouse_is_down = 0;
>> ++
>> +       ZLGtkViewWidget *viewWidget = (ZLGtkViewWidget*)data;
>> +       int x = (int)event->x;
>> +       int y = (int)event->y;
>> +@@ -73,6 +88,19 @@
>> + }
>> + + static void mouseMoved(GtkWidget*, GdkEventMotion *event, gpointer data)
>> {
>> ++      static gdouble last_x=0, last_y=0;
>> ++
>> ++      if (!mouse_is_down)
>> ++              /* we couldn't possibly want this mouse move event */
>> ++              return;
>> ++
>> ++      if (abs(last_x-event->x)<  5&&  abs(last_y-event->y)<  5)
>> ++              /* give the touchscreen tolerance for small movement */
>> ++              return;
>> ++
>> ++      last_x = event->x;
>> ++      last_y = event->y;
>> ++
>> +       ZLGtkViewWidget *viewWidget = (ZLGtkViewWidget*)data;
>> +       int x, y;
>> +       GdkModifierType state;
>> diff --git a/recipes/fbreader/fbreader_0.10.7.bb
>> b/recipes/fbreader/fbreader_0.10.7.bb
>> new file mode 100644
>> index 0000000..256467e
>> --- /dev/null
>> +++ b/recipes/fbreader/fbreader_0.10.7.bb
>> @@ -0,0 +1,41 @@
>> +DESCRIPTION = "FBreader is an ebook reader"
>> +HOMEPAGE = "http://www.fbreader.org"
>> +SECTION = "x11/utils"
>> +PRIORITY = "optional"
>> +LICENSE = "GPLv2"
>> +DEPENDS = "gtk+ expat bzip2 libfribidi liblinebreak virtual/libiconv"
>> +
>> +SRC_URI = "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
>> +          file://motion-threshold.patch;patch=1 \
>> +          file://remove-recursion.patch;patch=1 \
>> +          file://sane-events.patch;patch=1 \
>> +          file://clear-selection.patch;patch=1 \
>> +          "
>> +
>> +READER_ARCH      = "desktop"
>> +READER_GUI       = "gtk"
>> +READER_STATUS    = "release"
>> +
>> +FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlibrary"
>> +FILES_${PN}-dbg += "${libdir}/zlibrary/ui/.debug"
>> +
>> +CFLAGS_append = "INSTALLDIR=/usr"
>> +EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' OE_CFLAGS='${CXXFLAGS}'
>> INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_LIBDIR}'"
>> +
>> +inherit pkgconfig
>> +
>> +do_configure() {
>> +       echo "TARGET_ARCH = ${READER_ARCH}">  ${S}/makefiles/target.mk
>> +       echo "UI_TYPE = ${READER_GUI}">>  ${S}/makefiles/target.mk
>> +       echo "TARGET_STATUS = ${READER_STATUS}">>  ${S}/makefiles/target.mk
>> +}
>> +
>> +do_compile_append() {
>> +       # enable tap scrolling
>> +       sed -i -e 's/Enabled" value="false/Enabled" value="true/' \
>> +               ${S}/fbreader/data/default/config.desktop.xml
>> +}
>> +
>> +do_install () {
>> +       oe_runmake DESTDIR=${D} install
>> +}
>> --
>> 1.6.0.3
>>
>>




