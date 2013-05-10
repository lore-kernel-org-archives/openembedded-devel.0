Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Uas3n-0006R6-RY
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 20:28:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2013 11:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,650,1363158000"; d="scan'208";a="332101417"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.234])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 11:09:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 19:09:30 +0100
Message-Id: <45ebc64c13e572817862bcc1b7df09ff97efd350.1368209302.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] modphp: fix text relocation QA warning
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
X-List-Received-Date: Fri, 10 May 2013 18:28:55 -0000

Fixes the following warning:

WARNING: QA Issue: ELF binary '${WORKDIR}/packages-split/modphp/usr/lib/apache2/modules/libphp5.so' has relocations in .text

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 6b227af..62b59a1 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -19,6 +19,7 @@ inherit autotools
 CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
 EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
+                --with-pic \
                 --enable-maintainer-zts \
                 --without-mysql \
                 --enable-force-cgi-redirect \
-- 
1.8.1.2



