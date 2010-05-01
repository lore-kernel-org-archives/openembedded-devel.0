Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O8DeU-0005as-Fx
	for Openembedded-devel@lists.openembedded.org;
	Sat, 01 May 2010 16:26:54 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 92244F1F13;
	Sat,  1 May 2010 10:22:54 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sat, 01 May 2010 10:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=V6KJ3ADlLFGUBufqkSloncCi0PQ=;
	b=Nc9yqIhsYYsQIBaFPvBO8Sc2M9JWiZcGgAQEAnKk2SeG7Ehv6p1zUxt6hfc5ZlezuMLVpTZ6TUJH58vUzfgyNYidV++Tz3Ituxn0pJa1IWTMHhSPmhNfUmFjFNhclYw9pElhMZtBsFK2PyeZ99XAHjKeLcey+5cS8OmJ76GriB0=
X-Sasl-enc: b6R07hGgT+EzKe06oPdOLd4sTyn3rvPLI1y+1oT56BOg 1272723774
Received: from localhost.localdomain (p5B0FD323.dip.t-dialin.net
	[91.15.211.35])
	by mail.messagingengine.com (Postfix) with ESMTPA id C519419961;
	Sat,  1 May 2010 10:22:53 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Sat,  1 May 2010 16:22:47 +0200
Message-Id: <1272723767-16871-2-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1272723767-16871-1-git-send-email-vjensen@gmx.de>
References: <alpine.DEB.1.10.1005011614380.15503@vitus.devnet.local>
	<1272723767-16871-1-git-send-email-vjensen@gmx.de>
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH v2] canutils: new recipe
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
X-List-Received-Date: Sat, 01 May 2010 14:26:54 -0000

Adds canutils (PTX flavour) 4.0.4 as alternative to socketcan-utils-test.
canutils RCONFLICTS with socketcan-utils-test because of identical
file names.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/socketcan/canutils_4.0.4.bb           |   19 +++++++++++++++++++
 recipes/socketcan/socketcan-utils-test_svn.bb |    1 +
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 recipes/socketcan/canutils_4.0.4.bb

diff --git a/recipes/socketcan/canutils_4.0.4.bb b/recipes/socketcan/canutils_4.0.4.bb
new file mode 100644
index 0000000..e769c46
--- /dev/null
+++ b/recipes/socketcan/canutils_4.0.4.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "canutils (PTX flavour)"
+AUTHOR = "Luotao Fu"
+HOMEPAGE = "http://www.pengutronix.de"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+DEPENDS = "libsocketcan"
+RDEPENDS = "libsocketcan"
+RCONFLICTS = "socketcan-utils-test"
+
+TAG = "canutils-${PV}"
+PR = "r0"
+
+SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git;tag=${TAG} \
+        "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
diff --git a/recipes/socketcan/socketcan-utils-test_svn.bb b/recipes/socketcan/socketcan-utils-test_svn.bb
index ca4c23a..20bd5ac 100644
--- a/recipes/socketcan/socketcan-utils-test_svn.bb
+++ b/recipes/socketcan/socketcan-utils-test_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Socketcan user space utilities and test apps"
 HOMEPAGE = "http://developer.berlios.de/projects/socketcan/"
 SECTION = "console/utils"
 LICENSE = "GPL"
+RCONFLICTS = "canutils"
 
 SRCREV = "917"
 PV = "0.0+svnr${SRCPV}"
-- 
1.5.6.5



