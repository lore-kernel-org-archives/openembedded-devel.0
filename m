Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MQYQc-00020G-6w
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 05:11:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5B7D7350DEF;
	Mon, 13 Jul 2009 22:58:23 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14127-10; Mon, 13 Jul 2009 22:58:23 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 3FC2F352341; Mon, 13 Jul 2009 22:58:23 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 29BFE34F64E;
	Mon, 13 Jul 2009 22:58:21 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id D0D84A44337; Mon, 13 Jul 2009 22:58:21 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jul 2009 22:57:40 -0400
Message-Id: <1247540261-4537-3-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1247540261-4537-2-git-send-email-msmith@cbnco.com>
References: <1247540261-4537-1-git-send-email-msmith@cbnco.com>
	<1247540261-4537-2-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 3/4] mesa-dri: move tls configure logic to a class
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
X-List-Received-Date: Tue, 14 Jul 2009 03:11:38 -0000

Will allow reuse by xorg-xserver.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../mesa-tls.inc => classes/glx-use-tls.bbclass    |    3 ++-
 recipes/mesa/mesa-common.inc                       |    3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename recipes/mesa/mesa-tls.inc => classes/glx-use-tls.bbclass (81%)

diff --git a/recipes/mesa/mesa-tls.inc b/classes/glx-use-tls.bbclass
similarity index 81%
rename from recipes/mesa/mesa-tls.inc
rename to classes/glx-use-tls.bbclass
index 1472aa7..7530872 100644
--- a/recipes/mesa/mesa-tls.inc
+++ b/classes/glx-use-tls.bbclass
@@ -1,6 +1,7 @@
-
 def get_tls_setting(bb, d):
     # until we have no prober TLS support in uclibc disable it
     if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
         return ""
     return "--enable-glx-tls"
+
+EXTRA_OECONF += "${@get_tls_setting(bb, d)}"
diff --git a/recipes/mesa/mesa-common.inc b/recipes/mesa/mesa-common.inc
index 4f18c2f..d7bfc14 100644
--- a/recipes/mesa/mesa-common.inc
+++ b/recipes/mesa/mesa-common.inc
@@ -19,8 +19,7 @@ EXTRA_OECONF = "--enable-glu \
                 --disable-glut \
 	       "
 
-require mesa-tls.inc
-EXTRA_OECONF += "${@get_tls_setting(bb, d)} "
+inherit glx-use-tls
 
 # Package contents vary according to ${MACHINE_DRI_MODULES}.
 PACKAGE_ARCH = "${MACHINE}"
-- 
1.6.3



