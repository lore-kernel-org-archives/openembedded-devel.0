Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbS9-0007zC-4w
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:21 +0200
Received: by bkcik5 with SMTP id ik5so2247498bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=lKZMxlLs4FGw1pFjOSdG49Ndrbvm6uK6CQFolHeU7dU=;
	b=Fb1nCDfAou5FJh0vE+CtCBazagGW6pkYT+319QQvVrvv5Ln62/8lHPN3kkehoHc0xy
	t6vyIXgJvRBR1G/NPWTFfBaWLZOl3da5729mB/sSx6+kV0z0c8lLnLXevMVt+r8xhAVi
	NdUZ68RJDSPqs73gD9W8vNQ3od1Nxrq5gf3iJXjXti8043wq3AZn6z/6nyPC+Ce2Q18s
	yg+KkJ8qtvqh/JeyuRltO26tQx9LXMDQHPR7btNDNcOqnpCm+b/YfnNVBEEtidwzchf3
	uuxgqZ/6ACbqNzQIgXlx2YpP02l6MoawY9iZGJ17OvqLZU1WmxM0bGzaL3eZihMQF9Nt
	GN0w==
Received: by 10.204.156.17 with SMTP id u17mr155713bkw.52.1342168266256;
	Fri, 13 Jul 2012 01:31:06 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:08 +0200
Message-Id: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe,V2 00/32] transit to meta-systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 08:42:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1->v2:
* rebase to latest head
* 4 meta-oe/layer.conf: systemd-serialgetty moved to meta-systemd
* 5 append systemd package to RRECOMMENDS
* remove warning in case systemd-stuff is packed in ${PN}
* 7+8 make tasks usable without meta-systemd
* xserver-nodm-init: include Martin's patch [1]
* use FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:" for multiple bbappends

The series can be pulled from [2] branch systemd

[1] http://patches.openembedded.org/patch/30383/
[2] git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.git

Andreas Müller (32):
  systemd.bbclass: move to meta-systemd
  move systemd recipes to meta-systemd
  layer.conf/README: search directory structure for bbappends changed
  meta-oe/layer.conf: systemd-serialgetty moved to meta-systemd
  systemd.bbclass: add *-systemd packages to RRECOMMENDS
  systemd.bbclass: do not warn for systemd files are in ${PN}
  task-basic: move systemd support to meta systemd
  task-x11: in case meta-systemd is part of BBLAYERS,
    xserver-nodm-init-systemd is recommended automatically
  polkit: meta-systemd rework
  gdm: move systemd support to meta-systemd
  busybox: move systemd support to meta-systemd
  ntp: move systemd support to meta-systemd
  syslog-ng: move systemd support to meta-systemd
  udisks: move systemd support to meta-systemd
  lighttpd: move systemd support to meta-systemd
  cronie: move systemd support to meta-systemd
  elsa: move systemd support to meta-systemd
  net-snmp: move systemd support to meta-systemd
  atftp: move systemd support to meta-systemd
  dhcp: move systemd support to meta-systemd
  connman: move systemd support to meta-systemd
  gateone: move systemd support to meta-systemd
  cherokee: move systemd support to meta-systemd
  openssh: move systemd support to meta-systemd
  cloud9: move systemd support to meta-systemd
  xinput-calibrator: : move systemd support to meta-systemd
  xserver-nodm-init: move systemd support to meta-systemd
  dropbear: move systemd support to meta-systemd
  keymaps: move systemd support to meta-systemd
  rsyslog: move systemd support to meta-systemd
  gpsd: move systemd support to meta-systemd
  networkmanager: move systemd support to meta-systemd

 meta-efl/recipes-efl/efl/elsa_svn.bb               |    9 +----
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    8 +---
 meta-oe/conf/layer.conf                            |    1 -
 .../cherokee/cherokee_1.2.98.bb                    |   10 ++----
 .../recipes-connectivity/gateone/gateone_git.bb    |    9 +----
 .../networkmanager/networkmanager_0.9.2.0.bb       |   13 +++----
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |   20 +----------
 meta-oe/recipes-core/tasks/task-basic.bb           |    7 ++--
 meta-oe/recipes-core/tasks/task-x11_1.0.bb         |    6 ++--
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      |    9 +----
 meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 ++----
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |   17 +--------
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    4 +-
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   10 +++---
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    8 +---
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   16 +--------
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |   15 ++------
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |   15 ++------
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |   14 ++------
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   18 +---------
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    9 +----
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   10 ++----
 meta-systemd/README                                |    5 +++
 {meta-oe => meta-systemd}/classes/systemd.bbclass  |   35 +++++++++++++------
 meta-systemd/conf/layer.conf                       |    2 +-
 .../recipes-efl/efl/elsa/xserver-nodm.service      |    0
 .../meta-efl/recipes-efl/efl/elsa_svn.bbappend     |   13 +++++++
 .../meta-gnome}/recipes-gnome/gdm/gdm/gdm.service  |    0
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |   13 +++++++
 .../recipes-bsp/keymaps/keymaps/keymaps.service    |    0
 .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |    2 +-
 .../cherokee/cherokee/cherokee.service             |    0
 .../cherokee/cherokee_1.2.98.bbappend              |   10 ++++++
 .../connman/connman_1.0.bbappend                   |    2 +
 .../recipes-connectivity/dhcp/dhcp}/dhcpd.service  |    0
 .../dhcp/dhcp}/dhcrelay.service                    |    0
 .../dhcp/dhcp_4.2.3-P2.bbappend                    |    4 +-
 .../gateone/gateone/gateone.service                |    0
 .../gateone/gateone_git.bbappend                   |   11 ++++++
 .../networkmanager/networkmanager_0.9.2.0.bbappend |   14 ++++++++
 .../openssh/openssh/sshd.socket                    |    0
 .../openssh/openssh/sshd@.service                  |    0
 .../openssh/openssh/sshdgenkeys.service            |    0
 .../openssh/openssh_6.0p1.bbappend                 |    2 +-
 .../busybox/busybox/busybox-klogd.service.in       |    0
 .../busybox/busybox/busybox-syslog.service.in      |    0
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |   23 +++++++++++++
 .../recipes-core/dropbear/dropbear/dropbear.socket |    0
 .../dropbear/dropbear/dropbear@.service            |    0
 .../dropbear/dropbear/dropbearkey.service          |    0
 .../dropbear/dropbear_2012.55.bbappend             |    4 +-
 .../meta-oe/recipes-core/tasks/task-basic.bbappend |    6 +++
 .../recipes-devtools/cloud9/cloud9/cloud9.service  |    0
 .../recipes-devtools/cloud9/cloud9_0.6.bbappend    |   13 +++++++
 .../recipes-extended/atftp/atftp}/atftpd.service   |    0
 .../recipes-extended/atftp/atftp_0.7.bbappend      |   10 ++++++
 .../recipes-extended/cronie/cronie/crond.service   |    0
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |    4 +-
 .../lighttpd/lighttpd/lighttpd.service             |    0
 .../lighttpd/lighttpd_1.4.31.bbappend              |    4 +-
 .../net-snmp/net-snmp}/snmpd.service               |    0
 .../net-snmp/net-snmp}/snmptrapd.service           |    0
 .../net-snmp/net-snmp}/systemd-support.patch       |    0
 .../net-snmp/net-snmp_5.7.1.bbappend               |   19 +++++++++++
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 ++
 .../rsyslog/rsyslog_5.8.0.bbappend                 |   10 ++++++
 .../xinput-calibrator/xinput-calibrator.service    |    0
 .../xinput-calibrator_0.7.5.bbappend               |   10 ++++++
 .../xserver-nodm-init}/xserver-nodm.conf           |    0
 .../xserver-nodm-init}/xserver-nodm.service        |    0
 .../xserver-nodm-init_2.0.bbappend                 |   21 ++++++++++++
 .../recipes-navigation/gpsd/gpsd/gpsd.service      |    0
 .../recipes-navigation/gpsd/gpsd_3.4.bbappend      |   18 ++++++++++
 .../recipes-navigation/gpsd/gpsd_3.5.bbappend      |   18 ++++++++++
 .../recipes-navigation/gpsd/gpsd_git.bbappend      |   14 ++++++++
 .../meta-oe/recipes-support/ntp/ntp}/ntpd.service  |    0
 .../recipes-support/ntp/ntp}/ntpdate.service       |    0
 .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |   20 +++++++++++
 .../syslog-ng/syslog-ng_3.2.5.bbappend             |   11 ++++++
 .../udisks/udisks/add-systemd-support.patch        |    0
 .../recipes-support/udisks/udisks_1.0.4.bbappend   |   13 +++++++
 .../recipes-core/systemd/systemd-compat-units.bb   |    0
 .../systemd/systemd-compat-units/machineid.service |    0
 .../systemd-compat-units/run-postinsts.service     |    0
 .../systemd/systemd-machine-units_1.0.bb           |    0
 .../recipes-core/systemd/systemd-serialgetty.bb    |    0
 .../systemd/systemd-serialgetty/LICENSE            |    0
 .../systemd-serialgetty/serial-getty@.service      |    0
 .../recipes-core/systemd/systemd-speed-hacks.bb    |    0
 .../systemd/systemd-systemctl-native.bb            |    0
 .../systemd/systemd-systemctl-native/systemctl     |    0
 .../systemd/systemd/format-replace-m-uclibc.patch  |    0
 .../systemd/systemd/paper-over-mkostemp.patch      |    0
 .../recipes-core/systemd/systemd_git.bb            |    0
 94 files changed, 369 insertions(+), 203 deletions(-)
 rename {meta-oe => meta-systemd}/classes/systemd.bbclass (85%)
 rename {meta-efl => meta-systemd/meta-efl}/recipes-efl/efl/elsa/xserver-nodm.service (100%)
 create mode 100644 meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappend
 rename {meta-gnome => meta-systemd/meta-gnome}/recipes-gnome/gdm/gdm/gdm.service (100%)
 create mode 100644 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps/keymaps.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps_1.0.bbappend (85%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/cherokee/cherokee/cherokee.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/connman/connman_1.0.bbappend (84%)
 rename {meta-oe/recipes-connectivity/dhcp/files => meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp}/dhcpd.service (100%)
 rename {meta-oe/recipes-connectivity/dhcp/files => meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp}/dhcrelay.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend (79%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/gateone/gateone/gateone.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh/sshd.socket (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh/sshd@.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh/sshdgenkeys.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh_6.0p1.bbappend (88%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/busybox/busybox/busybox-klogd.service.in (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/busybox/busybox/busybox-syslog.service.in (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear/dropbear.socket (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear/dropbear@.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear/dropbearkey.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear_2012.55.bbappend (81%)
 create mode 100644 meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-devtools/cloud9/cloud9/cloud9.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
 rename {meta-oe/recipes-extended/atftp/files => meta-systemd/meta-oe/recipes-extended/atftp/atftp}/atftpd.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/cronie/cronie/crond.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/cronie/cronie_1.4.8.bbappend (69%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/lighttpd/lighttpd/lighttpd.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend (62%)
 rename {meta-oe/recipes-extended/net-snmp/files => meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp}/snmpd.service (100%)
 rename {meta-oe/recipes-extended/net-snmp/files => meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp}/snmptrapd.service (100%)
 rename {meta-oe/recipes-extended/net-snmp/files => meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp}/systemd-support.patch (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend
 rename {meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0 => meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init}/xserver-nodm.conf (100%)
 rename {meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0 => meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init}/xserver-nodm.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-navigation/gpsd/gpsd/gpsd.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend
 rename {meta-oe/recipes-support/ntp/files => meta-systemd/meta-oe/recipes-support/ntp/ntp}/ntpd.service (100%)
 rename {meta-oe/recipes-support/ntp/files => meta-systemd/meta-oe/recipes-support/ntp/ntp}/ntpdate.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-support/udisks/udisks/add-systemd-support.patch (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-compat-units.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-compat-units/machineid.service (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-compat-units/run-postinsts.service (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-machine-units_1.0.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-serialgetty.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-serialgetty/LICENSE (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-serialgetty/serial-getty@.service (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-speed-hacks.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-systemctl-native.bb (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd-systemctl-native/systemctl (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd/format-replace-m-uclibc.patch (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd/paper-over-mkostemp.patch (100%)
 rename {meta-oe => meta-systemd}/recipes-core/systemd/systemd_git.bb (100%)

-- 
1.7.6.5



