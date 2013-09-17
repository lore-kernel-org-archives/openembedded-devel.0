Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7AB6B389
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 17:21:37 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so2860862eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iDMJLkk9IkGvUplVQlVN+0ML5QhQDLQgqDDkdkKC1fk=;
	b=VERiO4MH6uaMbQV64ANSn+fnj9fY2RYvFIxzP+a4MmpFvrGoCT5qvyZn4aMtPzbrze
	1G9Ye4/uJ3txBpimfCN8BV1/h8Y49l3pakbJNe8R7hoCcwlef422hjQHbQhK4/X6lyIU
	civlOHeEezVMoTdiqOdd+myrTItA8s1ZPPXcJj2wamkACb48EMTU/bLKKmni6BJz3LpT
	2DaxsmFeIKjIXwAzg0fHYKVWy8Oxf2yqEmeqEwCDP158fogwevRNFaVrHYaslTSbcPOS
	kl8fqJGW7bZsB/SkagyQzFBdp7wc9IVk8dm8JwoJq9V/mye+CQUB1cdPmC6qxFWaWeSq
	lFIw==
X-Received: by 10.15.107.10 with SMTP id ca10mr3443642eeb.76.1379438497487;
	Tue, 17 Sep 2013 10:21:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm52651715eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 10:21:35 -0700 (PDT)
Date: Tue, 17 Sep 2013 19:23:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130917172311.GG7313@jama>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [WIP][PATCH 00/66] Deterministic dependencies II
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
X-List-Received-Date: Tue, 17 Sep 2013 17:21:37 -0000
X-Groupsio-MsgNum: 46225
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline

--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2013 at 05:50:53PM +0200, Martin Jansa wrote:
> WIP because verification build is still running and I must admit that I'm=
 mostly
> testing that all dependencies are correctly "disabled" and in the end det=
erministic.
>=20
> I'm not testing if every possible combination of PACKAGECONFIG options pr=
ovide sufficient
> dependency tree.
>=20
> The following changes since commit 72e23c12296fbc77193898c38426add58d0c2d=
71:
>=20
>   mysql5: replace with mariadb 5.1.67 and tweak (2013-08-27 16:39:31 +010=
0)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/deps
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/deps
>=20
> Martin Jansa (66):
>   gvfs: Add PACKAGECONFIG for fuse and disable it by default
>   libmikmod: upgrade to 3.2.0
>   gnome-desktop: Add startup-notification dependency
>   gnome-control-center: Add libxscrnsaver dependency
>   gnome-settings-daemon: add PACKAGECONFIG for pulseaudio
>   libgsf: Add PACKAGECONFIG for gdk-pixbuf
>   imagemagick: Add PACKAGECONFIG for jp2
>   libxklavier: Add libxi dependency
>   claws-mail: Add PACKAGECONFIG for enchant, dbus, ldap and
>     startup-notification
>   abiword: Add PACKAGECONFIG for collab-backends and spell
>   mkvtoolnix: Add PACKAGECONFIG for flac
>   uhd: Add PACKAGECONFIG for orc
>   entrance: Add PACKAGECONFIG for consolekit
>   expedite: Add PACKAGECONFIG for sdl
>   metacity: Add dependency on libgtop
>   libgtop: Add dependency on libxau
>   wv: Add PACKAGECONFIG for png
>   libetpan: Add dependency on curl
>   gnuradio: Add PACKAGECONFIG for jack and portaudio
>   fluidsynth: Add PACKAGECONFIG for sndfile, jack, pulseaudio, portaudio
>     and readline
>   vlc: Add PACKAGECONFIG for undeterministic dependencies
>   tracker: Add PACKAGECONFIG for undeterministic dependencies
>   mpd: Add PACKAGECONFIG for undeterministic dependencies
>   cherokee: Add PACKAGECONFIG for ffmpeg and ldap
>   collectd: Add PACKAGECONFIG for undeterministic dependencies
>   xchat: Add PACKAGECONFIG for dbus and openssl
>   xterm: Add fontconfig dependency
>   libwnck(3): Add dependency on libxres
>   e-wm: Add PACKAGECONFIG for pam
>   sox: Add PACKAGECONFIG for mad, id3tag and lame
>   gvfs: Add PACKAGECONFIG for archive, obexftp, cdda
>   upower: Add PACKAGECONFIG for idevice
>   udisks: Add PACKAGECONFIG for parted
>   imlib2: Add PACKAGECONFIG for gif, tiff, id3 and bzip2
>   openmotif: Add PACKAGECONFIG for jpeg and png
>   opencv: Add PACKAGECONFIG for jasper
>   gammu: Add dependency on glib-2.0
>   openbox: Add PACKAGECONFIG for imlib2, xrandr, xinerama, xcursor,
>     startup-notification
>   v4l-utils: Add libx11 dependency
>   epiphany: Add PACKAGECONFIG for zeroconf
>   libungif: Add dependency on libx11
>   libmemcached: Add PACKAGECONFIG for sasl
>   networkmanager: Add PACKAGECONFIG for concheck
>   proftpd: Add PACKAGECONFIG for curses
>   gnuplot: Add PACKAGECONFIG for cairo
>   gnome-mplayer: Add PACKAGECONFIG for gtk3
>   gimp: Add PACKAGECONFIG for bzip2, libxpm, libjasper and gudev
>   gegl: Add PACKAGECONFIG for jasper, avformat
>   edb: Add PACKAGECONFIG for ncurses
>   gnome-vfs: Add PACKAGECONFIG for fam
>   lightmediascanner: Add PACKAGECONFIG for ogg
>   mplayer2: Add PACKAGECONFIG for mpg123 and xss
>   maliit-framework: Add dependency on gtk+3
>   packagekit: Add PACKAGECONFIG for service-packs
>   orage: Add PACKAGECONFIG for notify and dependency on popt
>   thunar: Add PACKAGECONFIG for pcre
>   thunar-volman: Add PACKAGECONFIG for notify
>   tumbler: Add PACKAGECONFIG for gstreamer
>   xfce4-clipman-plugin: Add PACKAGECONFIG for unique
>   xfce4-places-plugin: Add PACKAGECONFIG for notify
>   xfce4-settings: Add PACKAGECONFIG for notify
>   xfdesktop: Add PACKAGECONFIG for notify
>   webkit-efl: Add dependency on gst-plugins-base
>   qt-creator: Add patch to resolve missing cpuid.h in ARM builds
>   xbmc: Add libmad dependency
>   qcanobserver: Move to nonworking
>=20
>  meta-efl/recipes-efl/e17/e-wm.inc                  |   3 +
>  meta-efl/recipes-efl/efl/edb_svn.bb                |   3 +
>  meta-efl/recipes-efl/efl/entrance_svn.bb           |   3 +
>  meta-efl/recipes-efl/efl/expedite.inc              |   3 +
>  meta-efl/recipes-efl/efl/imlib2_svn.bb             |   6 +
>  meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   2 +-
>  .../lightmediascanner/lightmediascanner_0.4.4.bb   |   3 +
>  .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |   3 +
>  meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |  15 +-
>  .../recipes-gnome/epiphany/epiphany_2.30.6.bb      |   3 +
>  .../gnome-control-center_2.32.1.bb                 |   2 +-
>  .../gnome-desktop/gnome-desktop3_3.0.2.bb          |   2 +-
>  .../gnome-desktop/gnome-desktop_2.32.1.bb          |   2 +-
>  .../gnome-settings-daemon_2.32.1.bb                |   3 +
>  .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |   1 +
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb       |   7 +-
>  meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb  |   3 +
>  meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb |   2 +-
>  meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb |   2 +-
>  meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb |   2 +-
>  .../recipes-gnome/libxklavier/libxklavier_5.0.bb   |   2 +-
>  .../recipes-gnome/metacity/metacity_2.34.13.bb     |   2 +-
>  meta-gnome/recipes-gnome/wv/wv_1.2.0.bb            |   3 +
>  .../recipes-mediacentre/xbmc/xbmc_git.bb           |   2 +-
>  .../recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb     |   3 +
>  .../fluidsynth/fluidsynth_1.1.1.bb                 |   7 +
>  .../recipes-multimedia/musicpd/mpd_0.17.1.bb       |   8 +
>  .../recipes-multimedia/sox/sox_14.4.0.bb           |   3 +
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  20 +-
>  .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |   3 +
>  .../recipes-support/libmemcached/libmemcached.inc  |   3 +
>  meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |   2 +-
>  ...n-t-add-usr-include-and-usr-lib-to-config.patch |  58 ----
>  .../gnuradio/allow-to-disable-jack-portaudio.patch |  34 ++
>  .../recipes-connectivity/gnuradio/gnuradio_git.bb  |   4 +
>  .../networkmanager/networkmanager_0.9.8.0.bb       |   1 +
>  meta-oe/recipes-connectivity/uhd/uhd.inc           |   3 +
>  .../packagekit/packagekit_0.5.6.bb                 |   3 +
>  .../recipes-extended/collectd/collectd_5.2.2.bb    |   7 +
>  meta-oe/recipes-extended/gnuplot/gnuplot.inc       |   5 +-
>  .../recipes-extended/libungif/libungif_4.1.3.bb    |   2 +
>  meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb        |   4 +
>  meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb        |   6 +
>  meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb  |   7 +
>  meta-oe/recipes-graphics/xorg-app/xterm_293.bb     |   2 +-
>  .../mikmod/libmikmod/CVE-2010-2971.patch           |  24 --
>  .../mikmod/libmikmod/ldflags.patch                 |   4 +-
>  .../{libmikmod_3.1.12.bb =3D> libmikmod_3.2.0.bb}    |   7 +-
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |   2 +
>  .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |   2 +-
>  .../qcanobserver/qcanobserver-socketcan_svn.bb     |   0
>  ...erinterface.cpp-add-sys-socket.h-as-inclu.patch |   0
>  .../0002-qconsole-writethread-gcc-4.5-fixes.patch  |   0
>  .../qcanobserver/qcanobserver/candemo.xml          |   0
>  .../qcanobserver/qcanobserver_svn.bb               |   0
>  .../qt-creator/fix.missing.cpuid.h.patch           | 384 +++++++++++++++=
++++++
>  meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb  |   4 +-
>  .../recipes-sato/claws-mail/claws-mail_3.9.0.bb    |   6 +
>  .../imagemagick/imagemagick_6.8.6.bb               |   3 +
>  meta-oe/recipes-support/libetpan/libetpan_0.57.bb  |   2 +-
>  .../recipes-support/maliit/maliit-framework_git.bb |   1 +
>  meta-oe/recipes-support/opencv/opencv_2.4.3.bb     |   3 +
>  .../recipes-support/openmotif/openmotif_2.3.3.bb   |   4 +
>  meta-oe/recipes-support/tracker/tracker_0.14.2.bb  |  12 +-
>  meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   3 +
>  meta-oe/recipes-support/upower/upower_0.9.14.bb    |   3 +
>  meta-oe/recipes-support/xchat/xchat_2.8.8.bb       |   4 +
>  .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |   4 +
>  meta-xfce/recipes-apps/orage/orage_4.8.4.bb        |   5 +-
>  .../clipman/xfce4-clipman-plugin_1.2.3.bb          |   3 +
>  .../places/xfce4-places-plugin_1.5.0.bb            |   3 +
>  .../thunar-volman/thunar-volman_0.8.0.bb           |   3 +
>  meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb      |   3 +
>  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb   |   3 +
>  .../xfce4-settings/xfce4-settings_4.11.0.bb        |   3 +
>  .../recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb     |   3 +
>  76 files changed, 648 insertions(+), 114 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-b=
uildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
>  create mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/allow-=
to-disable-jack-portaudio.patch
>  delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/CVE-2010-=
2971.patch
>  rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.1.12.bb =3D> libmi=
kmod_3.2.0.bb} (73%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver-s=
ocketcan_svn.bb (100%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver/0=
001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch (100%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver/0=
002-qconsole-writethread-gcc-4.5-fixes.patch (100%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver/c=
andemo.xml (100%)
>  rename meta-oe/recipes-qt/{ =3D> nonworking}/qcanobserver/qcanobserver_s=
vn.bb (100%)
>  create mode 100644 meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.=
cpuid.h.patch

I'm going to merge safe parts of this patchset, keeping only

pick 5632297 epiphany: Add PACKAGECONFIG for zeroconf
pick f8b64a5 gammu: Add dependency on glib-2.0
pick d193506 gimp: Add PACKAGECONFIG for bzip2, libxpm, libjasper and gudev
pick 2ab9b3f gnome-mplayer: Add PACKAGECONFIG for gtk3
pick ff23a5f gnuradio: Add PACKAGECONFIG for jack and portaudio
pick 4871ab0 tracker: Add PACKAGECONFIG for undeterministic dependencies
pick 8518b86 libungif: Add dependency on libx11
pick e8f1480 libungif: update to upstream version 4.1.4
pick b6c5b5a maliit-framework: Add dependency on gtk+3
pick 08fe2ae mpd: Add PACKAGECONFIG for undeterministic dependencies
pick 732895b mplayer2: Add PACKAGECONFIG for mpg123 and xss
pick 7e092a9 opencv: Add PACKAGECONFIG for jasper
pick 5ec16a8 thunar: Add PACKAGECONFIG for pcre
pick f98ad91 thunar-volman: Add PACKAGECONFIG for notify
pick 3cbef57 tk: Add fontconfig dependency
pick e4020db tumbler: Add PACKAGECONFIG for gstreamer
pick b2f59f5 vlc: Add PACKAGECONFIG for undeterministic dependencies
pick 57e14dc wv: Add PACKAGECONFIG for png
pick 8a39b4c xterm: Add fontconfig dependency

because in these recipes there are still autodetected dependencies, so
the change didn't work or didn't fix it completely.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI4j/8ACgkQN1Ujt2V2gBxPDACeM24RqAk6XxtTBhSglybjRdjq
LAQAoKuolAIRumEKRilYSpJxtXPjhfIj
=BlTB
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
