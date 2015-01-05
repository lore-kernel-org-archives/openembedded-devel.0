Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E85DD65D27
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:51:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2015 02:51:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="664505007"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2015 02:51:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:51:25 +0000
Message-Id: <cover.1420454954.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-networking][PATCH 0/5] Networking fixes and upgrades
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 10:51:56 -0000

Fix a couple of issues in the ntp recipe reported by Philip Balister
(the file locations patch was previously posted separately; this
version is identical). Also upgrade a few recipes.


The following changes since commit 2ea3a19a478c526baa04d6b9a9e8c9f42aae9d34:

  ctapi-common: Add new recipe (2014-12-31 16:38:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/networking-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/networking-fixes

Paul Eggleton (5):
  ntp: fix file locations
  ntp: add explicit perl dependency to ntp-utils package
  mtr: update to 0.86
  traceroute: update to 2.0.21
  dnsmasq: update to 2.72

 .../recipes-support/dnsmasq/dnsmasq_2.71.bb        | 10 -------
 .../recipes-support/dnsmasq/dnsmasq_2.72.bb        | 10 +++++++
 .../recipes-support/mtr/files/configure.patch      | 12 ---------
 .../recipes-support/mtr/files/no-gtk.patch         | 31 ----------------------
 .../mtr/{mtr_0.82.bb => mtr_0.86.bb}               | 10 +++----
 meta-networking/recipes-support/ntp/ntp_4.2.8.bb   | 22 +++++++--------
 .../{traceroute_2.0.20.bb => traceroute_2.0.21.bb} |  6 ++---
 7 files changed, 28 insertions(+), 73 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
 delete mode 100644 meta-networking/recipes-support/mtr/files/configure.patch
 delete mode 100644 meta-networking/recipes-support/mtr/files/no-gtk.patch
 rename meta-networking/recipes-support/mtr/{mtr_0.82.bb => mtr_0.86.bb} (51%)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.0.20.bb => traceroute_2.0.21.bb} (89%)

-- 
1.9.3


