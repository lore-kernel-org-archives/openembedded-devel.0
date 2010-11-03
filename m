Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1PDarV-0007Li-I3
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 11:46:38 +0100
Received: from localhost.localdomain (unknown [192.168.1.27])
	by mail.altell.local (Postfix) with ESMTP id 31E385435;
	Wed,  3 Nov 2010 13:45:37 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Nov 2010 13:47:01 +0300
Message-Id: <1288781221-14752-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1288775679.3980.31.camel@mattotaupa>
References: <1288775679.3980.31.camel@mattotaupa>
X-Altell-MailScanner-ID: 31E385435.728BF
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libpfring: update SVN revision to 4384
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
X-List-Received-Date: Wed, 03 Nov 2010 10:46:38 -0000

I guess it should be in sync with pf-ring kernel module as using module revision
4384 with lib revision 4326 results in "mmap() failed" message on tcpdump (using
patched libpcap to support pf_ring) exit.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 .../libpfring/libpfring-makefile-fixes.patch       |   16 ++++++++--------
 recipes/pf_ring/libpfring_svn.bb                   |    2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes/pf_ring/libpfring/libpfring-makefile-fixes.patch b/recipes/pf_ring/libpfring/libpfring-makefile-fixes.patch
index 721f904..0344a7d 100644
--- a/recipes/pf_ring/libpfring/libpfring-makefile-fixes.patch
+++ b/recipes/pf_ring/libpfring/libpfring-makefile-fixes.patch
@@ -1,7 +1,7 @@
 Index: Makefile
 ===================================================================
---- Makefile.orig	2010-08-02 17:31:55.000000000 +0400
-+++ Makefile	2010-08-03 12:56:31.000000000 +0400
+--- Makefile.orig	2010-11-03 13:37:30.000000000 +0300
++++ Makefile	2010-11-03 13:39:18.000000000 +0300
 @@ -8,7 +8,7 @@
  #
  # Installation directory
@@ -11,16 +11,16 @@ Index: Makefile
  
  #
  # Search directories
-@@ -29,6 +29,8 @@
+@@ -32,6 +32,8 @@
  #
- # C compiler and flags
+ # CROSS_COMPILE=arm-mv5sft-linux-gnueabi-
  #
 +AR        = ar
 +RANLIB    = ranlib
- CC        = gcc
- CFLAGS    = -g -O2 -Wall -fPIC ${INCLUDE} ${DNA_DEFINE}
- LDFLAGS   = -shared
-@@ -44,26 +46,29 @@
+ CC        = ${CROSS_COMPILE}gcc
+ CFLAGS    = -g  -Wall -fPIC ${INCLUDE} ${DNA_DEFINE}
+ LDFLAGS   = -g -shared
+@@ -47,26 +49,29 @@
  # Main targets
  #
  STATICLIB  = libpfring.a
diff --git a/recipes/pf_ring/libpfring_svn.bb b/recipes/pf_ring/libpfring_svn.bb
index 06aa311..a903e3a 100644
--- a/recipes/pf_ring/libpfring_svn.bb
+++ b/recipes/pf_ring/libpfring_svn.bb
@@ -7,7 +7,7 @@ PV = "4.4.0+svnr${SRCREV}"
 
 S = "${WORKDIR}/lib"
 
-SRCREV = "4326"
+SRCREV = "4384"
 SRC_URI = " \
 	svn://svn.ntop.org/svn/ntop/trunk/PF_RING/userland;module=lib;proto=https \
 	file://libpfring-makefile-fixes.patch;striplevel=0 \
-- 
1.5.6.5



