Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 036BD71D79
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jan 2018 14:32:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jan 2018 06:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,318,1511856000"; 
   d="scan'208";a="7506463"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga007.fm.intel.com with ESMTP; 05 Jan 2018 06:32:06 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 34DF858030D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jan 2018 06:32:06 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jan 2018 16:33:09 +0200
Message-Id: <1515162789-35322-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] ell: Upgrade SRCREV
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
X-List-Received-Date: Fri, 05 Jan 2018 14:32:06 -0000

Upgrade to:
8192131 : dbus: Fix setup in l_dbus_proxy_method_call

This is a requirement for BTP client tool support in Bluez5.
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=f68235b2c03235695837abfb6d7ceebacbf14dd9

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta-oe/recipes-core/ell/ell_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/ell/ell_git.bb b/meta-oe/recipes-core/ell/ell_git.bb
index 10df6e1..4354974 100644
--- a/meta-oe/recipes-core/ell/ell_git.bb
+++ b/meta-oe/recipes-core/ell/ell_git.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "7b7c15c2e5caff88fc45e7a8b874a47196a0eddd"
+SRCREV = "8192131685be0f27d6f51b14b78ef93fa7f3c692"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
 
 do_configure_prepend () {
-- 
2.4.0


