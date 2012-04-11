Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SI6wt-0004eV-Mj
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2012 01:27:40 +0200
Received: (qmail 29427 invoked by uid 1003); 11 Apr 2012 23:11:40 -0000
Received: from unknown (HELO localhost.localdomain)
	(philip@balister.org@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 Apr 2012 23:11:39 -0000
From: philip@balister.org
To: openembedded-devel@openembedded.org
Date: Wed, 11 Apr 2012 16:11:29 -0700
Message-Id: <1334185891-25460-4-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1334185891-25460-1-git-send-email-philip@balister.org>
References: <1334185891-25460-1-git-send-email-philip@balister.org>
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe 3/5] uhd : Update to version 3.4.1.
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
X-List-Received-Date: Wed, 11 Apr 2012 23:27:40 -0000

From: Philip Balister <philip@opensdr.com>

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 meta-oe/recipes-connectivity/uhd/uhd.inc    |    2 +-
 meta-oe/recipes-connectivity/uhd/uhd_git.bb |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
index 466a19c..5e2e329 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd.inc
+++ b/meta-oe/recipes-connectivity/uhd/uhd.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.ettus.com"
 LICENSE = "GPLV3+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=51b35d652c070d136bf20244494be2d3"
 
-DEPENDS = "git-native python-cheetah-native boost libusb1 uhd-firmware orc-native"
+DEPENDS = "git-native boost libusb1 uhd-firmware orc-native"
 RDEPENDS_${PN} += "uhd-firmware"
 
 PE = "1"
diff --git a/meta-oe/recipes-connectivity/uhd/uhd_git.bb b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
index cd9c554..e740ccd 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd_git.bb
+++ b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
@@ -1,10 +1,10 @@
 require uhd.inc
 
-PV = "3.3.1"
+PV = "3.4.1"
 PR = "${INC_PR}.0"
 
 SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;protocol=git \
-           file://0001-HACK-work-around-Wl-as-needed-problems.patch;striplevel=2"
+          "
 S = "${WORKDIR}/git/host"
 
-SRCREV = "f8d66fcfb14062283cdb0d0cbe4f77e2964ceb82"
+SRCREV = "3fb067567b0c799b3c707938491eb8489d85fefa"
-- 
1.7.7.6



