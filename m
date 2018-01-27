Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 65C117875F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:39 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id v3so166018plg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=e6eKqQbFGhtQdTl9voZ5aTzC+dfWR4/X4+62Bwo9tco=;
	b=cFhryonb8zcsVGIyLxz0YZMIHZBm6/8NxwMGBj2q7lAUqndt7OQO0qicOBSWqMWRTC
	dLwjcLNUuScDHwxZER0rHM4CHZNsXQzM6QQn4OnT7KgUMo12VPhka2M6WyD+1TZDIcTb
	07jL0Y2+uI9s5totuMBa6gy2I04xjd67oLN+U+ccmGN7szd8O2U77RdZngT5xaoJz/JD
	zslOcMiCsAe5I9DskwXHxwVnUlaCvGETkHntz+8trv1faV2HYGLv/SVjsJ/gPFhLRCxC
	a23X7RLmRytdfEpzaTmRWbOb1SxYtwtaG7sA2MU+k40SPTorFeoo6ds05qP/aWKYn009
	mj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=e6eKqQbFGhtQdTl9voZ5aTzC+dfWR4/X4+62Bwo9tco=;
	b=uPmGWuzVSB4AxedRmn200C82W+XkMmJN16Vrgv05hJLb1s9S1bbLIC4XYiMHs0CY4o
	wKwyUIhuVD+M6dk1yAVvjpQCmSQaLNRESQGkV+rWbvkuz6WF7IAQ9T3nAHtVkyq/ID15
	swWZtLTqMWKDW8xvDwQmNrTBWUIEc2T75Jz5oJT+NNEAiGRZoVyzcwMxrHXgwVS6w3jZ
	XZPvQf5r0QfFBYlagxZ1P1Lfq8dMnL+kzGkVJ8PsZlrfF9OUCQhcsPXwL7P6TobOwK3q
	i9wMmjnHlw+9dv6gnTI9SP0GBEBjsVY9+OsX5EppklVwhzJue22yU4+E4sqm1yISlpp2
	DTsg==
X-Gm-Message-State: AKwxytdCVem/U9UyQzUjVwkj1y4/8yap+PdbSEkci1oAr9qAJqO+sV8o
	buKf22teeRgfXzH7+7LZQmw=
X-Google-Smtp-Source: AH8x226KYU9uukUFjZ+Szg5ovl6keK9/JjVyEfq5lEqY+YLsCbc31UyJNpGQYHeppTw0oy+KzNdY7g==
X-Received: by 2002:a17:902:bc85:: with SMTP id
	bb5-v6mr16275920plb.425.1517023480658; 
	Fri, 26 Jan 2018 19:24:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:00 -0800
Message-Id: <cover.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/36] Rocko-next
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following are commits are being proposed for Rocket-next.


The following changes since commit 5d285bef0f8abd2da720e9f72d6c421d0da87c91:

  gpsd: fix /etc/default/gpsd ALTERNATIVES logic (2018-01-11 13:26:25 -0800)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/rocko-next
  http://cgit.openembedded.org//log/?h=stable/rocko-next

Andre McCurdy (1):
  dnsmasq: update SRC_URI for versions 2.69 and earlier

Andrea Galbusera (1):
  hiredis: fix paths in pkgconfig conf file

Andreas Müller (3):
  fltk-native: remove fltk-config from image
  fltk: remove fltk-native from DEPENDS
  Add FLTK to licenses to avoid warning when building fltk / fltk-native

Catalin Enache (1):
  xfce4-screenshooter: create src dir before build

Dariusz Pelowski (1):
  android-tools: do_unpack_extra task removed

Derek Straka (2):
  phpmyadmin: update to version 4.7.5
  phpmyadmin: update to version 4.7.6

Fabio Berton (1):
  arptables: Fix do_install task

George McCollister (1):
  postgresql: Update to 9.4.15

Hongxu Jia (2):
  libpwquality: fix Nothing RPROVIDES 'lib32-python3-libpwquality'
  libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'

Huang Qiyu (1):
  postgresql: Update to 9.4.14

Jackie Huang (4):
  samba: add missing RDEPENDS
  polkit: add consolekit only when x11 is enabled
  net-snmp: support openssl without 3des
  networkmanager: add consolekit only when x11 is enabled

Jonathan Haigh (1):
  Allow native builds of python-asyn1crypto

Jonathan Haws (1):
  mariadb: Added missing installation of mysqld_safe_helper to
    FILES_${PN}-server

Kai Kang (1):
  stunnel: fix compile error when openssl disable des support

Khem Raj (3):
  gperftools: Fix build on musl/mips
  open-isns: Fix build with musl
  dovecot: Fix parallel build

Li Zhou (1):
  php: Security Advisory - php - CVE-2017-16642

Martin Kelly (1):
  gpsd: add missing python-pygps RDEPENDS

Martin Kepplinger (1):
  tslib: update project homepage

Mingli Yu (1):
  passwdqc: add pam-passwdqc to RDEPENDS

Qi Hou (1):
  openldap: fix QA Warning

Qi.Chen@windriver.com (1):
  hwloc: fix multilib problem

Romain Forlot (1):
  Adding LUA to SDK

Stefan Müller-Klieser (1):
  dfu-utils-native: fix do_deploy sstate handling

Tobias Olausson (1):
  Move RDEPENDS on libasound-module to bluez4 since it has been removed
    from bluez5

Yi Zhao (3):
  leveldb: fix checking for SSE flag
  dialog: update SRC_URI
  uw-imap: update SRC_URI

 .../networkmanager/networkmanager_1.4.4.bb         |    3 +-
 .../recipes-connectivity/samba/samba_4.6.7.bb      |    3 +-
 .../net-snmp/net-snmp-fix-for-disable-des.patch    |   32 +
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |    4 +-
 .../recipes-support/arptables/arptables_git.bb     |    3 +-
 .../recipes-support/dnsmasq/dnsmasq.inc            |    4 +-
 .../dovecot/0001-doveadm-Fix-parallel-build.patch  |   38 +
 .../recipes-support/dovecot/dovecot_2.2.29.bb      |    4 +-
 ....h-endian.h-is-available-on-musl-on-linux.patch |   38 +
 .../recipes-support/open-isns/open-isns_0.97.bb    |    6 +-
 .../stunnel/stunnel/fix-openssl-no-des.patch       |   54 +
 .../recipes-support/stunnel/stunnel_5.35.bb        |    4 +-
 meta-oe/licenses/FLTK                              |  530 ++
 .../packagegroups/packagegroup-tools-bluetooth.bb  |    2 +-
 .../android-tools/android-tools_5.1.1.r37.bb       |   18 -
 meta-oe/recipes-devtools/lua/lua_5.3.4.bb          |    2 +-
 .../php/php-7.1.9/CVE-2017-16642.patch             | 5241 ++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.1.9.bb          |    1 +
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb  |    2 +-
 .../recipes-extended/dialog/dialog_1.3-20160828.bb |    2 +-
 meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb |    3 +-
 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb     |    9 +-
 ...uild_detect_platform-Check-for-__SSE4_2__.patch |    5 +-
 .../libpwquality/libpwquality_1.4.0.bb             |    4 +-
 .../recipes-extended/libreport/libreport_2.9.2.bb  |    6 +-
 meta-oe/recipes-extended/polkit/polkit_0.113.bb    |    4 +-
 meta-oe/recipes-graphics/tslib/tslib_1.1.bb        |    2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb       |    9 +-
 .../dfu-util/dfu-util-native_0.9.bb                |    7 +-
 meta-oe/recipes-support/fltk/fltk-native.bb        |    5 +
 meta-oe/recipes-support/fltk/fltk.bb               |    2 +-
 .../gperftools/gperftools/sgidef.patch             |   17 +
 .../recipes-support/gperftools/gperftools_2.6.1.bb |    1 +
 meta-oe/recipes-support/mysql/mariadb.inc          |    1 +
 .../recipes-support/openldap/openldap_2.4.45.bb    |    1 +
 meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb |    2 +-
 .../{postgresql_9.4.13.bb => postgresql_9.4.15.bb} |    4 +-
 .../recipes-devtools/python/python-asn1crypto.inc  |    1 +
 .../{phpmyadmin_4.7.3.bb => phpmyadmin_4.7.6.bb}   |    4 +-
 .../xfce4-screenshooter_1.9.1.bb                   |    1 +
 40 files changed, 6019 insertions(+), 60 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
 create mode 100644 meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
 create mode 100644 meta-oe/licenses/FLTK
 create mode 100644 meta-oe/recipes-devtools/php/php-7.1.9/CVE-2017-16642.patch
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
 rename meta-oe/recipes-support/postgresql/{postgresql_9.4.13.bb => postgresql_9.4.15.bb} (67%)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.7.3.bb => phpmyadmin_4.7.6.bb} (90%)

-- 
2.7.4


