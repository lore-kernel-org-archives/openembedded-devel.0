Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QBEsC-00038y-Pz
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 01:25:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 725E31416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 01:23:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L3gaMXuDVKsF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 01:23:45 +0200 (CEST)
Received: from [192.168.1.2] (233-15-80-78.tmcz.cz [78.80.15.233])
	by ns.penguin.cz (Postfix) with ESMTP id 3C2BC1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 01:23:45 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Apr 2011 01:23:35 +0200
Message-ID: <1302996215.3122.31.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Subject: [PATCH 1/5] binconfig.bbclass: search configs in D instead of S
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
X-List-Received-Date: Sat, 16 Apr 2011 23:25:52 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Searching for binconfig in S makes more problems than it
brings benefits. Searching in the installed root seems to be more logical.

Fixes following subtle breakages:
- binconfig are populated with a different name that upstream intended
- populated binconfig files that were not intended to be populated

It fixes at least ncurses, which populates ncurses-config instead of
ncurses5-config and ncursesw5-config, causing secondary breakages.

Signed-off-by: Stanislav Brabec <utx@penguin.cz>

diff --git a/classes/binconfig.bbclass b/classes/binconfig.bbclass
index b3b2236..3d2bf0f 100644
--- a/classes/binconfig.bbclass
+++ b/classes/binconfig.bbclass
@@ -49,7 +49,7 @@ binconfig_package_preprocess () {
 SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
 
 binconfig_sysroot_preprocess () {
-	for config in `find ${S} -name '${BINCONFIG_GLOB}'`; do
+	for config in `find ${D} -name '${BINCONFIG_GLOB}'`; do
 		configname=`basename $config`
 		install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
 		cat $config | sed ${@get_binconfig_mangle(d)} > ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



