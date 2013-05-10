Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Uas3q-0006R6-L1
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 20:28:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2013 11:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,650,1363158000"; d="scan'208";a="332101452"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.234])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 11:09:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 19:09:33 +0100
Message-Id: <f05dfc0deea48fa996c357bc124f38e2b4e5e44f.1368209302.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] phpmyadmin: remove dependency on bash
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
X-List-Received-Date: Fri, 10 May 2013 18:28:56 -0000

Remove some mostly superfluous scripts for adding additional mimetype
support that add an explicit dependency on bash.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb
index 54cacb5..e48e515 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.8.1.bb
@@ -21,6 +21,9 @@ do_install() {
 
     install -d ${D}${sysconfdir}/apache2/conf.d
     install -m 0644 ${WORKDIR}/apache.conf ${D}${sysconfdir}/apache2/conf.d/phpmyadmin.conf
+
+    # Remove a few scripts that explicitly require bash (!)
+    rm -f ${D}${datadir}/phpmyadmin/libraries/transformations/*.sh
 }
 
 FILES_${PN} = "${datadir}/${BPN} \
-- 
1.8.1.2



