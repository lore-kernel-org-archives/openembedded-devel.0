Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OmDR1-0000vI-W7
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 00:18:18 +0200
Received: by vws13 with SMTP id 13so2310067vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 15:17:46 -0700 (PDT)
Received: by 10.220.60.204 with SMTP id q12mr258049vch.183.1282256266729;
	Thu, 19 Aug 2010 15:17:46 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id m9sm848013vcz.41.2010.08.19.15.17.45
	(version=SSLv3 cipher=RC4-MD5); Thu, 19 Aug 2010 15:17:45 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Aug 2010 17:17:44 -0500
Message-Id: <1282256264-4206-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1282248521-32053-1-git-send-email-jkridner@beagleboard.org>
References: <1282248521-32053-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base-files: beagleboard: profile: use nano
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
X-List-Received-Date: Thu, 19 Aug 2010 22:18:19 -0000

If nano is available and EDITOR isn't otherwise set, then use it.
Advanced users who would prefer vi will know how to set EDITOR anyway.
I can clearly see myself being frustrated typing 'export EDITOR=vi'
every time I start a BeagleBoard test ramdisk image, but better me have
that than to try to explain to someone fresh how to use vi.

Updated with feedback from Gary Thomas to avoid overwriting anyone
else's preference.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/base-files/base-files/beagleboard/profile |   41 +++++++++++++++++++++
 recipes/base-files/base-files_3.0.14.bb           |    2 +-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100644 recipes/base-files/base-files/beagleboard/profile

diff --git a/recipes/base-files/base-files/beagleboard/profile b/recipes/base-files/base-files/beagleboard/profile
new file mode 100644
index 0000000..301fc93
--- /dev/null
+++ b/recipes/base-files/base-files/beagleboard/profile
@@ -0,0 +1,41 @@
+# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
+# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
+
+PATH="/usr/local/bin:/usr/bin:/bin"
+# EDITOR needed for packages like cron
+if [ -z "$EDITOR" ]; then
+	if [ -x /usr/bin/nano ]; then
+		EDITOR="/usr/bin/nano"
+	else
+		EDITOR="/bin/vi"
+	fi
+fi
+test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
+
+if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
+	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
+				# for an explanation of how to set this to your local timezone.
+	export TZ
+fi
+
+if [ "`id -u`" -eq 0 ]; then
+   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
+fi
+if [ "$PS1" ]; then
+# works for bash and ash (no other shells known to be in use here)
+   PS1='\u@\h:\w\$ '
+fi
+
+if [ -d /etc/profile.d ]; then
+  for i in /etc/profile.d/*.sh; do
+    if [ -r $i ]; then
+      . $i
+    fi
+  done
+  unset i
+fi
+
+export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
+
+umask 022
+
diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index f8d0778..ab554bb 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Miscellaneous files for the base system."
 SECTION = "base"
 PRIORITY = "required"
-PR = "r97"
+PR = "r98"
 LICENSE = "GPL"
 
 SRC_URI = " \
-- 
1.5.6.4



