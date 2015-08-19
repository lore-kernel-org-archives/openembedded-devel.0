Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 927D673CC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 03:05:42 +0000 (UTC)
Received: by laba3 with SMTP id a3so7598487lab.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 20:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=le+EtKWVN3O8rFFfxQ5yhMvWrUHAPBOdbB0OkHSvP/A=;
	b=Qcpom4xNoQUA8qoCYkifHjywzSYD2j5s5D8V43j1dRk6h9JnlE69ivPv+4KplMGWPY
	Qsx5D7vUBx3Bc8K043uil3e1AssE6HKqnhFk9mNRQcKa2fgxswoGuxVFTZaV5qj3hXaF
	GegzPBB+8Ec9sHvOS+dOBzWnaFdlBU/Myk7T+pS4SUeXZ4LbNninrcrE9GWs21jdJtfo
	LHbHqJ0XG3+zcUGKGb9xTEzBJYHmKxoh1C5HBWGlOW7TuJNwUUk4dxOQEIh4m6Bmlexe
	sszozeEwSPxbQJhurcpbn8fLxE07KBGZ1uDa+1IB2uLHMstO2IQ4SA9Ec7ffM9Loj+RU
	nN5A==
MIME-Version: 1.0
X-Received: by 10.112.171.227 with SMTP id ax3mr6172991lbc.118.1439953540747; 
	Tue, 18 Aug 2015 20:05:40 -0700 (PDT)
Received: by 10.25.15.38 with HTTP; Tue, 18 Aug 2015 20:05:40 -0700 (PDT)
In-Reply-To: <20150818094429.GI2458@jama>
References: <1438562844-16736-1-git-send-email-TicoTimo@gmail.com>
	<1438562844-16736-2-git-send-email-TicoTimo@gmail.com>
	<CANx9H-DRLk5sOcmPtoGgHQRAa5y+Ef8ihbBvMAb7S7ptOaE7dQ@mail.gmail.com>
	<20150818094429.GI2458@jama>
Date: Tue, 18 Aug 2015 20:05:40 -0700
Message-ID: <CANx9H-D_onDGKhvi08xPXXuNwzJ13dfYObE_=k+J0g2G4-R1aQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][meta-multimedia][PATCH 2/2] vlc: update to 2.2.1
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
X-List-Received-Date: Wed, 19 Aug 2015 03:05:43 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 18, 2015 at 2:44 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Sun, Aug 02, 2015 at 06:07:57PM -0700, Tim Orling wrote:
> > I accidentally left libvorbis as a dependency in vlc.inc, which is not
> > needed (tremor provides what was needed).
> >
> > You can pull the corrected recipes from:
> >
> >
> http://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/vlc-2.2.1
> >
> > --Tim
>
> It still fails with that libtool error:
> http://errors.yoctoproject.org/Errors/Details/14498/
> but I'll merge it anyway, because it doesn't make things worse than old
> version.
>
> It is having a problem with the assembly files (e.g.
vlc-2.2.1/modules/arm_neon/i422_yuyv.S )


Anybody have any ideas? I would guess that --tag=CC would still apply, but
I don't see any obvious support for assembly files in the libtool docs.

--Tim


> >
> >
> > On Sun, Aug 2, 2015 at 5:47 PM, Tim Orling <ticotimo@gmail.com> wrote:
> >
> > > * add several pkg configs and libsamplerate0 dependency to vlc.inc
> > > * update patches 0003 and 0004
> > > * add patch to use tremor's libvorbisidec rather than libvorbisdec
> > > * add patch to fix luaL_checkint and luaL_optint (deprecated in lua
> 5.3)
> > >
> > > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > ---
> > >  meta-multimedia/recipes-multimedia/vlc/vlc.inc     |   6 +-
> > >  .../vlc/vlc/0003-use-am-path-libgcrypt.patch       |  12 +-
> > >  .../0004-modules-gui-qt4-out-of-tree-build.patch   |  24 +-
> > >  .../vlc/vlc/0007-use-vorbisidec.patch              |  19 ++
> > >  .../vlc/vlc/0008-fix-luaL-checkint.patch           | 279
> > > +++++++++++++++++++++
> > >  .../recipes-multimedia/vlc/vlc_2.2.1.bb            |   6 +-
> > >  6 files changed, 325 insertions(+), 21 deletions(-)
> > >  create mode 100644
> > > meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
> > >  create mode 100644
> > > meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > index 0362f39..a79e63d 100644
> > > --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > @@ -10,7 +10,7 @@ DEPENDS = "libfribidi libtool libgcrypt
> libgcrypt-native
> > > gst-plugins-bad \
> > >     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
> > >     libdvdcss libdvdread lua-native lua libidn libnotify gtk+
> gnome-vfs \
> > >     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
> > > -   libmtp libopus orc libusb1 schroedinger taglib \
> > > +   libmtp libopus orc libsamplerate0 libvorbis libusb1 schroedinger
> > > taglib \
> > >     tiff xcb-util-keysyms samba"
> > >
> > >  SRC_URI = "
> > > http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
> > > @@ -36,7 +36,6 @@ EXTRA_OECONF = "\
> > >      --enable-dbus \
> > >      --without-contrib \
> > >      --without-kde-solid \
> > > -    --disable-glx \
> > >      --enable-realrtsp \
> > >      --disable-libtar \
> > >      ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
> > > @@ -54,6 +53,9 @@ PACKAGECONFIG[mkv] =
> > > "--enable-mkv,--disable-mkv,libmatroska libebml"
> > >  PACKAGECONFIG[postproc] =
> > > "--enable-postproc,--disable-postproc,libpostproc"
> > >  PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
> > >  PACKAGECONFIG[libva] = "--enable-libva
> --enable-avcodec,--disable-libva
> > > --disable-avcodec,libva libav"
> > > +PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
> > > +PACKAGECONFIG[gstreamer] =
> > > "--enable-gst-decode,--disable-gst-decode,gstreamer1.0
> > > gstreamer1.0-plugins-base"
> > > +PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
> > >
> > >  do_configure_prepend() {
> > >      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
> > > diff --git
> > >
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
> > >
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
> > > index ae80745..8e881d0 100644
> > > ---
> > >
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
> > > +++
> > >
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
> > > @@ -5,11 +5,11 @@
> > >
> > >  Upstream status: Pending
> > >
> > > -Index: vlc-2.1.4/configure.ac
> > > +Index: vlc-2.2.1/configure.ac
> > >  ===================================================================
> > > ---- vlc-2.1.4.orig/configure.ac
> > > -+++ vlc-2.1.4/configure.ac
> > > -@@ -3940,25 +3940,19 @@ PKG_ENABLE_MODULES_VLC([LIBXML2], [xml],
> > > +--- vlc-2.2.1.orig/configure.ac
> > > ++++ vlc-2.2.1/configure.ac
> > > +@@ -4017,25 +4017,19 @@ PKG_ENABLE_MODULES_VLC([LIBXML2], [xml],
> > >   dnl
> > >   dnl libgcrypt
> > >   dnl
> > > @@ -26,10 +26,10 @@ Index: vlc-2.1.4/configure.ac
> > >  -      GCRYPT_CFLAGS="`libgcrypt-config --cflags`"
> > >  -      GCRYPT_LIBS="`libgcrypt-config --libs`"
> > >  -    ], [
> > > --      AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or use
> > > --disable-libgcrypt. Have a nice day.])
> > > +-      AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or pass
> > > --disable-libgcrypt.])
> > >  -    ], [`libgcrypt-config --libs`])
> > >  -  ], [
> > > --    AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found.
> Install
> > > libgcrypt or use --disable-libgcrypt. Have a nice day.])
> > > +-    AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found.
> Install
> > > libgcrypt or pass --disable-libgcrypt.])
> > >  -  ], [#include <gcrypt.h>]
> > >  -  )
> > >  +      AM_PATH_LIBGCRYPT($GCRYPT_LIBVER:$GCRYPT_REQ,
> > > diff --git
> > >
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch
> > >
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch
> > > index 3dadb23..53df1c6 100644
> > > ---
> > >
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch
> > > +++
> > >
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch
> > > @@ -1,17 +1,19 @@
> > > -* modules/gui/qt4/Modules.am not B!=S friendly
> > > +* modules/gui/qt4/Makefile.am not B!=S friendly
> > >  * Simple solution to missing directories in ${B}
> > >
> > >  Upstream status: Pending
> > >
> > > -Index: vlc-2.1.4/modules/gui/qt4/Modules.am
> > > +Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > +
> > > +Index: vlc-2.2.1/modules/gui/qt4/Makefile.am
> > >  ===================================================================
> > > ---- vlc-2.1.4.orig/modules/gui/qt4/Modules.am
> > > -+++ vlc-2.1.4/modules/gui/qt4/Modules.am
> > > -@@ -261,6 +261,7 @@ else
> > > - if HAVE_WIN32
> > > -       $(moc_verbose)$(MOC) -D_WIN32 $(DEFS) -I$(top_srcdir)/include
> > > -I$(top_builddir)/include -I$(top_builddir) $(CPPFLAGS_qt4) -o $@ $<
> > > - else
> > > +--- vlc-2.2.1.orig/modules/gui/qt4/Makefile.am
> > > ++++ vlc-2.2.1/modules/gui/qt4/Makefile.am
> > > +@@ -127,6 +127,7 @@ moc_verbose_0 = @echo "  MOC   " $@;
> > > + moc_verbose__0 = $(moc_verbose_0)
> > > +
> > > + .hpp.moc.cpp:
> > >  +      [ -d $(dir $@) ] || mkdir -p $(dir $@)
> > > -       $(moc_verbose)$(MOC) $(DEFS) -I$(top_srcdir)/include
> > > -I$(top_builddir)/include -I$(top_builddir) $(CPPFLAGS_qt4) -o $@ $<
> > > - endif
> > > - endif
> > > +       $(moc_verbose)$(MOC) $(MOC_CPPFLAGS) -o $@ $<
> > > +
> > > + # These MOC files depend on the configure settings:
> > > diff --git
> > > a/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
> > > b/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
> > > new file mode 100644
> > > index 0000000..d05cf02
> > > --- /dev/null
> > > +++
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
> > > @@ -0,0 +1,19 @@
> > > +* tremor provides libvorbisidec, use it instead of libvorbisdec
> > > +
> > > +Upstream-status: Pending
> > > +
> > > +Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > +
> > > +Index: vlc-2.2.1/modules/codec/Makefile.am
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/codec/Makefile.am
> > > ++++ vlc-2.2.1/modules/codec/Makefile.am
> > > +@@ -234,7 +234,7 @@ codec_LTLIBRARIES += $(LTLIBtheora)
> > > + libtremor_plugin_la_SOURCES = codec/vorbis.c
> > > + libtremor_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -DMODULE_NAME_IS_tremor
> > > + libtremor_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(codecdir)'
> > > +-libtremor_plugin_la_LIBADD = -lvorbisdec -logg
> > > ++libtremor_plugin_la_LIBADD = -lvorbisidec -logg
> > > + EXTRA_LTLIBRARIES += libtremor_plugin.la
> > > + codec_LTLIBRARIES += $(LTLIBtremor)
> > > +
> > > diff --git
> > >
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
> > >
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
> > > new file mode 100644
> > > index 0000000..145e1ab
> > > --- /dev/null
> > > +++
> > >
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
> > > @@ -0,0 +1,279 @@
> > > +* luaL_checkint and luaL_optint were deprecated in lua 5.3
> > > +* replacement functions are luaL_checkinteger and luaL_optinteger
> > > +
> > > +Upstream-status: Pending
> > > +
> > > +Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > +
> > > +Index: vlc-2.2.1/modules/lua/demux.c
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/lua/demux.c
> > > ++++ vlc-2.2.1/modules/lua/demux.c
> > > +@@ -52,7 +52,7 @@ struct demux_sys_t
> > > + static int vlclua_demux_peek( lua_State *L )
> > > + {
> > > +     demux_t *p_demux = (demux_t *)vlclua_get_this( L );
> > > +-    int n = luaL_checkint( L, 1 );
> > > ++    int n = luaL_checkinteger( L, 1 );
> > > +     const uint8_t *p_peek;
> > > +
> > > +     int i_peek = stream_Peek( p_demux->s, &p_peek, n );
> > > +@@ -67,7 +67,7 @@ static int vlclua_demux_read( lua_State
> > > + {
> > > +     demux_t *p_demux = (demux_t *)vlclua_get_this( L );
> > > +     const uint8_t *p_read;
> > > +-    int n = luaL_checkint( L, 1 );
> > > ++    int n = luaL_checkinteger( L, 1 );
> > > +     int i_read = stream_Peek( p_demux->s, &p_read, n );
> > > +
> > > +     if( i_read > 0 )
> > > +Index: vlc-2.2.1/modules/lua/libs/configuration.c
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/lua/libs/configuration.c
> > > ++++ vlc-2.2.1/modules/lua/libs/configuration.c
> > > +@@ -84,7 +84,7 @@ static int vlclua_config_set( lua_State
> > > +             break;
> > > +
> > > +         case VLC_VAR_INTEGER:
> > > +-            config_PutInt( p_this, psz_name, luaL_checkint( L, 2 ) );
> > > ++            config_PutInt( p_this, psz_name, luaL_checkinteger( L, 2
> ) );
> > > +             break;
> > > +
> > > +         case VLC_VAR_BOOL:
> > > +Index: vlc-2.2.1/modules/lua/libs/net.c
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/lua/libs/net.c
> > > ++++ vlc-2.2.1/modules/lua/libs/net.c
> > > +@@ -202,7 +202,7 @@ static int vlclua_net_listen_tcp( lua_St
> > > + {
> > > +     vlc_object_t *p_this = vlclua_get_this( L );
> > > +     const char *psz_host = luaL_checkstring( L, 1 );
> > > +-    int i_port = luaL_checkint( L, 2 );
> > > ++    int i_port = luaL_checkinteger( L, 2 );
> > > +     int *pi_fd = net_ListenTCP( p_this, psz_host, i_port );
> > > +     if( pi_fd == NULL )
> > > +         return luaL_error( L, "Cannot listen on %s:%d", psz_host,
> i_port
> > > );
> > > +@@ -274,7 +274,7 @@ static int vlclua_net_connect_tcp( lua_S
> > > + {
> > > +     vlc_object_t *p_this = vlclua_get_this( L );
> > > +     const char *psz_host = luaL_checkstring( L, 1 );
> > > +-    int i_port = luaL_checkint( L, 2 );
> > > ++    int i_port = luaL_checkinteger( L, 2 );
> > > +     int i_fd = net_Connect( p_this, psz_host, i_port, SOCK_STREAM,
> > > IPPROTO_TCP );
> > > +     lua_pushinteger( L, vlclua_fd_map_safe( L, i_fd ) );
> > > +     return 1;
> > > +@@ -282,26 +282,26 @@ static int vlclua_net_connect_tcp( lua_S
> > > +
> > > + static int vlclua_net_close( lua_State *L )
> > > + {
> > > +-    int i_fd = luaL_checkint( L, 1 );
> > > ++    int i_fd = luaL_checkinteger( L, 1 );
> > > +     vlclua_fd_unmap_safe( L, i_fd );
> > > +     return 0;
> > > + }
> > > +
> > > + static int vlclua_net_send( lua_State *L )
> > > + {
> > > +-    int fd = vlclua_fd_get( L, luaL_checkint( L, 1 ) );
> > > ++    int fd = vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
> > > +     size_t i_len;
> > > +     const char *psz_buffer = luaL_checklstring( L, 2, &i_len );
> > > +
> > > +-    i_len = luaL_optint( L, 3, i_len );
> > > ++    i_len = luaL_optinteger( L, 3, i_len );
> > > +     lua_pushinteger( L, (fd != -1) ? send( fd, psz_buffer, i_len, 0
> ) :
> > > -1 );
> > > +     return 1;
> > > + }
> > > +
> > > + static int vlclua_net_recv( lua_State *L )
> > > + {
> > > +-    int fd = vlclua_fd_get( L, luaL_checkint( L, 1 ) );
> > > +-    size_t i_len = luaL_optint( L, 2, 1 );
> > > ++    int fd = vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
> > > ++    size_t i_len = luaL_optinteger( L, 2, 1 );
> > > +     char psz_buffer[i_len];
> > > +
> > > +     ssize_t i_ret = (fd != -1) ? recv( fd, psz_buffer, i_len, 0 ) :
> -1;
> > > +@@ -382,19 +382,19 @@ static int vlclua_fd_open( lua_State *L
> > > + #ifndef _WIN32
> > > + static int vlclua_fd_write( lua_State *L )
> > > + {
> > > +-    int fd = vlclua_fd_get( L, luaL_checkint( L, 1 ) );
> > > ++    int fd = vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
> > > +     size_t i_len;
> > > +     const char *psz_buffer = luaL_checklstring( L, 2, &i_len );
> > > +
> > > +-    i_len = luaL_optint( L, 3, i_len );
> > > ++    i_len = luaL_optinteger( L, 3, i_len );
> > > +     lua_pushinteger( L, (fd != -1) ? write( fd, psz_buffer, i_len )
> : -1
> > > );
> > > +     return 1;
> > > + }
> > > +
> > > + static int vlclua_fd_read( lua_State *L )
> > > + {
> > > +-    int fd = vlclua_fd_get( L, luaL_checkint( L, 1 ) );
> > > +-    size_t i_len = luaL_optint( L, 2, 1 );
> > > ++    int fd = vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
> > > ++    size_t i_len = luaL_optinteger( L, 2, 1 );
> > > +     char psz_buffer[i_len];
> > > +
> > > +     ssize_t i_ret = (fd != -1) ? read( fd, psz_buffer, i_len ) : -1;
> > > +Index: vlc-2.2.1/modules/lua/libs/osd.c
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/lua/libs/osd.c
> > > ++++ vlc-2.2.1/modules/lua/libs/osd.c
> > > +@@ -67,7 +67,7 @@ static int vlclua_osd_icon( lua_State *L
> > > + {
> > > +     const char *psz_icon = luaL_checkstring( L, 1 );
> > > +     int i_icon = vlc_osd_icon_from_string( psz_icon );
> > > +-    int i_chan = luaL_optint( L, 2, SPU_DEFAULT_CHANNEL );
> > > ++    int i_chan = luaL_optinteger( L, 2, SPU_DEFAULT_CHANNEL );
> > > +     if( !i_icon )
> > > +         return luaL_error( L, "\"%s\" is not a valid osd icon.",
> > > psz_icon );
> > > +
> > > +@@ -114,9 +114,9 @@ static int vlc_osd_position_from_string(
> > > + static int vlclua_osd_message( lua_State *L )
> > > + {
> > > +     const char *psz_message = luaL_checkstring( L, 1 );
> > > +-    int i_chan = luaL_optint( L, 2, SPU_DEFAULT_CHANNEL );
> > > ++    int i_chan = luaL_optinteger( L, 2, SPU_DEFAULT_CHANNEL );
> > > +     const char *psz_position = luaL_optstring( L, 3, "top-right" );
> > > +-    mtime_t duration = luaL_optint( L, 4, 1000000 );
> > > ++    mtime_t duration = luaL_optinteger( L, 4, 1000000 );
> > > +
> > > +     input_thread_t *p_input = vlclua_get_input_internal( L );
> > > +     if( p_input )
> > > +@@ -154,10 +154,10 @@ static int vlc_osd_slider_type_from_stri
> > > +
> > > + static int vlclua_osd_slider( lua_State *L )
> > > + {
> > > +-    int i_position = luaL_checkint( L, 1 );
> > > ++    int i_position = luaL_checkinteger( L, 1 );
> > > +     const char *psz_type = luaL_checkstring( L, 2 );
> > > +     int i_type = vlc_osd_slider_type_from_string( psz_type );
> > > +-    int i_chan = luaL_optint( L, 3, SPU_DEFAULT_CHANNEL );
> > > ++    int i_chan = luaL_optinteger( L, 3, SPU_DEFAULT_CHANNEL );
> > > +     if( !i_type )
> > > +         return luaL_error( L, "\"%s\" is not a valid slider type.",
> > > +                            psz_type );
> > > +@@ -198,7 +198,7 @@ static int vlclua_spu_channel_register(
> > > +
> > > + static int vlclua_spu_channel_clear( lua_State *L )
> > > + {
> > > +-    int i_chan = luaL_checkint( L, 1 );
> > > ++    int i_chan = luaL_checkinteger( L, 1 );
> > > +     input_thread_t *p_input = vlclua_get_input_internal( L );
> > > +     if( !p_input )
> > > +         return luaL_error( L, "Unable to find input." );
> > > +Index: vlc-2.2.1/modules/lua/libs/playlist.c
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/lua/libs/playlist.c
> > > ++++ vlc-2.2.1/modules/lua/libs/playlist.c
> > > +@@ -69,7 +69,7 @@ static int vlclua_playlist_next( lua_Sta
> > > +
> > > + static int vlclua_playlist_skip( lua_State * L )
> > > + {
> > > +-    int i_skip = luaL_checkint( L, 1 );
> > > ++    int i_skip = luaL_checkinteger( L, 1 );
> > > +     playlist_t *p_playlist = vlclua_get_playlist_internal( L );
> > > +     playlist_Skip( p_playlist, i_skip );
> > > +     return 0;
> > > +@@ -127,7 +127,7 @@ static int vlclua_playlist_random( lua_S
> > > +
> > > + static int vlclua_playlist_gotoitem( lua_State * L )
> > > + {
> > > +-    int i_id = luaL_checkint( L, 1 );
> > > ++    int i_id = luaL_checkinteger( L, 1 );
> > > +     playlist_t *p_playlist = vlclua_get_playlist_internal( L );
> > > +     PL_LOCK;
> > > +     int i_ret = playlist_Control( p_playlist, PLAYLIST_VIEWPLAY,
> > > +@@ -139,7 +139,7 @@ static int vlclua_playlist_gotoitem( lua
> > > +
> > > + static int vlclua_playlist_delete( lua_State * L )
> > > + {
> > > +-    int i_id = luaL_checkint( L, 1 );
> > > ++    int i_id = luaL_checkinteger( L, 1 );
> > > +     playlist_t *p_playlist = vlclua_get_playlist_internal( L );
> > > +     PL_LOCK;
> > > +     playlist_item_t *p_item = playlist_ItemGetById( p_playlist, i_id
> );
> > > +@@ -155,8 +155,8 @@ static int vlclua_playlist_delete( lua_S
> > > +
> > > + static int vlclua_playlist_move( lua_State * L )
> > > + {
> > > +-    int i_item = luaL_checkint( L, 1 );
> > > +-    int i_target = luaL_checkint( L, 2 );
> > > ++    int i_item = luaL_checkinteger( L, 1 );
> > > ++    int i_target = luaL_checkinteger( L, 2 );
> > > +     playlist_t *p_playlist = vlclua_get_playlist_internal( L );
> > > +     PL_LOCK;
> > > +     playlist_item_t *p_item = playlist_ItemGetById( p_playlist,
> i_item );
> > > +Index: vlc-2.2.1/modules/lua/libs/stream.c
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/lua/libs/stream.c
> > > ++++ vlc-2.2.1/modules/lua/libs/stream.c
> > > +@@ -101,7 +101,7 @@ static int vlclua_stream_read( lua_State
> > > + {
> > > +     int i_read;
> > > +     stream_t **pp_stream = (stream_t **)luaL_checkudata( L, 1,
> "stream"
> > > );
> > > +-    int n = luaL_checkint( L, 2 );
> > > ++    int n = luaL_checkinteger( L, 2 );
> > > +     uint8_t *p_read = malloc( n );
> > > +     if( !p_read ) return vlclua_error( L );
> > > +
> > > +Index: vlc-2.2.1/modules/lua/libs/variables.c
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/lua/libs/variables.c
> > > ++++ vlc-2.2.1/modules/lua/libs/variables.c
> > > +@@ -103,7 +103,7 @@ static int vlclua_tovalue( lua_State *L,
> > > +             val->b_bool = luaL_checkboolean( L, -1 );
> > > +             break;
> > > +         case VLC_VAR_INTEGER:
> > > +-            val->i_int = luaL_checkint( L, -1 );
> > > ++            val->i_int = luaL_checkinteger( L, -1 );
> > > +             break;
> > > +         case VLC_VAR_STRING:
> > > +             val->psz_string = (char*)luaL_checkstring( L, -1 ); /*
> XXX:
> > > Beware, this only stays valid as long as (L,-1) stays in the stack */
> > > +Index: vlc-2.2.1/modules/lua/libs/volume.c
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/lua/libs/volume.c
> > > ++++ vlc-2.2.1/modules/lua/libs/volume.c
> > > +@@ -48,7 +48,7 @@
> > > + static int vlclua_volume_set( lua_State *L )
> > > + {
> > > +     playlist_t *p_this = vlclua_get_playlist_internal( L );
> > > +-    int i_volume = luaL_checkint( L, 1 );
> > > ++    int i_volume = luaL_checkinteger( L, 1 );
> > > +     if( i_volume < 0 )
> > > +         i_volume = 0;
> > > +     int i_ret = playlist_VolumeSet( p_this,
> > > i_volume/(float)AOUT_VOLUME_DEFAULT );
> > > +@@ -68,7 +68,7 @@ static int vlclua_volume_up( lua_State *
> > > +     playlist_t *p_this = vlclua_get_playlist_internal( L );
> > > +     float volume;
> > > +
> > > +-    playlist_VolumeUp( p_this, luaL_optint( L, 1, 1 ), &volume );
> > > ++    playlist_VolumeUp( p_this, luaL_optinteger( L, 1, 1 ), &volume );
> > > +     lua_pushnumber( L, lroundf(volume * AOUT_VOLUME_DEFAULT) );
> > > +     return 1;
> > > + }
> > > +@@ -78,7 +78,7 @@ static int vlclua_volume_down( lua_State
> > > +     playlist_t *p_this = vlclua_get_playlist_internal( L );
> > > +     float volume;
> > > +
> > > +-    playlist_VolumeDown( p_this, luaL_optint( L, 1, 1 ), &volume );
> > > ++    playlist_VolumeDown( p_this, luaL_optinteger( L, 1, 1 ), &volume
> );
> > > +     lua_pushnumber( L, lroundf(volume * AOUT_VOLUME_DEFAULT) );
> > > +     return 1;
> > > + }
> > > +Index: vlc-2.2.1/modules/lua/libs/win.c
> > > +===================================================================
> > > +--- vlc-2.2.1.orig/modules/lua/libs/win.c
> > > ++++ vlc-2.2.1/modules/lua/libs/win.c
> > > +@@ -123,7 +123,7 @@ static int vlclua_console_init( lua_Stat
> > > +
> > > + static int vlclua_console_wait( lua_State *L )
> > > + {
> > > +-    int i_timeout = luaL_optint( L, 1, 0 );
> > > ++    int i_timeout = luaL_optinteger( L, 1, 0 );
> > > +     DWORD status = WaitForSingleObject( GetConsole( L ), i_timeout );
> > > +     lua_pushboolean( L, status == WAIT_OBJECT_0 );
> > > +     return 1;
> > > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> > > b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> > > index 418f77c..ba8ca4b 100644
> > > --- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> > > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> > > @@ -9,7 +9,9 @@ SRC_URI += "file://0001-enable-subdir-objects.patch \
> > >              file://0004-modules-gui-qt4-out-of-tree-build.patch \
> > >              file://0005-libpostproc-header-check.patch \
> > >              file://0006-make-opencv-configurable.patch \
> > > +           file://0007-use-vorbisidec.patch \
> > > +            file://0008-fix-luaL-checkint.patch \
> > >  "
> > >
> > > -SRC_URI[md5sum] = "7ed67d22f7425011078772bfc62ac222"
> > > -SRC_URI[sha256sum] =
> > > "3e566c7525478167e18cc53dc75d621e4af91eb40aabb6231e47db25d682d5d3"
> > > +SRC_URI[md5sum] = "42273945758b521c408fabc7fd6d9946"
> > > +SRC_URI[sha256sum] =
> > > "543d9d7e378ec0fa1ee2e7f7f5acf8c456c7d0ecc32037171523197ef3cf1fcb"
> > > --
> > > 2.1.0
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

