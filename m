Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id DAC336E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 16:51:45 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so204910413ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 09:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=KpEFoq5u6P0N4j909EeBBV0VALRIPu++pdWm61QQN0A=;
	b=QlJ+jC1zLP4s+R6oj275fQdjVKo2Jv11QjvOLNjFTlKh7Hz9cs4JUZcertLaeZvFY+
	36zO/zlnSQJ29GBdhZlB/N7MN5GJDpUA/E9f1hY6pkC58VAt4ETsWzy/jTDJ8vgLVzhX
	hfgM8KrmWYwRgb6agfgg6aAOo4ovA6oRzuNOa+uHiHQDXVvQtYgLuBD9mtq0X+FIHNSy
	8DTkgJEGg0F/P5xorf5KUFdZOTd16nq5+Lhz/58NJUAm8/X4GbWghUif/5pZg6gViRo6
	Elq4opY3E6PiiV6XMZ8R/My0Pk1dZPOAleZoh3c8D1PfWFRglyahhiog/Gii7XaUDLbd
	fwvg==
X-Received: by 10.107.162.139 with SMTP id l133mr33922403ioe.49.1442335905525; 
	Tue, 15 Sep 2015 09:51:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Tue, 15 Sep 2015 09:51:16 -0700 (PDT)
In-Reply-To: <365E1805BC95084CBE82381A0B86999401095D768C@EU-MBX-01.mgc.mentorg.com>
References: <1442057863-19627-1-git-send-email-schnitzeltony@googlemail.com>
	<365E1805BC95084CBE82381A0B86999401095D768C@EU-MBX-01.mgc.mentorg.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Sep 2015 09:51:16 -0700
Message-ID: <CAMKF1sq85H=827ZhLuWxNL8qthJcjCEc2sHYJ96nzuc2=1hwzw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5] qtbase: fix build for PACKAGECONFIG gles2
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
X-List-Received-Date: Tue, 15 Sep 2015 16:51:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2015 at 11:51 PM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote=
:
> Noor,
>
> I am keen to know that how this patch does not include X.h where None was=
 being defined to 0 earlier.
>

QT can build without X, in case you have X in there then using it from
X.h might be OK.

> Noor
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Andreas M=C3=BCller
> Sent: Saturday, September 12, 2015 4:38 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH][meta-qt5] qtbase: fix build for PACKAGECONFIG gles2
>
> fixes:
>
> | In file included from /home/superandy/tmp/oe-core-glibc/sysroots/varsom=
imx6q/usr/include/X11/Xlib.h:44:0,
> |                  from /home/superandy/tmp/oe-core-glibc/sysroots/varsom=
imx6q/usr/include/EGL/eglvivante.h:244,
> |                  from /home/superandy/tmp/oe-core-glibc/sysroots/varsom=
imx6q/usr/include/EGL/eglplatform.h:38,
> |                  from /home/superandy/tmp/oe-core-glibc/sysroots/varsom=
imx6q/usr/include/EGL/egl.h:39,
> |                  from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2=
hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59e=
e-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen_p.h:52,
> |                  from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2=
hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59e=
e-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:34:
> | ../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: e=
xpected identifier before numeric constant
> |          None =3D 0x0,
> |          ^
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...mscreen.cpp-reorder-headers-to-fix-build-.patch | 49 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reo=
rder-headers-to-fix-build-.patch
>
> diff --git a/recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-he=
aders-to-fix-build-.patch b/recipes-qt/qt5/qtbase/0012-qeglplatformscreen.c=
pp-reorder-headers-to-fix-build-.patch
> new file mode 100644
> index 0000000..a1a8791
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-headers-
> +++ to-fix-build-.patch
> @@ -0,0 +1,49 @@
> +From f8873b5ba0fa42cc0d2aadfd6c5a449b37799609 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Sat, 12 Sep 2015 12:58:46 +0200
> +Subject: [PATCH] qeglplatformscreen.cpp: reorder headers to fix build
> +with egl  enabled
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +fixes:
> +In file included from /home/superandy/tmp/oe-core-glibc/sysroots/varsomi=
mx6q/usr/include/X11/Xlib.h:44:0,
> +                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomi=
mx6q/usr/include/EGL/eglvivante.h:244,
> +                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomi=
mx6q/usr/include/EGL/eglplatform.h:38,
> +                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomi=
mx6q/usr/include/EGL/egl.h:39,
> +                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2h=
f-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee=
-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen_p.h:52,
> +                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2h=
f-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee=
-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:34:
> +../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: ex=
pected identifier before numeric constant
> +         None =3D 0x0,
> +         ^
> +
> +This patch has a very limited lifetime: In branch dev and 5.6 the patche=
d file is gone. Therefore:
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +---
> + src/platformsupport/eglconvenience/qeglplatformscreen.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
> +b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
> +index 61f8cdd..ceec797 100644
> +--- a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
> ++++ b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
> +@@ -31,10 +31,10 @@
> + **
> +
> +***********************************************************************
> +*****/
> +
> +-#include "qeglplatformscreen_p.h"
> +-#include "qeglplatformwindow_p.h"
> + #include <QtGui/qwindow.h>
> + #include <qpa/qwindowsysteminterface.h>
> ++#include "qeglplatformscreen_p.h"
> ++#include "qeglplatformwindow_p.h"
> + #include <QtPlatformSupport/private/qopenglcompositor_p.h>
> +
> + QT_BEGIN_NAMESPACE
> +--
> +2.1.0
> +
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb =
index f4287cc..4a073c5 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -25,6 +25,7 @@ SRC_URI +=3D "\
>  SRC_URI +=3D "\
>      file://0009-qmake-don-t-build-it-in-configure-but-allow-to-build.pat=
ch \
>      file://0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
> +
> + file://0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
> + \
>  "
>
>  DEPENDS +=3D "qtbase-native"
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

