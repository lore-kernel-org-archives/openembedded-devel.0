Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1Rs1be-0004Xs-OG
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 01:29:54 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id C0395EB63F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 01:22:01 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArpMAIgzJ09T4znVPGdsb2JhbABEiVKlBBkBAQEBNzKBcgFRAQojGBhqCi2Hf6tDAY00iyoGAQMKIQQPBoMnB4E0gxwElRqSUg
X-IronPort-AV: E=Sophos;i="4.71,592,1320620400"; d="scan'208";a="40837286"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.213])
	by ipb3.telenor.se with ESMTP; 31 Jan 2012 01:22:01 +0100
From: ulf@emagii.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 01:21:58 +0100
Message-Id: <1327969319-19246-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH 1/2] schroedinger: Bump version to 1.0.11
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
X-List-Received-Date: Tue, 31 Jan 2012 00:29:54 -0000

From: Ulf Samuelsson <ulf@emagii.com>

schroedinger depends on orc (Oil Runtime Compiler)
With the current version of schroedinger (1.0.9)
orc must have revision 0.4.11 or earlier.
As of 0.4.12, a stdint.h header is removed, breaking
the schroedinger build, and thus oe-classic which is now
using orc-0.4.16 as default.

Bumping the version will resync schroedinger with orc

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 recipes/schroedinger/schroedinger_1.0.11.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/schroedinger/schroedinger_1.0.11.bb

diff --git a/recipes/schroedinger/schroedinger_1.0.11.bb b/recipes/schroedinger/schroedinger_1.0.11.bb
new file mode 100644
index 0000000..ad09dd6
--- /dev/null
+++ b/recipes/schroedinger/schroedinger_1.0.11.bb
@@ -0,0 +1,13 @@
+require schroedinger.inc
+
+PR = "${INC_PR}.0"
+
+inherit autotools
+
+SRC_URI[schroedingertargz.md5sum] = "da6af08e564ca1157348fb8d92efc891"
+SRC_URI[schroedingertargz.sha256sum] = "1e572a0735b92aca5746c4528f9bebd35aa0ccf8619b22fa2756137a8cc9f912"
+
+PACKAGES =+ "gst-plugin-schroedinger-dbg gst-plugin-schroedinger-dev gst-plugin-schroedinger"
+FILES_gst-plugin-schroedinger = "${libdir}/gstreamer-0.10/*.so"
+FILES_gst-plugin-schroedinger-dbg = "${libdir}/gstreamer-0.10/.debug"
+FILES_gst-plugin-schroedinger-dev = "${libdir}/gstreamer-0.10/*.*a"
-- 
1.7.5.4



