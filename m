Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3K-0001fb-GC
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:06 +0200
Received: by wgbdr1 with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=dyqIMSIDYoDB8DGhYPIp0o7OLvw8BNNrSTBN3qTcKHI=;
	b=rTZRwr5kBqFZyh3AagpBvOIL9Fk0B6sismKv8GA/QvkO+PO0QxbuvTvs4250ZyAfTJ
	w8nvS+vmq6izNqA0WhESDG4wwgQ25zRPPSDq8AIVqoYW0iHg+vNXandGYy+kDb4SsAD/
	IL1Yl9gsg7Cw5ZTdLlAP239N13VTNQsV4k9iDTezTpTfSgm2I7jCCnTSjLHoyJywiRfI
	Pfkc4QJVsHTZlUUZH/RZSSf23kgH7kQn/Om2wpMayPP2D6l2SkTRPJS97G4eJciagFGp
	fw2G76GMlRpBJ+hfSxmT6GqO45xJER0NVi/9bWLxuoFIflILLnXQ6FE66vXzQLuMho8u
	Fhww==
Received: by 10.216.225.230 with SMTP id z80mr5474645wep.182.1339364493820;
	Sun, 10 Jun 2012 14:41:33 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:33 +0200
Message-Id: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [RFC, meta-oe 00/27] transit to meta-systemd (cover-letter-only)
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the first part of the transition to meta-systemd for review. It
contains the changes on all recipes inheriting systemd.

The following tests were performed:
* build all recipes touched by this series from scratch without this series
* build all recipes touched by this series from scratch without this series
  and check buildhistory diff for unexpected side effects
* set BBMASK = "meta-systemd|meta-ti/recipes-misc|meta-angstrom/recipes-core/led|meta-angstrom/recipes-core/systemd|meta-nokia/recipes-core/systemd|meta-openmoko/recipes-core/systemd"
  and build all recipes touched from scratch an check if there is no 
  reference to systemd or unexpeted left-over. These tests are still in progress.

I think there are basically two parties affected by this patch:

1.systemd users: These will not see any difference from the situation before
  this patch
2.non-systemd-users: They should now grab recipes from meta-oe wihout fearing
  systemd grabbed in. Tasks and images need further decisions/efforts for them (see 2. below)

After this patch series the following steps need to be done:

1.Automatic RRECOMMENDS on *-systemd packages or put systemd stuff in base
  packages. This is required to make tasks/images independent of using systemd
  or not. Here is still a discussions/decision pending. I see two ways to go:
  1.1. If a package with *-systemd package extension is required, the *-systemd
       package is added to RRECOMMENDS. The decision is only made by adding 
       meta-systemd to BBLAYERS.
  1.2. The *-system packages are removed and their contents move to their base
       packages. Same here: The decision is only made by adding meta-systemd
       to BBLAYERS.
  There were distro-features mentioned in previous discussions. Are conditional
  BBMASKS available e.g masking out whole meta-systemd if 'systemd' is not found
  in distro feature?
  To make these patches make sense and enable non systemd users to use meta-oe
  we need a decision on how to continue on this.
2. task-basic/task-x11/images: replace *-systemd packages by their base packages
3. move systemd extensions of from other layers to meta-systemd OR use conditional
   BBMASK as mentioned above (if avaliable)
3. slim/udev/avahi: remove systemd from base packages and move to meta-systemd
4. dietsplash: Believing in it's description it should be moved to meta-systemd.

This patch series can be pulled from 
git://gitorious.org/schnitzeltony-oe-meta/meta-oe.git
branch systemd

Andreas Müller (27):
  systemd.bbclass: move to meta-systemd
  move systemd recipes to meta-systemd
  layer.conf/README: search directory structure for bbappends changed
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

 meta-efl/recipes-efl/efl/elsa_svn.bb               |    9 +-------
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    8 +-----
 .../cherokee/cherokee_1.2.98.bb                    |   10 ++------
 .../recipes-connectivity/gateone/gateone_git.bb    |    9 +------
 .../networkmanager/networkmanager_0.9.2.0.bb       |   13 +++++------
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |   20 +---------------
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      |    9 +-------
 meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 ++------
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |   17 +-------------
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    4 +-
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   10 ++++----
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    8 +-----
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   11 ++-------
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |   13 +++-------
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |   14 +++--------
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |   14 +++--------
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   17 +-------------
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    9 +------
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   10 ++------
 meta-systemd/README                                |    5 ++++
 {meta-oe => meta-systemd}/classes/systemd.bbclass  |    0
 meta-systemd/conf/layer.conf                       |    2 +-
 .../recipes-efl/efl/elsa/xserver-nodm.service      |    0
 .../meta-efl/recipes-efl/efl/elsa_svn.bbappend     |   13 +++++++++++
 .../meta-gnome}/recipes-gnome/gdm/gdm/gdm.service  |    0
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |   13 +++++++++++
 .../recipes-bsp/keymaps/keymaps/keymaps.service    |    0
 .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |    2 +-
 .../cherokee/cherokee/cherokee.service             |    0
 .../cherokee/cherokee_1.2.98.bbappend              |   10 ++++++++
 .../connman/connman_0.79.bbappend                  |    2 +
 .../recipes-connectivity/dhcp/dhcp}/dhcpd.service  |    0
 .../dhcp/dhcp}/dhcrelay.service                    |    0
 .../dhcp/dhcp_4.2.3-P2.bbappend                    |    4 +-
 .../gateone/gateone/gateone.service                |    0
 .../gateone/gateone_git.bbappend                   |   11 +++++++++
 .../networkmanager/networkmanager_0.9.2.0.bbappend |   14 ++++++++++++
 .../openssh/openssh/sshd.socket                    |    0
 .../openssh/openssh/sshd@.service                  |    0
 .../openssh/openssh/sshdgenkeys.service            |    0
 .../openssh/openssh_6.0p1.bbappend                 |    2 +-
 .../busybox/busybox/busybox-klogd.service.in       |    0
 .../busybox/busybox/busybox-syslog.service.in      |    0
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |   23 ++++++++++++++++++++
 .../recipes-core/dropbear/dropbear/dropbear.socket |    0
 .../dropbear/dropbear/dropbear@.service            |    0
 .../dropbear/dropbear/dropbearkey.service          |    0
 .../dropbear/dropbear_2012.55.bbappend             |    2 +-
 .../recipes-devtools/cloud9/cloud9/cloud9.service  |    0
 .../recipes-devtools/cloud9/cloud9_0.6.bbappend    |   13 +++++++++++
 .../recipes-extended/atftp/atftp}/atftpd.service   |    0
 .../recipes-extended/atftp/atftp_0.7.bbappend      |   10 ++++++++
 .../recipes-extended/cronie/cronie/crond.service   |    0
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |    2 +-
 .../lighttpd/lighttpd/lighttpd.service             |    0
 .../lighttpd/lighttpd_1.4.30.bbappend              |    2 +-
 .../net-snmp/net-snmp}/snmpd.service               |    0
 .../net-snmp/net-snmp}/snmptrapd.service           |    0
 .../net-snmp/net-snmp}/systemd-support.patch       |    0
 .../net-snmp/net-snmp_5.7.1.bbappend               |   19 ++++++++++++++++
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 ++
 .../rsyslog/rsyslog_5.8.0.bbappend                 |   12 ++++++++++
 .../xinput-calibrator/xinput-calibrator.service    |    0
 .../xinput-calibrator_0.7.5.bbappend               |   10 ++++++++
 .../xserver-nodm-init}/xserver-nodm.service        |    0
 .../xserver-nodm-init_2.0.bbappend                 |   12 ++++++++++
 .../recipes-navigation/gpsd/gpsd_3.4.bbappend      |   14 ++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.5.bbappend      |   14 ++++++++++++
 .../recipes-navigation/gpsd/gpsd_git.bbappend      |   14 ++++++++++++
 .../meta-oe/recipes-support/ntp/ntp}/ntpd.service  |    0
 .../recipes-support/ntp/ntp}/ntpdate.service       |    0
 .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |   21 ++++++++++++++++++
 .../syslog-ng/syslog-ng_3.2.5.bbappend             |   11 +++++++++
 .../udisks/udisks/add-systemd-support.patch        |    0
 .../recipes-support/udisks/udisks_1.0.4.bbappend   |   13 +++++++++++
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
 88 files changed, 317 insertions(+), 171 deletions(-)
 rename {meta-oe => meta-systemd}/classes/systemd.bbclass (100%)
 rename {meta-efl => meta-systemd/meta-efl}/recipes-efl/efl/elsa/xserver-nodm.service (100%)
 create mode 100644 meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappend
 rename {meta-gnome => meta-systemd/meta-gnome}/recipes-gnome/gdm/gdm/gdm.service (100%)
 create mode 100644 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps/keymaps.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps_1.0.bbappend (85%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/cherokee/cherokee/cherokee.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/connman/connman_0.79.bbappend (84%)
 rename {meta-oe/recipes-connectivity/dhcp/files => meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp}/dhcpd.service (100%)
 rename {meta-oe/recipes-connectivity/dhcp/files => meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp}/dhcrelay.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend (81%)
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
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear_2012.55.bbappend (92%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-devtools/cloud9/cloud9/cloud9.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
 rename {meta-oe/recipes-extended/atftp/files => meta-systemd/meta-oe/recipes-extended/atftp/atftp}/atftpd.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/cronie/cronie/crond.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/cronie/cronie_1.4.8.bbappend (87%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/lighttpd/lighttpd/lighttpd.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend (84%)
 rename {meta-oe/recipes-extended/net-snmp/files => meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp}/snmpd.service (100%)
 rename {meta-oe/recipes-extended/net-snmp/files => meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp}/snmptrapd.service (100%)
 rename {meta-oe/recipes-extended/net-snmp/files => meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp}/systemd-support.patch (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
 rename {meta-oe => meta-systemd/meta-oe}/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend
 rename {meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0 => meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init}/xserver-nodm.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
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
1.7.4.4



