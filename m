Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 20B986079F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 23:26:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 16:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="1172470263"
Received: from wrath.jf.intel.com ([10.54.70.7])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2017 16:26:02 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 May 2017 16:25:51 -0700
Message-Id: <20170521232555.30221-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [meta-java][master][pyro][PATCH 0/4] xml-commons: unblacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 May 2017 23:26:08 -0000

In preparation for maven, we need xml-commons in better shape. The
following patches correct the behavior that led to blacklisting, update
versions --where possible-- and fix Recipe Specific Sysroots (RSS)
regressions.

If you have issues with "javac" core-dumping, it appears to be
due to a bug in sstate which I have yet to track down. When you
-c devshell, the symptom is that .../usr/share/java/ecj-bootstrap.jar
symlink and the real file are not present. The workaround is to wipe
tmp and sstate-cache and rebuild :(

I am also seeing some odd behavior while fetching source jars,
occasionally throwing an error that "unzip" does not exist,
even though bitbake/lib/bb/fetch2 properly associates a .jar
extension with "unzip". I have yet to see a strong enough pattern
to figure out why this is happening. I am fighting the temptation
to add unzip to HOSTTOOLS, as unzip-native should be working.

The remaining blacklisted recipes are proving harder to fix than
I would hope. Much of this infrastructure is aging badly upstream.

Tim Orling (4):
  xom: unblacklist and update to v1.2.10
  jaxen: unblacklist and update to v1.1.6
  dom4j: unblacklist and fix build
  jdom: unblacklist and update to v1.1.3

 recipes-core/xml-commons/dom4j_1.6.1.bb            | 29 ++++++------
 recipes-core/xml-commons/jaxen_1.1.1.bb            | 35 --------------
 recipes-core/xml-commons/jaxen_1.1.6.bb            | 40 ++++++++++++++++
 recipes-core/xml-commons/jdom_1.1.3.bb             | 25 ++++++++++
 recipes-core/xml-commons/jdom_1.1.bb               | 28 -----------
 .../04_remove_sun_import.patch                     |  0
 recipes-core/xml-commons/xom_1.1.bb                | 54 ----------------------
 recipes-core/xml-commons/xom_1.2.10.bb             | 50 ++++++++++++++++++++
 8 files changed, 129 insertions(+), 132 deletions(-)
 delete mode 100644 recipes-core/xml-commons/jaxen_1.1.1.bb
 create mode 100644 recipes-core/xml-commons/jaxen_1.1.6.bb
 create mode 100644 recipes-core/xml-commons/jdom_1.1.3.bb
 delete mode 100644 recipes-core/xml-commons/jdom_1.1.bb
 rename recipes-core/xml-commons/{xom-1.1 => xom-1.2.10}/04_remove_sun_import.patch (100%)
 delete mode 100644 recipes-core/xml-commons/xom_1.1.bb
 create mode 100644 recipes-core/xml-commons/xom_1.2.10.bb

-- 
2.9.4


