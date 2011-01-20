Received: from mrqout3.tiscali.it ([195.130.225.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@tiscali.it>) id 1PfviC-0004bR-99
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 15:42:08 +0100
Received: from [10.39.115.29] by mrq-3 with esmtp (Exim)
	id 1PfuQQ-00069K-Pc; Thu, 20 Jan 2011 14:19:42 +0100
Received: from ps-wm2 (10.39.75.202) by mail-10.mail.tiscali.sys (8.5.134)
	id 4D21E6B80063F78C; Thu, 20 Jan 2011 14:19:42 +0100
Message-ID: <3427233.444821295529582101.JavaMail.defaultUser@defaultHost>
Date: Thu, 20 Jan 2011 14:19:42 +0100 (CET)
From: Luca Bolognini <l.bolognini@tiscali.it>
To: Open Embedded Mailing List <openembedded-devel@lists.openembedded.org>, 
	Arago Mailing List <arago-devel@gforge.ti.com>
MIME-Version: 1.0
xOriginalSenderIP: 78.6.111.196
Subject: qt4-embedded-gles
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
X-List-Received-Date: Thu, 20 Jan 2011 14:42:08 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,
I'm an Arago user, I'm posting to openembedded mailing list too=20
because maybe someone could have faced the same problem.
I'm trying to=20
compile qt4-embedded-gles for MACHINE=3Dbeagleboard.
After, I would like=20
to have it compiled for c6a816x-evm.
As Arago user, I want to have=20
something like an arago-qte-image but with qt4-embedded-gles instead of=20
qt4-embedded.
To do so I have slightly changed task-arago-qte.bb as=20
follows:

DESCRIPTION =3D "Task to add Qt/Embedded and basic plugins"

LICENSE =3D "MIT"
PR =3D "r7"

inherit task

RDEPENDS_${PN} =3D "\
#    qt4-
embedded \
    qt4-embedded-gles \
    qt4-embedded-plugin-mousedriver-
tslib \
    qt4-embedded-plugin-gfxdriver-gfxtransformed \
    "


During task do_compile
NOTE: Running task 2885 of 4245 (ID: 1600,=20
/home/luca/oe/arago-oe-dev/recipes/qt4/qt4-embedded-gles_4.6.3.bb,=20
do_compile)
I got lots of "undefined reference to...":

| arm-none-
linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-
abi=3Dsoftfp -mthumb-interwork -mno-thumb -Wl,-rpath-link,
/home/luca/oe/arago-tmp/sysroots/armv7a-none-linux-gnueabi/usr/lib -
L/home/luca/oe/arago-tmp/sysroots/armv7a-none-linux-gnueabi/usr/lib -Wl,
-rpath-link,/home/luca/oe/arago-tmp/sysroots/armv7a-none-linux-
gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--no-undefined -shared=
=20
-Wl,-Bsymbolic-functions -Wl,-soname,libQtOpenGLE.so.4 -o libQtOpenGLE.
so.4.6.3 .obj/release-shared-emb-arm/qgl.o .obj/release-shared-emb-
arm/qglcolormap.o .obj/release-shared-emb-arm/qglpixelbuffer.o .
obj/release-shared-emb-arm/qglframebufferobject.o .obj/release-shared-
emb-arm/qglextensions.o .obj/release-shared-emb-arm/qglpaintdevice.o .
obj/release-shared-emb-arm/qglshaderprogram.o .obj/release-shared-emb-
arm/qglpixmapfilter.o .obj/release-shared-emb-arm/qgraphicsshadereffect.
o .obj/release-shared-emb-arm/qgraphicssystem_gl.o .obj/release-shared-
emb-arm/qwindowsurface_gl.o .obj/release-shared-emb-arm/qpixmapdata_gl.
o .obj/release-shared-emb-arm/qglgradientcache.o .obj/release-shared-
emb-arm/qglengineshadermanager.o .obj/release-shared-emb-
arm/qgl2pexvertexarray.o .obj/release-shared-emb-
arm/qpaintengineex_opengl2.o .obj/release-shared-emb-
arm/qglcustomshaderstage.o .obj/release-shared-emb-
arm/qtriangulatingstroker.o .obj/release-shared-emb-
arm/qtextureglyphcache_gl.o .obj/release-shared-emb-arm/qgl_qws.o .
obj/release-shared-emb-arm/qglpixelbuffer_egl.o .obj/release-shared-emb-
arm/qglscreen_qws.o .obj/release-shared-emb-arm/qglwindowsurface_qws.o .
obj/release-shared-emb-arm/qgl_egl.o .obj/release-shared-emb-
arm/moc_qgl.o .obj/release-shared-emb-arm/moc_qgl_p.o .obj/release-
shared-emb-arm/moc_qglshaderprogram.o .obj/release-shared-emb-
arm/moc_qgraphicsshadereffect_p.o .obj/release-shared-emb-
arm/moc_qwindowsurface_gl_p.o .obj/release-shared-emb-
arm/moc_qglengineshadermanager_p.o .obj/release-shared-emb-
arm/moc_qtextureglyphcache_gl_p.o   -L/home/luca/oe/arago-
tmp/sysroots/armv7a-none-linux-gnueabi/usr/lib -L/home/luca/oe/arago-
tmp/work/armv7a-none-linux-gnueabi/qt4-embedded-gles-4.6.3-r25.8-
arago4/qt-everywhere-opensource-src-4.6.3/lib -L -Wl,-rpath-link,
/home/luca/oe/arago-tmp/work/armv7a-none-linux-gnueabi/qt4-embedded-
gles-4.6.3-r25.8-arago4/qt-everywhere-opensource-src-4.6.3/lib -lQtGuiE=20
-lQtNetworkE -lQtCoreE -lglib-2.0 -lpthread -lEGL -lIMGegl -lsrv_um -
lEGL -lGLESv2 -lGLES_CM -lIMGegl -lsrv_um
| .obj/release-shared-emb-
arm/qgl_qws.o: In function `qt_egl_add_platform_config(QEglProperties&,=20
QPaintDevice*)':
| /home/luca/oe/arago-tmp/work/armv7a-none-linux-
gnueabi/qt4-embedded-gles-4.6.3-r25.8-arago4/qt-everywhere-opensource-
src-4.6.3/src/opengl/qgl_qws.cpp:134: undefined reference to=20
`QEglProperties::setPixelFormat(QImage::Format)'
| /home/luca/oe/arago-
tmp/work/armv7a-none-linux-gnueabi/qt4-embedded-gles-4.6.3-r25.8-
arago4/qt-everywhere-opensource-src-4.6.3/src/opengl/qgl_qws.cpp:132:=20
undefined reference to `QEglProperties::setPixelFormat(QImage::Format)'

| .obj/release-shared-emb-arm/qgl_qws.o: In function `QGLContext::
chooseContext(QGLContext const*)':
| /home/luca/oe/arago-
tmp/work/armv7a-none-linux-gnueabi/qt4-embedded-gles-4.6.3-r25.8-
arago4/qt-everywhere-opensource-src-4.6.3/src/opengl/qgl_qws.cpp:199:=20
undefined reference to `QEglContext::QEglContext()'
|=20
/home/luca/oe/arago-tmp/work/armv7a-none-linux-gnueabi/qt4-embedded-
gles-4.6.3-r25.8-arago4/qt-everywhere-opensource-src-4.6.3
/src/opengl/qgl_qws.cpp:203: undefined reference to `QEglProperties::
QEglProperties()'
| /home/luca/oe/arago-tmp/work/armv7a-none-linux-
gnueabi/qt4-embedded-gles-4.6.3-r25.8-arago4/qt-everywhere-opensource-
src-4.6.3/src/opengl/qgl_qws.cpp:206: undefined reference to=20
`QEglProperties::setRenderableType(QEgl::API)'
| /home/luca/oe/arago-
tmp/work/armv7a-none-linux-gnueabi/qt4-embedded-gles-4.6.3-r25.8-
arago4/qt-everywhere-opensource-src-4.6.3/src/opengl/qgl_qws.cpp:210:=20
undefined reference to `QEglContext::chooseConfig(QEglProperties=20
const&, QEgl::PixelFormatMatch)'
| /home/luca/oe/arago-tmp/work/armv7a-
none-linux-gnueabi/qt4-embedded-gles-4.6.3-r25.8-arago4/qt-everywhere-
opensource-src-4.6.3/src/opengl/qgl_qws.cpp:240: undefined reference to=20
`QEglContext::~QEglContext()'
| /home/luca/oe/arago-tmp/work/armv7a-
none-linux-gnueabi/qt4-embedded-gles-4.6.3-r25.8-arago4/qt-everywhere-
opensource-src-4.6.3/src/opengl/qgl_qws.cpp:220: undefined reference to=20
`QEglContext::createContext(QEglContext*, QEglProperties const*)'
|=20
/home/luca/oe/arago-tmp/work/armv7a-none-linux-gnueabi/qt4-embedded-
gles-4.6.3-r25.8-arago4/qt-everywhere-opensource-src-4.6.3
/src/opengl/qgl_qws.cpp:232: undefined reference to `QEglContext::
display()'
| .obj/release-shared-emb-arm/qgl_qws.o: In function=20
`qt_egl_create_surface':
| /home/luca/oe/arago-tmp/work/armv7a-none-
linux-gnueabi/qt4-embedded-gles-4.6.3-r25.8-arago4/qt-everywhere-
opensource-src-4.6.3/src/opengl/qgl_qws.cpp:178: undefined reference to=20
`QEglContext::display()'=20
[...]
| collect2: ld returned 1 exit status
|=20
make[1]: *** [../../lib/libQtOpenGLE.so.4.6.3] Error 1
| make[1]:=20
Leaving directory `/home/luca/oe/arago-tmp/work/armv7a-none-linux-
gnueabi/qt4-embedded-gles-4.6.3-r25.8-arago4/qt-everywhere-opensource-
src-4.6.3/src/opengl'
| make: *** [sub-opengl-make_default-ordered]=20
Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:=20
/home/luca/oe/arago-tmp/work/armv7a-none-linux-gnueabi/qt4-embedded-
gles-4.6.3-r25.8-arago4/temp/log.do_compile.7155
ERROR: TaskFailed=20
event exception, aborting
ERROR: Build of /home/luca/oe/arago-oe-
dev/recipes/qt4/qt4-embedded-gles_4.6.3.bb do_compile failed
ERROR:=20
Task 1600 (/home/luca/oe/arago-oe-dev/recipes/qt4/qt4-embedded-gles_4.
6.3.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 2884 tasks of=20
which 2857 didn't need to be rerun and 1 failed.
ERROR:=20
'/home/luca/oe/arago-oe-dev/recipes/qt4/qt4-embedded-gles_4.6.3.bb'=20
failed

Do you have any idea about these troubles?
Is qt4-embedded-gles=20
complementary to qt4-embedded or does it substitute/replace completely=20
qt4-embedded (I acted as things go in this 2nd way) ?

Thank you,
bye

Luca



Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!   Risparmia co=
n Tutto Incluso: telefono + adsl 20 mega a soli 29,95 =E2=82=AC al mese per=
 due anni!  SCONTO DI 240 EURO!  http://abbonati.tiscali.it/telefono-adsl/p=
rodotti/tc/tuttoincluso/?WT.mc_id=3D01fw 


