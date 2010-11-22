Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKPti-0001cs-Uu
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 07:29:09 +0100
Received: by gwaa11 with SMTP id a11so4088289gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 22:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=IdchbsVlUtr1F2G1O/qGxywIFRn39zirhCKyQd6AObg=;
	b=M0KfIzCtMgIRIbXSDd4XdbkVuA/t26JlgzLNNw5m1W73B/p+1qpFYhLOdkNHGYw0nJ
	GmWySD3gIf3vA0LlDYRwTxb1vdJR3KQwZ6uqh8v8y46ScTV+QTVpN2csH+3hghTivqVS
	BZkR0IjTuZLbySn1sWMYrKOmdT+V46HtCXwoc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=NoMGlVGLe9eHY1arYQOVTw58Dd3moCgb2zbpJYPCI4UWLuf+wbtsdrvwHG1f2/R2ji
	pwIGHKotYBb0NECy1O0M7Zix2de8RPNhXH+RC3X/GfLlJxvqLaFbcXhXZ2uEVfFRNcIq
	XUiSZHdtIYIh5X04AFj9mDWmHW6/ge5H8Ht+k=
Received: by 10.91.51.19 with SMTP id d19mr6681215agk.183.1290407274318; Sun,
	21 Nov 2010 22:27:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sun, 21 Nov 2010 22:27:34 -0800 (PST)
In-Reply-To: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
References: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Nov 2010 22:27:34 -0800
Message-ID: <AANLkTinS-eXbu8JVq-eAt5+x=yu_rWZHRHSLJ4J3pCSt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] gtk+-1.2: convert to new style staging (fixes xmms build)
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
X-List-Received-Date: Mon, 22 Nov 2010 06:29:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 21, 2010 at 3:59 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> * gtk+-1.2 didn't install its pkg-config file, but gtk-config
> =C2=A0depended on it and went crazy without it. xmms uses gtk-config.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Tested-by: Yury Bushmelev <jay4mail@gmail.com>

while you are at it can you fix the license field to be more
precise too ?
You dont have to resend the patch for review
thanks for nailing it down

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/gtk+/gtk+-1.2_1.2.10.bb | =C2=A0 30 ++---------------------=
-------
> =C2=A01 files changed, 2 insertions(+), 28 deletions(-)
>
> diff --git a/recipes/gtk+/gtk+-1.2_1.2.10.bb b/recipes/gtk+/gtk+-1.2_1.2.=
10.bb
> index 2e5f86d..a503eab 100644
> --- a/recipes/gtk+/gtk+-1.2_1.2.10.bb
> +++ b/recipes/gtk+/gtk+-1.2_1.2.10.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.gtk.org"
> =C2=A0SECTION =3D "libs"
> =C2=A0PRIORITY =3D "optional"
> =C2=A0DEPENDS =3D "glib-1.2 jpeg libpng libxext"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =C2=A0SRC_URI =3D "ftp://ftp.gtk.org/pub/gtk/v1.2/gtk+-${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://timezone-fix.patch \
> @@ -15,7 +15,7 @@ SRC_URI_append_jlime =3D " file://small-filesel.patch "
>
> =C2=A0S =3D "${WORKDIR}/gtk+-${PV}"
>
> -inherit autotools pkgconfig flow-lossage
> +inherit autotools pkgconfig flow-lossage binconfig
>
> =C2=A0do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d m4
> @@ -28,32 +28,6 @@ FILES_${PN}-dev +=3D "${datadir}/gtk-1.2/include ${lib=
dir}/gtk-1.2/include"
>
>
> =C2=A0EXTRA_OECONF =3D "--enable-debug=3Dno --disable-glibtest --disable-=
xim"
> -# --disable-cruft
> -
> -LIBV =3D "1.2.10"
> -
> -gtk_include =3D "fnmatch.h gtk.h gtkaccelgroup.h gtkaccellabel.h gtkadju=
stment.h gtkalignment.h gtkarg.h gtkarrow.h gtkaspectframe.h gtkbbox.h gtkb=
in.h gtkbindings.h gtkbox.h gtkbutton.h gtkcalendar.h gtkcheckbutton.h gtkc=
heckmenuitem.h gtkclist.h gtkcolorsel.h gtkcombo.h gtkcompat.h gtkcontainer=
.h gtkctree.h gtkcurve.h gtkdata.h gtkdebug.h gtkdialog.h gtkdnd.h gtkdrawi=
ngarea.h gtkeditable.h gtkentry.h gtkenums.h gtkeventbox.h gtkfeatures.h gt=
kfilesel.h gtkfixed.h gtkfontsel.h gtkframe.h gtkgamma.h gtkgc.h gtkhandleb=
ox.h gtkhbbox.h gtkhbox.h gtkhpaned.h gtkhruler.h gtkhscale.h gtkhscrollbar=
.h gtkhseparator.h gtkimage.h gtkinputdialog.h gtkintl.h gtkinvisible.h gtk=
item.h gtkitemfactory.h gtklabel.h gtklayout.h gtklist.h gtklistitem.h gtkm=
ain.h gtkmarshal.h gtkmenu.h gtkmenubar.h gtkmenufactory.h gtkmenuitem.h gt=
kmenushell.h gtkmisc.h gtknotebook.h gtkobject.h gtkoptionmenu.h gtkpacker.=
h gtkpaned.h gtkpixmap.h gtkplug.h gtkpreview.h gtkprivate.h gtkprogress.h =
gtkprogressbar.h gt
> =C2=A0kradiobutton.h gtkradiomenuitem.h gtkrange.h gtkrc.h gtkruler.h gtk=
scale.h gtkscrollbar.h gtkscrolledwindow.h gtkselection.h gtkseparator.h gt=
ksignal.h gtksocket.h gtkspinbutton.h gtkstatusbar.h gtkstyle.h gtktable.h =
gtktearoffmenuitem.h gtktext.h gtkthemes.h gtktipsquery.h gtktogglebutton.h=
 gtktoolbar.h gtktooltips.h gtktree.h gtktreeitem.h gtktypebuiltins.h gtkty=
peutils.h gtkvbbox.h gtkvbox.h gtkviewport.h gtkvpaned.h gtkvruler.h gtkvsc=
ale.h gtkvscrollbar.h gtkvseparator.h gtkwidget.h gtkwindow.h makeenums.h s=
tamp-gtkmarshal.h stamp-gtktypebuiltins.h"
> -gdk_include =3D "MwmUtil.h gdk.h gdkcursors.h gdki18n.h gdkinput.h gdkin=
putcommon.h gdkinputgxi.h gdkinputnone.h gdkinputxfree.h gdkkeysyms.h gdkpr=
ivate.h gdkrgb.h gdktypes.h gdkx.h gxid_lib.h gxid_proto.h"
> -
> -do_stage () {
> - =C2=A0 =C2=A0 =C2=A0 oe_libinstall -so -C gtk libgtk ${STAGING_LIBDIR}
> - =C2=A0 =C2=A0 =C2=A0 oe_libinstall -so -C gdk libgdk ${STAGING_LIBDIR}
> -
> - =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGING_INCDIR}/gtk-1.2/gtk
> - =C2=A0 =C2=A0 =C2=A0 for i in ${gtk_include}; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 gtk/$i=
 ${STAGING_INCDIR}/gtk-1.2/gtk/$i
> - =C2=A0 =C2=A0 =C2=A0 done
> -
> - =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGING_INCDIR}/gtk-1.2/gdk
> - =C2=A0 =C2=A0 =C2=A0 for i in ${gdk_include}; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 gdk/$i=
 ${STAGING_INCDIR}/gtk-1.2/gdk/$i
> - =C2=A0 =C2=A0 =C2=A0 done
> -
> - =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGING_LIBDIR}/gtk-1.2/include
> -
> - =C2=A0 =C2=A0 =C2=A0 install -m 0644 gtk.m4 ${STAGING_DATADIR}/aclocal/
> - =C2=A0 =C2=A0 =C2=A0 install -m 0755 gtk-config ${STAGING_BINDIR_CROSS}=
/
> -}
>
> =C2=A0do_install_append () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/gtk-1.2
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


