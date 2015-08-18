Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 55BC075F44
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 09:44:26 +0000 (UTC)
Received: by wijp15 with SMTP id p15so95494628wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 02:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zf44YNwovd3YEbDRmo8gR0oh68KkDgCNUhmN+lcOOe0=;
	b=bRAykm6P02PAP0ZQin4IeVCKr6BZtJ4dyEbkgAW1lPIXORZcoVCAd02Spe3FlehDqy
	RFpmmvEHkvqvGWL55ampd7KbibswCWU8TVHdLRA0UZq4a+TBkisdCnXtW/hrX8mqLc/H
	o+DOR+7hvS5xpdiIqpEFzAe7R2D17Z4E/d/a7tJ3+ED6xGo9Ph+lwk27GBvsA85FP/Mo
	VI0zZLmXdXFpokTaUAqEVBw91/vlTJ2z3kux42C6CoVgr+Y0UoO7VqDe9K2AY/WycZqT
	zsCrAgq518SrDTs+UBU2LmYzpQqHc0PzZVcIeIRi1phJbh282wReNl5HXt7zgeHVlJqV
	EfMw==
X-Received: by 10.180.211.77 with SMTP id na13mr32345117wic.50.1439891066239; 
	Tue, 18 Aug 2015 02:44:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bd9sm20581634wib.18.2015.08.18.02.44.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 02:44:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 11:44:29 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150818094429.GI2458@jama>
References: <1438562844-16736-1-git-send-email-TicoTimo@gmail.com>
	<1438562844-16736-2-git-send-email-TicoTimo@gmail.com>
	<CANx9H-DRLk5sOcmPtoGgHQRAa5y+Ef8ihbBvMAb7S7ptOaE7dQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-DRLk5sOcmPtoGgHQRAa5y+Ef8ihbBvMAb7S7ptOaE7dQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 18 Aug 2015 09:44:26 -0000
X-Groupsio-MsgNum: 56764
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nO3oAMapP4dBpMZi"
Content-Disposition: inline

--nO3oAMapP4dBpMZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 02, 2015 at 06:07:57PM -0700, Tim Orling wrote:
> I accidentally left libvorbis as a dependency in vlc.inc, which is not
> needed (tremor provides what was needed).
>=20
> You can pull the corrected recipes from:
>=20
> http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/vlc-2=
=2E2.1
>=20
> --Tim

It still fails with that libtool error:
http://errors.yoctoproject.org/Errors/Details/14498/
but I'll merge it anyway, because it doesn't make things worse than old
version.

>=20
>=20
> On Sun, Aug 2, 2015 at 5:47 PM, Tim Orling <ticotimo@gmail.com> wrote:
>=20
> > * add several pkg configs and libsamplerate0 dependency to vlc.inc
> > * update patches 0003 and 0004
> > * add patch to use tremor's libvorbisidec rather than libvorbisdec
> > * add patch to fix luaL_checkint and luaL_optint (deprecated in lua 5.3)
> >
> > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > ---
> >  meta-multimedia/recipes-multimedia/vlc/vlc.inc     |   6 +-
> >  .../vlc/vlc/0003-use-am-path-libgcrypt.patch       |  12 +-
> >  .../0004-modules-gui-qt4-out-of-tree-build.patch   |  24 +-
> >  .../vlc/vlc/0007-use-vorbisidec.patch              |  19 ++
> >  .../vlc/vlc/0008-fix-luaL-checkint.patch           | 279
> > +++++++++++++++++++++
> >  .../recipes-multimedia/vlc/vlc_2.2.1.bb            |   6 +-
> >  6 files changed, 325 insertions(+), 21 deletions(-)
> >  create mode 100644
> > meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
> >  create mode 100644
> > meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
> >
> > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > index 0362f39..a79e63d 100644
> > --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > @@ -10,7 +10,7 @@ DEPENDS =3D "libfribidi libtool libgcrypt libgcrypt-n=
ative
> > gst-plugins-bad \
> >     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
> >     libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs=
 \
> >     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
> > -   libmtp libopus orc libusb1 schroedinger taglib \
> > +   libmtp libopus orc libsamplerate0 libvorbis libusb1 schroedinger
> > taglib \
> >     tiff xcb-util-keysyms samba"
> >
> >  SRC_URI =3D "
> > http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
> > @@ -36,7 +36,6 @@ EXTRA_OECONF =3D "\
> >      --enable-dbus \
> >      --without-contrib \
> >      --without-kde-solid \
> > -    --disable-glx \
> >      --enable-realrtsp \
> >      --disable-libtar \
> >      ac_cv_path_MOC=3D${STAGING_BINDIR_NATIVE}/moc4 \
> > @@ -54,6 +53,9 @@ PACKAGECONFIG[mkv] =3D
> > "--enable-mkv,--disable-mkv,libmatroska libebml"
> >  PACKAGECONFIG[postproc] =3D
> > "--enable-postproc,--disable-postproc,libpostproc"
> >  PACKAGECONFIG[opencv] =3D "--enable-opencv,--disable-opencv,opencv"
> >  PACKAGECONFIG[libva] =3D "--enable-libva --enable-avcodec,--disable-li=
bva
> > --disable-avcodec,libva libav"
> > +PACKAGECONFIG[speex] =3D "--enable-speex,--disable-speex,speex"
> > +PACKAGECONFIG[gstreamer] =3D
> > "--enable-gst-decode,--disable-gst-decode,gstreamer1.0
> > gstreamer1.0-plugins-base"
> > +PACKAGECONFIG[vpx] =3D "--enable-vpx,--disable-vpx, libvpx"
> >
> >  do_configure_prepend() {
> >      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
> > diff --git
> > a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt=
=2Epatch
> > b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt=
=2Epatch
> > index ae80745..8e881d0 100644
> > ---
> > a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt=
=2Epatch
> > +++
> > b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt=
=2Epatch
> > @@ -5,11 +5,11 @@
> >
> >  Upstream status: Pending
> >
> > -Index: vlc-2.1.4/configure.ac
> > +Index: vlc-2.2.1/configure.ac
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- vlc-2.1.4.orig/configure.ac
> > -+++ vlc-2.1.4/configure.ac
> > -@@ -3940,25 +3940,19 @@ PKG_ENABLE_MODULES_VLC([LIBXML2], [xml],
> > +--- vlc-2.2.1.orig/configure.ac
> > ++++ vlc-2.2.1/configure.ac
> > +@@ -4017,25 +4017,19 @@ PKG_ENABLE_MODULES_VLC([LIBXML2], [xml],
> >   dnl
> >   dnl libgcrypt
> >   dnl
> > @@ -26,10 +26,10 @@ Index: vlc-2.1.4/configure.ac
> >  -      GCRYPT_CFLAGS=3D"`libgcrypt-config --cflags`"
> >  -      GCRYPT_LIBS=3D"`libgcrypt-config --libs`"
> >  -    ], [
> > --      AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or use
> > --disable-libgcrypt. Have a nice day.])
> > +-      AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or pass
> > --disable-libgcrypt.])
> >  -    ], [`libgcrypt-config --libs`])
> >  -  ], [
> > --    AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Insta=
ll
> > libgcrypt or use --disable-libgcrypt. Have a nice day.])
> > +-    AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Insta=
ll
> > libgcrypt or pass --disable-libgcrypt.])
> >  -  ], [#include <gcrypt.h>]
> >  -  )
> >  +      AM_PATH_LIBGCRYPT($GCRYPT_LIBVER:$GCRYPT_REQ,
> > diff --git
> > a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-o=
f-tree-build.patch
> > b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-o=
f-tree-build.patch
> > index 3dadb23..53df1c6 100644
> > ---
> > a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-o=
f-tree-build.patch
> > +++
> > b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-o=
f-tree-build.patch
> > @@ -1,17 +1,19 @@
> > -* modules/gui/qt4/Modules.am not B!=3DS friendly
> > +* modules/gui/qt4/Makefile.am not B!=3DS friendly
> >  * Simple solution to missing directories in ${B}
> >
> >  Upstream status: Pending
> >
> > -Index: vlc-2.1.4/modules/gui/qt4/Modules.am
> > +Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > +
> > +Index: vlc-2.2.1/modules/gui/qt4/Makefile.am
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- vlc-2.1.4.orig/modules/gui/qt4/Modules.am
> > -+++ vlc-2.1.4/modules/gui/qt4/Modules.am
> > -@@ -261,6 +261,7 @@ else
> > - if HAVE_WIN32
> > -       $(moc_verbose)$(MOC) -D_WIN32 $(DEFS) -I$(top_srcdir)/include
> > -I$(top_builddir)/include -I$(top_builddir) $(CPPFLAGS_qt4) -o $@ $<
> > - else
> > +--- vlc-2.2.1.orig/modules/gui/qt4/Makefile.am
> > ++++ vlc-2.2.1/modules/gui/qt4/Makefile.am
> > +@@ -127,6 +127,7 @@ moc_verbose_0 =3D @echo "  MOC   " $@;
> > + moc_verbose__0 =3D $(moc_verbose_0)
> > +
> > + .hpp.moc.cpp:
> >  +      [ -d $(dir $@) ] || mkdir -p $(dir $@)
> > -       $(moc_verbose)$(MOC) $(DEFS) -I$(top_srcdir)/include
> > -I$(top_builddir)/include -I$(top_builddir) $(CPPFLAGS_qt4) -o $@ $<
> > - endif
> > - endif
> > +       $(moc_verbose)$(MOC) $(MOC_CPPFLAGS) -o $@ $<
> > +
> > + # These MOC files depend on the configure settings:
> > diff --git
> > a/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
> > b/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
> > new file mode 100644
> > index 0000000..d05cf02
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.pa=
tch
> > @@ -0,0 +1,19 @@
> > +* tremor provides libvorbisidec, use it instead of libvorbisdec
> > +
> > +Upstream-status: Pending
> > +
> > +Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > +
> > +Index: vlc-2.2.1/modules/codec/Makefile.am
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/codec/Makefile.am
> > ++++ vlc-2.2.1/modules/codec/Makefile.am
> > +@@ -234,7 +234,7 @@ codec_LTLIBRARIES +=3D $(LTLIBtheora)
> > + libtremor_plugin_la_SOURCES =3D codec/vorbis.c
> > + libtremor_plugin_la_CPPFLAGS =3D $(AM_CPPFLAGS) -DMODULE_NAME_IS_trem=
or
> > + libtremor_plugin_la_LDFLAGS =3D $(AM_LDFLAGS) -rpath '$(codecdir)'
> > +-libtremor_plugin_la_LIBADD =3D -lvorbisdec -logg
> > ++libtremor_plugin_la_LIBADD =3D -lvorbisidec -logg
> > + EXTRA_LTLIBRARIES +=3D libtremor_plugin.la
> > + codec_LTLIBRARIES +=3D $(LTLIBtremor)
> > +
> > diff --git
> > a/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.pat=
ch
> > b/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.pat=
ch
> > new file mode 100644
> > index 0000000..145e1ab
> > --- /dev/null
> > +++
> > b/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.pat=
ch
> > @@ -0,0 +1,279 @@
> > +* luaL_checkint and luaL_optint were deprecated in lua 5.3
> > +* replacement functions are luaL_checkinteger and luaL_optinteger
> > +
> > +Upstream-status: Pending
> > +
> > +Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > +
> > +Index: vlc-2.2.1/modules/lua/demux.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/lua/demux.c
> > ++++ vlc-2.2.1/modules/lua/demux.c
> > +@@ -52,7 +52,7 @@ struct demux_sys_t
> > + static int vlclua_demux_peek( lua_State *L )
> > + {
> > +     demux_t *p_demux =3D (demux_t *)vlclua_get_this( L );
> > +-    int n =3D luaL_checkint( L, 1 );
> > ++    int n =3D luaL_checkinteger( L, 1 );
> > +     const uint8_t *p_peek;
> > +
> > +     int i_peek =3D stream_Peek( p_demux->s, &p_peek, n );
> > +@@ -67,7 +67,7 @@ static int vlclua_demux_read( lua_State
> > + {
> > +     demux_t *p_demux =3D (demux_t *)vlclua_get_this( L );
> > +     const uint8_t *p_read;
> > +-    int n =3D luaL_checkint( L, 1 );
> > ++    int n =3D luaL_checkinteger( L, 1 );
> > +     int i_read =3D stream_Peek( p_demux->s, &p_read, n );
> > +
> > +     if( i_read > 0 )
> > +Index: vlc-2.2.1/modules/lua/libs/configuration.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/lua/libs/configuration.c
> > ++++ vlc-2.2.1/modules/lua/libs/configuration.c
> > +@@ -84,7 +84,7 @@ static int vlclua_config_set( lua_State
> > +             break;
> > +
> > +         case VLC_VAR_INTEGER:
> > +-            config_PutInt( p_this, psz_name, luaL_checkint( L, 2 ) );
> > ++            config_PutInt( p_this, psz_name, luaL_checkinteger( L, 2 =
) );
> > +             break;
> > +
> > +         case VLC_VAR_BOOL:
> > +Index: vlc-2.2.1/modules/lua/libs/net.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/lua/libs/net.c
> > ++++ vlc-2.2.1/modules/lua/libs/net.c
> > +@@ -202,7 +202,7 @@ static int vlclua_net_listen_tcp( lua_St
> > + {
> > +     vlc_object_t *p_this =3D vlclua_get_this( L );
> > +     const char *psz_host =3D luaL_checkstring( L, 1 );
> > +-    int i_port =3D luaL_checkint( L, 2 );
> > ++    int i_port =3D luaL_checkinteger( L, 2 );
> > +     int *pi_fd =3D net_ListenTCP( p_this, psz_host, i_port );
> > +     if( pi_fd =3D=3D NULL )
> > +         return luaL_error( L, "Cannot listen on %s:%d", psz_host, i_p=
ort
> > );
> > +@@ -274,7 +274,7 @@ static int vlclua_net_connect_tcp( lua_S
> > + {
> > +     vlc_object_t *p_this =3D vlclua_get_this( L );
> > +     const char *psz_host =3D luaL_checkstring( L, 1 );
> > +-    int i_port =3D luaL_checkint( L, 2 );
> > ++    int i_port =3D luaL_checkinteger( L, 2 );
> > +     int i_fd =3D net_Connect( p_this, psz_host, i_port, SOCK_STREAM,
> > IPPROTO_TCP );
> > +     lua_pushinteger( L, vlclua_fd_map_safe( L, i_fd ) );
> > +     return 1;
> > +@@ -282,26 +282,26 @@ static int vlclua_net_connect_tcp( lua_S
> > +
> > + static int vlclua_net_close( lua_State *L )
> > + {
> > +-    int i_fd =3D luaL_checkint( L, 1 );
> > ++    int i_fd =3D luaL_checkinteger( L, 1 );
> > +     vlclua_fd_unmap_safe( L, i_fd );
> > +     return 0;
> > + }
> > +
> > + static int vlclua_net_send( lua_State *L )
> > + {
> > +-    int fd =3D vlclua_fd_get( L, luaL_checkint( L, 1 ) );
> > ++    int fd =3D vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
> > +     size_t i_len;
> > +     const char *psz_buffer =3D luaL_checklstring( L, 2, &i_len );
> > +
> > +-    i_len =3D luaL_optint( L, 3, i_len );
> > ++    i_len =3D luaL_optinteger( L, 3, i_len );
> > +     lua_pushinteger( L, (fd !=3D -1) ? send( fd, psz_buffer, i_len, 0=
 ) :
> > -1 );
> > +     return 1;
> > + }
> > +
> > + static int vlclua_net_recv( lua_State *L )
> > + {
> > +-    int fd =3D vlclua_fd_get( L, luaL_checkint( L, 1 ) );
> > +-    size_t i_len =3D luaL_optint( L, 2, 1 );
> > ++    int fd =3D vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
> > ++    size_t i_len =3D luaL_optinteger( L, 2, 1 );
> > +     char psz_buffer[i_len];
> > +
> > +     ssize_t i_ret =3D (fd !=3D -1) ? recv( fd, psz_buffer, i_len, 0 )=
 : -1;
> > +@@ -382,19 +382,19 @@ static int vlclua_fd_open( lua_State *L
> > + #ifndef _WIN32
> > + static int vlclua_fd_write( lua_State *L )
> > + {
> > +-    int fd =3D vlclua_fd_get( L, luaL_checkint( L, 1 ) );
> > ++    int fd =3D vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
> > +     size_t i_len;
> > +     const char *psz_buffer =3D luaL_checklstring( L, 2, &i_len );
> > +
> > +-    i_len =3D luaL_optint( L, 3, i_len );
> > ++    i_len =3D luaL_optinteger( L, 3, i_len );
> > +     lua_pushinteger( L, (fd !=3D -1) ? write( fd, psz_buffer, i_len )=
 : -1
> > );
> > +     return 1;
> > + }
> > +
> > + static int vlclua_fd_read( lua_State *L )
> > + {
> > +-    int fd =3D vlclua_fd_get( L, luaL_checkint( L, 1 ) );
> > +-    size_t i_len =3D luaL_optint( L, 2, 1 );
> > ++    int fd =3D vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
> > ++    size_t i_len =3D luaL_optinteger( L, 2, 1 );
> > +     char psz_buffer[i_len];
> > +
> > +     ssize_t i_ret =3D (fd !=3D -1) ? read( fd, psz_buffer, i_len ) : =
-1;
> > +Index: vlc-2.2.1/modules/lua/libs/osd.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/lua/libs/osd.c
> > ++++ vlc-2.2.1/modules/lua/libs/osd.c
> > +@@ -67,7 +67,7 @@ static int vlclua_osd_icon( lua_State *L
> > + {
> > +     const char *psz_icon =3D luaL_checkstring( L, 1 );
> > +     int i_icon =3D vlc_osd_icon_from_string( psz_icon );
> > +-    int i_chan =3D luaL_optint( L, 2, SPU_DEFAULT_CHANNEL );
> > ++    int i_chan =3D luaL_optinteger( L, 2, SPU_DEFAULT_CHANNEL );
> > +     if( !i_icon )
> > +         return luaL_error( L, "\"%s\" is not a valid osd icon.",
> > psz_icon );
> > +
> > +@@ -114,9 +114,9 @@ static int vlc_osd_position_from_string(
> > + static int vlclua_osd_message( lua_State *L )
> > + {
> > +     const char *psz_message =3D luaL_checkstring( L, 1 );
> > +-    int i_chan =3D luaL_optint( L, 2, SPU_DEFAULT_CHANNEL );
> > ++    int i_chan =3D luaL_optinteger( L, 2, SPU_DEFAULT_CHANNEL );
> > +     const char *psz_position =3D luaL_optstring( L, 3, "top-right" );
> > +-    mtime_t duration =3D luaL_optint( L, 4, 1000000 );
> > ++    mtime_t duration =3D luaL_optinteger( L, 4, 1000000 );
> > +
> > +     input_thread_t *p_input =3D vlclua_get_input_internal( L );
> > +     if( p_input )
> > +@@ -154,10 +154,10 @@ static int vlc_osd_slider_type_from_stri
> > +
> > + static int vlclua_osd_slider( lua_State *L )
> > + {
> > +-    int i_position =3D luaL_checkint( L, 1 );
> > ++    int i_position =3D luaL_checkinteger( L, 1 );
> > +     const char *psz_type =3D luaL_checkstring( L, 2 );
> > +     int i_type =3D vlc_osd_slider_type_from_string( psz_type );
> > +-    int i_chan =3D luaL_optint( L, 3, SPU_DEFAULT_CHANNEL );
> > ++    int i_chan =3D luaL_optinteger( L, 3, SPU_DEFAULT_CHANNEL );
> > +     if( !i_type )
> > +         return luaL_error( L, "\"%s\" is not a valid slider type.",
> > +                            psz_type );
> > +@@ -198,7 +198,7 @@ static int vlclua_spu_channel_register(
> > +
> > + static int vlclua_spu_channel_clear( lua_State *L )
> > + {
> > +-    int i_chan =3D luaL_checkint( L, 1 );
> > ++    int i_chan =3D luaL_checkinteger( L, 1 );
> > +     input_thread_t *p_input =3D vlclua_get_input_internal( L );
> > +     if( !p_input )
> > +         return luaL_error( L, "Unable to find input." );
> > +Index: vlc-2.2.1/modules/lua/libs/playlist.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/lua/libs/playlist.c
> > ++++ vlc-2.2.1/modules/lua/libs/playlist.c
> > +@@ -69,7 +69,7 @@ static int vlclua_playlist_next( lua_Sta
> > +
> > + static int vlclua_playlist_skip( lua_State * L )
> > + {
> > +-    int i_skip =3D luaL_checkint( L, 1 );
> > ++    int i_skip =3D luaL_checkinteger( L, 1 );
> > +     playlist_t *p_playlist =3D vlclua_get_playlist_internal( L );
> > +     playlist_Skip( p_playlist, i_skip );
> > +     return 0;
> > +@@ -127,7 +127,7 @@ static int vlclua_playlist_random( lua_S
> > +
> > + static int vlclua_playlist_gotoitem( lua_State * L )
> > + {
> > +-    int i_id =3D luaL_checkint( L, 1 );
> > ++    int i_id =3D luaL_checkinteger( L, 1 );
> > +     playlist_t *p_playlist =3D vlclua_get_playlist_internal( L );
> > +     PL_LOCK;
> > +     int i_ret =3D playlist_Control( p_playlist, PLAYLIST_VIEWPLAY,
> > +@@ -139,7 +139,7 @@ static int vlclua_playlist_gotoitem( lua
> > +
> > + static int vlclua_playlist_delete( lua_State * L )
> > + {
> > +-    int i_id =3D luaL_checkint( L, 1 );
> > ++    int i_id =3D luaL_checkinteger( L, 1 );
> > +     playlist_t *p_playlist =3D vlclua_get_playlist_internal( L );
> > +     PL_LOCK;
> > +     playlist_item_t *p_item =3D playlist_ItemGetById( p_playlist, i_i=
d );
> > +@@ -155,8 +155,8 @@ static int vlclua_playlist_delete( lua_S
> > +
> > + static int vlclua_playlist_move( lua_State * L )
> > + {
> > +-    int i_item =3D luaL_checkint( L, 1 );
> > +-    int i_target =3D luaL_checkint( L, 2 );
> > ++    int i_item =3D luaL_checkinteger( L, 1 );
> > ++    int i_target =3D luaL_checkinteger( L, 2 );
> > +     playlist_t *p_playlist =3D vlclua_get_playlist_internal( L );
> > +     PL_LOCK;
> > +     playlist_item_t *p_item =3D playlist_ItemGetById( p_playlist, i_i=
tem );
> > +Index: vlc-2.2.1/modules/lua/libs/stream.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/lua/libs/stream.c
> > ++++ vlc-2.2.1/modules/lua/libs/stream.c
> > +@@ -101,7 +101,7 @@ static int vlclua_stream_read( lua_State
> > + {
> > +     int i_read;
> > +     stream_t **pp_stream =3D (stream_t **)luaL_checkudata( L, 1, "str=
eam"
> > );
> > +-    int n =3D luaL_checkint( L, 2 );
> > ++    int n =3D luaL_checkinteger( L, 2 );
> > +     uint8_t *p_read =3D malloc( n );
> > +     if( !p_read ) return vlclua_error( L );
> > +
> > +Index: vlc-2.2.1/modules/lua/libs/variables.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/lua/libs/variables.c
> > ++++ vlc-2.2.1/modules/lua/libs/variables.c
> > +@@ -103,7 +103,7 @@ static int vlclua_tovalue( lua_State *L,
> > +             val->b_bool =3D luaL_checkboolean( L, -1 );
> > +             break;
> > +         case VLC_VAR_INTEGER:
> > +-            val->i_int =3D luaL_checkint( L, -1 );
> > ++            val->i_int =3D luaL_checkinteger( L, -1 );
> > +             break;
> > +         case VLC_VAR_STRING:
> > +             val->psz_string =3D (char*)luaL_checkstring( L, -1 ); /* =
XXX:
> > Beware, this only stays valid as long as (L,-1) stays in the stack */
> > +Index: vlc-2.2.1/modules/lua/libs/volume.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/lua/libs/volume.c
> > ++++ vlc-2.2.1/modules/lua/libs/volume.c
> > +@@ -48,7 +48,7 @@
> > + static int vlclua_volume_set( lua_State *L )
> > + {
> > +     playlist_t *p_this =3D vlclua_get_playlist_internal( L );
> > +-    int i_volume =3D luaL_checkint( L, 1 );
> > ++    int i_volume =3D luaL_checkinteger( L, 1 );
> > +     if( i_volume < 0 )
> > +         i_volume =3D 0;
> > +     int i_ret =3D playlist_VolumeSet( p_this,
> > i_volume/(float)AOUT_VOLUME_DEFAULT );
> > +@@ -68,7 +68,7 @@ static int vlclua_volume_up( lua_State *
> > +     playlist_t *p_this =3D vlclua_get_playlist_internal( L );
> > +     float volume;
> > +
> > +-    playlist_VolumeUp( p_this, luaL_optint( L, 1, 1 ), &volume );
> > ++    playlist_VolumeUp( p_this, luaL_optinteger( L, 1, 1 ), &volume );
> > +     lua_pushnumber( L, lroundf(volume * AOUT_VOLUME_DEFAULT) );
> > +     return 1;
> > + }
> > +@@ -78,7 +78,7 @@ static int vlclua_volume_down( lua_State
> > +     playlist_t *p_this =3D vlclua_get_playlist_internal( L );
> > +     float volume;
> > +
> > +-    playlist_VolumeDown( p_this, luaL_optint( L, 1, 1 ), &volume );
> > ++    playlist_VolumeDown( p_this, luaL_optinteger( L, 1, 1 ), &volume =
);
> > +     lua_pushnumber( L, lroundf(volume * AOUT_VOLUME_DEFAULT) );
> > +     return 1;
> > + }
> > +Index: vlc-2.2.1/modules/lua/libs/win.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- vlc-2.2.1.orig/modules/lua/libs/win.c
> > ++++ vlc-2.2.1/modules/lua/libs/win.c
> > +@@ -123,7 +123,7 @@ static int vlclua_console_init( lua_Stat
> > +
> > + static int vlclua_console_wait( lua_State *L )
> > + {
> > +-    int i_timeout =3D luaL_optint( L, 1, 0 );
> > ++    int i_timeout =3D luaL_optinteger( L, 1, 0 );
> > +     DWORD status =3D WaitForSingleObject( GetConsole( L ), i_timeout =
);
> > +     lua_pushboolean( L, status =3D=3D WAIT_OBJECT_0 );
> > +     return 1;
> > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> > b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> > index 418f77c..ba8ca4b 100644
> > --- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> > @@ -9,7 +9,9 @@ SRC_URI +=3D "file://0001-enable-subdir-objects.patch \
> >              file://0004-modules-gui-qt4-out-of-tree-build.patch \
> >              file://0005-libpostproc-header-check.patch \
> >              file://0006-make-opencv-configurable.patch \
> > +           file://0007-use-vorbisidec.patch \
> > +            file://0008-fix-luaL-checkint.patch \
> >  "
> >
> > -SRC_URI[md5sum] =3D "7ed67d22f7425011078772bfc62ac222"
> > -SRC_URI[sha256sum] =3D
> > "3e566c7525478167e18cc53dc75d621e4af91eb40aabb6231e47db25d682d5d3"
> > +SRC_URI[md5sum] =3D "42273945758b521c408fabc7fd6d9946"
> > +SRC_URI[sha256sum] =3D
> > "543d9d7e378ec0fa1ee2e7f7f5acf8c456c7d0ecc32037171523197ef3cf1fcb"
> > --
> > 2.1.0
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nO3oAMapP4dBpMZi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXS/nwACgkQN1Ujt2V2gBw2egCgrLJ7S4j+LZQ9nxXuHyW6FMoI
O/EAn2cfmkSm4y920gkbTNdJfKzO19RU
=rsPH
-----END PGP SIGNATURE-----

--nO3oAMapP4dBpMZi--
