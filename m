Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@ossystems.com.br>) id 1LXebP-0008EM-Oh
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 17:39:52 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 92BFF402F5;
	Thu, 12 Feb 2009 12:38:49 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 443C9740DC;
	Thu, 12 Feb 2009 14:38:48 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id B2FA361012D; Thu, 12 Feb 2009 14:38:35 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 14:38:31 -0200
Message-Id: <1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.rc0
In-Reply-To: <1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/6] cups: add 1.3.8.
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
X-List-Received-Date: Thu, 12 Feb 2009 16:39:52 -0000

---
 .../cups/cups-1.3.8/use_echo_only_in_init.patch    |   11 +++++++++++
 packages/cups/cups_1.3.8.bb                        |    8 ++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 packages/cups/cups-1.3.8/use_echo_only_in_init.patch
 create mode 100644 packages/cups/cups_1.3.8.bb

diff --git a/packages/cups/cups-1.3.8/use_echo_only_in_init.patch b/packages/cups/cups-1.3.8/use_echo_only_in_init.patch
new file mode 100644
index 0000000..21ff0e5
--- /dev/null
+++ b/packages/cups/cups-1.3.8/use_echo_only_in_init.patch
@@ -0,0 +1,11 @@
+--- a/init/cups.sh.in.orig	2008-10-04 16:50:46.000000000 -0300
++++ b/init/cups.sh.in	2008-10-04 16:51:39.000000000 -0300
+@@ -68,7 +68,7 @@
+ 		ECHO_ERROR=:
+ 		;;
+ 
+-	Linux*)
++	DISABLELinux*)
+ 		IS_ON=/bin/true
+ 		if test -f /etc/init.d/functions; then
+ 			. /etc/init.d/functions
diff --git a/packages/cups/cups_1.3.8.bb b/packages/cups/cups_1.3.8.bb
new file mode 100644
index 0000000..e9fd985
--- /dev/null
+++ b/packages/cups/cups_1.3.8.bb
@@ -0,0 +1,8 @@
+require cups.inc
+
+SRC_URI += "file://use_echo_only_in_init.patch;patch=1"
+PR = "r1"
+
+DEFAULT_PREFERENCE = "-1"
+
+EXTRA_OECONF += " --disable-gssapi "
-- 
1.6.2.rc0



