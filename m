Return-Path: <sjl@dent.vctlabs.com>
X-Greylist: delayed 384 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 18 Jul 2015 00:28:29 UTC
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id CA0AA65CCC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jul 2015 00:28:29 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 76AFDC0791; Fri, 17 Jul 2015 17:38:52 -0700 (PDT)
Date: Fri, 17 Jul 2015 17:38:52 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150718003852.GA18486@dent.vctlabs.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-oe][meta-filesystems][PATCH 2/2] ifuse: remove blacklist due to libimobiledevice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jul 2015 00:28:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

ifuse's libimobiledevice dependency has been fixed, so ifuse blacklist
can be removed as well

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
index 42f4c87..f0b58b9 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
@@ -3,7 +3,6 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 HOMEPAGE ="http://www.libimobiledevice.org/"
 
-PNBLACKLIST[ifuse] ?= "depends on blacklisted libimobiledevice"
 DEPENDS = "fuse libimobiledevice"
 
 SRC_URI = " \
-- 
1.7.10.4


