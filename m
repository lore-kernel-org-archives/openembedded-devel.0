Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B2C1560167
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381085"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:44 +0000
Message-Id: <cover.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 00/10] Recipe upgrades
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
X-List-Received-Date: Mon, 05 Jan 2015 11:01:05 -0000

A bunch of unrelated upgrades for recipes in meta-oe.


The following changes since commit 2ea3a19a478c526baa04d6b9a9e8c9f42aae9d34:

  ctapi-common: Add new recipe (2014-12-31 16:38:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/upgrades
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/upgrades

Paul Eggleton (10):
  iotop: update to 0.6
  lzip: update to 1.16
  ddrescue: update to 1.19
  lcdproc: update to 0.5.6
  libmodplug: update to 0.8.8.5
  protobuf: update to 2.5.0
  mariadb: update to 5.5.41
  rfkill: update to 0.5
  picocom: update to 1.7
  libssh: update to just after 0.6.4

 .../rfkill/{rfkill_0.4.bb => rfkill_0.5.bb}        |  8 ++--
 .../{protobuf_2.4.1.bb => protobuf_2.5.0.bb}       |  4 +-
 .../{ddrescue_1.16.bb => ddrescue_1.19.bb}         | 15 ++++---
 .../iotop/{iotop_0.4.4.bb => iotop_0.6.bb}         |  7 ++--
 .../lcdproc/lcdproc/automake-111-fix.patch         | 21 ----------
 .../lcdproc/{lcdproc_0.5.5.bb => lcdproc_0.5.6.bb} |  6 +--
 .../{libmodplug_0.8.7.bb => libmodplug_0.8.8.5.bb} |  4 +-
 .../libssh/{libssh_0.6.3.bb => libssh_git.bb}      |  4 +-
 .../lzip/{lzip_1.15.bb => lzip_1.16.bb}            | 14 +++----
 ...b-native_5.5.40.bb => mariadb-native_5.5.41.bb} |  0
 meta-oe/recipes-support/mysql/mariadb.inc          |  5 +--
 .../mysql/mariadb/revert-fix-for-MDEV-5120.patch   | 46 ----------------------
 .../mysql/{mariadb_5.5.40.bb => mariadb_5.5.41.bb} |  0
 .../picocom/{picocom_1.6.bb => picocom_1.7.bb}     |  7 ++--
 14 files changed, 37 insertions(+), 104 deletions(-)
 rename meta-oe/recipes-connectivity/rfkill/{rfkill_0.4.bb => rfkill_0.5.bb} (76%)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_2.4.1.bb => protobuf_2.5.0.bb} (81%)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.16.bb => ddrescue_1.19.bb} (54%)
 rename meta-oe/recipes-extended/iotop/{iotop_0.4.4.bb => iotop_0.6.bb} (81%)
 delete mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc/automake-111-fix.patch
 rename meta-oe/recipes-extended/lcdproc/{lcdproc_0.5.5.bb => lcdproc_0.5.6.bb} (75%)
 rename meta-oe/recipes-multimedia/libmodplug/{libmodplug_0.8.7.bb => libmodplug_0.8.8.5.bb} (80%)
 rename meta-oe/recipes-support/libssh/{libssh_0.6.3.bb => libssh_git.bb} (90%)
 rename meta-oe/recipes-support/lzip/{lzip_1.15.bb => lzip_1.16.bb} (64%)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.40.bb => mariadb-native_5.5.41.bb} (100%)
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.40.bb => mariadb_5.5.41.bb} (100%)
 rename meta-oe/recipes-support/picocom/{picocom_1.6.bb => picocom_1.7.bb} (67%)

-- 
1.9.3


