Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 39C6E6B5A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 04:13:15 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so722519eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 21:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=+oYYh778GmEYvR7mcXfv6GIq5yMLukoWWthYK8WhymE=;
	b=aBqSA+v91u6zpzbxrhYMTOp7WoWPWhz6c478+NV4p0HHBb30J3vUVPfhfFPPirgspW
	zIOUovbEBL4kjFQVDJvppnCAcjn3P1MExyBGCBVJaZQo0C86V36uTQUnGLIH3xCOa/3o
	y5zxn0ZgvU9lWJ5feuvLHYvzvy07CO5e9GmigSpo2XlIZOGt4eR2jVPaF8ifm22X+AZz
	U/njr33XCBHsgaP4QYdr3vTOspKXcJESbia/b6fiuDZVgbQexkrLDB3LRRNshpYgcufc
	oBt94uWmlDhT8VPRfxf6LBdsfzzKFaSa0A+bXDFnT79QCefxn3N490f2XYJsoj2aTXKR
	18aQ==
X-Gm-Message-State: ALoCoQk54X20vQYqY1Iq/5xZRWz7KTcT2zjwId4d1KPaG/SqOww2zJ0YF/59knBjnIoe701XuT1B
MIME-Version: 1.0
X-Received: by 10.14.0.200 with SMTP id 48mr9413308eeb.53.1376626395137; Thu,
	15 Aug 2013 21:13:15 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Thu, 15 Aug 2013 21:13:15 -0700 (PDT)
Date: Fri, 16 Aug 2013 00:13:15 -0400
Message-ID: <CALmOhgkdXWZ8rtY5-TgPEMMdmoBD74L9s0RDP-vv07PAU+1c0A@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@gmail.com>
Subject: building and running a qt5 application
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
X-List-Received-Date: Fri, 16 Aug 2013 04:13:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am trying to build and run a simple qt5 example:

    http://qt-project.org/doc/qt-5.0/qtuitools/textfinder.html

The first interesting thing that I come across is that the qt5 header
files in the sysroot are located in:

     ${PKG_CONFIG_SYSROOT_DIR}/usr/include/qt5

but when the build system configures itself to build the qt5
application, it uses a bunch of include directories such as:

    ${PKG_CONFIG_SYSROOT_DIR}/usr/include/QtCore
    ${PKG_CONFIG_SYSROOT_DIR}/usr/include/QtGui
    ${PKG_CONFIG_SYSROOT_DIR}/usr/include/QtWidgets

Therefore any recipe that wants to build a qt5 application is forced
to either modify the CXXFLAGS variable or say:

    OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"

If the build system knows it's going to be putting the qt5 header
files in $sysroot/usr/include/qt5/etc, why not simply use that instead
of requiring the users to update the include paths themselves in all
their recipes?

Secondly, I added both "qtbase" and my package to IMAGE_INSTALL, added
the "meta-qt5" layer to "bblayers.conf", specified "QT5_VERSION" as
"5.0.2", and then built:

    $ bitbake core-image-x11

When I tried to run my application I received:

    Failed to load platform plugin "xcb". Available platforms are:

    Aborted

Shouldn't an x11 image have included the xcb platform?

Any tips on building and running a simple qt5 application in a
yocto-based image?

Best regards,
    Trevor

