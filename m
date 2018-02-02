Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 011CA6FFF7;
	Fri,  2 Feb 2018 11:35:50 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id y3so12423958wrh.3;
	Fri, 02 Feb 2018 03:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sWExv29ldYQDzgt8Fp+pwpihWhJbwG9UsNlOyVpqiF8=;
	b=QCzLq4TyJoHW7dbHzibKdfJSWTfOWUgrUCwpPmYCicaW+YrYCqwHoxZp/uX+l46XLQ
	KRZjd/pyVfobtSa7Azc/41uvfrw2erpQw0q52bcZVsrVS7vvOzPWcfPNjJm2WYjUUD8l
	7ZQqPqpJ0vXN/d87tkQ0Y1VDjo4sXN5wfvlnQcuDXFEEjDCXzH0qZYROpsMqqXJ7Vz/u
	9XjPTUTaLNgMTnZe8zMBghfrmjFd5sdpu15MYKiT6o3K7QZTPZ8+HoOGByJJ36cZ9ZXH
	nMt7AhZrXZDTzYl1Pm2CuLS8Q7gEoP+19qwLj2WGwJ8vIL5Jyj6vXxjn2jiTq20IilpI
	zH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sWExv29ldYQDzgt8Fp+pwpihWhJbwG9UsNlOyVpqiF8=;
	b=MRwnNnngI5ao6+kPPLVrEF6Yw9iwY7rwbdusuW0GRNW/dqSmNfNZX4S1opKWlALCmb
	c1ljQbSjZSfICtOsCnpVJJmrYkEGOJybu0EAkkSGAK2ME3HyUMh7ZWf4MKRUVNmBE/EI
	4Pl8eHedLbOCyKZ2/mNxWPN4V6/J+lRnnRi8j9BKVxqN2Y0r9ACtO9AfmyXvpQRMQv5r
	r9aMj+niAvlocwsXZIbylwAlkABQKSdzhrSynVfLa0clpjlm0BLR+Lli17m+hfOw6lsZ
	kx1A0xwLfSdV+D1EB0JK2PhNupI4W7l+20iydm5Cw7gkwDktSQXv3187iTH6B+Yowhdm
	tyaA==
X-Gm-Message-State: AKwxytcYog+0nFibZl1N25Wp53PHoumIn2JsEdxwNgHrKfsqfWlq3Bn6
	YbtYyhs02mM8eC/dEavtxfa/2Xv3s21Kb4v3+2Ci7Q==
X-Google-Smtp-Source: AH8x227qlzQfwyqi52bOCb5jG59sTqCwcRrOZybSD/mfbsSHDVkqupAihBiVz25ymb0oj1vNWuuHZu49LVKxXuADkwo=
X-Received: by 10.223.136.167 with SMTP id f36mr20603294wrf.200.1517571346624; 
	Fri, 02 Feb 2018 03:35:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 2 Feb 2018 03:35:46 -0800 (PST)
In-Reply-To: <151750087874.30832.4117930919339260762@git.openembedded.org>
References: <151750087874.30832.4117930919339260762@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 2 Feb 2018 12:35:46 +0100
Message-ID: <CA+chaQfugMhAbs+u4jQYaGDgMoK-sSXfXFyxerOoM6H6feEpAQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	akuster808 <akuster808@gmail.com>, Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
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
X-List-Received-Date: Fri, 02 Feb 2018 11:35:51 -0000
Content-Type: text/plain; charset="UTF-8"

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
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/
> net-snmp-fix-for-disable-des.patch
>  create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-
> doveadm-Fix-parallel-build.patch
>  create mode 100644 meta-networking/recipes-support/open-isns/open-isns/
> 0001-util.h-endian.h-is-available-on-musl-on-linux.patch
>  create mode 100644 meta-networking/recipes-support/stunnel/stunnel/fix-
> openssl-no-des.patch
>  copy meta-oe/licenses/{QWTv1.0 => FLTK} (72%)
>  create mode 100644 meta-oe/licenses/UFL
>  create mode 100644 meta-oe/recipes-devtools/php/
> php-7.1.9/CVE-2017-16642.patch
>  create mode 100644 meta-oe/recipes-support/gperftools/gperftools/sgidef.
> patch
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

