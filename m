Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqls-00063o-NH
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:32 +0100
Received: by eaal10 with SMTP id l10so479834eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=Qe4IERvz2vV8FU1HAP5kJRJbqnQB8CJfzyf4Bsosx5M=;
	b=TMJPiBxLoknjcAmYwad69JFK5AX9iFUK3wyW1EKn32OPhS9oi81S/jIVvW85BHHjxW
	RCbqkBGScIVdj24XJY/A7eQalLtBAD3g/nsKZEiDF5zL6dqtDbY5QXaM1VRt0DRW9SQU
	S0ZTH2ofb1W4ZvOfT+nqu+N8J4ejfdC4/FnsU=
Received: by 10.14.94.134 with SMTP id n6mr336045eef.63.1329357620295;
	Wed, 15 Feb 2012 18:00:20 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:02:54 +0100
Message-Id: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2:
[2]  do not check configuration variables for cross and nativesdk
[3]  rename systemd_package to systemd_generate_package_scripts
[6]  parse unit files to determine the files to pack
[7]  create warning if *-systemd package already rdepends
     it's base package
added in V2:
[8]-[20] remove obsolet systemd code from recipes (these were used as
     test cases)
[21] dhcp-(relay) test case for multiple systemd packages
[22] modified to start service

The following tests were performed:
* build from scratch with [1]-[7] / run test
* build from scratch / apply patches / build -> check buildhistory diff
* build from scratch w/o patches / build from scratch with patches -> check
  buildhistory diff

Additional patches were prepared for other recipes inheriting systemd. These are
not yet send because they move systemd support from ${PN} to ${PN}-systemd which
currently needs modifications on tasks/images. I'd be happy if a common accepted
solution would be suggested/implemented (image-feature?).

This patch series can be pulled from:
git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.git branch systemd2

Andreas Müller (22):
  systemd-systemctl-native: add multiple services support
  systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and
    SYSTEMD_SERVICE
  systemd.bbclass: cosmetics
  systemd.bbclass: automatically create packages set in
    SYSTEMD_PACKAGES
  automatically install all *.service and *.socket supplied in recipe's
    SRC_URI
  systemd.bbclass: automatically extend FILES_* for systemd packages
  systemd.bbclass: automatically extend RDEPENDS for *-systemd packages
  connman: remove unneeded systemd code
  dropbear: remove unneeded systemd code
  openssh: remove unneeded systemd code
  elsa: remove unneeded systemd code
  cronie: remove unneeded systemd code
  xserver-nodm-init: remove unneeded systemd code
  atftp: remove unneeded systemd code
  udisks: remove unneeded systemd code
  rsyslog: remove unneeded systemd code
  syslog-ng: remove unneeded systemd code
  dhcp: remove unneeded systemd code
  gpsd: remove unneeded systemd code
  busybox: remove unneeded systemd code
  dhcp: add native systemd support for dhcp-relay
  gpsd: use ${PN}.service instead ${PN}.socket in SYSTEMD_SERVICE to
    enable service

 meta-efl/recipes-efl/efl/elsa_svn.bb               |   11 +--
 meta-oe/classes/systemd.bbclass                    |  165 ++++++++++++++++++--
 .../connman/connman_0.78.bbappend                  |    7 +-
 .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   18 +--
 .../dhcp/files/dhcrelay.service                    |   10 ++
 .../openssh/openssh_5.9p1.bbappend                 |   14 +--
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |    8 +-
 .../dropbear/dropbear_2011.54.bbappend             |   11 +--
 .../systemd/systemd-systemctl-native/systemctl     |   75 +++++----
 meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 +-
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |   12 +--
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |    7 +-
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   10 +-
 meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb       |   14 +--
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    7 +-
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |    9 +-
 16 files changed, 222 insertions(+), 166 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service

-- 
1.7.4.4



