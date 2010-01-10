Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NU1HK-0005iJ-Q5
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 18:08:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 10F8D1422AC0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 18:08:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-MPMoFotT11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 18:08:27 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id D32E81422AAE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 18:08:27 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jan 2010 18:06:35 +0100
Message-Id: <1263143195.3710.30.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] introduce global control on shared/static libraries
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
X-List-Received-Date: Sun, 10 Jan 2010 17:08:42 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

This patch adds support for global enabling and disabling of shared or
static libraries in autoconf based packages.

All required fixes in packages that I was able to test are already in
place with exception of apmd (I plan to commit it soon as well).

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 384a67d..ea1ea1e 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -346,10 +346,10 @@ oe_libinstall() {
 			silent=1
 			;;
 		-a)
-			require_static=1
+			if test "$enable_static" != "no" ; then require_static=1 ; fi
 			;;
 		-so)
-			require_shared=1
+			if test "$enable_shared" != "no" ; then require_shared=1 ; fi
 			;;
 		-*)
 			oefatal "oe_libinstall: unknown option: $1"
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 3a68959..4903952 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -86,6 +86,10 @@ bindir_cross = "/bin"
 #
 target_datadir := "${datadir}"
 
+# Basic autoconf defaults
+export enable_static = "yes"
+export enable_shared = "yes"
+
 ##################################################################
 # Architecture-dependent build variables.
 ##################################################################
diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index 643ae0b..3fa7a32 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -146,6 +146,12 @@ IMAGE_FSTYPES = "jffs2 tar"
 # SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
 # LDFLAGS =+ "-pg"
 
+# Uncomment these and define whether you want to build stared and static
+# libraries by default.
+# Normally the DISTRO of your choosing will take care of this 
+# export enable_static = "yes"
+# export enable_shared = "yes"
+
 # Uncomment this to enable parallel make.
 # This allows make to spawn mutliple processes to take advantage of multiple 
 # processors. Useful on SMP machines. This may break some packages - we're



________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



