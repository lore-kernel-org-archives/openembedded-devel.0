Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 88FF470101
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:24 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so105222089pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=C9PZz2xSj2WUAbaz8/8j+w1OP0EFqGTdP8bGN8Mb/+8=;
	b=V+qmfWnFWfUNY9Ey7UjkgbePJibGA9qZjkKVC9L1Hle7OngllFzVUEz+cd2hnyPEgI
	rRuaCSjBDiEOmWifjQcznV7sIKIjmS4/adk7sK/DIzcuvoHClh9S4958I5LGFH4jUhSN
	WL4Yk7wIg+SMFpfTAQwrNpLRS4c187QGhA+lEeCSeegHlApY4KPcAp8Wydgy5yE6LgAA
	080y9nKa2LGy01mK31OwZwwO5fsriqIiKun+lfyxMVoP9AceeT9drsH0hIyT75o7UIBu
	s90ePks6Vctqfj8NP/jhN7jkYgoamermjJvtKPCI84ubab6gfR7TYCOfUAqdaZrpTRpS
	f/Nw==
X-Received: by 10.66.123.72 with SMTP id ly8mr46639798pab.19.1450107265040;
	Mon, 14 Dec 2015 07:34:25 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	g68sm7639714pfj.57.2015.12.14.07.34.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:20 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 1696DFCC838; Mon, 14 Dec 2015 07:34:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:33:53 -0800
Message-Id: <cover.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/14] mete-oe Jethro-next
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for jethro-next

The following changes since commit 4fdb203c182dae6f451ca131c0edfd5f0c99fc28:

  vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394, dv1394, svg, svgdec (2015-11-16 21:57:48 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/jethro-next
  https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next

Armin Kuster (1):
  tmux: Fix QA issue

Christopher Larson (1):
  ctdb: rdep on bash

Jackie Huang (2):
  netmap-modules: make deterministic builds for drivers
  netmap-modules: Modules may not have the same arch as userspace

Jian Liu (1):
  ypbind-mt: set path of ypdomainname in ypbind script

Li Xin (2):
  net-snmp: Modify snmpd.service
  opensaf: remove unused service file

Rafaël Carré (1):
  net-snmp: fix cross compilation

Robert Yang (1):
  netcat: add DESCRIPTION

Roy Li (4):
  lldpd: configure the systemd unit file dir
  ufw: improve RRECOMMENDS
  dovecot: add PACKAGECONFIG for lz4
  pure-ftpd: add PACKAGECONFIG for libsodium

Yue Tao (1):
  netcat-openbsd: replace patch with quilt

 .../recipes-connectivity/ufw/ufw_0.33.bb           |  8 ++++++
 .../recipes-daemons/lldpd/lldpd_0.7.17.bb          |  5 +++-
 .../opensaf/opensaf/plmcboot.service               | 13 ---------
 .../recipes-daemons/opensaf/opensaf/plmcd.service  | 15 -----------
 .../recipes-daemons/opensaf/opensaf_4.6.0.bb       |  6 +----
 .../recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb  |  2 ++
 .../recipes-kernel/netmap/netmap-modules_git.bb    | 31 +++++++++++++++++++++-
 .../0002-config_os_headers-Error-Fix.patch         | 31 ++++++++++++++++++++++
 .../net-snmp/net-snmp/snmpd.service                |  2 +-
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |  3 +++
 .../recipes-support/dovecot/dovecot_2.2.18.bb      |  1 +
 .../recipes-support/netcat/netcat-openbsd_1.105.bb |  3 ++-
 meta-networking/recipes-support/netcat/netcat.inc  | 10 +++++++
 .../recipes-support/netcat/netcat_0.7.1.bb         |  2 --
 .../recipes-support/nis/files/ypbind.init          | 11 ++++----
 .../recipes-support/nis/ypbind-mt_1.38.bb          |  2 ++
 meta-oe/recipes-extended/tmux/tmux_2.1.bb          |  2 ++
 17 files changed, 103 insertions(+), 44 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch

-- 
1.9.1


