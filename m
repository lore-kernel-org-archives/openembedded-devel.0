Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaI5-00028f-Bi
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:49 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528032"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:06 +0000
Message-Id: <cover.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH 00/11] More networking recipes
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:49 -0000

These are updated, rebased and extended versions of patches originally
submitted by Vladimir Redzhepoff and Yauhen Kharuzhy, now applied to
meta-networking after discussion with them. This series also moves
libnfnetlink to meta-networking and adds some additional netfilter
library recipes needed for current versions of the netfilter suite.

Note that the original patch for pure-ftpd said that it was an updated
version of a recipe from OE-Classic; there was no such recipe in
OE-Classic however so I have commented it as a new recipe.
The libnetfilter-queue recipe was written from scratch as I did not
notice it was in OE-Classic; neither version has anything particularly
interesting in it and this version is more up-to-date.


The following changes since commit 85ab35f4edac91ecc180161e97c6698f1c10928b:

  netperf: Correct license flags (2012-11-30 11:49:56 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/networking2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/networking2

Paul Eggleton (11):
  netcat: add from OE-Classic
  libnfnetlink: move to meta-networking and update to 1.0.1
  libmnl: add new recipe for version 1.0.3
  libnetfilter-conntrack: add from OE-Classic and update
  libnetfilter-cttimeout: add new recipe for version 1.0.0
  libnetfilter-cthelper: add new recipe for version 1.0.0
  libnetfilter-queue: add new recipe for version 1.0.2
  conntrack-tools: add from OE-Classic, update and tidy up
  ebtables: add from OE-Classic, update and tidy up
  pure-ftpd: add new recipe for 1.0.36
  pptp-linux: add from OE-Classic, update and tidy up

 ...coded-usr-local-includes-from-configure.a.patch |   38 ++++
 .../pure-ftpd/pure-ftpd/nostrip.patch              |   30 ++++
 .../recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb  |   19 ++
 .../conntrack-tools/conntrack-tools_1.4.0.bb       |   33 ++++
 .../conntrack-tools/files/conntrack-failover       |   77 ++++++++
 .../recipes-filter/conntrack-tools/files/init      |   87 +++++++++
 .../ebtables-2.0.10-4/01debian_defaultconfig.patch |   50 ++++++
 .../ebtables/ebtables-2.0.10-4/ebtables.init       |  186 ++++++++++++++++++++
 .../ebtables-2.0.10-4/installnonroot.patch         |   43 +++++
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |   52 ++++++
 .../recipes-filter/libmnl/libmnl_1.0.3.bb          |   12 ++
 .../libnetfilter/libnetfilter-conntrack_1.0.2.bb   |   14 ++
 .../libnetfilter/libnetfilter-cthelper_1.0.0.bb    |   14 ++
 .../libnetfilter/libnetfilter-cttimeout_1.0.0.bb   |   13 ++
 .../libnetfilter/libnetfilter-queue_1.0.2.bb       |   14 ++
 .../libnfnetlink/libnfnetlink_1.0.1.bb             |   11 +-
 .../pptp-linux/pptp-linux-1.7.2/options.pptp       |   30 ++++
 .../pptp-linux/pptp-linux_1.7.2.bb                 |   29 +++
 .../recipes-support/netcat/netcat_0.7.1.bb         |   21 +++
 19 files changed, 768 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
 create mode 100644 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
 create mode 100644 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
 create mode 100644 meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
 create mode 100644 meta-networking/recipes-filter/conntrack-tools/files/conntrack-failover
 create mode 100644 meta-networking/recipes-filter/conntrack-tools/files/init
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/01debian_defaultconfig.patch
 create mode 100755 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.init
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/installnonroot.patch
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
 create mode 100644 meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
 rename meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb => meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb (60%)
 create mode 100644 meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/options.pptp
 create mode 100644 meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
 create mode 100644 meta-networking/recipes-support/netcat/netcat_0.7.1.bb

-- 
1.7.10.4



