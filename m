Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B0C166DF6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 08:11:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2013 00:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,831,1378882800"; d="scan'208";a="438947748"
Received: from jrissane-mobl.ger.corp.intel.com ([10.237.66.155])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2013 00:11:43 -0800
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Dec 2013 10:11:40 +0200
Message-Id: <1386231100-13446-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH] mosh: Perl module dependencies were missing
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
X-List-Received-Date: Thu, 05 Dec 2013 08:11:55 -0000

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
index c0d03c5..5a8e336 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
@@ -24,8 +24,15 @@ inherit autotools
 PACKAGE_BEFORE_PN += "${PN}-server"
 FILES_${PN}-server = "${bindir}/mosh-server"
 
+NEEDED_PERL_MODULES = "\
+	perl-module-socket \
+	perl-module-getopt-long \
+	perl-module-errno \
+	perl-module-io-socket-inet \
+	perl-module-posix \
+"
+
 # mosh uses SSH to authenticate and the client uses OpenSSH-specific features
-RDEPENDS_${PN} += "openssh-ssh"
+RDEPENDS_${PN} += "openssh-ssh ${NEEDED_PERL_MODULES}"
 # The server seemed not to work with dropbear either
-RDEPENDS_${PN}-server += "openssh-sshd"
-
+RDEPENDS_${PN}-server += "openssh-sshd ${NEEDED_PERL_MODULES}"
-- 
1.8.3.1


