Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0sHr-0006oz-3Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 11:22:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2012 02:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="114422017"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.5])
	by orsmga002.jf.intel.com with ESMTP; 24 Feb 2012 02:12:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 10:12:34 +0000
Message-Id: <cover.1330078260.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH 0/2] Tidy up some files
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
X-List-Received-Date: Fri, 24 Feb 2012 10:22:03 -0000

Pick off some low-hanging fruit.

The following changes since commit 9cca08ee27f166395e500718bf184fa86112c224:

  systemd: split out libraries from ${PN} (2012-02-24 10:55:49 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib paule/tidy
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/tidy

Paul Eggleton (2):
  python-setuptools: remove
  Tidy up unused files

 .../eglibc/ldconfig-native-2.12.1/32and64bit.patch |  331 --------------
 .../eglibc/ldconfig-native-2.12.1/README           |    8 -
 .../endian-ness_handling.patch                     |  454 -------------------
 .../ldconfig-native-2.12.1/endianess-header.patch  |  113 -----
 .../eglibc/ldconfig-native-2.12.1/flag_fix.patch   |   24 -
 .../ldconfig-native-2.12.1.tar.bz2                 |  Bin 21491 -> 0 bytes
 .../eglibc/ldconfig-native-2.12.1/ldconfig.patch   |  471 --------------------
 .../ldconfig_aux-cache_path_fix.patch              |   36 --
 .../python/python-setuptools_0.6c11.bb             |   33 --
 .../0001-don-t-try-to-run-generated-binaries.patch |   68 ---
 .../cups/cups-1.4.6/use_echo_only_in_init.patch    |   11 -
 meta-oe/recipes-support/cups/cups14.inc            |   84 ----
 12 files changed, 0 insertions(+), 1633 deletions(-)
 delete mode 100644 meta-oe/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
 delete mode 100644 meta-oe/recipes-core/eglibc/ldconfig-native-2.12.1/README
 delete mode 100644 meta-oe/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
 delete mode 100644 meta-oe/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch
 delete mode 100644 meta-oe/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
 delete mode 100644 meta-oe/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-native-2.12.1.tar.bz2
 delete mode 100644 meta-oe/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
 delete mode 100644 meta-oe/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
 delete mode 100644 meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb
 delete mode 100644 meta-oe/recipes-support/cups/cups-1.4.6/0001-don-t-try-to-run-generated-binaries.patch
 delete mode 100644 meta-oe/recipes-support/cups/cups-1.4.6/use_echo_only_in_init.patch
 delete mode 100644 meta-oe/recipes-support/cups/cups14.inc

-- 
1.7.5.4



