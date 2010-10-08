Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P46Np-00079y-O1
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 08:25:29 +0200
Received: by iwn5 with SMTP id 5so312483iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ce8eUtqDTnBs6t8O+Duhyy4pby/tYoFD7dTgaUQNvfM=;
	b=pgZWjednFS0ntEGH/TWK0O0wZeR1RjBQDIfSJ5vfaZ/L+OikHjxA8Qe2+0WvRTMcOm
	rAEXabRqcDfu7uN9o6dMlv0uCDLOv8VfuV7267rdhyr5RoAQ7nzWWWN13uNhm4wrihO9
	ZOvRIwkOYVoY0yPJHa0vvvonIvxzr9GUE+MEU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VNFZqYA2RFj2jM+Tf4eRvYcjUmivSbZy7QW98VzNw0bOeoWV/cBap/AX94PBKmZZ1M
	6PEiZ65+7t2jqg/ui2mzr/FboQzVzBZBji3hnb4qdv4KQHFfcjZn8Qq4vboicR9JsR8S
	qXtIaW7pC3JCL7LMg79cYdOVae35o3s01lXDw=
MIME-Version: 1.0
Received: by 10.231.32.130 with SMTP id c2mr1525327ibd.28.1286519056354; Thu,
	07 Oct 2010 23:24:16 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 7 Oct 2010 23:24:16 -0700 (PDT)
In-Reply-To: <1286500978.3659.60.camel@mattotaupa>
References: <1286500978.3659.60.camel@mattotaupa>
Date: Fri, 8 Oct 2010 08:24:16 +0200
Message-ID: <AANLkTim9By3dRuBbtOveONnCHOso+SvtE2mTt+5yg1SZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gtk+_2.20.1: add `pango-native` to `DEPENDS`
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
X-List-Received-Date: Fri, 08 Oct 2010 06:25:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/8 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear OE folks,
>
>
> I am still testing this patch. But since the new testing cycle will start=
 soon I am sending this out already.
>
>
> Thanks,
>
> Paul
>
> 8<-------------------------------------------------------------------->8
> Date: Thu, 7 Oct 2010 13:43:58 +0200
>
> Since two or three days I am not able to build `gtk+_2.20.1.bb` anymore. =
I tried to revert to `gtk+.inc` 9730a2 [1] with
>
> =A0 =A0git checkout 9730a28e669931fee601756e949bb210999b4b81 recipes/gtk+=
/gtk+.inc
>
> but it did not help. I do still get the same error.
>
> =A0 =A0| /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/bin=
/g-ir-scanner =A0--add-include-path=3D../gdk-pixbuf --namespace=3DGdk --nsv=
ersion=3D2.0 --libtool=3D"/bin/sh ../i686-linux-libtool" =A0--include=3DGio=
-2.0 --include=3DGdkPixbuf-2.0 --include=3DPango-1.0 =A0 --library=3Dlibgdk=
-x11-2.0.la --strip-prefix=3DGdk --add-include-path=3D../gdk-pixbuf -DG_LOG=
_DOMAIN=3D\"Gdk\" -DGDK_COMPILATION -I.. -I../gdk -I../gdk-pixbuf -DG_DISAB=
LE_CAST_CHECKS -pthread -I/oe/build-minimal-eglibc/minimal-dev/sysroots/i68=
6-linux/usr/include/glib-2.0 -I/oe/build-minimal-eglibc/minimal-dev/sysroot=
s/i686-linux/usr/lib/glib-2.0/include -I/oe/build-minimal-eglibc/minimal-de=
v/sysroots/i686-linux/usr/include/pango-1.0 -I/oe/build-minimal-eglibc/mini=
mal-dev/sysroots/i686-linux/usr/include/cairo -I/oe/build-minimal-eglibc/mi=
nimal-dev/sysroots/i686-linux/usr/include/pixman-1 -I/oe/build-minimal-egli=
bc/minimal-dev/sysroots/i686-linux/usr/include/freetype2 -I/oe/build-minima=
l-eglibc/minimal-dev/sysroots/i686-linux/usr/include -I/oe/build-minimal-eg=
libc/minimal-dev/sysroots/i686-linux/usr/include/libpng12 -I/oe/build-minim=
al-eglibc/minimal-dev/sysroots/i686-linux/usr/include/gio-unix-2.0/ =A0 =A0=
 =A0gdk.h gdkapplaunchcontext.h gdkcairo.h gdkcolor.h gdkcursor.h gdkdispla=
y.h gdkdisplaymanager.h gdkdnd.h gdkdrawable.h gdkevents.h gdkfont.h gdkgc.=
h gdki18n.h gdkimage.h gdkinput.h gdkkeys.h gdkkeysyms.h gdkpango.h gdkpixb=
uf.h gdkpixmap.h gdkprivate.h gdkproperty.h gdkregion.h gdkrgb.h gdkscreen.=
h gdkselection.h gdkspawn.h gdktestutils.h gdktypes.h gdkvisual.h gdkwindow=
.h gdk.c gdkapplaunchcontext.c gdkcairo.c gdkcolor.c gdkcursor.c gdkdisplay=
.c gdkdisplaymanager.c gdkdnd.c gdkdraw.c gdkevents.c gdkfont.c gdkgc.c gdk=
globals.c gdkimage.c gdkkeys.c gdkkeyuni.c gdkoffscreenwindow.c gdkpango.c =
gdkpixbuf-drawable.c gdkpixbuf-render.c gdkpixmap.c gdkpolyreg-generic.c gd=
krectangle.c gdkregion-generic.c gdkrgb.c gdkscreen.c gdkselection.c gdkvis=
ual.c gdkwindow.c gdkwindowimpl.c gdkenumtypes.c gdkenumtypes.h x11/checkse=
ttings.c x11/gdkapplaunchcontext-x11.c x11/gdkasync.c x11/gdkcolor-x11.c x1=
1/gdkcursor-x11.c x11/gdkdisplay-x11.c x11/gdkdnd-x11.c x11/gdkdrawable-x11=
.c x11/gdkevents-x11.c x11/gdkfont-x11.c x11/gdkgc-x11.c x11/gdkgeometry-x1=
1.c x11/gdkglobals-x11.c x11/gdkim-x11.c x11/gdkimage-x11.c x11/gdkinput-no=
ne.c x11/gdkinput-x11.c x11/gdkinput-xfree.c x11/gdkinput.c x11/gdkkeys-x11=
.c x11/gdkmain-x11.c x11/gdkpixmap-x11.c x11/gdkproperty-x11.c x11/gdkscree=
n-x11.c x11/gdkselection-x11.c x11/gdksettings.c x11/gdkspawn-x11.c x11/gdk=
testutils-x11.c x11/gdkvisual-x11.c x11/gdkwindow-x11.c x11/gdkxftdefaults.=
c x11/gdkxid.c x11/xsettings-client.c x11/xsettings-common.c libgdk-x11-2.0=
.la Makefile --output Gdk-2.0.gir
> =A0 =A0| Couldn't find include 'Pango-1.0.gir' (search path: ['../gdk-pix=
buf', '../gdk-pixbuf', '/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-=
linux/usr/share/gir-1.0', '/oe/build-minimal-eglibc/minimal-dev/sysroots/i6=
86-linux/usr/share/gir-1.0', '/usr/share/gir-1.0', '/oe/build-minimal-eglib=
c/minimal-dev/sysroots/i686-linux/usr/share/gir-1.0'])
>
> `Pango-1.0.gir` is not available in sysroot. But nothing seems to have ch=
anged regarding Pango during the last days either.
>
> I am using `minimal` for `MACHINE =3D "beagleboard"`.
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D9730a=
28e669931fee601756e949bb210999b4b81
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> =A0recipes/gtk+/gtk+_2.20.1.bb | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
> index 6ef5e5b..915ccf5 100644
> --- a/recipes/gtk+/gtk+_2.20.1.bb
> +++ b/recipes/gtk+/gtk+_2.20.1.bb
> @@ -19,6 +19,8 @@ ARM_INSTRUCTION_SET =3D "arm"
> =A0DEPENDS_virtclass-native =3D "libpng-native atk-native pango-native ca=
iro-native libxrender-native libxext-native libgcrypt-native"
> =A0PROVIDES_virtclass-native =3D "gdk-pixbuf-csource-native"
>
> +DEPENDS +=3D "pango-native"
> +
> =A0# Enable xkb selectively
> =A0XKBTOGGLE =3D " --disable-xkb"
> =A0XKBTOGGLE_angstrom =3D ""
> --
>
I doubt that this is sound.
Your error indicates you are missing includes, so you might need a
DEPENDS on pango, not on pango-native (and maybe pango needs to be
fixed to put its stuff in the right dir or gtk+ to look at the right
place)
Then again I do not see any beagle specific include dirs in your path,
which also greatly surprises me.

And please also don't type things before the --- like "Dear OE folks.
Please do explanations below that line, so if your patch is accepted
people can just do a git am without the need to modify the commit
message.

One other thing:
*if* we need a depend on pango-native, I guess it should go from the
DEPENDS_virtclass-native. Then again I am not that good wrt the
machinery that I can say whether it will not add an additional -native
or so. I recall another issue with that from earlier this week. Then
again I feel the build machinery should not add an addtional -native
suffix to depends etc that already have -native at the end).

frans


