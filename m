Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PGKMa-0000FR-F9
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 00:46:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 1476B8EFC36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 15:06:36 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22916-01 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 10 Nov 2010 15:06:36 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id DEB238EFB84; Wed, 10 Nov 2010 15:06:35 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 375B96B9030
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 15:06:33 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 1FC4314119D9; Wed, 10 Nov 2010 15:06:33 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Nov 2010 15:06:31 -0500
Message-Id: <1289419592-23604-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] xf86-input-mutouch: add latest git release
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
X-List-Received-Date: Wed, 10 Nov 2010 23:46:01 -0000

Fixes build with XINPUT ABI 7.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/xorg-driver/xf86-input-mutouch_git.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xorg-driver/xf86-input-mutouch_git.bb

diff --git a/recipes/xorg-driver/xf86-input-mutouch_git.bb b/recipes/xorg-driver/xf86-input-mutouch_git.bb
new file mode 100644
index 0000000..f72b03c
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-mutouch_git.bb
@@ -0,0 +1,10 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- muTouch input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+SRCREV = "db04a5333b545a0442b995bae47d2c5527a7459e"
+PV = "1.2.1+gitr${SRCREV}"
+
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-input-mutouch;protocol=git"
+
+S = "${WORKDIR}/git"
-- 
1.7.0.4



