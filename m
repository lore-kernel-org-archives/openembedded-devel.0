Return-Path: <cavallini.koan@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2439F736B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 16:40:47 +0000 (UTC)
Received: by lamp12 with SMTP id p12so50719311lam.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=P9pthNV/X0QharqJu2MF72bcq96vvHpL9sVwgK0arQE=;
	b=NOHcjB9wELm8xG8rPKOEs1BP/RYV2K1WfjajdpjybNONRwVmslS+s8SdhsQdFKPc6s
	deT+yey8NULmSi4D4xKi888Slnh8liaUjcc8ol7tgna85i2OrnSG0Mety6H4Ikov9uHD
	jsAwXxatmf8AquVD9nrUzAUXm9rZmtLPk3oR0dCYlW0zh+DmjqdXnvFYPL7KYFPJwFrX
	rbItiZz9aFOy0eqUr2tbOyIcU9IY9fHSX8Cg+fBnQMuDJIOH4cQ7ZBNwSiAf+UWCslV2
	6HoBoBCT81tErDwTeZymctVU1Vgw3BpbUIhSBYA2OT5ToG6yWlbiyA7CF+zv2+xnZ1Kv
	o4EA==
MIME-Version: 1.0
X-Received: by 10.152.178.165 with SMTP id cz5mr42570587lac.29.1441989645882; 
	Fri, 11 Sep 2015 09:40:45 -0700 (PDT)
Received: by 10.25.60.204 with HTTP; Fri, 11 Sep 2015 09:40:45 -0700 (PDT)
Date: Fri, 11 Sep 2015 18:40:45 +0200
Message-ID: <CAFQ+DijMtQYh-dF9LORJoSokLvmHv7dApw6W09_OE-OLhU8eew@mail.gmail.com>
From: Marco Cavallini <cavallini.koan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] erros building poppler_0.26.5.bb with --enable-poppler-qt4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 16:40:48 -0000
Content-Type: text/plain; charset=UTF-8

I used to build poppler + qt4 with dora and now I need the same with dizzy.
Unfortunately I am facing to some errors.

I edited poppler_0.26.5.bb enabling --enable-poppler-qt4
then I changed configure.ac patching the library names and adding 'E'.

AC_ARG_ENABLE(poppler-qt4,
              AC_HELP_STRING([--disable-poppler-qt4],
                             [Don't compile poppler Qt4 wrapper.]),
              enable_poppler_qt4=$enableval,
              enable_poppler_qt4="try")
if test x$enable_poppler_qt4 = xyes; then
  PKG_CHECK_MODULES(POPPLER_QT4,
                    QtCoreE >= 4.7.0 QtGuiE >= 4.7.0 QtXmlE >= 4.7.0)
  PKG_CHECK_MODULES(POPPLER_QT4_TEST,
                    QtTestE >= 4.7.0)
elif test x$enable_poppler_qt4 = xtry; then
  PKG_CHECK_MODULES(POPPLER_QT4,
                    QtCoreE >= 4.7.0 QtGuiE >= 4.7.0 QtXmlE >= 4.7.0,
                    [enable_poppler_qt4="yes"],
                    [enable_poppler_qt4="no"])
  if test x$enable_poppler_qt4 = xyes; then
    PKG_CHECK_MODULES(POPPLER_QT4_TEST,
                    QtTestE >= 4.7.0,
                    [enable_poppler_qt4="yes"],
                    [enable_poppler_qt4="no"])
  fi
fi

at this point poppler-0.26.5-r0 do_configure works
but at do_compile I get the following linker error probably related to
some wrong Qt4 library setting:

| make[4]: Entering directory
`/home/koan/yocto-fsl-dizzy/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/poppler/0.26.5-r0/build/qt4/src'
| ../../arm-poky-linux-gnueabi-libtool  --tag=CXX   --mode=link
arm-poky-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork
-mfloat-abi=hard -mfpu=neon -mtune=cortex-a9
--sysroot=/home/koan/yocto-fsl-dizzy/poky/build/tmp/sysroots/imx6dlsabresd
-Dpoppler_qt4_EXPORTS -fPIC -Wall -Woverloaded-virtual
-Wnon-virtual-dtor -Wcast-align -fno-exceptions -fno-check-new
-fno-common  -O2 -pipe -g -feliminate-unused-debug-types
-fvisibility-inlines-hidden -version-info 8:0:4   -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -o libpoppler-qt4.la -rpath
/usr/lib libpoppler_qt4_la-poppler-document.lo
libpoppler_qt4_la-poppler-page.lo
libpoppler_qt4_la-poppler-fontinfo.lo
libpoppler_qt4_la-poppler-embeddedfile.lo
libpoppler_qt4_la-poppler-textbox.lo libpoppler_qt4_la-poppler-link.lo
libpoppler_qt4_la-poppler-annotation.lo
libpoppler_qt4_la-poppler-link-extractor.lo
libpoppler_qt4_la-poppler-optcontent.lo
libpoppler_qt4_la-poppler-page-transition.lo
libpoppler_qt4_la-poppler-sound.lo libpoppler_qt4_la-poppler-form.lo
libpoppler_qt4_la-poppler-base-converter.lo
libpoppler_qt4_la-poppler-ps-converter.lo
libpoppler_qt4_la-poppler-pdf-converter.lo
libpoppler_qt4_la-poppler-qiodeviceoutstream.lo
libpoppler_qt4_la-poppler-private.lo
libpoppler_qt4_la-poppler-movie.lo libpoppler_qt4_la-poppler-media.lo
libpoppler_qt4_la-ArthurOutputDev.lo ../../poppler/libpoppler.la
-lQtGuiE -lQtXmlE -lQtCoreE  -lz -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed
| arm-poky-linux-gnueabi-libtool: link: cannot find the library `' or
unhandled argument `-DLINUX=1'
| make[4]: *** [libpoppler-qt4.la] Error 1
| make[4]: Leaving directory
`/home/koan/yocto-fsl-dizzy/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/poppler/0.26.5-r0/build/qt4/src'

Any Qt4 expert out there could give me a hint about how to solve this?

TIA
--
Marco

