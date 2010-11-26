Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PLxDw-0005zd-2w for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 13:16:22 +0100
Received: from f053037197.adsl.alicedsl.de ([78.53.37.197]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PLxCj-0000le-Tj for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 12:15:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Nov 2010 13:15:04 +0100
Message-ID: <1290773704.28296.30.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xbmc: task `compile` fails with `/tools/TexturePacker/XBMCTex.cpp:394: undefined reference to `__lzo_init2'`
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
X-List-Received-Date: Fri, 26 Nov 2010 12:16:22 -0000
X-Groupsio-MsgNum: 26616
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+G4Zs9XCPp1CIGgRKCK2"

--=-+G4Zs9XCPp1CIGgRKCK2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`bitbake -k xbmc` fails with the following error in task `compile`.

        [=E2=80=A6]
        fastmemcpy.c:1: warning: switch -mcpu=3Dcortex-a8 conflicts with -m=
arch=3D switch
        ar crus utils.a AlarmClock.o Archive.o Builtins.o CharsetConverter.=
o CriticalSection.o DownloadQueue.o DownloadQueueManager.o Event.o fstrcmp.=
o GUIInfoManager.o HTMLTable.o HTMLUtil.o HttpHeader.o IMDB.o InfoLoader.o =
IoSupport.o log.o MusicAlbumInfo.o MusicInfoScraper.o RegExp.o RssReader.o =
ScraperParser.o SingleLock.o Splash.o Stopwatch.o SystemInfo.o TuxBoxUtil.o=
 UdpClient.o Weather.o Thread.o SharedSection.o Win32Exception.o CPUInfo.o =
PCMAmplifier.o PCMRemap.o LabelFormatter.o Network.o BitstreamStats.o Perfo=
rmanceStats.o PerformanceSample.o LCDFactory.o LCD.o EventServer.o EventPac=
ket.o EventClient.o Socket.o Fanart.o ScraperUrl.o MusicArtistInfo.o Mutex.=
o md5.o ArabicShaping.o AsyncFileCopy.o DbusServer.o Atomics.o LockFree.o S=
treamDetails.o TimeUtils.o JobManager.o Teletext.o PasswordManager.o AliasS=
hortcutUtils.o WebServer.o AnnouncementManager.o Semaphore.o RingBuffer.o F=
ileOperationJob.o FileUtils.o Variant.o PCMLimiter.o fastmemcpy.o  =20
        make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714a=
dcbe/git/xbmc/utils'
        make -C xbmc/cores/DllLoader/exports/util
        make[1]: Entering directory `/oe/build/angstrom-dev/work/armv7a-ang=
strom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714=
adcbe/git/xbmc/cores/DllLoader/exports/util'
        make[1]: `exports_utils.a' is up to date.
        make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714a=
dcbe/git/xbmc/cores/DllLoader/exports/util'
        make -C xbmc/cores/DllLoader/exports
        make[1]: Entering directory `/oe/build/angstrom-dev/work/armv7a-ang=
strom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714=
adcbe/git/xbmc/cores/DllLoader/exports'
        make[1]: `exports.a' is up to date.
        make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714a=
dcbe/git/xbmc/cores/DllLoader/exports'
        arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/=
build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexp=
ensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -fp=
ermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE=
64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoft=
fp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon=
 -mvectorize-with-neon-quad -isystem/oe/build/angstrom-dev/sysroots/armv7a-=
angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-regis=
ters -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidd=
en -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =
-g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=
=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -L/oe/b=
uild/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath=
-link,/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
 -Wl,-O1 -Wl,--hash-style=3Dgnu -o xbmc.bin -Wl,--whole-archive xbmc/lib/cm=
yth/libcmyth/libcmyth.a xbmc/lib/cmyth/librefmem/librefmem.a xbmc/linux/lin=
ux.a xbmc/utils/utils.a xbmc/cores/DllLoader/exports/util/exports_utils.a x=
bmc/cores/DllLoader/exports/exports.a -Wl,--no-whole-archive xbmc/xbmc.a xb=
mc/addons/addons.a xbmc/cores/playercorefactory/playercorefactory.a xbmc/co=
res/dvdplayer/DVDPlayer.a xbmc/cores/paplayer/paplayer.a xbmc/cores/VideoRe=
nderers/VideoRenderer.a xbmc/cores/VideoRenderers/VideoShaders/VideoShaders=
.a guilib/guilib.a guilib/common/gui_common.a guilib/tinyXML/tinyxml.a xbmc=
/cdrip/cdrip.a xbmc/cores/cores.a xbmc/lib/libPython/python.a xbmc/cores/Dl=
lLoader/dllloader.a xbmc/cores/dvdplayer/DVDCodecs/DVDCodecs.a xbmc/cores/d=
vdplayer/DVDCodecs/Audio/Audio.a xbmc/cores/dvdplayer/DVDCodecs/Overlay/Ove=
rlay.a xbmc/cores/dvdplayer/DVDCodecs/Video/Video.a xbmc/cores/dvdplayer/DV=
DDemuxers/DVDDemuxers.a xbmc/cores/dvdplayer/DVDInputStreams/DVDInputStream=
s.a xbmc/cores/dvdplayer/DVDSubtitles/DVDSubtitles.a xbmc/cores/dvdplayer/C=
odecs/libbdnav/src/libbdnav/.libs/libbdnav.a xbmc/cores/AudioRenderers/audi=
orenderers.a xbmc/cores/ExternalPlayer/ExternalPlayer.a xbmc/FileSystem/fil=
esystem.a xbmc/FileSystem/MusicDatabaseDirectory/musicdatabasedirectory.a x=
bmc/FileSystem/VideoDatabaseDirectory/videodatabasedirectory.a xbmc/karaoke=
/karaoke.a xbmc/lib/libPython/xbmcmodule/xbmcmodule.a xbmc/lib/libscrobbler=
/scrobbler.a xbmc/lib/libRTV/librtv-arm.a xbmc/lib/libshout/libshout-arm.a =
xbmc/lib/libUPnP/libupnp-arm.a xbmc/lib/libXDAAP/libxdaap-arm.a xbmc/lib/li=
bjsonrpc/libjsonrpc.a lib/jsoncpp/jsoncpp/src/lib_json/libjsoncpp.a xbmc/li=
b/libhttpapi/libhttpapi.a xbmc/lib/sqLite/sqllite.a xbmc/lib/libsquish/libs=
quish-arm.a xbmc/lib/libapetag/.libs/libapetag.a lib/xbmc-dll-symbols/dll-s=
ymbols.a xbmc/settings/settings.a xbmc/lib/libXBMS/libxbms-arm.a xbmc/lib/U=
nrarXLib/UnrarXLib.a xbmc/posix/posix.a -lswscale -lpostproc -lavutil -lavf=
ormat -lavcodec -lXrandr -lavahi-client -lavahi-common -lfaac -lmicrohttpd =
-lSDL_image -lrt -ltiff -ljasper -lresolv -ldl -lSDL_mixer -lsmbclient -lfa=
ad -lmysqlclient -lmodplug -lmpeg2convert -lmpeg2 -lwavpack -lcrypto -lssl =
-lz -llzo2 -lpthread -ljpeg -lbz2 -lGLESv2 -lEGL  -lmad -lm   -lfontconfig =
  -lfribidi   -lsqlite3   -lpng12   -lpcre   -lpcre -lpcrecpp   -lcdio -lm =
  -lsamplerate   -lmms -lm -lglib-2.0   -lfreetype   -logg   -lvorbis -lm -=
logg   -lvorbisenc -lvorbis -lm -logg   -L/oe/build/angstrom-dev/sysroots/a=
rmv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/build/angstrom-dev=
/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3D=
gnu -rdynamic -L/oe/build/angstrom-dev/sysroots/i686-linux/usr/armv7a/lib -=
lmysqlclient -lz -lcrypt -lnsl -lm -lasound   -lenca -lm   -lXt -lX11   -lX=
tst   -lXext   -lXmu -lXt -lX11   -lXinerama   -lcurl   -ldbus-1 -lpthread =
-lrt   -lSDL -lpthread   -lpython2.6 -rdynamic
        arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/=
build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexp=
ensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -fP=
IC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_=
DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darm=
v7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isystem/oe/b=
uild/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -fPI=
C -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_D=
EBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv=
7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -L/oe/build/an=
gstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/=
oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O=
1 -Wl,--hash-style=3Dgnu -o xbmc-xrandr xbmc-xrandr.c -lXrandr -lXrender -l=
X11=20
        xbmc-xrandr.c:1: warning: switch -mcpu=3Dcortex-a8 conflicts with -=
march=3D switch
        make -C tools/TexturePacker/
        make[1]: Entering directory `/oe/build/angstrom-dev/work/armv7a-ang=
strom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714=
adcbe/git/tools/TexturePacker'
        arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -MD -c -isys=
tem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/includ=
e -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -gg=
db2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=
 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-marc=
h=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isyst=
em/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include=
 -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggd=
b2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =
-g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=
=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isyste=
m/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include =
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb=
2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -=
g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=
=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad  -D_LIN=
UX -D_FILE_DEFINED -D__STDC_CONSTANT_MACROS -DBIN_INSTALL_PATH=3D"\"/usr/li=
b/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/xbmc\"" -DHAS_SDL_JOYSTICK -D'SVN_=
REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H  -I../../xbmc/utils -I../../guili=
b -I../../xbmc/linux -I../../xbmc/lib/libsquish -D_GNU_SOURCE=3D1 -D_REENTR=
ANT -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/inc=
lude/ -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/i=
nclude/SDL -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/=
usr/include/alsa -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gn=
ueabi/usr/include/dbus-1.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstro=
m-linux-gnueabi/usr/include/freetype2 -I/oe/build/angstrom-dev/sysroots/arm=
v7a-angstrom-linux-gnueabi/usr/include/fribidi -I/oe/build/angstrom-dev/sys=
roots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angstr=
om-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12 -I/oe/bu=
ild/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/in=
clude -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/l=
ib/glib-2.0/include -I/oe/build/angstrom-dev/sysroots/i686-linux/usr/armv7a=
/include -I/oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-1=
0.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git SDL_anigif.c -o =
SDL_anigif.o
        SDL_anigif.c:1: warning: switch -mcpu=3Dcortex-a8 conflicts with -m=
arch=3D switch
        arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -MD -c -isys=
tem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/includ=
e -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -gg=
db2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LA=
RGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=
=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=
=3Dneon -mvectorize-with-neon-quad -isystem/oe/build/angstrom-dev/sysroots/=
armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlin=
es-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BIT=
S=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa=
,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad =
-isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/i=
nclude -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT =
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloa=
t-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 =
-mfpu=3Dneon -mvectorize-with-neon-quad  -D_LINUX -D_FILE_DEFINED -D__STDC_=
CONSTANT_MACROS -DBIN_INSTALL_PATH=3D"\"/usr/lib/xbmc\"" -DINSTALL_PATH=3D"=
\"/usr/share/xbmc\"" -DHAS_SDL_JOYSTICK -D'SVN_REV=3D"Unknown"' -D_ARMEL -D=
HAVE_CONFIG_H  -I../../xbmc/utils -I../../guilib -I../../xbmc/linux -I../..=
/xbmc/lib/libsquish -D_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build/angstrom-dev=
/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/ -I/oe/build/angstrom-d=
ev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/SDL -I/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build=
/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -=
I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/=
freetype2 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/include/fribidi -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-=
gnueabi/usr/include/glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angst=
rom-linux-gnueabi/usr/include/libpng12 -I/oe/build/angstrom-dev/sysroots/ar=
mv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/oe/build/angstrom-d=
ev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/oe/bu=
ild/angstrom-dev/sysroots/i686-linux/usr/armv7a/include -I/oe/build/angstro=
m-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe9643=
21c358ab9d6402088c714adcbe/git XBTFWriter.cpp -o XBTFWriter.o
        XBTFWriter.cpp:1: warning: switch -mcpu=3Dcortex-a8 conflicts with =
-march=3D switch
        arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -MD -c -isys=
tem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/includ=
e -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -gg=
db2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LA=
RGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=
=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=
=3Dneon -mvectorize-with-neon-quad -isystem/oe/build/angstrom-dev/sysroots/=
armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlin=
es-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BIT=
S=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa=
,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad =
-isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/i=
nclude -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT =
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloa=
t-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 =
-mfpu=3Dneon -mvectorize-with-neon-quad  -D_LINUX -D_FILE_DEFINED -D__STDC_=
CONSTANT_MACROS -DBIN_INSTALL_PATH=3D"\"/usr/lib/xbmc\"" -DINSTALL_PATH=3D"=
\"/usr/share/xbmc\"" -DHAS_SDL_JOYSTICK -D'SVN_REV=3D"Unknown"' -D_ARMEL -D=
HAVE_CONFIG_H  -I../../xbmc/utils -I../../guilib -I../../xbmc/linux -I../..=
/xbmc/lib/libsquish -D_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build/angstrom-dev=
/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/ -I/oe/build/angstrom-d=
ev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/SDL -I/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build=
/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -=
I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/=
freetype2 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/include/fribidi -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-=
gnueabi/usr/include/glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angst=
rom-linux-gnueabi/usr/include/libpng12 -I/oe/build/angstrom-dev/sysroots/ar=
mv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/oe/build/angstrom-d=
ev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/oe/bu=
ild/angstrom-dev/sysroots/i686-linux/usr/armv7a/include -I/oe/build/angstro=
m-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe9643=
21c358ab9d6402088c714adcbe/git XBMCTex.cpp -o XBMCTex.o
        XBMCTex.cpp:1: warning: switch -mcpu=3Dcortex-a8 conflicts with -ma=
rch=3D switch
        XBMCTex.cpp: In function 'CXBTFFrame createXBTFFrame(SDL_Surface*, =
CXBTFWriter&, double, unsigned int)':
        XBMCTex.cpp:235: warning: unused variable 'format'
        XBMCTex.cpp:236: warning: unused variable 'colorMSE'
        XBMCTex.cpp:236: warning: unused variable 'alphaMSE'
        arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/=
build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexp=
ensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -fp=
ermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE=
64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoft=
fp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon=
 -mvectorize-with-neon-quad -isystem/oe/build/angstrom-dev/sysroots/armv7a-=
angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-regis=
ters -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidd=
en -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =
-g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=
=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isyste=
m/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include =
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb=
2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARG=
EFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=
=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=
=3Dneon -mvectorize-with-neon-quad SDL_anigif.o XBTFWriter.o XBMCTex.o ../.=
./guilib/XBTF.o      -L/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linu=
x-gnueabi/usr/lib -Wl,-rpath-link,/oe/build/angstrom-dev/sysroots/armv7a-an=
gstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu ../../xbmc/lib/=
libsquish/libsquish-arm.a -lSDL_image -lSDL -llzo2 -o TexturePacker
        XBMCTex.o: In function `main':
        /oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.0=
5-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git/tools/TexturePacker=
/XBMCTex.cpp:394: undefined reference to `__lzo_init2'
        collect2: ld returned 1 exit status
        make[1]: *** [TexturePacker] Error 1
        make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714a=
dcbe/git/tools/TexturePacker'
        make: *** [tools/TexturePacker/TexturePacker] Error 2
        FATAL: oe_runmake failed
        ERROR: Function do_compile failed

I tried it with the following build configuration.

        Build Configuration:
        BB_VERSION        =3D "1.10.0"  =20
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "97ea91e"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "angstrom"
        DISTRO_VERSION    =3D "2010.7-test-20101126"
        TARGET_FPU        =3D "hard"

Could someone please shed some light on this, with what revision and
configuration it works correctly. If I remember correctly this was a
successful GSoC project.


Thanks,

Paul

--=-+G4Zs9XCPp1CIGgRKCK2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzvpMgACgkQPX1aK2wOHVgA0gCfWpM9CE+IVWS1epfW3ooJHhHy
x1UAoIfxxy2l08yZoAV2p52HXb4yLk6N
=8LoJ
-----END PGP SIGNATURE-----

--=-+G4Zs9XCPp1CIGgRKCK2--
