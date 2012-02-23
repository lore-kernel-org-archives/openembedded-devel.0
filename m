Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xde-0004lJ-0P
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:10 +0100
Received: by eaal10 with SMTP id l10so506551eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:48 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.124.69 as permitted sender)
	client-ip=10.14.124.69; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.124.69 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.124.69])
	by 10.14.124.69 with SMTP id w45mr763781eeh.6.1329999048866 (num_hops =
	1); Thu, 23 Feb 2012 04:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=zHclZGC0NzTfs7o4hfad02XDaJ4RitnoKJdzMffiOuM=;
	b=HNNFgJLIa0ohJVuOCJjrGla0KaIBWD3nTgQeO3+xdre6aprSnxWQ+Vqzl2MRSAszab
	Y12pEK4Ag3x3hsEQhkvK+bQQ0rbbn67BrNU07EwGX70A3WRDcEEyPVr4AhJsnR7G1aMh
	xWgX66Vud296TSMOhVX23WkIvULjxbrJ6/Sdo=
Received: by 10.14.124.69 with SMTP id w45mr603818eeh.6.1329999048733;
	Thu, 23 Feb 2012 04:10:48 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:31 +0100
Message-Id: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [meta-oe V3 00/23] systemd rework
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:10 -0000
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


V2 -> V3:
(Hopefully) all suggestions and comments were incorporated  / rebased
[2]  new: introduce systemd_unitdir
[3]  was [2] commit message changed (removed V1-V2 hint)
[6]  was [5] incorporated ${systemd_unitdir}
[7]  new: run code in populate_packages_prepend only if ${D} exists
[8]  was [6] rework: for *.socket add corresponding *.service and *@.service
[9]  was [7] rework: if RDEPENDS_<base-package>-systemd is set only append systemd
[10] was [8] incorporated ${systemd_unitdir}
[11] was [9] incorporated ${systemd_unitdir}
[15] was [13] keep RDEPENDS_${PN}-systemd to override systemd.bbclass's suggestion
[17] was [15] rebased
[19] was [17] incorporated ${systemd_unitdir}
[22] was [20] incorporated ${systemd_unitdir}
old [22] was remove since it is now properly handled by systemd.bbclass

Tests performed:
- with INHERIT += 'rm_work'
     1. setup build system to unpatched state
     2. build image
     3. apply all patches of this series
     4. incremental build image
     5. check buildhistory diff
     6. (re)build all recipes affected
     7. check buildhistory results
     
- without INHERIT += 'rm_work'
     1. apply all patches of this series
     2. build image from scratch
     3. check buildhistory results for recipes touched series and build by image
     4. delete temp dir / retain sstate-cache
     5. build image
     6. check buildhistory diffs
    
This patch series can be pulled from:
git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.git branch systemd3

Andreas Müller (23):
  systemd-systemctl-native: add multiple services support
  systemd.bbclass: introduce systemd_unitdir
  systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and
    SYSTEMD_SERVICE
  systemd.bbclass: cosmetics
  systemd.bbclass: automatically create packages set in
    SYSTEMD_PACKAGES
  systemd.bbclass: automatically install all *.service and *.socket
    supplied in recipe's SRC_URI
  systemd.bbclass: run code in populate_packages_prepend only if ${D}
    exists
  systemd.bbclass: automatically extend FILES_* for systemd packages
  systemd.bbclass: automatically extend RDEPENDS for *-systemd packages
  connman: remove unneeded systemd code / use ${systemd_unitdir}
  dropbear: remove unneeded systemd code / use ${systemd_unitdir}
  openssh: remove unneeded systemd code
  elsa: remove unneeded systemd code
  cronie: remove unneeded systemd code
  xserver-nodm-init: remove unneeded systemd code
  atftp: remove unneeded systemd code
  udisks: remove unneeded systemd code
  rsyslog: remove unneeded systemd code
  syslog-ng: remove unneeded systemd code / use ${systemd_unitdir}
  dhcp: remove unneeded systemd code
  gpsd: remove unneeded systemd code
  busybox: remove unneeded systemd code / use ${systemd_unitdir}
  dhcp: add native systemd support for dhcp-relay

 meta-efl/recipes-efl/efl/elsa_svn.bb               |   11 +--
 meta-oe/classes/systemd.bbclass                    |  165 +++++++++++++++++---
 .../connman/connman_0.78.bbappend                  |    9 +-
 .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   18 +--
 .../dhcp/files/dhcrelay.service                    |   10 ++
 .../openssh/openssh_5.9p1.bbappend                 |   14 +--
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |   15 +--
 .../dropbear/dropbear_2011.54.bbappend             |   13 +--
 .../systemd/systemd-systemctl-native/systemctl     |   75 +++++----
 meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 +-
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |   12 +--
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |    7 +-
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    9 +-
 meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb       |   12 +--
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    9 +-
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |    9 +-
 16 files changed, 224 insertions(+), 174 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service

-- 
1.7.6.4



