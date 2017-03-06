Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5909E71CAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:32:19 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id 187so13596108pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yuX/07aRlYxKyZXO0mNk4WGvW8q0j8XeWmNVFF/4QA0=;
	b=H4JQ/il8urKivJbMWtOviHUJAwMt7kdgSCkZo63Wfg+gs5Z0BCXc53hjzIkF84qKEj
	XePyc9lYEdJo6fyhVfowgXrsOM55zLZ0pv5N2GgK3uFYPp/Wb4SbzTNgnU7QBtaPzUc3
	Aq+JdDRoIZQKwT4Ra2zVkXKC0+//iDPRN4xOE7KamTH3sbZgz+fVqbICQgiMKilFg+0a
	eVIASBU7hzdsTGFJRmYeVmumJ8Zvn6/O4DEVe0JFQLyB6SVhbMZMHaTzP8+RQ5ATsKPS
	PKURjbAtjCEiey3ZOOW9BTfFu00jLc9z89HcKroC2iMJIwGrTwMsrF6CXWWDakgeewH5
	dcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yuX/07aRlYxKyZXO0mNk4WGvW8q0j8XeWmNVFF/4QA0=;
	b=ZG8S1yNgL1axrv9osLAb/6h8aNYeifdHN4Q+Ga2bjM5K/DFkLBvq5wPf3vHYVva0se
	LQt+2GmvY4vWIzNks1dlhETrTDz5zXdyw19n8Cs94gd6xLYX+F5cx5C9qjFrwh2vxjYe
	exWktffL7U5G3mlq/Em3uqP5QmQ2MrYFdXade2WE1H/NOiThUNOF3wHEKEGhzZTp119w
	ud3+zXdAPmswWWsFdn+IqM0ymfbLD6Kt6VuNlSfkDTiu+FBu0tr70aUbe4KEBxUXpudS
	a5lTtBwYqUBC6WjuDjUGLBRwP6pbng1jCT4SEjl8yFwkEpEYnehZN/NoWHd2lWQjEk6d
	ZGdQ==
X-Gm-Message-State: AMke39kFG999eO12NWhSpo3m5HlFyuoe8fbcb0MW4P6zUMW6Rb/kBmhf+dRdjd+VUkm1mQ==
X-Received: by 10.84.245.8 with SMTP id i8mr27491191pll.131.1488814341245;
	Mon, 06 Mar 2017 07:32:21 -0800 (PST)
Received: from localhost.localdomain ([2601:202:4001:9ea0:c634:6bff:fe01:a196])
	by smtp.gmail.com with ESMTPSA id
	a16sm39938905pgd.62.2017.03.06.07.32.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 07:32:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:31:15 -0500
Message-Id: <cover.1488813805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 00/62] morty pull request
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
X-List-Received-Date: Mon, 06 Mar 2017 15:32:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for morty

The following changes since commit 1efa5d623bc64659b57389e50be2568b1355d5f7:

  gpsd: fix multilib build (2016-12-03 07:45:12 -0800)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/morty-next
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akuster/morty-next

Andreas Müller (4):
  libtdb: fix SRC_URI - http has gone
  libtevent: fix SRC_URI - http has gone
  gnome-system-monitor: fix build after update of gnome c++ bindings
  lmsensors: fix fetch and unblacklist

Andreas Oberritter (3):
  imagemagick: use correct major version in program suffix
  samba: Avoid timeout for nmbd if started offline with systemd
  samba: conditionalize sed call for onnode

Andrej Valek (1):
  libupnp: Fix out-of-bound access in create_url_list() (CVE-2016-8863)

André Draszik (1):
  meta_oe_security_flags: disable PIE for libdbus-c++

Armin Kuster (11):
  wireshark: update package to 2.2.4
  wireshark: fix build issue
  tcpdump: update to 4.9.0 for security fixes
  netkit-ruser: update SRC_URI
  ipsec-tools: change SRC_URI fetcher.
  fetchmail: update SRC_URI
  libdnet: update SRC_URI
  python-sqlalchemy: fix SRC_URI
  lm_sensors: update SRC_URI
  exfat-utils: update SRC_URI
  libdnet: Update SRC_URI to fix checksum errors

Chai, Chong Yi (1):
  libtalloc: fix SRC_URI to use https instead of http

Chen Qi (3):
  inetutils: fix alternative priority to avoid conflict
  netcat-openbsd: fix ALTERNATIVE_PRIORITY to avoid conflict
  tftp-hpa: fix ALTERNATIVE_PRIORITY to avoid conflict

Haiqing Bai (1):
  crda: check the word size of target instead of host machine.

Jackie Huang (3):
  squid: disable gnu atomic operations for mipsel
  chrony: remove unrecognized option ipv6
  samba: fix the hardcoded path in init script

Jason Wessel (1):
  tsock: Make use of LDFLAGS

Joe Slater (1):
  ntp: update to version 4.8p9

Kai Kang (7):
  samba: Fix qa issue and update ctdb-tests
  samba: correct sub-package name for multilib
  curlpp: fix qa issue of do_configure
  postfix: add dependency icu
  pimd: update SRC_URI
  ctdb: update SRC_URI
  openl2tp: update SRC_URI

Khem Raj (10):
  libvdpau: Disable PIE
  mpv: Add PACKAGECONFIG for vaapi
  meta_oe_security_flags.inc: Disable PIE for luajit
  samba: Fix build with musl
  crda: Fix build with clang
  vlc: Add packageconfig for vdpau
  mpv: Add libvdpau to DEPENDS
  ipsec-tools: Fix build with clang
  inetutils: Disable rsh, rcp, rlogin on musl
  hplip: Fix build with clang

Li Zhou (2):
  net-snmp: fix snmptrap to use clientaddr from snmp.conf.
  net-snmp: snmplib, UDPIPv6 transport: Add a missing return statement

Mark Asselstine (2):
  dnsmasq: read the conf files found in dnsmasq.d
  dnsmasq: allow for dnsmasq instances to reuse default dnsmasq.conf

Martin Jansa (1):
  libxml++: fix LICENSE

Max Krummenacher (1):
  tinymembench: fix QA warning for GNU_HASH

Nicolas Ferre (1):
  nbench-byte: fix project URL

Oleksandr Kravchuk (3):
  wireshark: update to 2.2.3
  tcpdump: upgrade to 4.8.1
  iperf3: update to 3.1.3

Ricardo Ribalda Delgado (1):
  gflags: Fix fetch URL

Robert Yang (2):
  inetutils: do_configure: fix "Argument list too long"
  lftp: do_configure: fix "Argument list too long"

Thomas PERROT (1):
  makedumpfile: add ARM into COMPATIBLE_HOST

Zheng Ruoqin (1):
  wireshark: 2.2.1 -> 2.2.2

 .../recipes-utils/exfat-utils/exfat-utils_1.2.3.bb |   5 +-
 .../gnome-system-monitor_2.28.2.bb                 |   2 +
 .../libupnp/libupnp/CVE-2016-8863.patch            |  57 ++++++++++
 .../recipes-connectivity/libupnp/libupnp_1.6.19.bb |   1 +
 meta-multimedia/recipes-multimedia/vlc/vlc.inc     |   7 +-
 .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch  |  58 +++++++++++
 .../recipes-connectivity/crda/crda/make.patch      |  25 +++++
 .../use-target-word-size-instead-of-host-s.patch   |  34 ++++++
 .../recipes-connectivity/crda/crda_3.18.bb         |   8 +-
 .../inetutils/inetutils_1.9.4.bb                   |  22 +++-
 .../recipes-connectivity/lftp/lftp_4.7.3.bb        |   2 +
 .../recipes-connectivity/libdnet/libdnet_1.12.bb   |   2 +-
 ...void-timeout-for-nmbd-if-started-offline-.patch |  31 ++++++
 .../samba/samba-4.4.5/samba-4.2.7-pam.patch        |  36 +++++++
 .../samba-4.3.9-remove-getpwent_r.patch            |  87 ++++++++++++++++
 .../recipes-connectivity/samba/samba_4.4.5.bb      |  32 +++++-
 .../recipes-daemons/postfix/postfix.inc            |   4 +-
 .../recipes-daemons/squid/squid_3.5.20.bb          |   1 +
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |   2 +-
 .../netkit-rusers/netkit-rusers_0.17.bb            |   4 +-
 ...ix-snmptrap-to-use-clientaddr-from-snmp.c.patch |  48 +++++++++
 ...IPv6-transport-Add-a-missing-return-state.patch |  29 ++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |   2 +
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |   2 +-
 .../recipes-protocols/tsocks/tsocks_1.8beta5.bb    |   3 +
 .../recipes-support/chrony/chrony_2.4.bb           |   2 +-
 meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb |   2 +-
 .../recipes-support/curlpp/curlpp_0.7.3.bb         |   1 +
 .../dnsmasq/files/dnsmasq-noresolvconf.service     |   2 +-
 .../dnsmasq/files/dnsmasq-resolvconf.service       |   2 +-
 .../recipes-support/dnsmasq/files/dnsmasq.conf     |   2 +-
 .../recipes-support/fetchmail/fetchmail_6.3.26.bb  |   2 +-
 .../ipsec-tools/0001-Fix-build-with-clang.patch    | 115 +++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |   3 +-
 .../recipes-support/libtalloc/libtalloc_2.1.8.bb   |   2 +-
 .../recipes-support/libtdb/libtdb_1.3.10.bb        |   2 +-
 .../recipes-support/libtevent/libtevent_0.9.29.bb  |   2 +-
 .../recipes-support/netcat/netcat-openbsd_1.105.bb |   2 +-
 .../ntp/{ntp_4.2.8p8.bb => ntp_4.2.8p9.bb}         |   4 +-
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb |   2 +-
 .../tcpdump/tcpdump/add-ptest.patch                |  25 ++---
 .../tcpdump/{tcpdump_4.7.4.bb => tcpdump_4.9.0.bb} |   9 +-
 .../{wireshark_2.2.1.bb => wireshark_2.2.4.bb}     |   7 +-
 .../conf/distro/include/meta_oe_security_flags.inc |  13 +++
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb     |   4 +-
 .../nbench-byte/nbench-byte_2.2.3.bb               |   4 +-
 .../tinymembench/tinymembench_git.bb               |   2 +
 meta-oe/recipes-core/libxml/libxml++_2.38.1.bb     |   2 +-
 ...de-cups-ppd.h-for-missing-ppd-definitions.patch |  42 ++++++++
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |   1 +
 .../makedumpfile/makedumpfile_1.6.0.bb             |   2 +-
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb   |   3 +-
 meta-oe/recipes-support/gflags/gflags_2.1.2.bb     |   7 +-
 .../imagemagick/imagemagick_7.0.2.bb               |  46 ++++-----
 .../recipes-support/lm_sensors/lmsensors_3.4.0.bb  |   8 +-
 .../python/python-sqlalchemy_0.7.9.bb              |   5 +-
 56 files changed, 738 insertions(+), 91 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/CVE-2016-8863.patch
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/make.patch
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.2.7-pam.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.3.9-remove-getpwent_r.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-build-with-clang.patch
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p8.bb => ntp_4.2.8p9.bb} (97%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.7.4.bb => tcpdump_4.9.0.bb} (85%)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.1.bb => wireshark_2.2.4.bb} (94%)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch

-- 
2.9.3


