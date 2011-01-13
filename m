Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PdOBY-0004As-HB
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 15:29:56 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id p0DETE9A005510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 13 Jan 2011 15:29:14 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1PdOAr-0006jC-SA; Thu, 13 Jan 2011 15:29:13 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 15:29:12 +0100
Message-Id: <1294928952-25833-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.3.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.995
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: [PATCH] zlib: substitute sharedlibdir
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
X-List-Received-Date: Thu, 13 Jan 2011 14:29:56 -0000

From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

@sharedlibdir@ is not substituted so that linkerflags in zlib.pc expand to
"... -L@sharedlibdir@" which breaks e.g. glib builds.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 recipes/zlib/zlib-1.2.5/0001-autotools.patch |    4 +++-
 recipes/zlib/zlib_1.2.5.bb                   |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/zlib/zlib-1.2.5/0001-autotools.patch b/recipes/zlib/zlib-1.2.5/0001-autotools.patch
index 6642860..f5c50f1 100644
--- a/recipes/zlib/zlib-1.2.5/0001-autotools.patch
+++ b/recipes/zlib/zlib-1.2.5/0001-autotools.patch
@@ -33,7 +33,7 @@ new file mode 100644
 index 0000000..177c89a
 --- /dev/null
 +++ b/configure.ac
-@@ -0,0 +1,17 @@
+@@ -0,0 +1,19 @@
 +AC_INIT(zlib,1.2.5)
 +AC_CONFIG_SRCDIR(adler32.c)
 +AM_INIT_AUTOMAKE(zlibs,1.2.5)
@@ -45,6 +45,8 @@ index 0000000..177c89a
 +
 +AC_HEADER_STDC
 +
++AC_SUBST(sharedlibdir,$libdir)
++
 +AC_CONFIG_FILES([
 +Makefile
 +zlib.pc
diff --git a/recipes/zlib/zlib_1.2.5.bb b/recipes/zlib/zlib_1.2.5.bb
index 34419f0..1f51404 100644
--- a/recipes/zlib/zlib_1.2.5.bb
+++ b/recipes/zlib/zlib_1.2.5.bb
@@ -1,6 +1,6 @@
 include zlib.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://0001-autotools.patch "
 
-- 
1.7.3.4



