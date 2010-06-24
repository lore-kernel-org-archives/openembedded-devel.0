Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1ORjEZ-0006q3-28
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 12:00:38 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.3) with ESMTP id o5O9tbqb002281
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Jun 2010 11:55:38 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1ORj9k-000600-BQ; Thu, 24 Jun 2010 11:55:36 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jun 2010 11:55:34 +0200
Message-Id: <1277373334-22503-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] binconfig.bbclass: take *-config from ${D}, not from ${S}
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
X-List-Received-Date: Thu, 24 Jun 2010 10:00:38 -0000

It is not always right to take *-config files from source tree;
e.g. the buildsystem of recent ncurses takes an 'ncurses-config'
template and installs it as 'ncurses5-config' and 'ncursesw5-config'.

This patch uses the installed *-config files which are having the
expected name and content.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/binconfig.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/classes/binconfig.bbclass b/classes/binconfig.bbclass
index b3b2236..c1116fc 100644
--- a/classes/binconfig.bbclass
+++ b/classes/binconfig.bbclass
@@ -49,7 +49,10 @@ binconfig_package_preprocess () {
 SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
 
 binconfig_sysroot_preprocess () {
-	for config in `find ${S} -name '${BINCONFIG_GLOB}'`; do
+	# take *-config from ${D}; Using ${PKGD} is not possible
+	# because it might not be populated yet and copies there will
+	# be altered by the function above.
+	for config in `find ${D} -name '${BINCONFIG_GLOB}'`; do
 		configname=`basename $config`
 		install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
 		cat $config | sed ${@get_binconfig_mangle(d)} > ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
-- 
1.7.0.1



