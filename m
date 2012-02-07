Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqk-0001JL-An
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:20:54 +0100
Received: by eekd41 with SMTP id d41so2181054eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=wPX+cjqbEtO+kkti/+dkNd4Q4x+3KZrbhrD0D7wrbiA=;
	b=ORIHUrZQwckBqpEdeH18D+u9zjtyojwHBGKZUuCwuFWaCfV2yMPKPetB6aIPme0Xca
	ihauuHwvSjYl0RAXzay5Z8WVRDftGKQvhkBWGxCohRt+GOuH7BiVQXwh/0nxXMmuDeUi
	MhQBlyMgfO8ydibeKL7qfb6eqEX2iPsif6gV0=
Received: by 10.14.39.148 with SMTP id d20mr7178417eeb.90.1328627571986;
	Tue, 07 Feb 2012 07:12:51 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.12.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:12:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:26 +0100
Message-Id: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Tue, 07 Feb 2012 15:20:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The RFC series is intended to

* reduce efforts/pitfalls when implementing native systemd support
* enable a global configuration for selecting of systemd/syvinit (sysvinit
  needs further efforts)

The whole series' can be found at (branches 'systemd'
meta-oe: git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.git
meta-angstrom: git://gitorious.org/schnitzeltony-oe-meta/meta-angstrom-systemd.git

Notes:
* These are my first python experiences - suggestions welcome.
* In local.conf (or in distro) the configuration variable INIT_MANAGER selects
  the initmanager to be build into an image. When changing the selection,
  a build from scratch is required. INIT_MANAGER currently defaults to systemd
  (see image.bbclass and initmanager.bbclass)
* In systemd.bbclass debug messages were left in to have a better overview
  what's going on.
* An additional patch series goes out for meta-angstrom.
* This is a huge RFC which might cause serious impacts. What I have already
  detected after a build from scatch is that /var/lib/opkg is missing in the
  image (although it can be found in libopkg.ipk). I will spend the next
  days with my new friend buildhistory (thanks for this!!).

Comments welcome

Andreas Müller (27):
  systemd.bbclass: rework
  initmanager.bbclass: inital add
  image.bbclass: inherit initmanager.bbclass and set default value for
    IMAGE_INIT_MANAGER
  elsa: remove unneeded systemd code
  connman: remove unneeded systemd code
  openssh: remove unneeded systemd code
  gateone: remove unneeded systemd code
  cronie: remove unneeded systemd code
  xserver-nodm-init: remove unneeded systemd code
  busybox: remove unneeded systemd code
  atftp: remove unneeded systemd code
  gpsd: remove unneeded systemd code
  gdm: inherit systemd / remove unneeded systemd code
  dropbear: remove unneeded systemd code
  cloud9: pack systemd support in ${PN}-systemd / remove unneeded
    systemd code
  slim: inherit systemd / remove unneeded systemd code
  udisks: conditional DEPENDS systemd / remove unneeded systemd code
  rsyslog: conditional DEPENDS systemd / remove unneeded systemd code
  polkit: conditional DEPEND systemd
  syslog-ng: conditional --enable-systemd --with-systemdsystemunitdir /
    remove unneeded systemd code
  lighthttpd: inherit systemd / added systemd native support / remove
    unneeded systemd code
  cherokee: inherit systemd / added systemd native support / remove
    unneeded systemd code
  networkmanager: inherit systemd / added
    NetworkManager-wait-online.service / remove unneeded systemd code
  ntp: add native systemd support for ntpdate / remove unneeded systemd
    code
  dhcp: add native support for dhcp-relay / remove unneeded systemd
    code
  task-basic: replace systemd specific packets by common ones /
    conditionally RDEPENDS avahi(-systemd) systemd-compat-units
  task-x11: replace systemd specific packets by common ones

 meta-efl/recipes-efl/efl/elsa_svn.bb               |   11 +-
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |   32 +--
 meta-oe/classes/image.bbclass                      |  382 ++++++++++++++++++++
 meta-oe/classes/initmanager.bbclass                |   10 +
 meta-oe/classes/systemd.bbclass                    |  173 ++++++++--
 meta-oe/recipes-connectivity/cherokee/cherokee.inc |   11 +-
 .../connman/connman_0.78.bbappend                  |    7 +-
 .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   16 +-
 .../dhcp/files/dhcrelay.service                    |   10 +
 .../recipes-connectivity/gateone/gateone_git.bb    |    7 +-
 .../networkmanager/networkmanager_0.9.2.0.bb       |   26 +-
 .../openssh/openssh_5.9p1.bbappend                 |   14 +-
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |    6 -
 .../dropbear/dropbear_2011.54.bbappend             |   10 +-
 meta-oe/recipes-core/tasks/task-basic.bb           |   10 +-
 meta-oe/recipes-core/tasks/task-x11_1.0.bb         |    4 +-
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb    |   10 +-
 meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 +-
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |   12 +-
 .../lighttpd/lighttpd_1.4.30.bbappend              |   14 +-
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    5 +
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |    9 +-
 meta-oe/recipes-graphics/slim/slim_1.3.2.bb        |    9 +-
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   10 +-
 meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb       |   12 +-
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   14 +-
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   10 +-
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   11 +-
 28 files changed, 620 insertions(+), 235 deletions(-)
 create mode 100644 meta-oe/classes/image.bbclass
 create mode 100644 meta-oe/classes/initmanager.bbclass
 create mode 100644 meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend

-- 
1.7.6.4



