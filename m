Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PnevS-0005ZL-2Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 23:23:46 +0100
Received: (qmail invoked by alias); 10 Feb 2011 22:22:41 -0000
Received: from p5DE48E6E.dip.t-dialin.net (EHLO localhost.localdomain)
	[93.228.142.110]
	by mail.gmx.net (mp071) with SMTP; 10 Feb 2011 23:22:41 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/sbq0KhK/sNl8lxGgaSYdpzSG03BRmJaB+MambG7
	Kq2PnTNXJDsftM
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Feb 2011 23:18:21 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1296768970-19738-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1296768970-19738-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201102102318.21822.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] clutter: fix broken clutter-gtk
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
X-List-Received-Date: Thu, 10 Feb 2011 22:23:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 03 February 2011 22:36:10 Andreas Mueller wrote:
> * Since clutter 1.4.2 clutter-gtk fails for machines/archs configuring
> * flavour=eglx with (see clutter.inc)
> *
> * | Making all in clutter-gtk
> * | make[2]: Entering directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8/clutter-gtk'
> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-embed.lo
> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-scrollable.lo
> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-util.lo
> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-viewport.lo
> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-zoomable.lo
> * |   CCLD   libclutter-gtk-0.10.la
> * | /home/Superandi/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: cannot find -lclutter-egl-1.0
> *
> * Since clutter 1.3.x in 'configure.ac' the meaning of 'CLUTTER_WINSYS' has
> * changed. In clutter 1.2.x 'CLUTTER_WINSYS' contained the value passed by
> * 'flavour' (in the error case 'eglx'). In 1.3.x this variable is set in
> * 'configure.ac'. For flavour=eglx it is set to 'egl'! The correct value
> * 'eglx' is found in 'CLUTTER_SONAME_INFIX'. Some of the '*.pc.in' files
> * were changed. clutter-gtk fell victim for clutter-x11.pc.in.
> *
> * Build tested for all clutter recipes with
> *
> * BB_VERSION        = "1.10.2"
> * MACHINE           = "overo"
> * DISTRO            = "angstrom"
> * DISTRO_VERSION    = "2010.7-test-20110203"
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  .../clutter/clutter-1.4.2/fix-lib-location.patch   |   63 ++++++++++++++++++++
>  recipes/clutter/clutter_1.4.2.bb                   |    3 +-
>  2 files changed, 65 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/clutter/clutter-1.4.2/fix-lib-location.patch
> 
> diff --git a/recipes/clutter/clutter-1.4.2/fix-lib-location.patch b/recipes/clutter/clutter-1.4.2/fix-lib-location.patch
> new file mode 100644
> index 0000000..ad4589c
> --- /dev/null
> +++ b/recipes/clutter/clutter-1.4.2/fix-lib-location.patch
> @@ -0,0 +1,63 @@
> +diff --git a/clutter/cally/cally.pc.in b/clutter/cally/cally.pc.in
> +index 224668f..b313ad6 100644
> +--- a/clutter/cally/cally.pc.in
> ++++ b/clutter/cally/cally.pc.in
> +@@ -13,6 +13,6 @@ Name: Cally
> + Description: Clutter Accessibility Implementation Library
> + Version: @VERSION@
> + Requires: atk clutter-1.0
> +-Libs: -L${libdir} -lclutter-${winsys}-${apiversion}
> ++Libs: -L${libdir} -lclutter-${soname_infix}-${apiversion}
> + Cflags: -I${includedir}/clutter-${apiversion}
> + Requires: ${requires}
> +diff --git a/clutter/cogl/cogl/cogl.pc.in b/clutter/cogl/cogl/cogl.pc.in
> +index 7975f4f..39358ca 100644
> +--- a/clutter/cogl/cogl/cogl.pc.in
> ++++ b/clutter/cogl/cogl/cogl.pc.in
> +@@ -8,10 +8,11 @@ backend=@COGL_WINSYS@ #only kept for backward compatability
> + winsys=@COGL_WINSYS@
> + cogl=@COGL_DRIVER@ #only kept for backward compatability
> + driver=@COGL_DRIVER@
> ++soname_infix=@CLUTTER_SONAME_INFIX@
> + 
> + Name: COGL
> + Description: Clutter GL abstraction library (${winsys}/${driver} backend)
> + Version: @VERSION@
> +-Libs: -L${libdir} -lclutter-${winsys}-${apiversion}
> ++Libs: -L${libdir} -lclutter-${soname_infix}-${apiversion}
> + Cflags: -I${includedir}/clutter-${apiversion}
> + Requires: ${requires}
> +diff --git a/clutter/win32/clutter-win32.pc.in b/clutter/win32/clutter-win32.pc.in
> +index ad9a2b4..36b7a6f 100644
> +--- a/clutter/win32/clutter-win32.pc.in
> ++++ b/clutter/win32/clutter-win32.pc.in
> +@@ -7,10 +7,11 @@ requires=@CLUTTER_REQUIRES@
> + backend=@CLUTTER_WINSYS@ #only kept for backward compatability
> + winsys=@CLUTTER_WINSYS@
> + cogl_driver=@COGL_DRIVER@
> ++soname_infix=@CLUTTER_SONAME_INFIX@
> + 
> + Name: Clutter
> + Description: Clutter Core Library (${winsys}/${cogl_driver} backend)
> + Version: @VERSION@
> +-Libs: -L${libdir} -lclutter-${winsys}-${apiversion}
> ++Libs: -L${libdir} -lclutter-${soname_infix}-${apiversion}
> + Cflags: -I${includedir}/clutter-${apiversion}
> + Requires: ${requires}
> +diff --git a/clutter/x11/clutter-x11.pc.in b/clutter/x11/clutter-x11.pc.in
> +index ad9a2b4..36b7a6f 100644
> +--- a/clutter/x11/clutter-x11.pc.in
> ++++ b/clutter/x11/clutter-x11.pc.in
> +@@ -7,10 +7,11 @@ requires=@CLUTTER_REQUIRES@
> + backend=@CLUTTER_WINSYS@ #only kept for backward compatability
> + winsys=@CLUTTER_WINSYS@
> + cogl_driver=@COGL_DRIVER@
> ++soname_infix=@CLUTTER_SONAME_INFIX@
> + 
> + Name: Clutter
> + Description: Clutter Core Library (${winsys}/${cogl_driver} backend)
> + Version: @VERSION@
> +-Libs: -L${libdir} -lclutter-${winsys}-${apiversion}
> ++Libs: -L${libdir} -lclutter-${soname_infix}-${apiversion}
> + Cflags: -I${includedir}/clutter-${apiversion}
> + Requires: ${requires}
> diff --git a/recipes/clutter/clutter_1.4.2.bb b/recipes/clutter/clutter_1.4.2.bb
> index d3159f4..12b6eb5 100644
> --- a/recipes/clutter/clutter_1.4.2.bb
> +++ b/recipes/clutter/clutter_1.4.2.bb
> @@ -2,10 +2,11 @@ require clutter.inc
>  
>  DEPENDS += "json-glib"
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  SRC_URI = "http://source.clutter-project.org/sources/clutter/1.4/clutter-${PV}.tar.bz2 \
>             file://test-conformance-fix.patch \
> +           file://fix-lib-location.patch \
>             ${INC_SRC_URI} \
>            "
>  
> 
ping & some advertisement for this patch at

http://bugzilla.clutter-project.org/show_bug.cgi?id=2549
http://git.clutter-project.org/clutter/commit/?h=clutter-1.4&id=14cb728aa92518b35c1085cd728ecd17ef8a73fa
http://git.clutter-project.org/clutter/commit/?id=615c200707411bad14d6864e679ec8c279ec276b

Andreas


