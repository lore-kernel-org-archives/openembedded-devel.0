Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1PiafD-0002nl-G1
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 23:50:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 52A0214019D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 23:34:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiz41tauHzzN
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 23:34:37 +0100 (CET)
Received: from [192.168.1.2] (233-15-80-78.tmcz.cz [78.80.15.233])
	by ns.penguin.cz (Postfix) with ESMTP id 1CD0B1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 23:34:36 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jan 2011 23:31:05 +0100
Message-ID: <1296167465.14370.7.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
Subject: [RFC][PATCH] binconfig.bbclass: search configs in PKGD instead of S
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
X-List-Received-Date: Thu, 27 Jan 2011 22:50:03 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Hallo.

It seems that searching for binconfig in S makes more problems than it
brings benefits. It breaks for example ncurses - it populates
ncurses-config instead of ncurses5-config and ncursesw5-config).

Searching in the installed root seems to be more logical.

Most packages don't need to be ported to this change, as they install
config file with the same name as it exists in sources. But probably
several will need porting.

--- a/classes/binconfig.bbclass
+++ b/classes/binconfig.bbclass
@@ -49,7 +49,7 @@
 SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
 
 binconfig_sysroot_preprocess () {
-	for config in `find ${S} -name '${BINCONFIG_GLOB}'`; do
+	for config in `find ${PKGD} -name '${BINCONFIG_GLOB}'`; do
 		configname=`basename $config`
 		install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
 		cat $config | sed ${@get_binconfig_mangle(d)} > ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



