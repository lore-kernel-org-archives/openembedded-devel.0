Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 50761786E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Feb 2018 11:42:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1517571729; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=ITO2WOnifOpVicmRgLsAi4sxXXHwrYcr1TQKaBHen1A=;
	b=XvnttJBfd3WPalKF0VMEskXU05FyAdWr0vAppJWA/kcOqHVrJccKI0z+3kX4FnVrOgACoSlU
	gXj0FGJMTTGmEyurzhP2j7Chq79D8y3gBBeP5IBQm388trOQ0hLtbhDjfBOaDR1Mm7oiZsGw
	1VY2cu4eLtgQE6WAqIpEFtO2lJw=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mxa.mailgun.org with ESMTP id 5a744e91.7f659442c130-smtp-out-n03;
	Fri, 02 Feb 2018 11:42:09 -0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id d54so30481313qtd.4;
	Fri, 02 Feb 2018 03:42:09 -0800 (PST)
X-Gm-Message-State: APf1xPAfuRcHBNcO1VWXC/PkgeUnr77xRRkjLsDwyrenlC4dfvrQz3sy
	sH0qpDRVmv06CgYM1CWBKAlPkXa+p3ifAb7D1XE=
X-Google-Smtp-Source: AH8x224jBYuvi+DoDC/r1dGL+Q/5/0/QbcP8aDQ6PC1aBEF+buNoVYxi1TGTdmN209t0LNmMKyImWeTsQ7Wrat6A1aA=
X-Received: by 10.200.57.3 with SMTP id s3mr3491456qtb.328.1517571728905; Fri,
	02 Feb 2018 03:42:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.83.228 with HTTP; Fri, 2 Feb 2018 03:42:08 -0800 (PST)
Received: by 10.140.83.228 with HTTP; Fri, 2 Feb 2018 03:42:08 -0800 (PST)
In-Reply-To: <CA+chaQfugMhAbs+u4jQYaGDgMoK-sSXfXFyxerOoM6H6feEpAQ@mail.gmail.com>
References: <151750087874.30832.4117930919339260762@git.openembedded.org>
	<CA+chaQfugMhAbs+u4jQYaGDgMoK-sSXfXFyxerOoM6H6feEpAQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 2 Feb 2018 06:42:08 -0500
X-Gmail-Original-Message-ID: <CADNbA1q4MXAuD7Qon2du5xF3siSt-HYBUZ2qbvOSNrMUxP25_g@mail.gmail.com>
Message-ID: <CADNbA1q4MXAuD7Qon2du5xF3siSt-HYBUZ2qbvOSNrMUxP25_g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Mark Asselstine <mark.asselstine@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] branch rocko updated (6e3fc5b -> a65c1ac)
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
X-List-Received-Date: Fri, 02 Feb 2018 11:42:08 -0000
Content-Type: text/plain; charset="UTF-8"

Mark had cherry picked the twisted changes from master.  I thought he had
pulled in the full change set, but I must have missed some of the commits
when I reviewed it.  I'll take a look once I get off the train.  Sorry for
the breakage.

On Feb 2, 2018 6:35 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

Why was this change backported to rocko?
  add 0f1dff9  python-twisted: clean-up the dependencies

It adds dependency on python3-hyperlink which isn't in rocko, only in
master since:

commit 378b8a6a8aa65fae704e9ceddc3f2e2b07585953
Author: Derek Straka <derek@asterius.io>
Date:   Wed Nov 1 11:37:51 2017 -0400

    python-hyperlink: add a recipe for version 17.3.1

and dependency on python-incremental also only in master since:

commit 63791edb3f69269fc6e0b83863e76f6a4a35965c
Author: Derek Straka <derek@asterius.io>
Date:   Wed Nov 1 10:58:33 2017 -0400

    python-incremental: add an initial recipe for version 17.5.0


This is causing quite a 4 errors shown in world builds:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'python-incremental' (but
meta-oe/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python-incremental' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-incremental']
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'python-twisted', 'python-incremental']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'python3-hyperlink' (but
meta-oe/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-hyperlink' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-hyperlink']
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'python3-twisted', 'python3-hyperlink']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

On Thu, Feb 1, 2018 at 5:01 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> armin_kuster pushed a change to branch rocko
> in repository meta-openembedded.
>
>     from 6e3fc5b  python-cffi: update to version 1.11.2
>      add d8f82c4  README: update maintainers list for rocko
>      add a1f65f1  debootstrap: change license to MIT
>      add 4e67423  UFL: add missing license
>      add 9132eef  python-cryptography: add -pthread to LD_FLAGS
>      add 0f1dff9  python-twisted: clean-up the dependencies
>      add a68639a  python-twisted: restore RDEPENDS on -news for py2
>      add 5d285be  gpsd: fix /etc/default/gpsd ALTERNATIVES logic
>      new 7b404fd  gperftools: Fix build on musl/mips
>      new 96eab89  tslib: update project homepage
>      new c5939bd  libpwquality: fix Nothing RPROVIDES
> 'lib32-python3-libpwquality'
>      new f83f290  libreport: fix Nothing RPROVIDES
> 'lib32-python3-libreport'
>      new 9afe8a4  samba: add missing RDEPENDS
>      new 1985f77  gpsd: add missing python-pygps RDEPENDS
>      new 4bea809  android-tools: do_unpack_extra task removed
>      new 6ef007b  mariadb: Added missing installation of
> mysqld_safe_helper to FILES_${PN}-server
>      new 52bdf26  polkit: add consolekit only when x11 is enabled
>      new 45a874a  hiredis: fix paths in pkgconfig conf file
>      new ab3630f  xfce4-screenshooter: create src dir before build
>      new 45bcac8  php: Security Advisory - php - CVE-2017-16642
>      new be07dad  Allow native builds of python-asyn1crypto
>      new 0fb0fd2  phpmyadmin: update to version 4.7.5
>      new b4289b2  postgresql: Update to 9.4.14
>      new 1caf212  postgresql: Update to 9.4.15
>      new c993fd1  dfu-utils-native: fix do_deploy sstate handling
>      new 731a262  Move RDEPENDS on libasound-module to bluez4 since it has
> been removed from bluez5
>      new f48be7e  passwdqc: add pam-passwdqc to RDEPENDS
>      new 846e009  openldap: fix QA Warning
>      new 859dfb0  phpmyadmin: update to version 4.7.6
>      new f224492  Adding LUA to SDK
>      new c31b240  fltk-native: remove fltk-config from image
>      new 7cfbfe0  fltk: remove fltk-native from DEPENDS
>      new 4bdaf0c  Add FLTK to licenses to avoid warning when building fltk
> / fltk-native
>      new ed6ed8d  hwloc: fix multilib problem
>      new e8abea8  leveldb: fix checking for SSE flag
>      new f351bea  open-isns: Fix build with musl
>      new 8349bbd  dovecot: Fix parallel build
>      new b54c140  dnsmasq: update SRC_URI for versions 2.69 and earlier
>      new f80ff75  arptables: Fix do_install task
>      new e4c768c  net-snmp: support openssl without 3des
>      new fc88b63  stunnel: fix compile error when openssl disable des
> support
>      new 18b570e  networkmanager: add consolekit only when x11 is enabled
>      new a0d7f74  dialog: update SRC_URI
>      new a65c1ac  uw-imap: update SRC_URI
>
> The 36 revisions listed above as "new" are entirely new to this
> repository and will be described in separate emails.  The revisions
> listed as "add" were already present in the repository and have only
> been added to this reference.
>
>
> Summary of changes:
>  meta-filesystems/README                            |   12 +-
>  meta-gnome/README                                  |   11 +-
>  meta-initramfs/README                              |   10 +-
>  meta-multimedia/README                             |   15 +-
>  meta-networking/MAINTAINERS                        |    7 +-
>  .../networkmanager/networkmanager_1.4.4.bb         |    3 +-
>  .../recipes-connectivity/samba/samba_4.6.7.bb      |    3 +-
>  .../net-snmp/net-snmp-fix-for-disable-des.patch    |   32 +
>  .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |    4 +-
>  .../recipes-support/arptables/arptables_git.bb     |    3 +-
>  .../recipes-support/dnsmasq/dnsmasq.inc            |    4 +-
>  .../dovecot/0001-doveadm-Fix-parallel-build.patch  |   38 +
>  .../recipes-support/dovecot/dovecot_2.2.29.bb      |    4 +-
>  ....h-endian.h-is-available-on-musl-on-linux.patch |   38 +
>  .../recipes-support/open-isns/open-isns_0.97.bb    |    6 +-
>  .../stunnel/stunnel/fix-openssl-no-des.patch       |   54 +
>  .../recipes-support/stunnel/stunnel_5.35.bb        |    4 +-
>  meta-oe/README                                     |   10 +-
>  meta-oe/licenses/{QWTv1.0 => FLTK}                 |  281 +-
>  meta-oe/licenses/UFL                               |   97 +
>  .../packagegroups/packagegroup-tools-bluetooth.bb  |    2 +-
>  .../android-tools/android-tools_5.1.1.r37.bb       |   18 -
>  .../debootstrap/debootstrap_1.0.67.bb              |    2 +-
>  meta-oe/recipes-devtools/lua/lua_5.3.4.bb          |    2 +-
>  .../php/php-7.1.9/CVE-2017-16642.patch             | 5241
> ++++++++++++++++++++
>  meta-oe/recipes-devtools/php/php_7.1.9.bb          |    1 +
>  meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb  |    2 +-
>  .../recipes-extended/dialog/dialog_1.3-20160828.bb |    2 +-
>  meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb |    3 +-
>  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb     |    9 +-
>  ...uild_detect_platform-Check-for-__SSE4_2__.patch |    5 +-
>  .../libpwquality/libpwquality_1.4.0.bb             |    4 +-
>  .../recipes-extended/libreport/libreport_2.9.2.bb  |    6 +-
>  meta-oe/recipes-extended/polkit/polkit_0.113.bb    |    4 +-
>  meta-oe/recipes-graphics/tslib/tslib_1.1.bb        |    2 +-
>  meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb       |   14 +-
>  .../dfu-util/dfu-util-native_0.9.bb                |    7 +-
>  meta-oe/recipes-support/fltk/fltk-native.bb        |    5 +
>  meta-oe/recipes-support/fltk/fltk.bb               |    2 +-
>  .../gperftools/gperftools/sgidef.patch             |   17 +
>  .../recipes-support/gperftools/gperftools_2.6.1.bb |    1 +
>  meta-oe/recipes-support/mysql/mariadb.inc          |    1 +
>  .../recipes-support/openldap/openldap_2.4.45.bb    |    1 +
>  meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb |    2 +-
>  .../{postgresql_9.4.13.bb => postgresql_9.4.15.bb} |    4 +-
>  meta-perl/README                                   |    9 +-
>  meta-python/README                                 |    4 +-
>  .../recipes-devtools/python/python-asn1crypto.inc  |    1 +
>  .../python/python-cryptography.inc                 |    2 +
>  .../recipes-devtools/python/python-twisted.inc     |    4 +-
>  .../python/python-twisted_17.9.0.bb                |    8 +-
>  .../python/python3-twisted_17.9.0.bb               |    2 +-
>  meta-webserver/README                              |    4 +-
>  .../{phpmyadmin_4.7.3.bb => phpmyadmin_4.7.6.bb}   |    4 +-
>  meta-xfce/README                                   |   11 +-
>  .../xfce4-screenshooter_1.9.1.bb                   |    1 +
>  56 files changed, 5785 insertions(+), 258 deletions(-)
>  create mode 100644 meta-networking/recipes-protoc
> ols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
>  create mode 100644 meta-networking/recipes-suppor
> t/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
>  create mode 100644 meta-networking/recipes-suppor
> t/open-isns/open-isns/0001-util.h-endian.h-is-available-
> on-musl-on-linux.patch
>  create mode 100644 meta-networking/recipes-suppor
> t/stunnel/stunnel/fix-openssl-no-des.patch
>  copy meta-oe/licenses/{QWTv1.0 => FLTK} (72%)
>  create mode 100644 meta-oe/licenses/UFL
>  create mode 100644 meta-oe/recipes-devtools/php/p
> hp-7.1.9/CVE-2017-16642.patch
>  create mode 100644 meta-oe/recipes-support/gperft
> ools/gperftools/sgidef.patch
>  rename meta-oe/recipes-support/postgresql/{postgresql_9.4.13.bb =>
> postgresql_9.4.15.bb} (67%)
>  rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.7.3.bb =>
> phpmyadmin_4.7.6.bb} (90%)
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

