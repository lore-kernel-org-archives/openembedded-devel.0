Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MOudo-00044A-La
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 16:30:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id AD5CA4FF388;
	Thu,  9 Jul 2009 10:17:42 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06976-07; Thu,  9 Jul 2009 10:17:42 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 8D2494F9CC6; Thu,  9 Jul 2009 10:17:42 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 2B97A500C7E;
	Thu,  9 Jul 2009 10:17:39 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 23B7340151; Thu,  9 Jul 2009 10:17:39 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jul 2009 10:16:57 -0400
Message-Id: <1247149017-23395-3-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1247149017-23395-2-git-send-email-msmith@cbnco.com>
References: <1247149017-23395-1-git-send-email-msmith@cbnco.com>
	<1247149017-23395-2-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 3/3] glibc: use INC_PR, bumping all PRs to r32.0
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
X-List-Received-Date: Thu, 09 Jul 2009 14:30:30 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/glibc/glibc.inc                  |    3 +++
 recipes/glibc/glibc_2.2.5.bb             |    2 +-
 recipes/glibc/glibc_2.3.2+cvs20040726.bb |    2 +-
 recipes/glibc/glibc_2.3.2.bb             |    2 +-
 recipes/glibc/glibc_2.3.3+cvs20041128.bb |    2 +-
 recipes/glibc/glibc_2.3.3+cvs20050221.bb |    2 +-
 recipes/glibc/glibc_2.3.3+cvs20050420.bb |    2 +-
 recipes/glibc/glibc_2.3.3.bb             |    2 +-
 recipes/glibc/glibc_2.3.5+cvs20050627.bb |    2 +-
 recipes/glibc/glibc_2.3.6.bb             |    2 +-
 recipes/glibc/glibc_2.4.bb               |    2 +-
 recipes/glibc/glibc_2.5.bb               |    2 +-
 recipes/glibc/glibc_2.6.1.bb             |    2 +-
 recipes/glibc/glibc_2.7.bb               |    2 +-
 recipes/glibc/glibc_2.9.bb               |    2 +-
 recipes/glibc/glibc_cvs.bb               |    2 +-
 16 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/recipes/glibc/glibc.inc b/recipes/glibc/glibc.inc
index c2ee531..9a39421 100644
--- a/recipes/glibc/glibc.inc
+++ b/recipes/glibc/glibc.inc
@@ -10,6 +10,9 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 
+# INC_PR for glibc.inc, glibc-initial.inc and glibc-stage.inc
+INC_PR = "r32"
+
 inherit autotools
 
 LEAD_SONAME = "libc.so"
diff --git a/recipes/glibc/glibc_2.2.5.bb b/recipes/glibc/glibc_2.2.5.bb
index 49d3a35..f810477 100644
--- a/recipes/glibc/glibc_2.2.5.bb
+++ b/recipes/glibc/glibc_2.2.5.bb
@@ -1,7 +1,7 @@
 require glibc.inc
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
-PR = "r21"
+PR = "${INC_PR}.0"
 
 DEFAULT_PREFERENCE_sh3 = "-99"
 
diff --git a/recipes/glibc/glibc_2.3.2+cvs20040726.bb b/recipes/glibc/glibc_2.3.2+cvs20040726.bb
index 754c85f..0799676 100644
--- a/recipes/glibc/glibc_2.3.2+cvs20040726.bb
+++ b/recipes/glibc/glibc_2.3.2+cvs20040726.bb
@@ -3,7 +3,7 @@ require glibc.inc
 DEFAULT_PREFERENCE_sh3 = "-99"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
-PR = "r31"
+PR = "${INC_PR}.0"
 
 GLIBC_ADDONS ?= "linuxthreads"
 
diff --git a/recipes/glibc/glibc_2.3.2.bb b/recipes/glibc/glibc_2.3.2.bb
index 0ed7d3e..1524420 100644
--- a/recipes/glibc/glibc_2.3.2.bb
+++ b/recipes/glibc/glibc_2.3.2.bb
@@ -1,6 +1,6 @@
 require glibc.inc
 
-PR = "r20"
+PR = "${INC_PR}.0"
 
 DEFAULT_PREFERENCE_sh3 = "-99"
 
diff --git a/recipes/glibc/glibc_2.3.3+cvs20041128.bb b/recipes/glibc/glibc_2.3.3+cvs20041128.bb
index 02be256..d99bde7 100644
--- a/recipes/glibc/glibc_2.3.3+cvs20041128.bb
+++ b/recipes/glibc/glibc_2.3.3+cvs20041128.bb
@@ -3,7 +3,7 @@ require glibc.inc
 DEFAULT_PREFERENCE_sh3 = "-99"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
-PR = "r16"
+PR = "${INC_PR}.0"
 
 GLIBC_ADDONS ?= "linuxthreads"
 
diff --git a/recipes/glibc/glibc_2.3.3+cvs20050221.bb b/recipes/glibc/glibc_2.3.3+cvs20050221.bb
index 4eff27f..7ce4cce 100644
--- a/recipes/glibc/glibc_2.3.3+cvs20050221.bb
+++ b/recipes/glibc/glibc_2.3.3+cvs20050221.bb
@@ -3,7 +3,7 @@ require glibc.inc
 DEFAULT_PREFERENCE_sh3 = "-99"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
-PR = "r16"
+PR = "${INC_PR}.0"
 
 GLIBC_ADDONS ?= "linuxthreads"
 
diff --git a/recipes/glibc/glibc_2.3.3+cvs20050420.bb b/recipes/glibc/glibc_2.3.3+cvs20050420.bb
index 65654dc..ea51f9e 100644
--- a/recipes/glibc/glibc_2.3.3+cvs20050420.bb
+++ b/recipes/glibc/glibc_2.3.3+cvs20050420.bb
@@ -5,7 +5,7 @@ DEFAULT_PREFERENCE_i586 = "0"
 DEFAULT_PREFERENCE_sh3 = "-99"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
-PR = "r14"
+PR = "${INC_PR}.0"
 
 GLIBC_ADDONS ?= "linuxthreads"
 
diff --git a/recipes/glibc/glibc_2.3.3.bb b/recipes/glibc/glibc_2.3.3.bb
index dada4bb..83ef019 100644
--- a/recipes/glibc/glibc_2.3.3.bb
+++ b/recipes/glibc/glibc_2.3.3.bb
@@ -1,6 +1,6 @@
 require glibc.inc
 
-PR = "r17"
+PR = "${INC_PR}.0"
 
 DEFAULT_PREFERENCE_sh3 = "-99"
 
diff --git a/recipes/glibc/glibc_2.3.5+cvs20050627.bb b/recipes/glibc/glibc_2.3.5+cvs20050627.bb
index 1d4dd0d..04231d1 100644
--- a/recipes/glibc/glibc_2.3.5+cvs20050627.bb
+++ b/recipes/glibc/glibc_2.3.5+cvs20050627.bb
@@ -2,7 +2,7 @@ require glibc.inc
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs-2.3.5"
 SRCDATE = "20050627"
-PR = "r23"
+PR = "${INC_PR}.0"
 
 #Doesnt build for sh3
 DEFAULT_PREFERENCE_sh3="-1"
diff --git a/recipes/glibc/glibc_2.3.6.bb b/recipes/glibc/glibc_2.3.6.bb
index 8d64540..9277dd1 100644
--- a/recipes/glibc/glibc_2.3.6.bb
+++ b/recipes/glibc/glibc_2.3.6.bb
@@ -1,6 +1,6 @@
 require glibc.inc
 
-PR = "r5"
+PR = "${INC_PR}.0"
 
 GLIBC_ADDONS ?= "linuxthreads"
 
diff --git a/recipes/glibc/glibc_2.4.bb b/recipes/glibc/glibc_2.4.bb
index 54fe487..ca6afe2 100644
--- a/recipes/glibc/glibc_2.4.bb
+++ b/recipes/glibc/glibc_2.4.bb
@@ -1,6 +1,6 @@
 require glibc.inc
 
-PR = "r21"
+PR = "${INC_PR}.0"
 
 #add the hosts that are confirmed to be working to COMPATIBLE_HOSTi
 COMPATIBLE_HOST = '(i.86.*-linux|sh.*-linux)'
diff --git a/recipes/glibc/glibc_2.5.bb b/recipes/glibc/glibc_2.5.bb
index 6e22959..02cfeae 100644
--- a/recipes/glibc/glibc_2.5.bb
+++ b/recipes/glibc/glibc_2.5.bb
@@ -1,5 +1,5 @@
 require glibc.inc
-PR = "r18"
+PR = "${INC_PR}.0"
 
 ARM_INSTRUCTION_SET = "arm"
 
diff --git a/recipes/glibc/glibc_2.6.1.bb b/recipes/glibc/glibc_2.6.1.bb
index 0a8708c..5cbd8b6 100644
--- a/recipes/glibc/glibc_2.6.1.bb
+++ b/recipes/glibc/glibc_2.6.1.bb
@@ -1,5 +1,5 @@
 require glibc.inc
-PR = "r17"
+PR = "${INC_PR}.0"
 
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
diff --git a/recipes/glibc/glibc_2.7.bb b/recipes/glibc/glibc_2.7.bb
index 447a695..f152756 100644
--- a/recipes/glibc/glibc_2.7.bb
+++ b/recipes/glibc/glibc_2.7.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
-PR = "r10"
+PR = "${INC_PR}.0"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index be66e2b..8a9f2c0 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
diff --git a/recipes/glibc/glibc_cvs.bb b/recipes/glibc/glibc_cvs.bb
index 26d29f0..4d093de 100644
--- a/recipes/glibc/glibc_cvs.bb
+++ b/recipes/glibc/glibc_cvs.bb
@@ -1,7 +1,7 @@
 require glibc.inc
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs-2.3.5"
-PR = "r12"
+PR = "${INC_PR}.0"
 PV = "2.3.5+cvs${SRCDATE}"
 
 GLIBC_ADDONS ?= "ports,linuxthreads"
-- 
1.6.3



