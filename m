Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O7ULB-0000wR-6X
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 16:03:48 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 95A6B4B0034;
	Thu, 29 Apr 2010 16:00:02 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 96B1D4B0088;
	Thu, 29 Apr 2010 15:59:59 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Apr 2010 16:01:34 +0200
Message-Id: <1272549694-23764-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] nano: Add version 2.2.4.
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
X-List-Received-Date: Thu, 29 Apr 2010 14:03:48 -0000

* give access to the latest stable release available
* Tested on x86

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/nano/nano_2.2.4.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 recipes/nano/nano_2.2.4.bb

diff --git a/recipes/nano/nano_2.2.4.bb b/recipes/nano/nano_2.2.4.bb
new file mode 100644
index 0000000..561b64e
--- /dev/null
+++ b/recipes/nano/nano_2.2.4.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "GNU nano (Nano's ANOther editor, or \
+Not ANOther editor) is an enhanced clone of the \
+Pico text editor."
+HOMEPAGE = "http://www.nano-editor.org/"
+LICENSE = "GPLv2"
+SECTION = "console/utils"
+DEPENDS = "ncurses"
+
+SRC_URI = "http://www.nano-editor.org/dist/v2.2/nano-${PV}.tar.gz \
+           file://glib.m4"
+
+inherit autotools
+
+# only 16K more to get everything but the kitchen sink
+EXTRA_OECONF = "--enable-all"
+
+do_configure_prepend () {
+	install -m 0644 ${WORKDIR}/glib.m4 m4/
+}
+
+SRC_URI[md5sum] = "6304308afb1f7ef4a5e93eb99206632a"
+SRC_URI[sha256sum] = "971b8547be157de5a814cb26c804dc2515b686d7188f4dc016269312965d4da5"
-- 
1.6.3.3



