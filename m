Received: from mail-bw0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1PRqI2-0003q5-5o
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Dec 2010 19:04:54 +0100
Received: by bwz12 with SMTP id 12so5790326bwz.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 10:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=djtVjWbjb7v6xRrgzoTFLm1XrYglfR0mDPGVOn+QEw4=;
	b=SfgoNTAesKwZH68ahao6aXyCy3lqlDWMUh6zIVJ55pW33FypFg7Y4lPhF9fLMXWR7z
	tjFXzwSpfLHNhL8EBoyX7yMuKUMdPTgE6YUOnj9F/7N10R8ia+8TxpJa1mcNEPHLQ5Bv
	pUQVHmEUSa0z0tDPRxb4a7kPOA2KaVJsCCDGQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=u0dzs9teuKKMPqpoSZXisntI5ARAGP/2NX6pFWiDnHoetnsVNFlM0r63TA56y4BqB/
	U8Z+xRnI1mp9fiXP7A0lpRBKv+ZzLx2GDxmmaVfuAIpRoBdxz/MMyq41h17McRxX5qr5
	gtl/+Q8Xf+6xUxyV7j7zO80KirEDcaZDJ35UE=
Received: by 10.204.66.148 with SMTP id n20mr2869507bki.44.1292176998945;
	Sun, 12 Dec 2010 10:03:18 -0800 (PST)
Received: from localhost.localdomain ([46.128.240.207])
	by mx.google.com with ESMTPS id v1sm2631717bkt.17.2010.12.12.10.03.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 12 Dec 2010 10:03:18 -0800 (PST)
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Dec 2010 19:03:04 +0100
Message-Id: <1292176984-20866-1-git-send-email-lazy.gopher@gmail.com>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.214.44
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] mcpp: fixed crash issue with slice2cpp
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
X-List-Received-Date: Sun, 12 Dec 2010 18:04:54 -0000

* added patch to fix crash issue with slice2cpp
* fixed package name by removing lib_package

Signed-off-by: Maksym Parkachov <lazy.gopher@gmail.com>
---
 recipes/mcpp/mcpp-2.7.2/slice2ccp-no-crash.patch |   49 ++++++++++++++++++++++
 recipes/mcpp/mcpp.inc                            |    2 +-
 recipes/mcpp/mcpp_2.7.2.bb                       |    3 +
 3 files changed, 53 insertions(+), 1 deletions(-)
 create mode 100644 recipes/mcpp/mcpp-2.7.2/slice2ccp-no-crash.patch

diff --git a/recipes/mcpp/mcpp-2.7.2/slice2ccp-no-crash.patch b/recipes/mcpp/mcpp-2.7.2/slice2ccp-no-crash.patch
new file mode 100644
index 0000000..1a0d931
--- /dev/null
+++ b/recipes/mcpp/mcpp-2.7.2/slice2ccp-no-crash.patch
@@ -0,0 +1,49 @@
+Index: mcpp-2.7.2/src/internal.H
+===================================================================
+--- mcpp-2.7.2.orig/src/internal.H	2010-12-12 15:52:09.556466001 +0100
++++ mcpp-2.7.2/src/internal.H	2010-12-12 15:52:28.313840001 +0100
+@@ -390,6 +390,8 @@
+ extern char     identifier[];       /* Lastly scanned name          */
+ extern IFINFO   ifstack[];          /* Information of #if nesting   */
+ extern char     work_buf[];
++extern FILEINFO * sh_file;
++extern int      sh_line;
+         /* Temporary buffer for directive line and macro expansion  */
+ 
+ /* main.c   */
+Index: mcpp-2.7.2/src/main.c
+===================================================================
+--- mcpp-2.7.2.orig/src/main.c	2010-12-12 15:52:16.115744002 +0100
++++ mcpp-2.7.2/src/main.c	2010-12-12 15:52:28.317842001 +0100
+@@ -326,6 +326,8 @@
+             = FALSE;
+     option_flags.trig = TRIGRAPHS_INIT;
+     option_flags.dig = DIGRAPHS_INIT;
++    sh_file = NULL;
++    sh_line = 0;
+ }
+ 
+ int     mcpp_lib_main
+Index: mcpp-2.7.2/src/system.c
+===================================================================
+--- mcpp-2.7.2.orig/src/system.c	2010-12-12 15:52:22.939154002 +0100
++++ mcpp-2.7.2/src/system.c	2010-12-12 15:52:28.317842001 +0100
+@@ -3858,6 +3858,9 @@
+ }
+ #endif
+ 
++FILEINFO*       sh_file;
++int             sh_line;
++
+ void    sharp(
+     FILEINFO *  sharp_file,
+     int         flag        /* Flag to append to the line for GCC   */
+@@ -3868,8 +3871,6 @@
+  * else (i.e. 'sharp_file' is NULL) 'infile'.
+  */
+ {
+-    static FILEINFO *   sh_file;
+-    static int  sh_line;
+     FILEINFO *  file;
+     int         line;
+ 
diff --git a/recipes/mcpp/mcpp.inc b/recipes/mcpp/mcpp.inc
index 9c56a7c..4c4589c 100644
--- a/recipes/mcpp/mcpp.inc
+++ b/recipes/mcpp/mcpp.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-inherit autotools lib_package
+inherit autotools
 
 EXTRA_OECONF = " --enable-mcpplib "
 
diff --git a/recipes/mcpp/mcpp_2.7.2.bb b/recipes/mcpp/mcpp_2.7.2.bb
index 55418bf..6e79424 100644
--- a/recipes/mcpp/mcpp_2.7.2.bb
+++ b/recipes/mcpp/mcpp_2.7.2.bb
@@ -1,5 +1,8 @@
 require ${BPN}.inc
 
+PR = "r1"
+SRC_URI += " file://slice2ccp-no-crash.patch "
+
 SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05"
 SRC_URI[sha256sum] = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
 
-- 
1.7.2.3



