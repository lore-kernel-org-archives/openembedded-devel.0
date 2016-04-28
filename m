Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id BCD5B700EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 21:01:16 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r187so12241268pfr.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KHcTZf8nOT4TLxeQy9hlOxVpT3IrQrqEU0sVpOlXyJ8=;
	b=r9zXw9BtfhimnjamXrEPI+xYn9rX3cyqz8IoWdYrV92Hcky+aKT4WV5rhEJ+Sa8AWc
	Jwn7MjyniEk0PLotN4hhHw+Mhd5D0qkicMy4afWNEDTDgpc77V6ZaUDVndJWR4NOMXCx
	yA9geBqtJts7Cr910o9aVTnDds9JxeQMwiLklSNQ66s8ls4RM5Pxc7824ZKQLOokDTRW
	4p7Vc+gOB3AwW8XOF9JPSGnjHNAZLeGhiLZnjhJ336Qp7IlCQUjqvPobW3/IOpKfOKR7
	C5aFPd774IFU7Xspk8PY0L8JqWmODMOsJhInpcWJXlfRFFjDkeemgyAZV1f9P0D2jUS9
	KvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KHcTZf8nOT4TLxeQy9hlOxVpT3IrQrqEU0sVpOlXyJ8=;
	b=mU2uJhUPRMrVy8PRfSxiobyMIENX36eLcekMr2x/dXb2XbjSSpXB8tu4Vp4IkKFo8M
	fs2pciW9Vn+uR5pAxILMOjfWSr8Z4ZEbYcgvZZZLPmP/KVgch5Ss7EMN43kBF/zZysxZ
	moI9kEeftNP4P1a2NRVOGAx0LObWkvuxOL5h9THWU9UaHD4+be4PiKqx9m0TQ9YR8uVs
	s5dVYShe2mtQmwKEVptu4oZD0e9zjP2XquVzb40rHVcA+SPzpxRO5fvlPCZeUdT6c5G0
	t7UNiuq2RNwm7N8y7D2MIjJQaz4MTV3CkY5jBQG3+2iQi1rTHRDgMNps7Wqr+UGCMYsE
	G8uA==
X-Gm-Message-State: AOPr4FUsPgqV/dWPBDm4+nRbWEycRcW2L/4CTpqSym0cK3zgPTEUpeENOdeA0/ovjb7PdA==
X-Received: by 10.98.78.199 with SMTP id c190mr23510399pfb.7.1461877277033;
	Thu, 28 Apr 2016 14:01:17 -0700 (PDT)
Received: from bigIsland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	t62sm17418431pfa.38.2016.04.28.14.01.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Apr 2016 14:01:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 28 Apr 2016 14:00:26 -0700
Message-Id: <cover.1461874725.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/36] Jethro-next pull request
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
X-List-Received-Date: Thu, 28 Apr 2016 21:01:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for jethro-next

The following changes since commit c305ac5d2f5285d5eec8952a4ca7f3b4f89aed96:

  python-m2crypto: fix SSLv2 symbol issue (2016-03-09 20:10:13 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/jethro-next
  https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next

Alexander Kanavin (1):
  tracker: fix packaging issues

Andre McCurdy (1):
  gst-plugins-base: add perl runtime dependency to gst-plugins-base-apps

André Draszik (1):
  rsnapshot: use ${bindir} as rsync location

Armin Kuster (3):
  udisk2: fix build issue with missing depends
  xcursorgen: fix License issue
  flite: fix license issue.

Belal, Awais (1):
  mplayer2: fix building with gcc 5.x

Catalin Enache (2):
  net-snmp: fix invalid paths in target net-snmp-config
  net-snmp: fix some invalid paths

Christopher Larson (1):
  ctdb: rdep on bash

Jackie Huang (1):
  libsmi: set the SH to the target path

Koen Kooi (1):
  mozjs: fix armeb builds

Li xin (2):
  mozjs_17.0.0.bb: Fix do_srpm error
  mariadb: Fix rootfs creation errors

Mark Asselstine (1):
  mozjs: fix configure host contamination

Martin Jansa (4):
  recipes: Replace "cp -a" with "cp -R --no-dereference
    --preserve=mode,links"
  efl-native: add dependency on openssl
  luajit: depend on luajit-native to provide host lua
  libftdi: Fix cpp-wrapper options

Mingli Yu (2):
  netkit-telnet: Add to generate telnetlogin.
  netkit-rsh: add two patches and some fixes.

Philip Balister (1):
  log4cpp: Fix build system path in pkgconfig file QA failure.

Rafaël Carré (5):
  vlc: make x11 DISTRO_FEATURE optional (enabled by default)
  vlc: make sdl optional (enabled by default)
  vlc: Fix typo introduced in 0f2b3139521570ad494a72399f8a9dae76e69b16
  net-snmp: apply patch for cross-compilation
  net-snmp: apply patch for cross-compilation

Richard Purdie (1):
  xmlstarlet: Disable PARALLEL_MAKE

Richard Tollerton (1):
  openldap: control ipv6 support via DISTRO_FEATURES

Roy Li (2):
  lldpd: configure the systemd unit file dir
  net-snmp: fix the replacement in net-snmp-config

Stefan Agner (1):
  gstreamer: fix argument parsing when using Bison 3

Stephano Cetola (1):
  fix missing packageconfig for samba with sysvinit

Stephen Arnold (1):
  net-snmp: fix cross-compile breakage, add libnl pkgconfig option

Zhixiong Chi (2):
  postgresql: Security Advisory-postgresql-CVE-2016-0766
  krb5-CVE-2016-3119.patch

 meta-efl/recipes-devtools/python/python-edbus.inc  |   2 +-
 meta-efl/recipes-efl/efl/efl.inc                   |   2 +-
 .../recipes-support/tracker/tracker_0.14.2.bb      |   2 +-
 .../recipes-mkv/libebml/libebml_1.3.0.bb           |   2 +-
 .../recipes-mkv/libmatroska/libmatroska_1.4.1.bb   |   2 +-
 .../gstreamer-0.10/gst-plugins-base_0.10.36.bb     |   3 +
 ...01-parse-make-grammar.y-work-with-Bison-3.patch |  35 ++++++
 ...mer-change-priv_gst_parse_yylex-arguments.patch |  33 -----
 .../gstreamer-0.10/gstreamer_0.10.36.bb            |   2 +-
 meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  13 +-
 .../recipes-connectivity/samba/samba_4.1.12.bb     |   1 +
 .../recipes-daemons/lldpd/lldpd_0.7.17.bb          |   5 +-
 .../netkit-rsh/netkit-rsh/fix-host-variable.patch  |  27 ++++
 .../netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch    |  30 +++++
 .../recipes-netkit/netkit-rsh/netkit-rsh/rexec.pam |  10 ++
 .../netkit-rsh/netkit-rsh/rexec.xinetd.netkit      |   2 +-
 .../netkit-rsh/netkit-rsh/rlogin.pam               |  12 ++
 .../netkit-rsh/netkit-rsh/rlogin.xinetd.netkit     |   2 +-
 .../recipes-netkit/netkit-rsh/netkit-rsh/rsh.pam   |  10 ++
 .../netkit-rsh/netkit-rsh/rsh.xinetd.netkit        |   2 +-
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   |  25 ++--
 .../netkit-telnet/netkit-telnet_0.17.bb            |   3 +
 ....patch => 0001-config_os_libs2-Error-Fix.patch} |   2 +-
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  30 +++--
 .../cim-schema/cim-schema-docs_2.40.0.bb           |   2 +-
 .../cim-schema/cim-schema-exper_2.39.0.bb          |   2 +-
 .../cim-schema/cim-schema-final_2.40.0.bb          |   2 +-
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |   2 +
 meta-oe/licenses/ManishSingh                       |  19 +++
 meta-oe/licenses/flite                             |  32 +++++
 meta-oe/recipes-benchmark/fio/fio_2.2.6.bb         |   2 +-
 .../krb5/krb5/krb5-CVE-2016-3119.patch             |  36 ++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |   1 +
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb    |   3 +
 ...0001-add-support-for-big-endian-32bit-ARM.patch |  26 ++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |  15 +--
 .../recipes-extended/tipcutils/tipcutils_2.0.6.bb  |   2 +-
 meta-oe/recipes-multimedia/live555/live555.inc     |  10 +-
 ...artially-port-libtheora-glue-code-to-Theo.patch | 136 +++++++++++++++++++++
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |   4 +-
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   2 +-
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb |   4 +-
 meta-oe/recipes-support/libftdi/libftdi_1.2.bb     |   2 +-
 meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb     |   2 +
 meta-oe/recipes-support/log4cpp/files/fix-pc.patch |  20 +++
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb   |   8 +-
 meta-oe/recipes-support/mysql/mariadb.inc          |   5 +-
 .../recipes-support/openldap/openldap_2.4.42.bb    |   2 +
 .../files/postgresql-CVE-2016-0766.patch           |  35 ++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  |   1 +
 .../rsnapshot/configure-fix-cmd_rsync.patch        |   2 +-
 meta-oe/recipes-support/tbb/tbb_4.1.bb             |   2 +-
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb    |   2 +-
 .../recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb |   7 ++
 .../recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb   |   2 +-
 55 files changed, 544 insertions(+), 103 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fix-host-variable.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.pam
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.pam
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.pam
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{0002-config_os_headers-Error-Fix.patch => 0001-config_os_libs2-Error-Fix.patch} (96%)
 create mode 100644 meta-oe/licenses/ManishSingh
 create mode 100644 meta-oe/licenses/flite
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-CVE-2016-3119.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer2/0001-demux_ogg-partially-port-libtheora-glue-code-to-Theo.patch
 create mode 100644 meta-oe/recipes-support/log4cpp/files/fix-pc.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0766.patch

-- 
1.9.1


