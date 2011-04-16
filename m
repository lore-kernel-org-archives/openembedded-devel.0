Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QBEsi-0003FS-0f
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 01:26:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id B77351416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 01:24:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzDK7AqgT4HC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 01:24:16 +0200 (CEST)
Received: from [192.168.1.2] (233-15-80-78.tmcz.cz [78.80.15.233])
	by ns.penguin.cz (Postfix) with ESMTP id 896641416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 01:24:16 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Apr 2011 01:24:07 +0200
Message-ID: <1302996247.3122.32.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Subject: [PATCH 2/5] pkgconfig.bbclass: search configs in D instead of S
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
X-List-Received-Date: Sat, 16 Apr 2011 23:26:24 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Searching for .pc files in S makes more problems than it
brings benefits. Searching in the installed root seems to be more
logical.

Fixes possible subtle breakages:
- .pc files populated with a different name that upstream intended
- populated .pc files files that were not intended to be populated

Signed-off-by: Stanislav Brabec <utx@penguin.cz>

diff --git a/classes/pkgconfig.bbclass b/classes/pkgconfig.bbclass
index d96b708..00298ca 100644
--- a/classes/pkgconfig.bbclass
+++ b/classes/pkgconfig.bbclass
@@ -14,7 +14,7 @@ SYSROOT_PREPROCESS_FUNCS += "pkgconfig_sysroot_preprocess"
 
 pkgconfig_sysroot_preprocess () {
 	install -d ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}
-	for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-uninstalled.pc$'`; do
+	for pc in `find ${D} -name '*.pc' -type f`; do
 		pcname=`basename $pc`
 		if [ ! -f ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}/$pcname ]; then
 			oenote "$pcname was not installed."

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



