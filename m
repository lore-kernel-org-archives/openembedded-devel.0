Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECE86FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 10:26:56 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id s17so2036781oih.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 03:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=anTArQxFFKz+M+VCAtHywv2F60oi6gV8N8RH2qNQggM=;
	b=AAwNR06y8nlqubSGRps6W0g/47fqqRIWioXT8QYzesV6m8ijKafNFGu7i9cPC4bU8H
	gE9m7ppw2je7UHKcZdAcxHIVsX4kNzc+F5l8S1u+fGHxa/wxQL3KJ8FLtOHSJRHXPMQL
	VTTmTqcvVTyvkgChXIKek+Uy2m3jEvY1v4CeK4QBx4FSFzqtnKMdM8qMPOtf7Nsk50Mg
	/QU57ncp+8y+QSSenjXOP9UXSqrtSEzIhv6rtIDXseTGF1BhDSolHX3NanM1fG+/J+/u
	wxp6k0SIrOup/RSj5209UpYPa2S2PMj19hXq7JVp7GEj8Rp/K5806R1FYAOIpfiBHJiH
	2frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=anTArQxFFKz+M+VCAtHywv2F60oi6gV8N8RH2qNQggM=;
	b=iExV3zCSSCSzpSVS6euK0VVNGMw/0T2bPNuioCkygQFZkHwNLREqzMdA6iLHnlkFKu
	X7r3gKOXlO07U2nHf6kafNZXwPqQvBgzAyz824Job+c2rECVbv/X8Eyq54WuWFVuVDfq
	GgUScQuXA5ZRvOATAUTEGnBGCaf8OCNZXN1sOQI1YiUdwEDuOchcpOaj/wm0OmwB4Ua+
	2FJt5pP8njtQPe8HI3JZ9KCxa7dhbR4TlBmZRAYA8+ebqfQsrwWaQhgWmHxVp9hWMwLJ
	WKnh4MjkTdYi6v8URNqFF0XXSRf1mbZH+4VGN+1BVo+PsRAk1HEt2rnHug9BXIa6Apjl
	Y7Nw==
X-Gm-Message-State: ALyK8tIvERsvPU11bDZFRlVKhlATS//U7+EQ3rO935h5KtzvbCXwmK1UZzutb4lxXglkktvQpxHVU6jkY8n9tw==
X-Received: by 10.202.85.148 with SMTP id j142mr1346191oib.121.1467109616354; 
	Tue, 28 Jun 2016 03:26:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.80.80 with HTTP; Tue, 28 Jun 2016 03:26:37 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 28 Jun 2016 22:26:37 +1200
Message-ID: <CADySD0H7uWACB6xV768Lg+ZmEawSbCDg4ikRV5=jY=CYjrhwoQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Application run time problem when upgraded to Qt5.6.1 on AM335x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2016 10:26:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

=E2=80=8B=E2=80=8B
I am using daisy branch for development on AM335x based product.
Recently I updated Qt version from 5.4.1 (daisy) -> 5.6.1 (krogoth) as
Qt5.6.1 is declared as LTS.

So I only updated meta-qt5 as I want rest of layers to be at daisy.

My application is having runtime problems with Qt5.6.1. It is loading very
slowly and I can see UI changes like transparency on button getting set,
sliders moving in etc which were kind of spontaneous with Qt5.4.1

It feels weird as if I am debugging through all the Qt qml code.
But if I run SGX demos, they all run fine which is expected as I only
update meta-qt5 layer
=E2=80=8B.=E2=80=8B

Is there a reason for observing this ? Or is there something I missed in
recipes ?

Here are the changes that I did to upgrade Qt:
- updated meta-qt5 layer to krogoth branch
- copied recipes-qt from meta-arago krogoth branch into my meta-arago daisy
branch
- updated my qtbase_%.bbappend for customization's

Here is my qtbase_%.bbappend:

GLES_EXTRA_DEPS =3D ""
PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl
${GLES_EXTRA_DEPS}"

PACKAGECONFIG +=3D "accessibility icu"

QT_CONFIG_FLAGS +=3D " \
    -qpa eglfs \
    -freetype \
    -no-iconv \
    -no-linuxfb \
    -no-directfb \
    -nomake examples \
    -no-fontconfig \
    -no-tslib \
    -no-sql-sqlite \
    -no-sql-sqlite2 \
    -no-xcb \
    -no-alsa \
    -no-pulseaudio \
"

I also have removed "x11 wayland" from DISTRO_FEATURES as MACHINE_FEATURES
have "sgx"

Here is the Qt configuration log:

Build options:
  Configuration .......... accessibility audio-backend c++11 clock-gettime
clock-monotonic compile_examples concurrent cross_compile dbus dbus-linked
egl eglfs evdev eventfd freetype full-config getaddrinfo getifaddrs glib
harfbuzz icu inotify ipv6ifname kms large-config largefile libudev
medium-config minimal-config mremap neon nis no-widgets opengl opengles2
openssl pcre png posix_fallocate qpa qpa reduce_exports release shared
silent small-config system-jpeg system-png system-zlib threadsafe-cloexec
  Build parts ............ libs
  Mode ................... release
  Using sanitizer(s)...... none
  Using C++ standard ..... c++11
  Using gold linker....... no
  Using new DTAGS ........ no
  Using PCH .............. no
  Using LTCG ............. no
  Target compiler supports:
    Neon ................. yes

Qt modules and options:
  Qt D-Bus ............... yes (linked to dbus-1)
  Qt Concurrent .......... yes
  Qt GUI ................. yes
  Qt Widgets ............. no
  Large File ............. yes
  QML debugging .......... yes
  Use system proxies ..... no

Support enabled for:
  Accessibility .......... yes
  ALSA ................... no
  CUPS ................... no
  Evdev .................. yes
  FontConfig ............. no
  FreeType ............... qt
  Glib ................... yes
  GStreamer .............. no
  GTK theme .............. no
  HarfBuzz ............... yes (bundled copy)
  Iconv .................. no
  ICU .................... yes
  Image formats:
    GIF .................. yes (plugin, using bundled copy)
    JPEG ................. yes (plugin, using system library)
    PNG .................. yes (in QtGui, using system library)
  libinput................ no
  Logging backends:
    journald ............... no
    syslog   ............... no
  mtdev .................. no
  Networking:
    getaddrinfo .......... yes
    getifaddrs ........... yes
    IPv6 ifname .......... yes
    libproxy.............. no
    OpenSSL .............. yes (loading libraries at run-time)
  NIS .................... yes
  OpenGL / OpenVG:
    EGL .................. yes
    OpenGL ............... yes (OpenGL ES 2.0+)
    OpenVG ............... no
  PCRE ................... yes (bundled copy)
  pkg-config ............. yes
  PulseAudio ............. no
  QPA backends:
    DirectFB ............. no
    EGLFS ................ yes
      EGLFS i.MX6 ........ no
      EGLFS i.MX6 Wayland. no
      EGLFS EGLDevice .... no
      EGLFS GBM .......... no
      EGLFS Mali ......... no
      EGLFS Raspberry Pi . no
      EGLFS X11 .......... no
    LinuxFB .............. no
    Mir client............ no
    XCB .................. no
  Session management ..... yes
  SQL drivers:
    DB2 .................. no
    InterBase ............ no
    MySQL ................ no
    OCI .................. no
    ODBC ................. no
    PostgreSQL ........... no
    SQLite 2 ............. no
    SQLite ............... no
    TDS .................. no
  tslib .................. no
  udev ................... yes
  xkbcommon-x11........... no
  xkbcommon-evdev......... no
  zlib ................... yes (system library)
=E2=80=8B

=E2=80=8B
=E2=80=8B
Any help in investigating this is appreciated as I would really like to
upgrade to Qt LTS.=E2=80=8B

thanks
Ankur

