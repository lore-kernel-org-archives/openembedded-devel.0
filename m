Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MdyYM-0003jO-An
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:43:07 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id D1B581B2D1; Wed, 19 Aug 2009 20:25:48 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 20:24:32 -0700
Message-Id: <1250738680-20274-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
Subject: [PATCH] cross.bbclass: keep TARGET_SYS & TARGET_PREFIX independent.
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
X-List-Received-Date: Thu, 20 Aug 2009 03:43:14 -0000

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/cross.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 7debde6..72a0fb7 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -2,6 +2,11 @@
 # no need for them to be a direct target of 'world'
 EXCLUDE_FROM_WORLD = "1"
 
+# In order to keep TARGET_PREFIX decoupled from TARGET_SYS, let's force the
+# binary names to match the former, rather than relying on autoconf's implicit
+# prefixing based on the latter.
+EXTRA_OECONF_append = " --program-prefix=${TARGET_PREFIX}"
+
 # Save PACKAGE_ARCH before changing HOST_ARCH
 OLD_PACKAGE_ARCH := "${PACKAGE_ARCH}"
 PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
-- 
1.6.0



