Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFAC6C765
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2014 12:26:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jan 2014 04:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,728,1384329600"; d="scan'208";a="473055627"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2014 04:26:51 -0800
Received: from irsswdev001.ir.intel.com (irsswdev001.ir.intel.com
	[163.33.195.157])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	s0RCQoOH006814; Mon, 27 Jan 2014 12:26:50 GMT
Received: from irsswdev001.ir.intel.com (localhost [127.0.0.1])
	by irsswdev001.ir.intel.com with ESMTP id s0RCQoKW026537;
	Mon, 27 Jan 2014 12:26:50 GMT
Received: (from kmsywula@localhost)
	by irsswdev001.ir.intel.com with œ id s0RCQn75026531;
	Mon, 27 Jan 2014 12:26:49 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2014 12:26:13 +0000
Message-Id: <1390825573-26419-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.12.2
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [dylan][PATCH] irssi: add 0.8.16-rc1
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
X-List-Received-Date: Mon, 27 Jan 2014 12:26:52 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

irssi is a text mode IRC client.

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/irssi/irssi_0.8.16-rc1.bb  | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
new file mode 100644
index 0000000..7880a06
--- /dev/null
+++ b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "ncurses IRC client"
+DESCRIPTION = "Irssi is an ncurses IRC client"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
+
+DEPENDS = "glib-2.0 ncurses openssl"
+
+REALPV = "0.8.16-rc1"
+PV = "0.8.15+${REALPV}"
+
+SRC_URI = "http://irssi.org/files/irssi-${REALPV}.tar.gz"
+
+SRC_URI[md5sum] = "769fec4df8e633c583c411ccd2cd563a"
+SRC_URI[sha256sum] = "bb6c0125db30b697f80837941c17372b7484c64d57a6920b8bfa7ee3def92de3"
+
+S = "${WORKDIR}/irssi-${REALPV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-ssl"
+
-- 
1.7.12.2


