Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E05ACAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 16:08:57 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.2604.1758038929499838399
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 09:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout04.t-online.de (Postfix) with SMTP id A2F64EEE7
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 18:08:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.62]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyYEW-0l6aRd0; Tue, 16 Sep 2025 18:08:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] make use of virtual/ffmpeg
Date: Tue, 16 Sep 2025 18:08:39 +0200
Message-ID: <20250916160839.3860748-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1758038924-757F1C1C-D26C8A25/0/0 CLEAN NORMAL
X-TOI-MSGID: c840678b-d227-4830-a7ea-4dea439a1a8f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 16:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119469

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb          | 2 +-
 meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb    | 2 +-
 meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb   | 2 +-
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc       | 2 +-
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb       | 2 +-
 .../recipes-multimedia/openal/openal-soft_1.24.3.bb            | 2 +-
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.bb  | 3 ++-
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb           | 2 +-
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb   | 2 +-
 meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb       | 2 +-
 meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb              | 2 +-
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb                | 2 +-
 12 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb b/meta=
-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
index ffea1f76b3..76d04a7eac 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG:remove:libc-musl =3D "seccomp"
=20
 PACKAGECONFIG[battery]     =3D "-Dbattery_detection=3Dupower,-Dbattery_d=
etection=3Dnone,upower"
 PACKAGECONFIG[cue]     =3D "-Dcue=3Denabled,-Dcue=3Ddisabled,libcue"
-PACKAGECONFIG[ffmpeg]     =3D "-Dlibav=3Denabled,-Dlibav=3Ddisabled,ffmp=
eg"
+PACKAGECONFIG[ffmpeg]     =3D "-Dlibav=3Denabled,-Dlibav=3Ddisabled,virt=
ual/ffmpeg"
 PACKAGECONFIG[gexiv2]     =3D ",,gexiv2"
 PACKAGECONFIG[gstreamer]  =3D ",,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[gupnp]      =3D "-Dgstreamer_backend=3Dgupnp,,gupnp-dlna"
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb =
b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
index 6348f25a57..cc59dbf17a 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
@@ -18,7 +18,7 @@ PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DTRUE,-DWIT=
H_SYSTEMD=3DFALSE,systemd"
 PACKAGECONFIG[taglib] =3D "-DWITH_TAGLIB=3DTRUE,-DWITH_TAGLIB=3DFALSE,ta=
glib"
 PACKAGECONFIG[curl] =3D "-DWITH_CURL=3DTRUE,-DWITH_CURL=3DFALSE,curl"
 PACKAGECONFIG[inotify] =3D "-DWITH_INOTIFY=3DTRUE,-DWITH_INOTIFY=3DFALSE=
,inotify-tools"
-PACKAGECONFIG[avcodec] =3D "-DWITH_AVCODEC=3DTRUE,-DWITH_AVCODEC=3DFALSE=
,ffmpeg"
+PACKAGECONFIG[avcodec] =3D "-DWITH_AVCODEC=3DTRUE,-DWITH_AVCODEC=3DFALSE=
,virtual/ffmpeg"
 PACKAGECONFIG[wavpack] =3D "-DWITH_WAVPACK=3DTRUE,-DWITH_WAVPACK=3DFALSE=
,wavpack"
 PACKAGECONFIG[exif] =3D "-DWITH_EXIF=3DTRUE,-DWITH_EXIF=3DFALSE,libexif"
 PACKAGECONFIG[exiv2] =3D "-DWITH_EXIV2=3DTRUE,-DWITH_EXIV2=3DFALSE,exiv2=
"
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb=
 b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
index a3f5f21406..37189664a8 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
@@ -19,7 +19,7 @@ PACKAGECONFIG[aom] =3D "-DWITH_AOM_ENCODER=3DON -DWITH_=
AOM_DECODER=3DON,-DWITH_AOM_ENC
 PACKAGECONFIG[dav1d] =3D "-DWITH_DAV1D=3DON, -DWITH_DAV1D=3DOFF,dav1d"
 PACKAGECONFIG[svt-av1] =3D "-DWITH_SvtEnc=3DON,-DWITH_SvtEnc=3DOFF,svt-a=
v1"
 PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG_DECODER=3DON -DWITH_JPEG_ENCODER=3D=
ON,-DWITH_JPEG_ENCODER=3DOFF -DWITH_JPEG_DECODER=3DOFF,jpeg"
-PACKAGECONFIG[ffmpeg] =3D "-DWITH_FFMPEG_DECODER=3DON,-DWITH_FFMPEG_DECO=
DER=3DOFF,ffmpeg"
+PACKAGECONFIG[ffmpeg] =3D "-DWITH_FFMPEG_DECODER=3DON,-DWITH_FFMPEG_DECO=
DER=3DOFF,virtual/ffmpeg"
 PACKAGECONFIG[jpeg2000] =3D "-DWITH_OpenJPEG_ENCODER=3DON -DWITH_OpenJPE=
G_DECODER=3DON,-DWITH_OpenJPEG_ENCODER=3DOFF -DWITH_OpenJPEG_DECODER=3DOF=
F,openjpeg"
 PACKAGECONFIG[openh264] =3D ",,openh264"
=20
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/m=
eta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index cb2a1865e8..7b731d5666 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "MiniDLNA (aka ReadyDLNA) is server software with the ai=
m of \
 being fully compliant with DLNA/UPnP-AV clients."
 LICENSE =3D "GPL-2.0-only|BSD-3-Clause"
-DEPENDS =3D "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag lib=
vorbis"
+DEPENDS =3D "virtual/ffmpeg flac libav jpeg sqlite3 libexif libogg libid=
3tag libvorbis"
=20
 # because it depends on libav which has commercial flag
 LICENSE_FLAGS =3D "commercial"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
index d1dd4d7442..8e65c345c1 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG[audiofile] =3D "-Daudiofile=3Denabled,-Da=
udiofile=3Ddisabled,audiofile"
 PACKAGECONFIG[bzip2] =3D "-Dbzip2=3Denabled,-Dbzip2=3Ddisabled,bzip2"
 PACKAGECONFIG[cdioparanoia] =3D "-Dcdio_paranoia=3Denabled,-Dcdio_parano=
ia=3Ddisabled,libcdio-paranoia"
 PACKAGECONFIG[daemon] =3D "-Ddaemon=3Dtrue,-Ddaemon=3Dfalse"
-PACKAGECONFIG[ffmpeg] =3D "-Dffmpeg=3Denabled,-Dffmpeg=3Ddisabled,ffmpeg=
"
+PACKAGECONFIG[ffmpeg] =3D "-Dffmpeg=3Denabled,-Dffmpeg=3Ddisabled,virtua=
l/ffmpeg"
 PACKAGECONFIG[fifo] =3D "-Dfifo=3Dtrue,-Dfifo=3Dfalse"
 PACKAGECONFIG[flac] =3D "-Dflac=3Denabled,-Dflac=3Ddisabled,flac"
 PACKAGECONFIG[fluidsynth] =3D "-Dfluidsynth=3Denabled,-Dfluidsynth=3Ddis=
abled,fluidsynth"
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3=
.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
index a1d2932f93..e5ef736529 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
@@ -18,6 +18,6 @@ PACKAGECONFIG[oss] =3D "-DALSOFT_BACKEND_OSS=3DON,-DALS=
OFT_BACKEND_OSS=3DOFF"
 PACKAGECONFIG[pulseaudio] =3D "-DALSOFT_BACKEND_PULSEAUDIO=3DON,-DALSOFT=
_BACKEND_PULSEAUDIO=3DOFF,pulseaudio"
 PACKAGECONFIG[pipewire] =3D "-DALSOFT_BACKEND_PIPEWIRE=3DON,-DALSOFT_BAC=
KEND_PIPEWIRE=3DOFF,pipewire"
 PACKAGECONFIG[examples] =3D "-DALSOFT_EXAMPLES=3DON,-DALSOFT_EXAMPLES=3D=
OFF"
-PACKAGECONFIG[sdl2] =3D "-DALSOFT_BACKEND_SDL2=3DON,-DALSOFT_BACKEND_SDL=
2=3DOFF,virtual/libsdl2 ffmpeg"
+PACKAGECONFIG[sdl2] =3D "-DALSOFT_BACKEND_SDL2=3DON,-DALSOFT_BACKEND_SDL=
2=3DOFF,virtual/libsdl2 virtual/ffmpeg"
=20
 FILES:${PN} +=3D "${datadir}"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.bb
index 8687244f3e..3de99273ff 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.bb
@@ -108,7 +108,7 @@ PACKAGECONFIG[bluez-lc3] =3D "-Dbluez5-codec-lc3=3Den=
abled,-Dbluez5-codec-lc3=3Ddisabl
 # This packageconfig enables modemmanager specific code in the BlueZ bac=
kend.
 PACKAGECONFIG[bluez-backend-native-mm] =3D "-Dbluez5-backend-native-mm=3D=
enabled,-Dbluez5-backend-native-mm=3Ddisabled,modemmanager"
 PACKAGECONFIG[docs] =3D "-Ddocs=3Denabled,-Ddocs=3Ddisabled,doxygen-nati=
ve graphviz-native"
-PACKAGECONFIG[ffmpeg] =3D "-Dffmpeg=3Denabled,-Dffmpeg=3Ddisabled,ffmpeg=
"
+PACKAGECONFIG[ffmpeg] =3D "-Dffmpeg=3Denabled,-Dffmpeg=3Ddisabled,virtua=
l/ffmpeg"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Denabled,-Dflatpak=3Ddisabled,gli=
b-2.0"
 PACKAGECONFIG[gsettings] =3D "-Dgsettings=3Denabled,-Dgsettings=3Ddisabl=
ed,glib-2.0"
 PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base,,gstreamer1.0-pipewire=
"
@@ -409,3 +409,4 @@ do_install:append() {
     sed -i "s,${WORKDIR},,g" ${D}${datadir}/doc/pipewire/html/dir_*html
   fi
 }
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb b/meta-=
multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb
index 2d2ecc63b9..547fca0b75 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 DEPENDS =3D "coreutils-native fribidi libtool libgcrypt libgcrypt-native=
 bison-native \
    dbus libxml2 gnutls \
-   tremor faad2 ffmpeg flac alsa-lib \
+   tremor faad2 virtual/ffmpeg flac alsa-lib \
    lua-native lua libidn \
    avahi jpeg xz libmodplug \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb=
 b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
index 8c6b3f7e14..f3726f91ed 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
@@ -24,7 +24,7 @@ PACKAGECONFIG ??=3D " \
=20
 PACKAGECONFIG[24bpp] =3D "-DWITH_24BPP=3DON,-DWITH_24BPP=3DOFF,"
 PACKAGECONFIG[filetransfer] =3D "-DWITH_TIGHTVNC_FILETRANSFER=3DON,-DWIT=
H_TIGHTVNC_FILETRANSFER=3DOFF,"
-PACKAGECONFIG[ffmpeg] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,ffmpeg=
,ffmpeg"
+PACKAGECONFIG[ffmpeg] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,virtua=
l/ffmpeg,ffmpeg"
 PACKAGECONFIG[gcrypt] =3D "-DWITH_GCRYPT=3DON,-DWITH_GCRYPT=3DOFF,libgcr=
ypt,libgcrypt"
 PACKAGECONFIG[gnutls] =3D "-DWITH_GNUTLS=3DON,-DWITH_GNUTLS=3DOFF,gnutls=
"
 PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg"
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb b/m=
eta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
index 3a1096bb57..cc10f3c633 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
@@ -18,7 +18,7 @@ PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=
=3Ddisabled,vulkan-loader shade
 PACKAGECONFIG[glslang] =3D "-Dglslang=3Denabled,-Dglslang=3Ddisabled,gls=
lang"
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled"
 PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
-PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg virtual/=
libsdl2 libsdl2-image"
+PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,virtual/ffmpeg =
virtual/libsdl2 libsdl2-image"
=20
 EXTRA_OEMESON =3D "-Dvulkan-registry=3D${STAGING_DATADIR}/vulkan/registr=
y/vk.xml"
=20
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/=
recipes-support/freerdp/freerdp3_3.5.1.bb
index 7f58820eb7..ebaab77cdd 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG[cups] =3D "-DWITH_CUPS=3DON,-DWITH_CUPS=3D=
OFF,cups"
 PACKAGECONFIG[fuse] =3D "-DWITH_FUSE=3DON,-DWITH_FUSE=3DOFF,fuse3,fuse3"
 PACKAGECONFIG[pcsc] =3D "-DWITH_PCSC=3DON,-DWITH_PCSC=3DOFF,pcsc-lite"
 PACKAGECONFIG[manpages] =3D "-DWITH_MANPAGES=3DON,-DWITH_MANPAGES=3DOFF,=
 libxslt-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[ffmpeg] =3D "-DWITH_DSP_FFMPEG=3DON -DWITH_FFMPEG=3DON -DW=
ITH_SWSCALE=3DON, -DWITH_DSP_FFMPEG=3DOFF -DWITH_FFMPEG=3DOFF -DWITH_SWSC=
ALE=3DOFF,ffmpeg"
+PACKAGECONFIG[ffmpeg] =3D "-DWITH_DSP_FFMPEG=3DON -DWITH_FFMPEG=3DON -DW=
ITH_SWSCALE=3DON, -DWITH_DSP_FFMPEG=3DOFF -DWITH_FFMPEG=3DOFF -DWITH_SWSC=
ALE=3DOFF,virtual/ffmpeg"
 PACKAGECONFIG[krb5] =3D "-DWITH_KRB5=3DON -DWITH_KRB5_NO_NTLM_FALLBACK=3D=
OFF,-DWITH_KRB5=3DOFF,krb5"
 PACKAGECONFIG[openh264] =3D "-DWITH_OPENH264=3DON,-DWITH_OPENH264=3DOFF,=
openh264"
 PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-icd-loader"
diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.12.0.bb
index 5462c4f8da..4a124fe2ec 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -107,7 +107,7 @@ PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3D=
OFF,gtk+3,"
 PACKAGECONFIG[jasper] =3D "-DWITH_JASPER=3DON,-DWITH_JASPER=3DOFF,jasper=
,"
 PACKAGECONFIG[java] =3D "-DJAVA_INCLUDE_PATH=3D${JAVA_HOME}/include -DJA=
VA_INCLUDE_PATH2=3D${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=3D$=
{JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${JAVA_HOME}/lib/amd64/libjawt.s=
o -DJAVA_JVM_LIBRARY=3D${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-nativ=
e fastjar-native openjdk-8-native,"
 PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"
-PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,ffmpeg,=
"
+PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,virtual=
/ffmpeg,"
 PACKAGECONFIG[libv4l] =3D "-DWITH_LIBV4L=3DON,-DWITH_LIBV4L=3DOFF,v4l-ut=
ils,"
 PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-headers virtual/opencl-icd,"
 PACKAGECONFIG[openvino] =3D "-DWITH_OPENVINO=3DON,-DWITH_OPENVINO=3DOFF,=
openvino-inference-engine,openvino-inference-engine"
--=20
2.50.1


