Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MdyYT-0003jW-TY
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:43:16 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id 3496A1B7A2; Wed, 19 Aug 2009 20:25:51 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 20:24:38 -0700
Message-Id: <1250738680-20274-7-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
In-Reply-To: <1250738680-20274-6-git-send-email-clarson@mvista.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
Subject: [PATCH] bitbake.conf: Add export for cross NM.
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
X-List-Received-Date: Thu, 20 Aug 2009 03:43:19 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

When not providing a cross nm, the configure for libtool-cross falls back to
the system nm. This can lead to empty "global_symbol_pipe" and
"global_symbol_to_cdeclvarble" variables in the generated libtool script.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Chris Larson <clarson@mvista.com>
---
 conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 0b35ea8..371bf8e 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -404,6 +404,7 @@ export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 export OBJCOPY = "${HOST_PREFIX}objcopy"
 export OBJDUMP = "${HOST_PREFIX}objdump"
+export NM = "${HOST_PREFIX}nm"
 PYTHON = "${@sys.executable}"
 
 export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
-- 
1.6.0



