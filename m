Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIH7N-0006aa-KC
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 11:46:53 +0200
Received: by mail-wy0-f175.google.com with SMTP id 19so6135383wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 02:40:59 -0700 (PDT)
Received: by 10.216.90.129 with SMTP id e1mr2801660wef.114.1319449259134;
	Mon, 24 Oct 2011 02:40:59 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff6sm7321111wbb.10.2011.10.24.02.40.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 02:40:58 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 11:40:34 +0200
Message-Id: <1319449234-12080-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1319449234-12080-7-git-send-email-koen@dominion.thruhere.net>
References: <1319449234-12080-1-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-2-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-3-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-4-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-5-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-6-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-7-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 8/8] soft66 git: import from OE classic
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
X-List-Received-Date: Mon, 24 Oct 2011 09:46:53 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-connectivity/soft66/soft66_git.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/soft66/soft66_git.bb

diff --git a/meta-oe/recipes-connectivity/soft66/soft66_git.bb b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
new file mode 100644
index 0000000..c38ac15
--- /dev/null
+++ b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Library and tools for Soft66ADD and related SDR radio receivers"
+LICENSE = "GPLv3 LGPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
+                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 "
+
+DEPENDS = "libftdi"
+
+PV = "0.1.3+gitr${SRCPV}"
+
+SRCREV = "a1dab25e73896c90c98227ac8055f227b830d512"
+SRC_URI = "git://home.horsten.com/soft66;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
-- 
1.6.6.1



