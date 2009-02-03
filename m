Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LUUuv-0004Du-MG
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 00:42:59 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090203234248.SJWD2342.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>;
	Tue, 3 Feb 2009 18:42:48 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id Bbid1b00G1E665w03bid4s; Tue, 03 Feb 2009 18:42:37 -0500
X-Authority-Analysis: v=1.0 c=1 a=5n8E4KItPpEA:10 a=QnKSE2tEv7cA:10
	a=IHPn33SEwnbtslBcP6IA:9 a=8y61FP7EIZOrOhiQkzCEA31l5ucA:4
	a=b8hG5vVbyAkA:10
X-CM-Score: 0.00
Date: Tue, 3 Feb 2009 16:42:37 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090203234237.GI3856@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [PATCH] Make eglibc_{2.9,svn} depend on gperf-native
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
X-List-Received-Date: Tue, 03 Feb 2009 23:43:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.  Trying to build eglibc 2.9 today I hit a problem on install as I
didn't have gperf installed.  OK to push the following?

diff --git a/packages/eglibc/eglibc_2.9.bb b/packages/eglibc/eglibc_2.9.bb
index 207c73a..e2cac82 100644
--- a/packages/eglibc/eglibc_2.9.bb
+++ b/packages/eglibc/eglibc_2.9.bb
@@ -1,9 +1,10 @@
 require eglibc.inc
 
+DEPENDS += "gperf-native"
 DEFAULT_PREFERENCE = "1"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/eglibc-svn"
 PV = "2.9"
-PR = "r0"
+PR = "r1"
 SVN_REV="7430"
 EGLIBC_BRANCH="eglibc-2_9"
 SRC_URI = "svn://svn.eglibc.org/branches;module=eglibc-2_9;rev=${SVN_REV};proto=svn \
diff --git a/packages/eglibc/eglibc_svn.bb b/packages/eglibc/eglibc_svn.bb
index a0d322a..fc3ed59 100644
--- a/packages/eglibc/eglibc_svn.bb
+++ b/packages/eglibc/eglibc_svn.bb
@@ -1,10 +1,11 @@
 require eglibc.inc
 
+DEPENDS += "gperf-native"
 SRCREV = "7542"
 # DEFAULT_PREFERENCE = "-1"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/eglibc-svn"
 PV = "2.9+svnr${SRCREV}"
-PR = "r0"
+PR = "r1"
 EGLIBC_BRANCH="trunk"
 SRC_URI = "svn://svn.eglibc.org;module=trunk \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \

-- 
Tom Rini


