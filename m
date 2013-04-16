Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US3nV-0006d2-0n
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:11:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2013 03:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319811873"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2013 03:54:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:53:54 +0100
Message-Id: <cover.1366109533.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to meta-networking
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
X-List-Received-Date: Tue, 16 Apr 2013 11:12:40 -0000

This moves most of the remaining networking recipes in meta-oe to
meta-networking, with some additional tidying up.


The following changes since commit a45830a39bb47a9eab27980d52966226c9504ea4:

  recipes: Unify indentation (2013-04-15 16:23:17 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/meta-networking-moves2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/meta-networking-moves2

Paul Eggleton (9):
  vsftpd: move from meta-oe to meta-networking and tweak
  iw: move to meta-networking and update
  openvpn: move to meta-networking and tweak
  bridge-utils: move to meta-networking and tweak
  rp-pppoe: move from meta-oe to meta-networking and tweak
  dnsmasq: move to meta-networking and tweak
  ipsec-tools: move to meta-networking and tweak
  strongswan: move to meta-networking
  atftp: move to meta-networking and tweak

 .../recipes-daemons}/atftp/atftp/atftpd.service    |    0
 .../recipes-daemons}/atftp/atftp_git.bb            |    4 ++--
 ...tpd-0.7_circumvent_tftp_size_restrictions.patch |    5 ++++
 .../atftpd-0.7_unprotected_assignments_crash.patch |    7 ++++++
 .../recipes-daemons}/atftp/files/atftpd.init       |    0
 .../recipes-daemons}/vsftpd/files/init             |    0
 .../recipes-daemons}/vsftpd/files/vsftpd.conf      |    0
 .../vsftpd/vsftpd-2.3.5/makefile-destdir.patch     |   25 +++++++++-----------
 .../vsftpd/vsftpd-2.3.5/makefile-libs.patch        |   21 ++++++++++++++++
 .../vsftpd/vsftpd-2.3.5/makefile-strip.patch       |   17 +++++++++++++
 .../vsftpd/vsftpd-2.3.5/nopam.patch                |    4 ++++
 .../recipes-daemons}/vsftpd/vsftpd_2.3.5.bb        |   17 +++++++------
 .../rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch |    0
 .../discard-use-of-dnl-in-Makefile.am.patch        |    0
 .../rp-pppoe-3.8/dont-swallow-errors.patch         |    0
 .../rp-pppoe/rp-pppoe-3.8/pppoe-server.default     |    0
 .../rp-pppoe/rp-pppoe-3.8/pppoe-server.init        |    0
 .../rp-pppoe-3.8/pppoe-src-restrictions.patch      |    0
 .../rp-pppoe/rp-pppoe-3.8/top-autoconf.patch       |    0
 .../rp-pppoe/rp-pppoe-3.8/update-config.patch      |    0
 .../rp-pppoe/rp-pppoe-3.8/use-ldflags.patch        |    0
 .../recipes-protocols}/rp-pppoe/rp-pppoe_3.8.bb    |   14 ++++++-----
 .../recipes-support}/bridge-utils/bridge-utils.inc |    7 +++---
 .../bridge-utils/bridge-utils/kernel-headers.patch |    0
 .../bridge-utils/bridge-utils_1.5.bb               |    0
 .../recipes-support}/dnsmasq/dnsmasq.inc           |   13 ++++++++--
 .../recipes-support}/dnsmasq/dnsmasq_2.55.bb       |    0
 .../recipes-support}/dnsmasq/files/dnsmasq.conf    |    0
 .../recipes-support}/dnsmasq/files/dnsmasq.service |    0
 .../recipes-support}/dnsmasq/files/init            |    0
 .../ipsec-tools/files/ipsec-tools-install.patch    |    4 ++++
 .../recipes-support/ipsec-tools/ipsec-tools.inc    |    0
 .../ipsec-tools/ipsec-tools_0.7.2.bb               |    0
 ....sh-don-t-use-git-describe-for-versioning.patch |    0
 .../recipes-support/iw/iw_3.8.bb                   |    6 ++---
 .../recipes-support}/openvpn/openvpn/openvpn       |    0
 .../recipes-support}/openvpn/openvpn_2.1.3.bb      |    9 +++----
 .../recipes-support/strongswan/strongswan_5.0.0.bb |    0
 .../dnsmasq/dnsmasq-dbus_2.55.bb                   |   13 ----------
 meta-oe/recipes-connectivity/openvpn/openvpn.inc   |   22 -----------------
 40 files changed, 112 insertions(+), 76 deletions(-)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/atftp/atftpd.service (100%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/atftp_git.bb (95%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch (98%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch (95%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/files/atftpd.init (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/vsftpd/files/init (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/vsftpd/files/vsftpd.conf (100%)
 rename meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/makefile.patch => meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patch (75%)
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/vsftpd/vsftpd-2.3.5/nopam.patch (87%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/vsftpd/vsftpd_2.3.5.bb (83%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/pppoe-server.default (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/pppoe-server.init (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/update-config.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe_3.8.bb (97%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/bridge-utils/bridge-utils.inc (84%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/bridge-utils/bridge-utils/kernel-headers.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/bridge-utils/bridge-utils_1.5.bb (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/dnsmasq.inc (76%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/dnsmasq_2.55.bb (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/files/dnsmasq.conf (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/files/dnsmasq.service (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/files/init (100%)
 rename {meta-oe => meta-networking}/recipes-support/ipsec-tools/files/ipsec-tools-install.patch (90%)
 rename {meta-oe => meta-networking}/recipes-support/ipsec-tools/ipsec-tools.inc (100%)
 rename {meta-oe => meta-networking}/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch (100%)
 rename meta-oe/recipes-connectivity/iw/iw_3.6.bb => meta-networking/recipes-support/iw/iw_3.8.bb (74%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/openvpn/openvpn/openvpn (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/openvpn/openvpn_2.1.3.bb (92%)
 rename {meta-oe => meta-networking}/recipes-support/strongswan/strongswan_5.0.0.bb (100%)
 delete mode 100644 meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb
 delete mode 100644 meta-oe/recipes-connectivity/openvpn/openvpn.inc

-- 
1.7.10.4



