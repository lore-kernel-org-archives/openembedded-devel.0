Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NU1LA-0005pX-II
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 18:12:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id B8B561422AC0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 18:12:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NYC2lEnShHF1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 18:12:25 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 91C121422AAE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 18:12:25 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jan 2010 18:10:33 +0100
Message-Id: <1263143433.3710.34.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] disable static libraries in Angstrom
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
X-List-Received-Date: Sun, 10 Jan 2010 17:12:39 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Attached patch disables build of major part of static libraries in the
Angstrom distribution.

Rationale:

Angstrom distribution is intended for project that are typically based
on multiple packages and use of shared libraries. In such environment,
static libraries are mostly only a waste of space. Disabling static
libraries seems to be a smart default.

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 85d6f3f..bddedda 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -41,6 +41,9 @@ require conf/distro/include/preferred-opie-versions-1.2.4.inc
 DISTRO_TYPE ?= "debug"
 #DISTRO_TYPE = "release"
 
+# Do not build static libraries by default.
+export enable_static = "no"
+
 # Set the toolchain type (internal, external) and brand (generic, csl etc.)
 TOOLCHAIN_TYPE ?= "internal"
 TOOLCHAIN_BRAND ?= ""



________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



