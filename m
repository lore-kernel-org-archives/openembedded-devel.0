Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqCcg-0003yM-IN
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 22:42:26 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id B7731CEE2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 22:39:22 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuY3ALpDmktT4zvyPGdsb2JhbACaaAwBAQEBNy2uSY1ThHsE
X-IronPort-AV: E=Sophos;i="4.49,628,1262559600"; d="scan'208";a="49444939"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 12 Mar 2010 22:39:22 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 22:39:22 +0100
Message-Id: <1268429962-12841-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.20
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] osb-jscore: Templates cannot be static
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
X-List-Received-Date: Fri, 12 Mar 2010 21:42:26 -0000

Some templates are declared static inline, which makes
the compiler complain.
This patch removes two static declarations in
"JavaScriptCore/kjs/protected_values.cpp"
allowing the build to complete successfully.

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 .../gtk-webcore/files/no-static-templates.patch    |   21 ++++++++++++++++++++
 recipes/gtk-webcore/osb-jscore_svn.bb              |    4 ++-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gtk-webcore/files/no-static-templates.patch

diff --git a/recipes/gtk-webcore/files/no-static-templates.patch b/recipes/gtk-webcore/files/no-static-templates.patch
new file mode 100644
index 0000000..2cfb41f
--- /dev/null
+++ b/recipes/gtk-webcore/files/no-static-templates.patch
@@ -0,0 +1,21 @@
+diff -urN JavaScriptCore-0rig/kjs/protected_values.cpp JavaScriptCore/kjs/protected_values.cpp
+--- JavaScriptCore-0rig/kjs/protected_values.cpp	2010-02-26 12:57:50.000000000 +0100
++++ JavaScriptCore/kjs/protected_values.cpp	2010-02-26 12:59:13.000000000 +0100
+@@ -195,7 +195,7 @@
+ 
+ template <int size> static unsigned hash(ValueImp *pointer);
+ 
+-template <> static inline unsigned hash<4>(ValueImp *pointer) 
++template <> inline unsigned hash<4>(ValueImp *pointer)
+ {
+   int a = (int)(intptr_t)PHI;
+   int b = (int)(intptr_t)pointer;
+@@ -214,7 +214,7 @@
+   return (unsigned)c;
+ }
+ 
+-template <> static inline unsigned hash<8>(ValueImp *pointer)
++template <> inline unsigned hash<8>(ValueImp *pointer)
+ {
+   int a = (int)PHI;
+   int b = (int)(intptr_t)pointer;
diff --git a/recipes/gtk-webcore/osb-jscore_svn.bb b/recipes/gtk-webcore/osb-jscore_svn.bb
index 52c56f9..b8c6ee2 100644
--- a/recipes/gtk-webcore/osb-jscore_svn.bb
+++ b/recipes/gtk-webcore/osb-jscore_svn.bb
@@ -7,7 +7,9 @@ PV = "0.5.2+svnr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "svn://gtk-webcore.svn.sourceforge.net/svnroot/gtk-webcore/trunk;module=JavaScriptCore;proto=https \
-           file://gcc4-fno-threadsafe-statics-JavaScriptCore.patch;patch=1"
+           file://gcc4-fno-threadsafe-statics-JavaScriptCore.patch;patch=1 \
+	   file://no-static-templates.patch;patch=1 \
+	"
 
 S = "${WORKDIR}/JavaScriptCore"
 
-- 
1.6.0.2



