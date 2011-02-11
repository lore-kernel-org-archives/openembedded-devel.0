Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pnsew-0004l2-4k
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:03:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id DBF95314D9F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:02:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id jKl6i7NzjsaI
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:02:30 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 236F2314D9EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:02:29 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 11 Feb 2011 13:02:29 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 13:02:29 +0000
Message-Id: <1297429349-5526-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] kernel.bbclass: provide virtual/kernel-${PV}
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
X-List-Received-Date: Fri, 11 Feb 2011 13:03:39 -0000

* Allow precompiled modules to depend on a specific kernel version.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 0d1b4ad..55e3ca0 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -1,6 +1,6 @@
 inherit linux-kernel-base module_strip
 
-PROVIDES += "virtual/kernel"
+PROVIDES += "virtual/kernel virtual/kernel-${PV}"
 DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules bluez-dtl1-workaround"
 
 # we include gcc above, we dont need virtual/libc
-- 
1.7.2.3



