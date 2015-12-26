Return-Path: <akuster808@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id A4A846FFEA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Dec 2015 01:01:23 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id iw8so203120424obc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 17:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=JV6Sb7KXGZwYSN8OEq4W4GnfAHteDAIjVNDXt3+RqYU=;
	b=O+S+c9sX4pgLDDNpwCjc7nx2HeU67fnBh3v82i6wivwRHCc7sS0BPecFaxMCxjAprY
	7134WhCQFJBEtTdyyZfmCw2oZv8ehS9mpUvkgPqIwtpSQuXy4Yy5QnYr+twtl9sglZN7
	FwhBBleuFEL/MBJIhsnH/D4XUkGVNWArW0RkaLsKMQRE0KXAERN+9BYY0zAg2j3XbE3q
	pCT/D+r7SUqKmkfAmdgbZMX4T4mo6wozMbpCbnar5KRAZAkkJ9JBFBvb2XdYioT1mWvh
	TheL/ZKXHdqjKJ+nxTy6Qi8l5AbX2bBk5sDjlISFtLDOW9h5q0fuiL3Qo3DJTJqGEYus
	5lAA==
X-Received: by 10.60.63.138 with SMTP id g10mr14624573oes.58.1451091684284;
	Fri, 25 Dec 2015 17:01:24 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:70c9:620c:782f:9b2e?
	([2601:202:4000:1239:70c9:620c:782f:9b2e])
	by smtp.googlemail.com with ESMTPSA id
	y15sm10329528oie.17.2015.12.25.17.01.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Dec 2015 17:01:22 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <cover.1450888554.git.akuster808@gmail.com>
	<CAMKF1sqH=+A8kJmK2DoT2tfMpmvs-NKGoCZtRT_zZyBLwUZACg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <567DE6DF.3060207@gmail.com>
Date: Fri, 25 Dec 2015 17:01:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqH=+A8kJmK2DoT2tfMpmvs-NKGoCZtRT_zZyBLwUZACg@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Dec 2015 01:01:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 12/23/2015 06:32 PM, Khem Raj wrote:
> Armin
> 
> Can you add
sure thing.

> http://git.openembedded.org/meta-openembedded/commit/?id=b5341db1c245e581b25e2b7d5766ed2c1bbd17f7
> 
> to either this one or next pull plz

- armin
> 
> 
> On Wed, Dec 23, 2015 at 8:39 AM, Armin Kuster <akuster808@gmail.com> wrote:
>> Please consider these changes for Jethro-next
>>
>> I dropped the netmap changes but add more.
>>
>> The following changes since commit 4fdb203c182dae6f451ca131c0edfd5f0c99fc28:
>>
>>   vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394, dv1394, svg, svgdec (2015-11-16 21:57:48 +0100)
>>
>> are available in the git repository at:
>>
>>   git://github.com/akuster/meta-openembedded akuster/jethro-next
>>   https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next
>>
>> Andre McCurdy (1):
>>   tree: respect the package's own default CFLAGS
>>
>> Andreas Müller (1):
>>   faenza-icon-theme: fix host-user-contamination
>>
>> Bob Ham (1):
>>   poppler: move RDEPENDS on poppler-data to libpoppler
>>
>> Christopher Larson (3):
>>   ctdb: rdep on bash
>>   gpsd: also support bluez5
>>   canutils: rdep on iproute2
>>
>> George McCollister (1):
>>   postgresql: Don't symlink to perl if it's disabled
>>
>> Haris Okanovic (1):
>>   python-jinja2: Disable `make clean`
>>
>> Hongxu Jia (3):
>>   libhtml-tree-perl: fix shebang
>>   libnet-ssleay-perl: fix test failures with openssl
>>   mariadb.inc: fix mysqld hung at first init time based on systemd
>>
>> Jackie Huang (4):
>>   lmsensors-config: fix the packaging for sensord
>>   xfsprogs: fix the license
>>   netmap-modules: make deterministic builds for drivers
>>   netmap-modules: Modules may not have the same arch as userspace
>>
>> Jian Liu (1):
>>   ypbind-mt: set path of ypdomainname in ypbind script
>>
>> Joshua Lock (1):
>>   poppler-data: install CMap resources for CJK glyph support
>>
>> Kai Kang (4):
>>   libssh2: make crypto library selectable
>>   mcelog: remove bashism and create ptest subpackage
>>   apache2: fix host-user-contaminated warnings
>>   pmtools: support huge ACPI table
>>
>> Li Xin (2):
>>   net-snmp: Modify snmpd.service
>>   opensaf: remove unused service file
>>
>> Li xin (1):
>>   sessreg: add a patch to avoid build errors.
>>
>> Martin Jansa (3):
>>   gnome-panel: add dependency on dbus
>>   lcdproc5: add dependency on lirc
>>   mpd: add dependency on libupnp
>>
>> Qi.Chen@windriver.com (3):
>>   rrdtool: install python site packages into libdir
>>   tipcutils: fix host-user-comtaminated QA issue
>>   libvpx: fix host-user-comtaminated QA issue
>>
>> Radek Dostal (1):
>>   htop: delete not used patch
>>
>> Rafaël Carré (7):
>>   net-snmp: fix cross compilation
>>   vlc: remove libdc1394 libraw1394 from DEPENDS
>>   VLC: make libnotify a configurable dependency
>>   VLC: explicit PACKAGECONFIG for fontconfig
>>   VLC: explicit PACKAGECONFIG for freetype
>>   VLC: make libdvdread PACKAGECONFIG
>>   VLC: do not use --with-contrib
>>
>> Robert Yang (2):
>>   netcat: add DESCRIPTION
>>   dracut: fix host-user-contaminated
>>
>> Roy Li (3):
>>   dovecot: add PACKAGECONFIG for lz4
>>   pure-ftpd: add PACKAGECONFIG for libsodium
>>   ufw: improve RRECOMMENDS
>>
>> Scott Ellis (1):
>>   python-requests: Add RDEPENDS
>>
>> Steffen Sledz (1):
>>   syslog-ng: add UPDATE_ALTERNATIVE for syslog-service
>>
>> Wenzong Fan (5):
>>   krb5: fix CVE-2015-2695
>>   krb5: fix CVE-2015-2696
>>   krb5: fix CVE-2015-2697
>>   krb5: fix CVE-2015-2698
>>   phpmyadmin: fix CVE-2015-7873
>>
>> Yi Zhao (3):
>>   pam-passwdqc: fix the hardcoded libdir
>>   hplip: specify cupsbackenddir and cupsfilterdir
>>   tmux: add PACKAGECONFIG for utempter
>>
>> Yue Tao (1):
>>   netcat-openbsd: replace patch with quilt
>>
>>  .../recipes-utils/xfsprogs/xfsprogs_3.2.3.bb       |   2 +-
>>  .../faenza-icon-theme/faenza-icon-theme_1.3.bb     |   1 +
>>  .../gnome-panel/gnome-panel_2.32.1.bb              |   2 +-
>>  .../recipes-devtools/dracut/dracut_git.bb          |   3 +
>>  .../recipes-multimedia/musicpd/mpd_0.19.10.bb      |   2 +-
>>  meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  14 +-
>>  .../recipes-connectivity/ufw/ufw_0.33.bb           |   8 +
>>  .../opensaf/opensaf/plmcboot.service               |  13 -
>>  .../recipes-daemons/opensaf/opensaf/plmcd.service  |  15 -
>>  .../recipes-daemons/opensaf/opensaf_4.6.0.bb       |   6 +-
>>  .../recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb  |   2 +
>>  .../recipes-kernel/netmap/netmap-modules_git.bb    |  31 +-
>>  .../0002-config_os_headers-Error-Fix.patch         |  31 +
>>  .../net-snmp/net-snmp/snmpd.service                |   2 +-
>>  meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |   3 +
>>  .../recipes-support/dovecot/dovecot_2.2.18.bb      |   1 +
>>  .../recipes-support/netcat/netcat-openbsd_1.105.bb |   3 +-
>>  meta-networking/recipes-support/netcat/netcat.inc  |  10 +
>>  .../recipes-support/netcat/netcat_0.7.1.bb         |   2 -
>>  .../recipes-support/nis/files/ypbind.init          |  11 +-
>>  .../recipes-support/nis/ypbind-mt_1.38.bb          |   2 +
>>  ...AKERB-context-aliasing-bugs-CVE-2015-2696.patch | 739 +++++++++++++++++++++
>>  ...AKERB-context-export-import-CVE-2015-2698.patch | 134 ++++
>>  ...PNEGO-context-aliasing-bugs-CVE-2015-2695.patch | 572 ++++++++++++++++
>>  ...-build_principal-memory-bug-CVE-2015-2697.patch |  58 ++
>>  meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |   4 +
>>  ...tch-to-dynamic-buffer-for-huge-ACPI-table.patch |  66 ++
>>  meta-oe/recipes-devtools/pmtools/pmtools_git.bb    |   4 +-
>>  meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |   2 +
>>  meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |   2 +-
>>  meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb  |   8 +-
>>  .../recipes-extended/socketcan/canutils_4.0.6.bb   |   3 +
>>  .../recipes-extended/tipcutils/tipcutils_2.0.6.bb  |   1 +
>>  meta-oe/recipes-extended/tmux/tmux_2.1.bb          |   4 +
>>  .../sessreg/0001-Makefile.am-Error-Fix.patch       |  33 +
>>  meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb |   7 +-
>>  meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb    |   5 +-
>>  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |   4 +-
>>  .../htop/htop/remove-proc-test.patch               |  13 -
>>  meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb   |  10 +-
>>  .../lm_sensors/lmsensors-config_1.0.bb             |   5 +-
>>  .../mcelog/mcelog/mcelog-debash.patch              |  36 +
>>  meta-oe/recipes-support/mcelog/mcelog/run-ptest    |   3 +
>>  meta-oe/recipes-support/mcelog/mcelog_1.09.bb      |  32 +-
>>  meta-oe/recipes-support/mysql/mariadb.inc          |  51 +-
>>  meta-oe/recipes-support/mysql/mariadb/install_db   |  13 +
>>  .../mysql/mariadb/install_db.service               |  17 +
>>  meta-oe/recipes-support/mysql/mariadb/my.cnf       |   1 -
>>  .../mysql/mariadb/mysql-systemd-start              |  66 ++
>>  .../recipes-support/mysql/mariadb/mysqld.service   |   9 +
>>  .../pam-passwdqc/pam-passwdqc_1.0.5.bb             |   7 +-
>>  .../recipes-support/poppler/poppler-data_0.4.7.bb  |  21 +-
>>  meta-oe/recipes-support/poppler/poppler_0.37.0.bb  |   2 +-
>>  meta-oe/recipes-support/postgresql/postgresql.inc  |  18 +-
>>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   8 +-
>>  meta-oe/recipes-support/tree/tree_1.7.0.bb         |  11 +-
>>  .../libhtml/files/bin-htmltree-fix-shebang.patch   |  25 +
>>  .../recipes-perl/libhtml/libhtml-tree-perl_5.03.bb |   4 +-
>>  ...ay-perl-Disable-test-that-fails-with-open.patch |  70 ++
>>  ...2-betas-have-dropped-the-SSLv3_method-fun.patch |  75 +++
>>  .../recipes-perl/libnet/libnet-ssleay-perl_1.65.bb |   2 +
>>  .../recipes-devtools/python/python-jinja2_2.7.3.bb |   2 +
>>  .../python/python-requests_2.7.0.bb                |   2 +
>>  .../recipes-httpd/apache2/apache2_2.4.16.bb        |   2 +
>>  .../Port-content-spoofing-fix-CVE-2015-7873.patch  |  48 ++
>>  .../recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb   |   1 +
>>  66 files changed, 2222 insertions(+), 142 deletions(-)
>>  delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
>>  delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
>>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch
>>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-context-aliasing-bugs-CVE-2015-2696.patch
>>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-context-export-import-CVE-2015-2698.patch
>>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-SPNEGO-context-aliasing-bugs-CVE-2015-2695.patch
>>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-build_principal-memory-bug-CVE-2015-2697.patch
>>  create mode 100644 meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch
>>  create mode 100644 meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
>>  delete mode 100644 meta-oe/recipes-support/htop/htop/remove-proc-test.patch
>>  create mode 100644 meta-oe/recipes-support/mcelog/mcelog/mcelog-debash.patch
>>  create mode 100644 meta-oe/recipes-support/mcelog/mcelog/run-ptest
>>  create mode 100755 meta-oe/recipes-support/mysql/mariadb/install_db
>>  create mode 100644 meta-oe/recipes-support/mysql/mariadb/install_db.service
>>  create mode 100644 meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start
>>  create mode 100644 meta-perl/recipes-perl/libhtml/files/bin-htmltree-fix-shebang.patch
>>  create mode 100644 meta-perl/recipes-perl/libnet/files/0001-libnet-ssleay-perl-Disable-test-that-fails-with-open.patch
>>  create mode 100644 meta-perl/recipes-perl/libnet/files/0002-Recent-1.0.2-betas-have-dropped-the-SSLv3_method-fun.patch
>>  create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/Port-content-spoofing-fix-CVE-2015-7873.patch
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

