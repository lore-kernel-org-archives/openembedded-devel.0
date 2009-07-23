Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MU1e5-0002ot-GV
	for openembedded-devel@openembedded.org; Thu, 23 Jul 2009 18:59:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MU1QG-0001Ih-LO
	for openembedded-devel@openembedded.org; Thu, 23 Jul 2009 16:45:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 16:45:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 16:45:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Jul 2009 18:45:24 +0200
Message-ID: <h4a435$9sd$1@ger.gmane.org>
References: <200907231733.14601.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <200907231733.14601.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Fix qt4-embedded compilation
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
X-List-Received-Date: Thu, 23 Jul 2009 16:59:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-07-09 17:33, Holger Hans Peter Freyther wrote:
> Hey,
>
> I need the below patch to be able to compile qt4-embedded without trying to
> download a PowerVR sdk for the OMAP when building on x86...

Can't you just bbmask it out?


>
> I think the gles/OpenVG backend can be added back whenever the normal build is
> not broken, or maybe someone finds the time to find out why it broke.
>
> holger
>
>
>  From 36d8a5f1daf3aab9ad1b4faa672d796dadfe906d Mon Sep 17 00:00:00 2001
> From: Holger Hans Peter Freyther<zecke@selfish.org>
> Date: Thu, 23 Jul 2009 17:27:33 +0200
> Subject: [PATCH] qt4-embedded: Fix compilation of qt4-embedded
>
> The addition of the qt4-embedded-gles recipe broke the normal
> plain qt4-embedded build. A plain bitbake qt4-embedded will attempt
> to build both due some magic I don't yet understand.
> ---
>   recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch |   18 --------------
>   recipes/qt4/qt4-embedded-gles_4.5.2.bb             |   25
> --------------------
>   2 files changed, 0 insertions(+), 43 deletions(-)
>   delete mode 100644 recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch
>   delete mode 100644 recipes/qt4/qt4-embedded-gles_4.5.2.bb
>
> diff --git a/recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch
> b/recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch
> deleted file mode 100644
> index c3bf39f..0000000
> --- a/recipes/qt4/qt4-embedded-gles-4.5.2/sgx-hack.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> ---- /tmp/qglscreen_qws.h	2009-07-09 09:39:40.000000000 +0200
> -+++ qt-embedded-linux-opensource-src-4.5.2/src/opengl/qglscreen_qws.h	
> 2009-07-09 09:40:11.000000000 +0200
> -@@ -60,7 +60,6 @@
> - #else
> - #include<GLES/egl.h>
> - #endif
> --#if !defined(EGL_VERSION_1_3)&&  !defined(QEGL_NATIVE_TYPES_DEFINED)
> - #undef EGLNativeWindowType
> - #undef EGLNativePixmapType
> - #undef EGLNativeDisplayType
> -@@ -68,7 +67,6 @@
> - typedef NativePixmapType EGLNativePixmapType;
> - typedef NativeDisplayType EGLNativeDisplayType;
> - #define QEGL_NATIVE_TYPES_DEFINED 1
> --#endif
> -
> - QT_BEGIN_HEADER
> -
> diff --git a/recipes/qt4/qt4-embedded-gles_4.5.2.bb b/recipes/qt4/qt4-embedded-
> gles_4.5.2.bb
> deleted file mode 100644
> index 31bfe0f..0000000
> --- a/recipes/qt4/qt4-embedded-gles_4.5.2.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -# recipe to build GLES gfxdriver
> -
> -FILESPATHPKG =. "qt4-embedded-${PV}:qt4-embedded:"
> -
> -QT_CONFIG_FLAGS += "-D QT_QWS_CLIENTBLIT -depths 16,24,32 -opengl es1 -
> plugin-gfx-powervr"
> -
> -require qt4-embedded_${PV}.bb
> -
> -DEPENDS += "virtual/egl"
> -SRC_URI += "file://sgx-hack.patch;patch=1"
> -
> -export EXTRA_QMAKE_MUNGE = " glmunge "
> -
> -glmunge() {
> -	sed -e /QMAKE_INCDIR_OPENGL/d -e /QMAKE_LIBDIR_OPENGL/d -e
> /QMAKE_LIBS_OPENGL/d -e /QMAKE_LIBS_OPENGL_QT/d -i
> mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
> -
> -	echo "QMAKE_INCDIR_OPENGL = ${STAGING_INCDIR}/GLES/">>
> mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
> -	echo "QMAKE_LIBDIR_OPENGL  = ${STAGING_LIBDIR}">>
> mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
> -	echo "QMAKE_LIBS_OPENGL = -lEGL -lGLES_CM -lIMGegl -lsrv_um">>
> mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
> -	echo "QMAKE_LIBS_OPENGL_QT = -lEGL -lGLES_CM -lIMGegl -lsrv_um">>
> mkspecs/${OE_QMAKE_PLATFORM}/qmake.conf
> -	sed -i -e s:MBX_SYNC:HW_SYNC:g
> ${S}/src/plugins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl.c
> -}
> -
> -
> -




