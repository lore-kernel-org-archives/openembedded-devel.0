Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Nvvf8-0007I8-SU
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 18:48:35 +0200
Received: from fbcmmo06.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Mar 2010 18:45:21 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Mar 2010 18:44:55 +0200
Received: from localhost.localdomain ([79.21.202.115]) by
	FBCMCL01B02.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Mar 2010 18:44:55 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Mar 2010 18:44:44 +0200
Message-Id: <1269794684-1331-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <1269794684-1331-1-git-send-email-GNUtoo@no-log.org>
References: <1269794684-1331-1-git-send-email-GNUtoo@no-log.org>
X-OriginalArrivalTime: 28 Mar 2010 16:44:55.0496 (UTC)
	FILETIME=[FEDF0C80:01CACE95]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL, BAYES_00, RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] DO_NOT_COMMIT_YET: fastjar: handle cross-compilation
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
X-List-Received-Date: Sun, 28 Mar 2010 16:48:35 -0000


  btoc(m4 macro)'s AC_TRY_RUN didn't handle the cross-compilation case.
  thanks ? for telling me that the third argument
  was for cross-compilation.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/fastjar/fastjar-0.98/btowc_eof.patch |   13 +++++++++++++
 recipes/fastjar/fastjar-0.98/wcrtomb.patch   |   13 +++++++++++++
 recipes/fastjar/fastjar_0.98.bb              |    2 ++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 recipes/fastjar/fastjar-0.98/btowc_eof.patch
 create mode 100644 recipes/fastjar/fastjar-0.98/wcrtomb.patch

diff --git a/recipes/fastjar/fastjar-0.98/btowc_eof.patch b/recipes/fastjar/fastjar-0.98/btowc_eof.patch
new file mode 100644
index 0000000..b76e491
--- /dev/null
+++ b/recipes/fastjar/fastjar-0.98/btowc_eof.patch
@@ -0,0 +1,13 @@
+Index: fastjar-0.98/m4/btowc.m4
+===================================================================
+--- fastjar-0.98.orig/m4/btowc.m4
++++ fastjar-0.98/m4/btowc.m4
+@@ -47,7 +47,7 @@ int main ()
+ }],
+             [gl_cv_func_btowc_eof=yes],
+             [gl_cv_func_btowc_eof=no],
+-            [])
++            [gl_cv_func_btowc_eof=yes])
+         fi
+       ])
+     case "$gl_cv_func_btowc_eof" in
diff --git a/recipes/fastjar/fastjar-0.98/wcrtomb.patch b/recipes/fastjar/fastjar-0.98/wcrtomb.patch
new file mode 100644
index 0000000..9d3133d
--- /dev/null
+++ b/recipes/fastjar/fastjar-0.98/wcrtomb.patch
@@ -0,0 +1,13 @@
+Index: fastjar-0.98/m4/wcrtomb.m4
+===================================================================
+--- fastjar-0.98.orig/m4/wcrtomb.m4
++++ fastjar-0.98/m4/wcrtomb.m4
+@@ -67,7 +67,7 @@ int main ()
+ }],
+             [gl_cv_func_wcrtomb_retval=yes],
+             [gl_cv_func_wcrtomb_retval=no],
+-            [])
++            [gl_cv_func_wcrtomb_retval=yes])
+         fi
+       ])
+     case "$gl_cv_func_wcrtomb_retval" in
diff --git a/recipes/fastjar/fastjar_0.98.bb b/recipes/fastjar/fastjar_0.98.bb
index 35392f2..76b28e2 100644
--- a/recipes/fastjar/fastjar_0.98.bb
+++ b/recipes/fastjar/fastjar_0.98.bb
@@ -1 +1,3 @@
 require fastjar.inc
+SRC_URI += " file://btowc_eof.patch;patch=1 \
+             file://wcrtomb.patch;patch=1"
-- 
1.6.4.4



