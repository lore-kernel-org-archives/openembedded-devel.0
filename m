Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Uas3L-0006Nt-V1
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 20:28:25 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 11:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,650,1363158000"; d="scan'208";a="332101429"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.234])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 11:09:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 19:09:31 +0100
Message-Id: <0f7c89e633df092a88578966f3e44008b3b2be35.1368209302.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] modphp: fix re-exec of do_install
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
X-List-Received-Date: Fri, 10 May 2013 18:28:26 -0000
X-List-Received-Date: Fri, 10 May 2013 18:28:26 -0000

Copying files and then modifying them is preferred rather than the other
way around because then the modification can never be run twice if the
function is re-executed on an existing work directory.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 62b59a1..192abd7 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -65,8 +65,8 @@ do_install  () {
     install -d ${D}${sysconfdir}/apache2/modules.d
     install -d ${D}${sysconfdir}/php/apache2-php5
     install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
-    sed -i s,lib/,${libdir}/, ${WORKDIR}/70_mod_php5.conf
     install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
+    sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php5.conf
     cat ${S}/php.ini-production | \
         sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
         > ${D}${sysconfdir}/php/apache2-php5/php.ini
-- 
1.8.1.2



