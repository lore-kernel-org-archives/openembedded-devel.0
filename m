Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MdyYT-0003jV-TF
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:43:16 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id E7B6F1B7A1; Wed, 19 Aug 2009 20:25:50 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 20:24:37 -0700
Message-Id: <1250738680-20274-6-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
In-Reply-To: <1250738680-20274-5-git-send-email-clarson@mvista.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
Subject: [PATCH] bitbake.conf: Kill CCACHE. Implicit, automatic use of things which can fail is bad.
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

To re-enable, set CCACHE = "ccache ".

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 conf/bitbake.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index c4af34e..0b35ea8 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -390,7 +390,6 @@ export PATH
 # Build utility info.
 ##################################################################
 
-CCACHE = "${@bb.which(bb.data.getVar('PATH', d, 1), 'ccache') and 'ccache '}"
 TOOLCHAIN_OPTIONS = ""
 
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
1.6.0



