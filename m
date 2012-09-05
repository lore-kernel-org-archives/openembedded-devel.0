Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Haz-0001aq-LD
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 17:32:49 +0200
Received: from archHP.dbnet.local (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 6FD514ED98;
	Wed,  5 Sep 2012 12:50:29 +0100 (BST)
From: ml@communistcode.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 16:21:34 +0100
Message-Id: <1346858494-4849-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCHv4 3/3] libcec: update libcec to latest version (1.8.1) as to include RasPi support
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
X-List-Received-Date: Wed, 05 Sep 2012 15:32:49 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

V2

- Change package version to 1.8.1

V1

- Now depends on liblockdev
- Slight licence change - new md5sum

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-extended/libcec/libcec_git.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 142b2e2..81b518a 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -1,14 +1,13 @@
 DESCRIPTION = "USB CEC Adaptor communication Library"
 HOMEPAGE = "http://libcec.pulse-eight.com/"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=185ead350fec5fc223da0f65f9a802af"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5e8e16396992369f73f3d28875f846da"
 
-DEPENDS = "udev"
+DEPENDS = "udev liblockdev"
 
-PR = "r1"
-PV = "1.4.0"
-SRCREV = "2db8981f49fbd167ddbbf19c1fbadd064abc332a"
+PV = "1.8.1"
+SRCREV = "34a9cecdd92f6b2844f9c4054da202b152ab2217"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.12



