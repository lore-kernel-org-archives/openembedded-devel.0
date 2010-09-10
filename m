Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ou9s4-0002ci-HL for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:06:54 +0200
Received: from f053039231.adsl.alicedsl.de ([78.53.39.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ou9rO-0004S6-B8 for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 20:06:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Sep 2010 22:06:07 +0200
Message-ID: <1284149167.3787.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: uClibc: gtk+-2.20.1-r8.3: task do_compile: Failed: ./.libs/libgtk-x11-2.0.so: undefined reference to `nftw'
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
X-List-Received-Date: Fri, 10 Sep 2010 20:06:54 -0000
X-Groupsio-MsgNum: 23437
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WyOL98T+5+86vEx46XAa"

--=-WyOL98T+5+86vEx46XAa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


during the last two or three days something broke `bitbake
console-image` for minimal-uclibc with GCC 4.5 in a clean/fresh
environment.

        $ more conf/local.conf
        [=E2=80=A6]
        # Make use of SMP and fast disks
        PARALLEL_MAKE =3D "-j4"
        BB_NUMBER_THREADS =3D "4"
       =20
        DISTRO =3D "minimal-uclibc"
       =20
        ENABLE_BINARY_LOCALE_GENERATION =3D "0"
        GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"
       =20
        # Don't generate the mirror tarball for SCM repos, the snapshot is =
enough
        BB_GENERATE_MIRROR_TARBALLS =3D "0"
       =20
        MACHINE ?=3D "beagleboard"
        BUILD_ARCH =3D "i686"
        BUILD_OS =3D "linux"
       =20
        BB_NICE_LEVEL=3D"19"
       =20
        PREFERRED_GCC_VERSION                =3D "4.5"

Can you guys make something from the following excerpt from log file or
do I need to do a `git bisect`?

        arm-oe-linux-uclibceabi-libtool: link: /bin/grep -E -e "^[^_].*" ".=
libs/libgtk-x11-2.0.exp" > ".libs/libgtk-x11-2.0.expT"
        arm-oe-linux-uclibceabi-libtool: link: mv -f ".libs/libgtk-x11-2.0.=
expT" ".libs/libgtk-x11-2.0.exp"
        arm-oe-linux-uclibceabi-libtool: link: echo "{ global:" > .libs/lib=
gtk-x11-2.0.ver
        arm-oe-linux-uclibceabi-libtool: link:  cat .libs/libgtk-x11-2.0.ex=
p | sed -e "s/\(.*\)/\1;/" >> .libs/libgtk-x11-2.0.ver
        arm-oe-linux-uclibceabi-libtool: link:  echo "local: *; };" >> .lib=
s/libgtk-x11-2.0.ver
        arm-oe-linux-uclibceabi-libtool: link:  arm-oe-linux-uclibceabi-gcc=
 -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mth=
umb-interwork -mno-thumb -shared  .libs/gtkquery.o .libs/gtksearchengine.o =
.libs/gtksearchenginesimple.o .libs/fnmatch.o .libs/gtkaboutdialog.o .libs/=
gtkaccelgroup.o .libs/gtkaccellabel.o .libs/gtkaccelmap.o .libs/gtkaccessib=
le.o .libs/gtkaction.o .libs/gtkactiongroup.o .libs/gtkactivatable.o .libs/=
gtkadjustment.o .libs/gtkalignment.o .libs/gtkarrow.o .libs/gtkaspectframe.=
o .libs/gtkassistant.o .libs/gtkbbox.o .libs/gtkbin.o .libs/gtkbindings.o .=
libs/gtkbox.o .libs/gtkbuildable.o .libs/gtkbuilder.o .libs/gtkbuilderparse=
r.o .libs/gtkbutton.o .libs/gtkcalendar.o .libs/gtkcelleditable.o .libs/gtk=
celllayout.o .libs/gtkcellrenderer.o .libs/gtkcellrendereraccel.o .libs/gtk=
cellrenderercombo.o .libs/gtkcellrendererpixbuf.o .libs/gtkcellrendererprog=
ress.o .libs/gtkcellrendererspin.o .libs/gtkcellrendererspinner.o .libs/gtk=
cellrenderertext.o .libs/gtkcellrenderertoggle.o .libs/gtkcellview.o .libs/=
gtkcheckbutton.o .libs/gtkcheckmenuitem.o .libs/gtkcolorbutton.o .libs/gtkc=
olorsel.o .libs/gtkcolorseldialog.o .libs/gtkcombobox.o .libs/gtkcomboboxen=
try.o .libs/gtkcontainer.o .libs/gtkdialog.o .libs/gtkdrawingarea.o .libs/g=
tkeditable.o .libs/gtkentry.o .libs/gtkentrybuffer.o .libs/gtkentrycompleti=
on.o .libs/gtkeventbox.o .libs/gtkexpander.o .libs/gtkfilechooser.o .libs/g=
tkfilechooserbutton.o .libs/gtkfilechooserdefault.o .libs/gtkfilechooserdia=
log.o .libs/gtkfilechooserembed.o .libs/gtkfilechooserentry.o .libs/gtkfile=
choosersettings.o .libs/gtkfilechooserutils.o .libs/gtkfilechooserwidget.o =
.libs/gtkfilefilter.o .libs/gtkfilesystem.o .libs/gtkfilesystemmodel.o .lib=
s/gtkfixed.o .libs/gtkfontbutton.o .libs/gtkfontsel.o .libs/gtkframe.o .lib=
s/gtkgc.o .libs/gtkhandlebox.o .libs/gtkhbbox.o .libs/gtkhbox.o .libs/gtkhp=
aned.o .libs/gtkhruler.o .libs/gtkhscale.o .libs/gtkhscrollbar.o .libs/gtkh=
separator.o .libs/gtkhsv.o .libs/gtkiconcache.o .libs/gtkiconcachevalidator=
.o .libs/gtkiconfactory.o .libs/gtkicontheme.o .libs/gtkiconview.o .libs/gt=
kimage.o .libs/gtkimagemenuitem.o .libs/gtkimcontext.o .libs/gtkimcontextsi=
mple.o .libs/gtkimmodule.o .libs/gtkimmulticontext.o .libs/gtkinfobar.o .li=
bs/gtkinputdialog.o .libs/gtkinvisible.o .libs/gtkitem.o .libs/gtkkeyhash.o=
 .libs/gtklabel.o .libs/gtklayout.o .libs/gtklinkbutton.o .libs/gtkliststor=
e.o .libs/gtkmain.o .libs/gtkmarshal.o .libs/gtkmarshalers.o .libs/gtkmenu.=
o .libs/gtkmenubar.o .libs/gtkmenuitem.o .libs/gtkmenushell.o .libs/gtkmenu=
toolbutton.o .libs/gtkmessagedialog.o .libs/gtkmisc.o .libs/gtkmnemonichash=
.o .libs/gtkmodules.o .libs/gtkmountoperation.o .libs/gtknotebook.o .libs/g=
tkobject.o .libs/gtkoffscreenwindow.o .libs/gtkorientable.o .libs/gtkpagese=
tup.o .libs/gtkpaned.o .libs/gtkpapersize.o .libs/gtkpathbar.o .libs/gtkplu=
g.o .libs/gtkprintcontext.o .libs/gtkprintoperation.o .libs/gtkprintoperati=
onpreview.o .libs/gtkprintsettings.o .libs/gtkprintutils.o .libs/gtkprogres=
sbar.o .libs/gtkradioaction.o .libs/gtkradiobutton.o .libs/gtkradiomenuitem=
.o .libs/gtkradiotoolbutton.o .libs/gtkrange.o .libs/gtkrbtree.o .libs/gtkr=
c.o .libs/gtkrecentaction.o .libs/gtkrecentchooserdefault.o .libs/gtkrecent=
chooserdialog.o .libs/gtkrecentchoosermenu.o .libs/gtkrecentchooserwidget.o=
 .libs/gtkrecentchooserutils.o .libs/gtkrecentchooser.o .libs/gtkrecentfilt=
er.o .libs/gtkrecentmanager.o .libs/gtkruler.o .libs/gtkscale.o .libs/gtksc=
alebutton.o .libs/gtkscrollbar.o .libs/gtkscrolledwindow.o .libs/gtkselecti=
on.o .libs/gtkseparator.o .libs/gtkseparatormenuitem.o .libs/gtkseparatorto=
olitem.o .libs/gtksettings.o .libs/gtksizegroup.o .libs/gtkshow.o .libs/gtk=
socket.o .libs/gtkspinbutton.o .libs/gtkspinner.o .libs/gtkstatusbar.o .lib=
s/gtkstatusicon.o .libs/gtkstock.o .libs/gtkstyle.o .libs/gtktable.o .libs/=
gtktearoffmenuitem.o .libs/gtktestutils.o .libs/gtktextbtree.o .libs/gtktex=
tbuffer.o .libs/gtktextbufferrichtext.o .libs/gtktextbufferserialize.o .lib=
s/gtktextchild.o .libs/gtktextdisplay.o .libs/gtktextiter.o .libs/gtktextla=
yout.o .libs/gtktextmark.o .libs/gtktextsegment.o .libs/gtktexttag.o .libs/=
gtktexttagtable.o .libs/gtktexttypes.o .libs/gtktextutil.o .libs/gtktextvie=
w.o .libs/gtkthemes.o .libs/gtktoggleaction.o .libs/gtktogglebutton.o .libs=
/gtktoggletoolbutton.o .libs/gtktoolbar.o .libs/gtktoolbutton.o .libs/gtkto=
olitem.o .libs/gtktoolitemgroup.o .libs/gtktoolpalette.o .libs/gtktoolshell=
.o .libs/gtktooltip.o .libs/gtktreedatalist.o .libs/gtktreednd.o .libs/gtkt=
reemodel.o .libs/gtktreemodelfilter.o .libs/gtktreemodelsort.o .libs/gtktre=
eselection.o .libs/gtktreesortable.o .libs/gtktreestore.o .libs/gtktreeview=
.o .libs/gtktreeviewcolumn.o .libs/gtktypebuiltins.o .libs/gtktypeutils.o .=
libs/gtkuimanager.o .libs/gtkvbbox.o .libs/gtkvbox.o .libs/gtkvolumebutton.=
o .libs/gtkviewport.o .libs/gtkvpaned.o .libs/gtkvruler.o .libs/gtkvscale.o=
 .libs/gtkvscrollbar.o .libs/gtkvseparator.o .libs/gtkwidget.o .libs/gtkwin=
dow-decorate.o .libs/gtkwindow.o .libs/gtkclipboard.o .libs/gtkdnd.o .libs/=
gtktext.o .libs/gtktree.o .libs/gtktreeitem.o .libs/gtkclist.o .libs/gtkcom=
bo.o .libs/gtkctree.o .libs/gtkcurve.o .libs/gtkfilesel.o .libs/gtkgamma.o =
.libs/gtkitemfactory.o .libs/gtklist.o .libs/gtklistitem.o .libs/gtkoldedit=
able.o .libs/gtkoptionmenu.o .libs/gtkpixmap.o .libs/gtkpreview.o .libs/gtk=
progress.o .libs/gtksignal.o .libs/gtktipsquery.o .libs/gtktooltips.o .libs=
/gtkcustompaperunixdialog.o .libs/gtkpagesetupunixdialog.o .libs/gtkprinter=
.o .libs/gtkprinteroption.o .libs/gtkprinteroptionset.o .libs/gtkprinteropt=
ionwidget.o .libs/gtkprintjob.o .libs/gtkprintoperation-unix.o .libs/gtkpri=
ntunixdialog.o .libs/gtkprintbackend.o .libs/gtksearchenginebeagle.o .libs/=
gtksearchenginetracker.o .libs/gtkplug-x11.o .libs/gtksocket-x11.o .libs/gt=
kxembed.o .libs/gtktrayicon-x11.o .libs/gtkmountoperation-x11.o   -Wl,-rpat=
h -Wl,/oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-ucli=
bceabi/gtk+-2.20.1-r8.3/gtk+-2.20.1/gdk-pixbuf/.libs -Wl,-rpath -Wl,/oe/bui=
ld-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/gtk+-2=
.20.1-r8.3/gtk+-2.20.1/gdk/.libs -Wl,-rpath -Wl,/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib -L/oe/build-mi=
nimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/gtk+-2.20.1=
-r8.3/gtk+-2.20.1/gdk-pixbuf/.libs -L/oe/build-minimal-uclibc/minimal-uclib=
c-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/.libs -L/oe/build-minimal=
-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib ../g=
dk-pixbuf/.libs/libgdk_pixbuf-2.0.so ../gdk/.libs/libgdk-x11-2.0.so /oe/bui=
ld-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/us=
r/lib/libXrandr.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/lib/libXcursor.so /oe/build-minimal-uclibc/mini=
mal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/gtk+-2.20.1-r8.3/gtk+-2.20.1=
/gdk-pixbuf/.libs/libgdk_pixbuf-2.0.so /oe/build-minimal-uclibc/minimal-ucl=
ibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libpangocairo-1.0.so /o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/lib/libXcomposite.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sys=
roots/armv7a-oe-linux-uclibceabi/usr/lib/libXext.so /oe/build-minimal-uclib=
c/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libXdamage=
.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uc=
libceabi/usr/lib/libXfixes.so /oe/build-minimal-uclibc/minimal-uclibc-dev/s=
ysroots/armv7a-oe-linux-uclibceabi/usr/lib/libatk-1.0.so /oe/build-minimal-=
uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libca=
iro.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux=
-uclibceabi/usr/lib/libpixman-1.so /oe/build-minimal-uclibc/minimal-uclibc-=
dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libpng12.so /oe/build-minim=
al-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/li=
bXrender.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-=
linux-uclibceabi/usr/lib/libX11.so /oe/build-minimal-uclibc/minimal-uclibc-=
dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libxcb.so /oe/build-minimal=
-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libp=
thread-stubs.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a=
-oe-linux-uclibceabi/usr/lib/libXau.so /oe/build-minimal-uclibc/minimal-ucl=
ibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libXdmcp.so /oe/build-m=
inimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/li=
b/libgio-2.0.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a=
-oe-linux-uclibceabi/usr/lib/libpangoft2-1.0.so /oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libpango-1.0.s=
o /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucli=
bceabi/usr/lib/libfontconfig.so /oe/build-minimal-uclibc/minimal-uclibc-dev=
/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libfreetype.so /oe/build-minim=
al-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/li=
bz.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-=
uclibceabi/usr/lib/libexpat.so /oe/build-minimal-uclibc/minimal-uclibc-dev/=
sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libgobject-2.0.so /oe/build-min=
imal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/=
libgmodule-2.0.so -ldl /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots=
/armv7a-oe-linux-uclibceabi/usr/lib/libgthread-2.0.so -lpthread /oe/build-m=
inimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/li=
b/libglib-2.0.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7=
a-oe-linux-uclibceabi/usr/lib/libiconv.so -lintl -lm  -march=3Darmv7-a -mtu=
ne=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thu=
mb -Wl,-rpath-link -Wl,/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots=
/armv7a-oe-linux-uclibceabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -pthread=
   -pthread -Wl,-soname -Wl,libgtk-x11-2.0.so.0 -Wl,-version-script -Wl,.li=
bs/libgtk-x11-2.0.ver -o .libs/libgtk-x11-2.0.so.0.2000.1
        arm-oe-linux-uclibceabi-libtool: link: (cd ".libs" && rm -f "libgtk=
-x11-2.0.so.0" && ln -s "libgtk-x11-2.0.so.0.2000.1" "libgtk-x11-2.0.so.0")
        arm-oe-linux-uclibceabi-libtool: link: (cd ".libs" && rm -f "libgtk=
-x11-2.0.so" && ln -s "libgtk-x11-2.0.so.0.2000.1" "libgtk-x11-2.0.so")
        arm-oe-linux-uclibceabi-libtool: link: ( cd ".libs" && rm -f "libgt=
k-x11-2.0.la" && ln -s "../libgtk-x11-2.0.la" "libgtk-x11-2.0.la" )
        /bin/sh ../arm-oe-linux-uclibceabi-libtool  --tag=3DCC   --mode=3Dl=
ink arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb  -DGDK_PIXBUF_DIS=
ABLE_DEPRECATED -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroot=
s/armv7a-oe-linux-uclibceabi/usr/include -fexpensive-optimizations -fomit-f=
rame-pointer -frename-registers -Os -Wall  -L/oe/build-minimal-uclibc/minim=
al-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib -Wl,-rpath-link,/=
oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibce=
abi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o gtk-query-immodules-2.0 query=
immodules.o libgtk-x11-2.0.la ../gdk-pixbuf/libgdk_pixbuf-2.0.la ../gdk/lib=
gdk-x11-2.0.la -pthread -lpangocairo-1.0 -lX11 -lXcomposite -lXdamage -lXfi=
xes -latk-1.0 -lcairo -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lfreetype -lfon=
tconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lglib-2.0 -lintl -lm=20
        arm-oe-linux-uclibceabi-libtool: link: arm-oe-linux-uclibceabi-gcc =
-march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthu=
mb-interwork -mno-thumb -DGDK_PIXBUF_DISABLE_DEPRECATED -isystem/oe/build-m=
inimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/in=
clude -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os=
 -Wall -Wl,-rpath-link -Wl,/oe/build-minimal-uclibc/minimal-uclibc-dev/sysr=
oots/armv7a-oe-linux-uclibceabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o .=
libs/gtk-query-immodules-2.0 queryimmodules.o -pthread  -L/oe/build-minimal=
-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib ./.l=
ibs/libgtk-x11-2.0.so /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv=
7a-oe-linux-uclibceabi/gtk+-2.20.1-r8.3/gtk+-2.20.1/gdk/.libs/libgdk-x11-2.=
0.so ../gdk-pixbuf/.libs/libgdk_pixbuf-2.0.so ../gdk/.libs/libgdk-x11-2.0.s=
o /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucli=
bceabi/usr/lib/libXrandr.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sys=
roots/armv7a-oe-linux-uclibceabi/usr/lib/libXcursor.so /oe/build-minimal-uc=
libc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/gtk+-2.20.1-r8.3/gt=
k+-2.20.1/gdk-pixbuf/.libs/libgdk_pixbuf-2.0.so /oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libpangocairo-=
1.0.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux=
-uclibceabi/usr/lib/libXcomposite.so /oe/build-minimal-uclibc/minimal-uclib=
c-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libXext.so /oe/build-mini=
mal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/l=
ibXdamage.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe=
-linux-uclibceabi/usr/lib/libXfixes.so /oe/build-minimal-uclibc/minimal-ucl=
ibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libatk-1.0.so /oe/build=
-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/=
lib/libcairo.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a=
-oe-linux-uclibceabi/usr/lib/libpixman-1.so /oe/build-minimal-uclibc/minima=
l-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libpng12.so /oe/bu=
ild-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/u=
sr/lib/libXrender.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/a=
rmv7a-oe-linux-uclibceabi/usr/lib/libX11.so /oe/build-minimal-uclibc/minima=
l-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libxcb.so /oe/buil=
d-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr=
/lib/libpthread-stubs.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroo=
ts/armv7a-oe-linux-uclibceabi/usr/lib/libXau.so /oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libXdmcp.so /o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/lib/libgio-2.0.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroo=
ts/armv7a-oe-linux-uclibceabi/usr/lib/libpangoft2-1.0.so /oe/build-minimal-=
uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libpa=
ngo-1.0.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-l=
inux-uclibceabi/usr/lib/libfontconfig.so /oe/build-minimal-uclibc/minimal-u=
clibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libfreetype.so /oe/bu=
ild-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/u=
sr/lib/libz.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-=
oe-linux-uclibceabi/usr/lib/libexpat.so /oe/build-minimal-uclibc/minimal-uc=
libc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libgobject-2.0.so /oe/=
build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi=
/usr/lib/libgmodule-2.0.so -ldl /oe/build-minimal-uclibc/minimal-uclibc-dev=
/sysroots/armv7a-oe-linux-uclibceabi/usr/lib/libgthread-2.0.so -lpthread /o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/lib/libglib-2.0.so /oe/build-minimal-uclibc/minimal-uclibc-dev/sysro=
ots/armv7a-oe-linux-uclibceabi/usr/lib/libiconv.so -lintl -lm -pthread
        /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linu=
x-uclibceabi/usr/lib/libglib-2.0.so: warning: the use of OBSOLESCENT `utime=
' is discouraged, use `utimes'
        /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr=
/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.2/../../../../arm-oe-linux-ucli=
bceabi/bin/ld: warning: libc.so, needed by /oe/build-minimal-uclibc/minimal=
-uclibc-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/=
4.5.2/../../../../arm-oe-linux-uclibceabi/lib/libgcc_s.so.1, not found (try=
 using -rpath or -rpath-link)
        ./.libs/libgtk-x11-2.0.so: undefined reference to `nftw'
        collect2: ld returned 1 exit status
        make[4]: *** [gtk-query-immodules-2.0] Error 1
        make[4]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc=
-dev/work/armv7a-oe-linux-uclibceabi/gtk+-2.20.1-r8.3/gtk+-2.20.1/gtk'
        make[3]: *** [all-recursive] Error 1
        make[3]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc=
-dev/work/armv7a-oe-linux-uclibceabi/gtk+-2.20.1-r8.3/gtk+-2.20.1/gtk'
        make[2]: *** [all] Error 2
        make[2]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc=
-dev/work/armv7a-oe-linux-uclibceabi/gtk+-2.20.1-r8.3/gtk+-2.20.1/gtk'
        make[1]: *** [all-recursive] Error 1
        make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc=
-dev/work/armv7a-oe-linux-uclibceabi/gtk+-2.20.1-r8.3/gtk+-2.20.1'
        make: *** [all] Error 2
        FATAL: oe_runmake failed
        ERROR: Function do_compile failed

The only change to this recipe was `--disable-cups` for the native build
[1], so I doubt this has anything to do with it.

I am not attaching the log file because it is pretty big. Please tell me
if you need more information.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Da8c6451=
9f8ca82166cdb1d69c120d5103c18f6be

--=-WyOL98T+5+86vEx46XAa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyKj68ACgkQPX1aK2wOHVhmyQCfR3CTjuvbFMJ1xoEoBTeJgXY2
WoMAn0/ndSbnyQfwO3DdYYHafVpnMevz
=wA4V
-----END PGP SIGNATURE-----

--=-WyOL98T+5+86vEx46XAa--
