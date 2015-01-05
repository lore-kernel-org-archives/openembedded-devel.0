Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA394723D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:51:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2015 02:51:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="664505012"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2015 02:51:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:51:27 +0000
Message-Id: <f13e6148e428dafe743e53ec8cb8da2678518def.1420454954.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 2/5] ntp: add explicit perl dependency to ntp-utils package
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
X-List-Received-Date: Mon, 05 Jan 2015 10:51:57 -0000

The ntp-utils package contains at least one perl-using script as well as
a supporting perl module, therefore we need a dependency on perl.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
index e14921a..9f74f6b 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
@@ -125,6 +125,7 @@ FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd
 "
 FILES_${PN}-tickadj = "${sbindir}/tickadj"
 FILES_${PN}-utils = "${sbindir} ${datadir}/ntp/lib"
+RDEPENDS_${PN}-utils += "perl"
 FILES_ntpdate = "${sbindir}/ntpdate \
     ${sysconfdir}/network/if-up.d/ntpdate-sync \
     ${bindir}/ntpdate-sync \
-- 
1.9.3


