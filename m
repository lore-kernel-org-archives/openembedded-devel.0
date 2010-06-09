Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMLWA-0005KI-Mr
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 15:40:32 +0200
Received: by pxi14 with SMTP id 14so2143884pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=0TDf6MD+WO1wxihKL+VV9YrC9WErBlodk7OJmCPbpwQ=;
	b=HLlfw1EPND4Twcj8cGDUZCSWT4053x9MKtkzRmy0jYDFz319Xt49Jvl/kXnUJ9jeia
	wsMJYZNPUcGyzh8YUVPmsCFkC/1+YdobItcwLEq3WUriqTfzjKjFXPgD0hLda+mfsbGx
	/QdaUmKnYJr8JNX0JvM6tTELnLz1OnEGfbegw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iC96Dn/TffzwLIkGx9kzmINXuuCcMA08ukGX8IDHAKc9xGrJE5tdr31RsfbrObt2SM
	P6jIiUYCsHDujbFfsTjS466d8h/Q7VUrLmFBZSILjfEFGacj+WTJwCvGQokYuyAUFHuX
	el2o2Z8Qw0if84fdvGHgN+spX3MtwMfBFRWiY=
Received: by 10.114.187.22 with SMTP id k22mr14314382waf.106.1276090567360;
	Wed, 09 Jun 2010 06:36:07 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n29sm64427263wae.16.2010.06.09.06.36.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 06:36:06 -0700 (PDT)
Date: Wed, 9 Jun 2010 06:36:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100609133618.GC29724@gmail.com>
References: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
	<1276068782-23257-4-git-send-email-mad_soft@inbox.ru>
MIME-Version: 1.0
In-Reply-To: <1276068782-23257-4-git-send-email-mad_soft@inbox.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] mupdf-0.6: new recipe
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
X-List-Received-Date: Wed, 09 Jun 2010 13:40:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/06/10 11:33), Dmitry Artamonow wrote:
> MuPDF is a slim and fast PDF viewer/toolkit.
> 
> Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
> ---
>  recipes/mupdf/mupdf-0.6/Makerules                  |    8 +++
>  .../mupdf/mupdf-0.6/mupdf_fix_16bit_display.patch  |   12 ++++
>  recipes/mupdf/mupdf_0.6.bb                         |   59 ++++++++++++++++++++
>  3 files changed, 79 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/mupdf/mupdf-0.6/Makerules
>  create mode 100644 recipes/mupdf/mupdf-0.6/mupdf_fix_16bit_display.patch
>  create mode 100644 recipes/mupdf/mupdf_0.6.bb
> 
> diff --git a/recipes/mupdf/mupdf-0.6/Makerules b/recipes/mupdf/mupdf-0.6/Makerules
> new file mode 100644
> index 0000000..5f3d4e2
> --- /dev/null
> +++ b/recipes/mupdf/mupdf-0.6/Makerules
> @@ -0,0 +1,8 @@
> +# Configuration for the Makefile
> +LIBS := -ljbig2dec -lopenjpeg -ljpeg -lz -lm
> +CFLAGS := -Wall --std=gnu99 -Ifitz -Imupdf $(THIRD_INCS)
> +
> +CFLAGS += `pkg-config --cflags freetype2`
> +LDFLAGS += `pkg-config --libs freetype2`
> +X11LIBS = -lX11 -lXext
> +PDFVIEW_EXE = $(X11VIEW_EXE)
> diff --git a/recipes/mupdf/mupdf-0.6/mupdf_fix_16bit_display.patch b/recipes/mupdf/mupdf-0.6/mupdf_fix_16bit_display.patch
> new file mode 100644
> index 0000000..fdc0b74
> --- /dev/null
> +++ b/recipes/mupdf/mupdf-0.6/mupdf_fix_16bit_display.patch
> @@ -0,0 +1,12 @@
> +* upstream: http://bugs.ghostscript.com/show_bug.cgi?id=690932
> +
> +--- mupdf/apps/x11_image.c.orig	2010-06-06 19:42:46.000000000 +0400
> ++++ mupdf/apps/x11_image.c	2010-06-06 20:32:35.000000000 +0400
> +@@ -14,6 +14,7 @@
> + 
> + #include <X11/Xlib.h>
> + #include <X11/Xutil.h>
> ++#include <X11/Xarch.h>
> + #include <sys/ipc.h>
> + #include <sys/shm.h>
> + #include <X11/extensions/XShm.h>
> diff --git a/recipes/mupdf/mupdf_0.6.bb b/recipes/mupdf/mupdf_0.6.bb
> new file mode 100644
> index 0000000..e9cb0b1
> --- /dev/null
> +++ b/recipes/mupdf/mupdf_0.6.bb
> @@ -0,0 +1,59 @@
> +DESCRIPTION = "A lightweight PDF viewer and toolkit written in portable C."
> +HOMEPAGE = "http://www.mupdf.com"
> +SECTION = "x11/applications"
> +LICENSE = "GPLv3"
> +PR = "r0"
> +
> +DEPENDS = "openjpeg jbig2dec jpeg zlib virtual/libx11 libxext freetype"
> +
> +SRC_URI = "http://mupdf.com/download/source/${PN}-${PV}-source.tar.gz \
> +           file://mupdf_fix_16bit_display.patch \
> +           file://Makerules"
> +
> +S = "${WORKDIR}/mupdf"
> +
> +PACKAGES =+ "${PN}-tools ${PN}-tools-doc "
> +FILES_${PN}-tools = "${bindir}/pdfclean ${bindir}/pdfdraw ${bindir}/pdfshow \
> +                     ${bindir}/pdfextract ${bindir}/pdfinfo"
> +FILES_${PN}-tools-doc = "${mandir}/man1/pdfclean.1 ${mandir}/man1/pdfdraw.1 \
> +                         ${mandir}/man1/pdfshow.1"
> +
> +# mupdf crashes (at least on arm) when built with high level of optimization
> +FULL_OPTIMIZATION = "-O2"

the commend does not go with the code. O2 is high enough optimization.
be more specific what does not work and by default OE uses -Os + some 
specific opt passes.

> +
> +do_configure() {
> +    cp ${WORKDIR}/Makerules ${S}/Makerules
> +

Why not create a patch for Makerules instread of creating a file and then
copying. It will help upgrades the patch will get refreshed for any changes
but this will overwrite those changes.

> +    # we don't include CJK fonts to make binary more slim
> +    # comment out following two lines if you need support for CJK
> +    sed -i 's:^\t\$.GENDIR./font_cjk.c::g' ${S}/Makefile
> +    echo "CFLAGS += -DNOCJK" >> ${S}/Makerules
> +}
> +
> +do_compile() {
> +    # mupdf uses couple of tools for code generation during build process
> +    # so we need to compile them first with host compiler
> +    unset CFLAGS LDFLAGS
> +    oe_runmake build/debug
> +    oe_runmake build/debug/cmapdump LD=${BUILD_CC} CC=${BUILD_CC}
> +    oe_runmake build/debug/fontdump LD=${BUILD_CC} CC=${BUILD_CC}
> +
> +    # ...and then we fire 'make', feeding proper
> +    # cross-compilation flags through Makerules file
> +    echo "CFLAGS += ${CFLAGS}" >> ${S}/Makerules
> +    echo "LDFLAGS += ${LDFLAGS}" >> ${S}/Makerules
> +    oe_runmake LD="${CC}"
> +}
> +
> +do_install() {
> +    oe_runmake install prefix="${D}/usr"
> +    install -d ${D}/${datadir}/applications
> +    install -d ${D}/${datadir}/pixmaps
> +    install -d ${D}/${mandir}/man1
> +    install -m 0644 ${S}/debian/mupdf.xpm ${D}/${datadir}/pixmaps/
> +    install -m 0644 ${S}/debian/mupdf.desktop ${D}/${datadir}/applications/
> +    install -m 0644 ${S}/debian/*.1 ${D}/${mandir}/man1/
> +}
> +
> +SRC_URI[md5sum] = "d1e1a1df8fb3e4d1c601506797b75036"
> +SRC_URI[sha256sum] = "6f87c4f113ee9e0f4bdfd3a316ef44052edc4febc8f7b531c4a3f44ffe149605"
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


