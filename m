Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4A88D761DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 05:37:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99108470"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 13:41:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V5ZgSh023456
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 13:35:42 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 13:37:33 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 09:37:22 -0400
Message-ID: <1438349842-11951-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [meta-oe][PATCH] mailcap: upgrade 2.1.43 -> 2.1.44
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
X-List-Received-Date: Fri, 31 Jul 2015 05:37:38 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../mailcap/{mailcap_2.1.43.bb => mailcap_2.1.44.bb}              | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.43.bb => mailcap_2.1.44.bb} (83%)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.44.bb
similarity index 83%
rename from meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb
rename to meta-oe/recipes-support/mailcap/mailcap_2.1.44.bb
index 95d7d11..d9f5e10 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.44.bb
@@ -12,12 +12,12 @@ by several applications e.g. to determine MIME types for filenames."
 
 SECTION = "System Environment/Base"
 
-SRC_URI = "https://git.fedorahosted.org/cgit/${PN}.git/snapshot/r2-1-43.tar.gz"
-SRC_URI[md5sum] = "8fd185ffae710301de3bc297877a404b"
-SRC_URI[sha256sum] = "a630892b5fe59eb9e3bef30c597de1c2b7f35243dea4b0c995fd482aa20c2d6b"
+SRC_URI = "https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${PN}-r2-1-44.tar.gz"
+SRC_URI[md5sum] = "e7de2a5dfaa126d5e0a081af7d908906"
+SRC_URI[sha256sum] = "644da071f918a33e11d1f8db8334010dd325108209d302f800816f4a177ee2e6"
 LICENSE = "PD & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
-S = "${WORKDIR}/r2-1-43"
+S = "${WORKDIR}/${PN}-r2-1-44"
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
 }
-- 
1.8.4.2


