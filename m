Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1D765CBA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 12:01:56 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b14so46526457wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 04:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tP4X8//fJSwj50u+6hMSgips2e0++yRwXnyIEEdFZak=;
	b=tkWERn9SA5d33q6jKDBAH5ixzW6UxylT9q7ijr67iHTZdx4XJYXRYJl8+Ogm+cSEyf
	2RGa8bcG8kqjDlk9lCTZRYtfPLnMna9tNg8x4zdHmK4S/Hr445X1Az7c5N61PWtB2g0J
	TDhbyPfP3gCjpIJqNZmhunEwAjqTdtcsEPLqqlI5/yr311OqnfwZ/qX5UL8ZSwcGUIAc
	xx7pK9EZUih8oL70T5kxqKYPjEyFYK6jJEjlUFp9krpSTH49xrRgf8V6MjaiWnLVHIig
	eTD4kvYRNVjaKRt6TOAxuqcvcjfHBab0b+11ceurRuGJ+HbgsZaylelktKad83+ZU+c2
	qc9Q==
X-Received: by 10.28.139.205 with SMTP id n196mr16171877wmd.0.1451476917547;
	Wed, 30 Dec 2015 04:01:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u62sm57100561wmg.4.2015.12.30.04.01.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 04:01:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Dec 2015 13:05:32 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151230120532.GC2263@jama>
References: <cover.1450888554.git.akuster808@gmail.com>
	<CAMKF1sqH=+A8kJmK2DoT2tfMpmvs-NKGoCZtRT_zZyBLwUZACg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqH=+A8kJmK2DoT2tfMpmvs-NKGoCZtRT_zZyBLwUZACg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH v2 00/54] Jentrho-next pull request
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
X-List-Received-Date: Wed, 30 Dec 2015 12:01:58 -0000
X-Groupsio-MsgNum: 59217
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline

--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 06:32:57PM -0800, Khem Raj wrote:
> Armin
>=20
> Can you add
>=20
> http://git.openembedded.org/meta-openembedded/commit/?id=3Db5341db1c245e5=
81b25e2b7d5766ed2c1bbd17f7
>=20
> to either this one or next pull plz

I've added also this one:
commit af602920594a9cc2e9b397fe311fda7f531be7f3
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Thu Dec 10 20:01:13 2015 +0100

    libgxim: move from meta-ruby back to meta-oe
   =20
    * it was moved to meta-ruby (totherer with imsettings which depends
    * on libgxim)
      because of ruby-native dependency, now when ruby was moved from
meta-ruby to
      oe-core we can move libgxim back to meta-oe (which also allows
imsettings
      in meta-xfce to depend only on meta-oe as well)
   =20
because it's needed together with imsettings move (otherwise we will
have the same issue why imsettings was initially moved to meta-ruby).

> On Wed, Dec 23, 2015 at 8:39 AM, Armin Kuster <akuster808@gmail.com> wrot=
e:
> > Please consider these changes for Jethro-next
> >
> > I dropped the netmap changes but add more.
> >
> > The following changes since commit 4fdb203c182dae6f451ca131c0edfd5f0c99=
fc28:
> >
> >   vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394,=
 dv1394, svg, svgdec (2015-11-16 21:57:48 +0100)
> >
> > are available in the git repository at:
> >
> >   git://github.com/akuster/meta-openembedded akuster/jethro-next
> >   https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next
> >
> > Andre McCurdy (1):
> >   tree: respect the package's own default CFLAGS
> >
> > Andreas M=FCller (1):
> >   faenza-icon-theme: fix host-user-contamination
> >
> > Bob Ham (1):
> >   poppler: move RDEPENDS on poppler-data to libpoppler
> >
> > Christopher Larson (3):
> >   ctdb: rdep on bash
> >   gpsd: also support bluez5
> >   canutils: rdep on iproute2
> >
> > George McCollister (1):
> >   postgresql: Don't symlink to perl if it's disabled
> >
> > Haris Okanovic (1):
> >   python-jinja2: Disable `make clean`
> >
> > Hongxu Jia (3):
> >   libhtml-tree-perl: fix shebang
> >   libnet-ssleay-perl: fix test failures with openssl
> >   mariadb.inc: fix mysqld hung at first init time based on systemd
> >
> > Jackie Huang (4):
> >   lmsensors-config: fix the packaging for sensord
> >   xfsprogs: fix the license
> >   netmap-modules: make deterministic builds for drivers
> >   netmap-modules: Modules may not have the same arch as userspace
> >
> > Jian Liu (1):
> >   ypbind-mt: set path of ypdomainname in ypbind script
> >
> > Joshua Lock (1):
> >   poppler-data: install CMap resources for CJK glyph support
> >
> > Kai Kang (4):
> >   libssh2: make crypto library selectable
> >   mcelog: remove bashism and create ptest subpackage
> >   apache2: fix host-user-contaminated warnings
> >   pmtools: support huge ACPI table
> >
> > Li Xin (2):
> >   net-snmp: Modify snmpd.service
> >   opensaf: remove unused service file
> >
> > Li xin (1):
> >   sessreg: add a patch to avoid build errors.
> >
> > Martin Jansa (3):
> >   gnome-panel: add dependency on dbus
> >   lcdproc5: add dependency on lirc
> >   mpd: add dependency on libupnp
> >
> > Qi.Chen@windriver.com (3):
> >   rrdtool: install python site packages into libdir
> >   tipcutils: fix host-user-comtaminated QA issue
> >   libvpx: fix host-user-comtaminated QA issue
> >
> > Radek Dostal (1):
> >   htop: delete not used patch
> >
> > Rafa=EBl Carr=E9 (7):
> >   net-snmp: fix cross compilation
> >   vlc: remove libdc1394 libraw1394 from DEPENDS
> >   VLC: make libnotify a configurable dependency
> >   VLC: explicit PACKAGECONFIG for fontconfig
> >   VLC: explicit PACKAGECONFIG for freetype
> >   VLC: make libdvdread PACKAGECONFIG
> >   VLC: do not use --with-contrib
> >
> > Robert Yang (2):
> >   netcat: add DESCRIPTION
> >   dracut: fix host-user-contaminated
> >
> > Roy Li (3):
> >   dovecot: add PACKAGECONFIG for lz4
> >   pure-ftpd: add PACKAGECONFIG for libsodium
> >   ufw: improve RRECOMMENDS
> >
> > Scott Ellis (1):
> >   python-requests: Add RDEPENDS
> >
> > Steffen Sledz (1):
> >   syslog-ng: add UPDATE_ALTERNATIVE for syslog-service
> >
> > Wenzong Fan (5):
> >   krb5: fix CVE-2015-2695
> >   krb5: fix CVE-2015-2696
> >   krb5: fix CVE-2015-2697
> >   krb5: fix CVE-2015-2698
> >   phpmyadmin: fix CVE-2015-7873
> >
> > Yi Zhao (3):
> >   pam-passwdqc: fix the hardcoded libdir
> >   hplip: specify cupsbackenddir and cupsfilterdir
> >   tmux: add PACKAGECONFIG for utempter
> >
> > Yue Tao (1):
> >   netcat-openbsd: replace patch with quilt
> >
> >  .../recipes-utils/xfsprogs/xfsprogs_3.2.3.bb       |   2 +-
> >  .../faenza-icon-theme/faenza-icon-theme_1.3.bb     |   1 +
> >  .../gnome-panel/gnome-panel_2.32.1.bb              |   2 +-
> >  .../recipes-devtools/dracut/dracut_git.bb          |   3 +
> >  .../recipes-multimedia/musicpd/mpd_0.19.10.bb      |   2 +-
> >  meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  14 +-
> >  .../recipes-connectivity/ufw/ufw_0.33.bb           |   8 +
> >  .../opensaf/opensaf/plmcboot.service               |  13 -
> >  .../recipes-daemons/opensaf/opensaf/plmcd.service  |  15 -
> >  .../recipes-daemons/opensaf/opensaf_4.6.0.bb       |   6 +-
> >  .../recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb  |   2 +
> >  .../recipes-kernel/netmap/netmap-modules_git.bb    |  31 +-
> >  .../0002-config_os_headers-Error-Fix.patch         |  31 +
> >  .../net-snmp/net-snmp/snmpd.service                |   2 +-
> >  meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |   3 +
> >  .../recipes-support/dovecot/dovecot_2.2.18.bb      |   1 +
> >  .../recipes-support/netcat/netcat-openbsd_1.105.bb |   3 +-
> >  meta-networking/recipes-support/netcat/netcat.inc  |  10 +
> >  .../recipes-support/netcat/netcat_0.7.1.bb         |   2 -
> >  .../recipes-support/nis/files/ypbind.init          |  11 +-
> >  .../recipes-support/nis/ypbind-mt_1.38.bb          |   2 +
> >  ...AKERB-context-aliasing-bugs-CVE-2015-2696.patch | 739 +++++++++++++=
++++++++
> >  ...AKERB-context-export-import-CVE-2015-2698.patch | 134 ++++
> >  ...PNEGO-context-aliasing-bugs-CVE-2015-2695.patch | 572 +++++++++++++=
+++
> >  ...-build_principal-memory-bug-CVE-2015-2697.patch |  58 ++
> >  meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |   4 +
> >  ...tch-to-dynamic-buffer-for-huge-ACPI-table.patch |  66 ++
> >  meta-oe/recipes-devtools/pmtools/pmtools_git.bb    |   4 +-
> >  meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |   2 +
> >  meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |   2 +-
> >  meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb  |   8 +-
> >  .../recipes-extended/socketcan/canutils_4.0.6.bb   |   3 +
> >  .../recipes-extended/tipcutils/tipcutils_2.0.6.bb  |   1 +
> >  meta-oe/recipes-extended/tmux/tmux_2.1.bb          |   4 +
> >  .../sessreg/0001-Makefile.am-Error-Fix.patch       |  33 +
> >  meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb |   7 +-
> >  meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb    |   5 +-
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |   4 +-
> >  .../htop/htop/remove-proc-test.patch               |  13 -
> >  meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb   |  10 +-
> >  .../lm_sensors/lmsensors-config_1.0.bb             |   5 +-
> >  .../mcelog/mcelog/mcelog-debash.patch              |  36 +
> >  meta-oe/recipes-support/mcelog/mcelog/run-ptest    |   3 +
> >  meta-oe/recipes-support/mcelog/mcelog_1.09.bb      |  32 +-
> >  meta-oe/recipes-support/mysql/mariadb.inc          |  51 +-
> >  meta-oe/recipes-support/mysql/mariadb/install_db   |  13 +
> >  .../mysql/mariadb/install_db.service               |  17 +
> >  meta-oe/recipes-support/mysql/mariadb/my.cnf       |   1 -
> >  .../mysql/mariadb/mysql-systemd-start              |  66 ++
> >  .../recipes-support/mysql/mariadb/mysqld.service   |   9 +
> >  .../pam-passwdqc/pam-passwdqc_1.0.5.bb             |   7 +-
> >  .../recipes-support/poppler/poppler-data_0.4.7.bb  |  21 +-
> >  meta-oe/recipes-support/poppler/poppler_0.37.0.bb  |   2 +-
> >  meta-oe/recipes-support/postgresql/postgresql.inc  |  18 +-
> >  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   8 +-
> >  meta-oe/recipes-support/tree/tree_1.7.0.bb         |  11 +-
> >  .../libhtml/files/bin-htmltree-fix-shebang.patch   |  25 +
> >  .../recipes-perl/libhtml/libhtml-tree-perl_5.03.bb |   4 +-
> >  ...ay-perl-Disable-test-that-fails-with-open.patch |  70 ++
> >  ...2-betas-have-dropped-the-SSLv3_method-fun.patch |  75 +++
> >  .../recipes-perl/libnet/libnet-ssleay-perl_1.65.bb |   2 +
> >  .../recipes-devtools/python/python-jinja2_2.7.3.bb |   2 +
> >  .../python/python-requests_2.7.0.bb                |   2 +
> >  .../recipes-httpd/apache2/apache2_2.4.16.bb        |   2 +
> >  .../Port-content-spoofing-fix-CVE-2015-7873.patch  |  48 ++
> >  .../recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb   |   1 +
> >  66 files changed, 2222 insertions(+), 142 deletions(-)
> >  delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plm=
cboot.service
> >  delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plm=
cd.service
> >  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp=
/0002-config_os_headers-Error-Fix.patch
> >  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-c=
ontext-aliasing-bugs-CVE-2015-2696.patch
> >  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-c=
ontext-export-import-CVE-2015-2698.patch
> >  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-SPNEGO-c=
ontext-aliasing-bugs-CVE-2015-2695.patch
> >  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-build_pr=
incipal-memory-bug-CVE-2015-2697.patch
> >  create mode 100644 meta-oe/recipes-devtools/pmtools/pmtools/pmtools-sw=
itch-to-dynamic-buffer-for-huge-ACPI-table.patch
> >  create mode 100644 meta-oe/recipes-graphics/xorg-app/sessreg/0001-Make=
file.am-Error-Fix.patch
> >  delete mode 100644 meta-oe/recipes-support/htop/htop/remove-proc-test.=
patch
> >  create mode 100644 meta-oe/recipes-support/mcelog/mcelog/mcelog-debash=
=2Epatch
> >  create mode 100644 meta-oe/recipes-support/mcelog/mcelog/run-ptest
> >  create mode 100755 meta-oe/recipes-support/mysql/mariadb/install_db
> >  create mode 100644 meta-oe/recipes-support/mysql/mariadb/install_db.se=
rvice
> >  create mode 100644 meta-oe/recipes-support/mysql/mariadb/mysql-systemd=
-start
> >  create mode 100644 meta-perl/recipes-perl/libhtml/files/bin-htmltree-f=
ix-shebang.patch
> >  create mode 100644 meta-perl/recipes-perl/libnet/files/0001-libnet-ssl=
eay-perl-Disable-test-that-fails-with-open.patch
> >  create mode 100644 meta-perl/recipes-perl/libnet/files/0002-Recent-1.0=
=2E2-betas-have-dropped-the-SSLv3_method-fun.patch
> >  create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Po=
rt-content-spoofing-fix-CVE-2015-7873.patch
> >
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaDyIsACgkQN1Ujt2V2gByZyQCfSsrVKt5DBwVnuJKTtoQAlPGV
GaQAn3liemVhe37gK1Neng74JyUdUJqx
=Fg/n
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
