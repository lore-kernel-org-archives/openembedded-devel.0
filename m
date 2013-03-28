Received: from 19.mo1.mail-out.ovh.net ([178.32.97.206]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1ULCNp-0003OY-Aq
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 13:56:46 +0100
Received: from mail630.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 6879BFF99E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 12:40:08 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Mar 2013 13:22:42 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (mail@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 28 Mar 2013 13:22:41 +0200
Received: from b5-vm-mint0.betafive.co.uk (unknown [192.168.0.229])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id 3B5C81607DE;
	Thu, 28 Mar 2013 11:22:34 +0000 (GMT)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Thu, 28 Mar 2013 11:22:22 +0000
Message-Id: <1364469742-37652-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
X-Ovh-Tracer-Id: 2882585238162344265
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrjeeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrjeeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-oe][PATCH] live555: Update to latest version
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
X-List-Received-Date: Thu, 28 Mar 2013 12:56:57 -0000

The upstream source for live555 does not keep tarballs of old releases so the
live555 recipe in meta-oe no longer builds. The version number has been updated
to 20130323 which is currently available.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-multimedia/live555/live555_20110314.bb |   10 ----------
 meta-oe/recipes-multimedia/live555/live555_20130323.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/live555/live555_20110314.bb
 create mode 100644 meta-oe/recipes-multimedia/live555/live555_20130323.bb

diff --git a/meta-oe/recipes-multimedia/live555/live555_20110314.bb b/meta-oe/recipes-multimedia/live555/live555_20110314.bb
deleted file mode 100644
index b1dbad2..0000000
--- a/meta-oe/recipes-multimedia/live555/live555_20110314.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require live555.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "ff65b2c598e970b4b6c8219a1811de00"
-SRC_URI[sha256sum] = "c6ce050a7f9f69901e6f7f81a6745c82d9419e3904a753b2d5db1139caaf6738"
-
-
diff --git a/meta-oe/recipes-multimedia/live555/live555_20130323.bb b/meta-oe/recipes-multimedia/live555/live555_20130323.bb
new file mode 100644
index 0000000..abf7e14
--- /dev/null
+++ b/meta-oe/recipes-multimedia/live555/live555_20130323.bb
@@ -0,0 +1,8 @@
+require live555.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "e9a75e0cfbf4f25aedd4ee4a10a7c26f"
+SRC_URI[sha256sum] = "9aaa736ee3b11ac0aa33655d8c59eefa893ef7c84a8f87d8ac0176c33b8f4deb"
-- 
1.7.10.4



