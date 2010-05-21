Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OFTQT-0006CI-Az
	for Openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 16:42:15 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 1A0F9F7E15;
	Fri, 21 May 2010 10:37:29 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Fri, 21 May 2010 10:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=RNtdkUTphj6hJ9xIHxDFu3v0+3o=;
	b=TrK+COYlvvyG4YGdQHtgb0dTK9jiqo6hUNe5UvMORkWNIJUplCQBG5xXCOamuNHTBPP3MoJkGuVmfsEk83o/aLM+Xsd2+6kSBFp14wDBPEto6cexNmGbBkcxq53uQPD0i0ad0YV1gOEjwO1Zu32E20wYx9wxzBVb36YMBuzGQRY=
X-Sasl-enc: 9kJedD5i+qGyozxoHKNI330dtQ9whGpV+RBgse9YXgNZ 1274452645
Received: from localhost.localdomain (hnvr-4d078ae5.pool.mediaWays.net
	[77.7.138.229])
	by mail.messagingengine.com (Postfix) with ESMTPA id 53D1E58005;
	Fri, 21 May 2010 10:37:25 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Fri, 21 May 2010 16:38:05 +0200
Message-Id: <1274452686-17891-2-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <1274452686-17891-1-git-send-email-vjensen@gmx.de>
References: <alpine.LNX.2.00.1005162211110.21508@asterix.crazy-teaparty.dyndns.org>
	<1274452686-17891-1-git-send-email-vjensen@gmx.de>
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH v3 2/3] canutils: new recipes
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
X-List-Received-Date: Fri, 21 May 2010 14:42:16 -0000

Add canutils (PTX flavour) 4.0.4 and 4.0.5 as alternatives
to socketcan-utils-test.  Version 4.x requires libsocketcan
and supports kernel 2.6.30 and above.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/socketcan/canutils.inc      |   16 ++++++++++++++++
 recipes/socketcan/canutils_4.0.4.bb |    4 ++++
 recipes/socketcan/canutils_4.0.5.bb |    4 ++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/socketcan/canutils.inc
 create mode 100644 recipes/socketcan/canutils_4.0.4.bb
 create mode 100644 recipes/socketcan/canutils_4.0.5.bb

diff --git a/recipes/socketcan/canutils.inc b/recipes/socketcan/canutils.inc
new file mode 100644
index 0000000..596785f
--- /dev/null
+++ b/recipes/socketcan/canutils.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "canutils (PTX flavour)"
+AUTHOR = "Luotao Fu"
+HOMEPAGE = "http://www.pengutronix.de"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+DEPENDS = "libsocketcan"
+RCONFLICTS = "socketcan-utils-test"
+INC_PR = "r0"
+
+SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git;tag=${TAG} \
+        "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
diff --git a/recipes/socketcan/canutils_4.0.4.bb b/recipes/socketcan/canutils_4.0.4.bb
new file mode 100644
index 0000000..9ddb697
--- /dev/null
+++ b/recipes/socketcan/canutils_4.0.4.bb
@@ -0,0 +1,4 @@
+TAG = "canutils-${PV}"
+require canutils.inc
+
+PR = "${INC_PR}.0"
diff --git a/recipes/socketcan/canutils_4.0.5.bb b/recipes/socketcan/canutils_4.0.5.bb
new file mode 100644
index 0000000..c084bcd
--- /dev/null
+++ b/recipes/socketcan/canutils_4.0.5.bb
@@ -0,0 +1,4 @@
+TAG = "v${PV}"
+require canutils.inc
+
+PR = "${INC_PR}.0"
-- 
1.6.4.4



