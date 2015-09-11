Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AADD773CBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 06:34:17 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZaHub-0006sb-6H from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2015 23:34:17 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.194]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0224.002; Fri, 11 Sep 2015 07:34:16 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] qtbase: Fix qeglplatformscreen.c compilation issue due
	refinition on None.
Thread-Index: AQHQ67wvyG1kZEDNNket9qZ74ucOz5423/tg
Date: Fri, 11 Sep 2015 06:34:14 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095D5E7C@EU-MBX-01.mgc.mentorg.com>
References: <1441884648-4113-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1441884648-4113-1-git-send-email-noor_ahsan@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [PATCH] qtbase: Fix qeglplatformscreen.c compilation issue due refinition on None.
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
X-List-Received-Date: Fri, 11 Sep 2015 06:34:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry this patch is not for oe.

-----Original Message-----
From: Ahsan, Noor=20
Sent: Thursday, September 10, 2015 4:31 PM
To: openembedded-devel@lists.openembedded.org
Cc: Ahsan, Noor
Subject: [PATCH] qtbase: Fix qeglplatformscreen.c compilation issue due ref=
inition on None.

From: Noor <noor_ahsan@mentor.com>

* In Qt5.5 qeglplatformscreen.c includes qurl.h and X.h (via eglvivante.h).=
 X.h
  define None to 0L but qurl.h set None to 0 in enum. Due to this do_compil=
e task
  fails saying "qurl.h:131:9: error: expected identifier before numeric con=
stant".
  This patch undefine None in qurl.h if it is define earlier.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../qtbase/fix_multiple_definition_of_None.patch   |   41 ++++++++++++++++=
++++
 qt5-layer/recipes-qt/qt5/qtbase_%.bbappend         |    4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/qt5-layer/recipes-qt/qt5/qtbase/fix_multiple_definition_of_Non=
e.patch b/qt5-layer/recipes-qt/qt5/qtbase/fix_multiple_definition_of_None.p=
atch
new file mode 100644
index 0000000..f5b2abf
--- /dev/null
+++ b/qt5-layer/recipes-qt/qt5/qtbase/fix_multiple_definition_of_None.pa
+++ tch
@@ -0,0 +1,41 @@
+Workaround qeglplatformscreen.c failure in Qt5.5 due to inclusion of qurl.=
h and X.h. X.h define None to 0L and qurl.h set None to 0 in enum. Due to t=
his following error occur. Undef None in qurl.h if it is defined.
+
+In file included from /home/noor/SB/release_2015.12/build/tmp/sysroots/imx=
6qsabresd/usr/include/X11/Xlib.h:44:0,
+                 from /home/noor/SB/release_2015.12/build/tmp/sysroots/imx=
6qsabresd/usr/include/EGL/eglvivante.h:244,
+                 from /home/noor/SB/release_2015.12/build/tmp/sysroots/imx=
6qsabresd/usr/include/EGL/eglplatform.h:38,
+                 from /home/noor/SB/release_2015.12/build/tmp/sysroots/imx=
6qsabresd/usr/include/EGL/egl.h:39,
+                 from /home/noor/SB/release_2015.12/build/tmp/work/cortexa=
9hf-vfp-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r=
0/git/src/platformsupport/eglconvenience/qeglplatformscreen_p.h:52,
+                 from /home/noor/SB/release_2015.12/build/tmp/work/cortexa=
9hf-vfp-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r=
0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:34:
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: expe=
cted identifier before numeric constant
+         None =3D 0x0,
+         ^
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error:=20
+expected '}' before numeric constant
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error:=20
+expected unqualified-id before numeric constant In file included from ../.=
./include/QtCore/qurl.h:1:0,
+                 from ../../include/QtGui/../../../git/src/gui/kernel/qeve=
nt.h:48,
+                 from ../../include/QtGui/qevent.h:1,
+                 from ../../include/QtGui/QTouchEvent:1,
+                 from ../../include/QtGui/5.5.0/QtGui/qpa/../../../../../.=
./git/src/gui/kernel/qwindowsysteminterface.h:53,
+                 from ../../include/QtGui/5.5.0/QtGui/qpa/qwindowsystemint=
erface.h:1,
+                 from /home/noor/SB/release_2015.12/build/tmp/work/cortexa=
9hf-vfp-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r=
0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:37:
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:26: error: 'Ur=
lFormattingOption' was not declared in this scope
+     typedef QUrlTwoFlags<UrlFormattingOption,=20
+ComponentFormattingOption> FormattingOptions; ....
+
+
+Upstream-Status: Inappropriate [workaround]
+
+diff --git a/src/corelib/io/qurl.h b/src/corelib/io/qurl.h index=20
+e6c570d..06de3af 100644
+--- a/src/corelib/io/qurl.h
++++ b/src/corelib/io/qurl.h
+@@ -128,6 +128,9 @@ public:
+=20
+     // encoding / toString values
+     enum UrlFormattingOption {
++#ifdef None
++#undef None
++#endif
+         None =3D 0x0,
+         RemoveScheme =3D 0x1,
+         RemovePassword =3D 0x2,
diff --git a/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend b/qt5-layer/recipes=
-qt/qt5/qtbase_%.bbappend
index e0979bf..4ad4c5c 100644
--- a/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend
+++ b/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend
@@ -2,7 +2,9 @@
=20
 FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
=20
-SRC_URI +=3D "file://Force_egl_visual_ID_33.patch"
+SRC_URI +=3D "file://Force_egl_visual_ID_33.patch \
+            file://fix_multiple_definition_of_None.patch \ "
=20
 HAS_X11 =3D "${@base_contains('DISTRO_FEATURES', 'x11', 1, 0, d)}"
=20
--
1.7.9.5


