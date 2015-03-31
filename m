Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B148D736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 17:23:10 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2VHNAtb027353
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 31 Mar 2015 10:23:11 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>)
	id 1YczsI-0003zH-7h; Tue, 31 Mar 2015 13:22:50 -0400
Date: Tue, 31 Mar 2015 13:22:50 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org, amy.fong@windriver.com
Message-ID: <20150331172250.GA15301@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-filesystems] [PATCH] aufs-tools - version cleanup
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
X-List-Received-Date: Tue, 31 Mar 2015 17:23:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From b475c003b0581eab69b90a662bffafcf67419c76 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Tue, 31 Mar 2015 13:17:43 -0400
Subject: [PATCH] aufs-tools - version cleanup

Fix the version to be 3.0 so that it corresponds to what we get
from the SRCREV.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 48c5456..db3cd59 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -8,13 +8,13 @@ DEPENDS = "aufs-util-native"
 DEPENDS_class-native = ""
 
 SRCREV = "f29056fe396d56fc2a06a96312feabaebbe14c59"
-SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.9 \
+SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.0 \
            file://aufs-util-don-t-strip-executables.patch \
            file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \
            file://aufs_type.h \
 "
 
-PV = "3.9+git${SRCPV}"
+PV = "3.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


