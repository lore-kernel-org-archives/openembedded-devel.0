Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9Rna-0007au-LB
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:27 +0200
Received: by mail-gx0-f175.google.com with SMTP id 22so1148347gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:50 -0700 (PDT)
Received: by 10.100.250.14 with SMTP id x14mr2684070anh.232.1287793009958;
	Fri, 22 Oct 2010 17:16:49 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:49 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:53 -0200
Message-Id: <4cc22971.0311650a.0c4d.ffffaf68@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL, BAYES_00, TVD_SPACE_RATIO
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 13/17] Ecore: update exit_uclibc.patch
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:28 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/efl1/ecore/exit_uclibc.patch |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/recipes/efl1/ecore/exit_uclibc.patch b/recipes/efl1/ecore/exit_uclibc.patch
index 105aeed..00782f6 100644
--- a/recipes/efl1/ecore/exit_uclibc.patch
+++ b/recipes/efl1/ecore/exit_uclibc.patch
@@ -1,13 +1,13 @@
-Index: ecore/src/lib/ecore_con/ecore_con_info.c
-===================================================================
---- ecore.orig/src/lib/ecore_con/ecore_con_info.c	2009-11-14 00:14:56.056955719 +0100
-+++ ecore/src/lib/ecore_con/ecore_con_info.c	2009-11-14 00:16:40.035696191 +0100
-@@ -243,7 +243,7 @@
- 	  freeaddrinfo(result);
- 	err = write(fd[1], "", 1);
- 	close(fd[1]);
--# ifdef __USE_ISOC99
-+# if defined(__USE_ISOC99) && !defined(__UCLIBC__)
- 	_Exit(0);
- # else
- 	_exit(0);
+diff -upN ecore/src/lib/ecore_con/ecore_con_info.c ecore.new/src/lib/ecore_con/ecore_con_info.c
+--- ecore/src/lib/ecore_con/ecore_con_info.c	2010-08-12 11:07:48.000000000 -0300
++++ ecore.new/src/lib/ecore_con/ecore_con_info.c	2010-08-12 17:16:15.508079579 -0300
+@@ -283,7 +283,7 @@ on_error:
+         
+         err = write(fd[1], "", 1);
+         close(fd[1]);
+-#ifdef __USE_ISOC99
++#if defined(__USE_ISOC99) && !defined(__UCLIBC__)
+         _Exit(0);
+ #else
+         _exit(0);
+Common subdirectories: ecore/src/lib/ecore_con/.svn and ecore.new/src/lib/ecore_con/.svn
-- 
1.7.3.1



