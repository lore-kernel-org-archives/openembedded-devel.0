Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9GVs-0007lK-SI
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 16:23:28 +0200
Received: from archHP.dbnet.local (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 2B1984ED39;
	Wed,  5 Sep 2012 11:31:36 +0100 (BST)
From: ml@communistcode.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 15:02:30 +0100
Message-Id: <1346853750-503-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1346853750-503-1-git-send-email-ml@communistcode.co.uk>
References: <1346853750-503-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH 3/3] libcec: update libcec to latest version (1.8.2) as to include RasPi support
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
X-List-Received-Date: Wed, 05 Sep 2012 14:23:28 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

- Now depends on liblockdev
- Slight licence change - new md5sum

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-extended/libcec/libcec_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 142b2e2..f3cb39e 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -1,14 +1,14 @@
 DESCRIPTION = "USB CEC Adaptor communication Library"
 HOMEPAGE = "http://libcec.pulse-eight.com/"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=185ead350fec5fc223da0f65f9a802af"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5e8e16396992369f73f3d28875f846da"
 
-DEPENDS = "udev"
+DEPENDS = "udev liblockdev"
 
 PR = "r1"
-PV = "1.4.0"
-SRCREV = "2db8981f49fbd167ddbbf19c1fbadd064abc332a"
+PV = "1.8.2"
+SRCREV = "34a9cecdd92f6b2844f9c4054da202b152ab2217"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.12



