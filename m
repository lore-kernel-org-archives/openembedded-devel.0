Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Oyhmw-0007G3-Sj for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 11:08:23 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet2.eads.net with ESMTP; 23 Sep 2010 11:02:03 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 23 Sep 2010 11:07:56 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 23 Sep 2010 11:07:56 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 23 Sep 2010 11:07:54 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74419@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: qt4-embedded-gles_4.6.3: Error on compile/link for angstrom
	distro and omap3evm machine
thread-index: ActaTvnpbUPq7HrmSN6VjZRAFUvq8QAr48rA
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 23 Sep 2010 09:07:56.0323 (UTC)
	FILETIME=[CFB68730:01CB5AFE]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@cassidian.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4-embedded-gles_4.6.3: Error on compile/link for angstrom distro and omap3evm machine
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
X-List-Received-Date: Thu, 23 Sep 2010 09:08:24 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

the problem is solved with a complete build from scratch.
I should do it more frequently.

Regards
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: Hauser, Wolfgang (external)=20
Gesendet: Mittwoch, 22. September 2010 14:09
An: 'openembedded-devel@lists.openembedded.org'
Betreff: qt4-embedded-gles_4.6.3: Error on compile/link for angstrom =
distro and omap3evm machine

Hello,

I tried to build the latest qt4-embedded-gles 4.6.3 and got following =
error message:
... snip
| rm -f libQtOpenGLE.so.4.6.3 libQtOpenGLE.so libQtOpenGLE.so.4 =
libQtOpenGLE.so.4.6
| arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp =
-Wl,-rpath-link,/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/sys=
roots/armv7a-angstrom-linux-gnueabi/usr/lib =
-L/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/lib =
-Wl,-rpath-link,/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/sys=
roots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 =
-Wl,--hash-style=3Dgnu -Wl,--no-undefined -shared =
-Wl,-Bsymbolic-functions -Wl,-soname,libQtOpenGLE.so.4 -o =
libQtOpenGLE.so.4.6.3 .obj/release-shared-emb-arm/qgl.o =
.obj/release-shared-emb-arm/qglcolormap.o =
.obj/release-shared-emb-arm/qglpixelbuffer.o =
.obj/release-shared-emb-arm/qglframebufferobject.o =
.obj/release-shared-emb-arm/qglextensions.o =
.obj/release-shared-emb-arm/qglpaintdevice.o =
.obj/release-shared-emb-arm/qglshaderprogram.o =
.obj/release-shared-emb-arm/qglpixmapfilter.o =
.obj/release-shared-emb-arm/qgraphicsshadereffect.o =
.obj/release-shared-emb-arm/qgraphicssystem_gl.o =
.obj/release-shared-emb-arm/qwindowsurface_gl.o =
.obj/release-shared-emb-arm/qpixmapdata_gl.o =
.obj/release-shared-emb-arm/qglgradientcache.o =
.obj/release-shared-emb-arm/qglengineshadermanager.o =
.obj/release-shared-emb-arm/qgl2pexvertexarray.o =
.obj/release-shared-emb-arm/qpaintengineex_opengl2.o =
.obj/release-shared-emb-arm/qglcustomshaderstage.o =
.obj/release-shared-emb-arm/qtriangulatingstroker.o =
.obj/release-shared-emb-arm/qtextureglyphcache_gl.o =
.obj/release-shared-emb-arm/qgl_qws.o =
.obj/release-shared-emb-arm/qglpixelbuffer_egl.o =
.obj/release-shared-emb-arm/qglscreen_qws.o =
.obj/release-shared-emb-arm/qglwindowsurface_qws.o =
.obj/release-shared-emb-arm/qgl_egl.o =
.obj/release-shared-emb-arm/moc_qgl.o =
.obj/release-shared-emb-arm/moc_qgl_p.o =
.obj/release-shared-emb-arm/moc_qglshaderprogram.o =
.obj/release-shared-emb-arm/moc_qgraphicsshadereffect_p.o =
.obj/release-shared-emb-arm/moc_qwindowsurface_gl_p.o =
.obj/release-shared-emb-arm/moc_qglengineshadermanager_p.o =
.obj/release-shared-emb-arm/moc_qtextureglyphcache_gl_p.o   =
-L/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/lib =
-L/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/work/armv7a-angst=
rom-linux-gnueabi/qt4-embedded-gles-4.6.3-r21.8/qt-everywhere-opensource-=
src-4.6.3/lib -L =
-Wl,-rpath-link,/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/wor=
k/armv7a-angstrom-linux-gnueabi/qt4-embedded-gles-4.6.3-r21.8/qt-everywhe=
re-opensource-src-4.6.3/lib -lQtGuiE -lQtNetworkE -lQtCoreE -lglib-2.0 =
-lpthread -lEGL -lIMGegl -lsrv_um -lEGL -lGLESv2 -lGLES_CM -lIMGegl =
-lsrv_um
| .obj/release-shared-emb-arm/qgl_qws.o: In function =
`QGLContext::chooseContext(QGLContext const*)':
| =
/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/work/armv7a-angstro=
m-linux-gnueabi/qt4-embedded-gles-4.6.3-r21.8/qt-everywhere-opensource-sr=
c-4.6.3/src/opengl/qgl_qws.cpp:232: undefined reference to =
`QEglContext::display()'
| .obj/release-shared-emb-arm/qgl_qws.o: In function =
`qt_egl_create_surface':
| =
/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/work/armv7a-angstro=
m-linux-gnueabi/qt4-embedded-gles-4.6.3-r21.8/qt-everywhere-opensource-sr=
c-4.6.3/src/opengl/qgl_qws.cpp:178: undefined reference to =
`QEglContext::display()'
| =
/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/work/armv7a-angstro=
m-linux-gnueabi/qt4-embedded-gles-4.6.3-r21.8/qt-everywhere-opensource-sr=
c-4.6.3/src/opengl/qgl_qws.cpp:175: undefined reference to =
`QEglContext::display()'
| .obj/release-shared-emb-arm/qglpixelbuffer_egl.o: In function =
`QGLPixelBuffer::hasOpenGLPbuffers()':
| =
/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/work/armv7a-angstro=
m-linux-gnueabi/qt4-embedded-gles-4.6.3-r21.8/qt-everywhere-opensource-sr=
c-4.6.3/src/opengl/qglpixelbuffer_egl.cpp:211: undefined reference to =
`QEglContext::display()'
| .obj/release-shared-emb-arm/qglpixelbuffer_egl.o: In function =
`QGLPixelBuffer::releaseFromDynamicTexture()':
| =
/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/work/armv7a-angstro=
m-linux-gnueabi/qt4-embedded-gles-4.6.3-r21.8/qt-everywhere-opensource-sr=
c-4.6.3/src/opengl/qglpixelbuffer_egl.cpp:184: undefined reference to =
`QEglContext::display()'
| =
.obj/release-shared-emb-arm/qglpixelbuffer_egl.o:/home/devel/warrior_glob=
als/BSP_ARM/angstrom-omap3evm/work/armv7a-angstrom-linux-gnueabi/qt4-embe=
dded-gles-4.6.3-r21.8/qt-everywhere-opensource-src-4.6.3/src/opengl/qglpi=
xelbuffer_egl.cpp:171: more undefined references to =
`QEglContext::display()' follow
| .obj/release-shared-emb-arm/qgl_egl.o: In function =
`qt_egl_update_format(QEglContext const&, QGLFormat&)':
| =
/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/work/armv7a-angstro=
m-linux-gnueabi/qt4-embedded-gles-4.6.3-r21.8/qt-everywhere-opensource-sr=
c-4.6.3/src/opengl/qgl_egl.cpp:129: undefined reference to =
`QEglContext::clearError()'
| collect2: ld returned 1 exit status
| make[1]: *** [../../lib/libQtOpenGLE.so.4.6.3] Error 1
| make[1]: Leaving directory =
`/home/devel/warrior_globals/BSP_ARM/angstrom-omap3evm/work/armv7a-angstr=
om-linux-gnueabi/qt4-embedded-gles-4.6.3-r21.8/qt-everywhere-opensource-s=
rc-4.6.3/src/opengl'
| make: *** [sub-opengl-make_default-ordered] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
snip ...

what is going wrong here ? Is something missing ?

Regards
Wolfgang Hauser


