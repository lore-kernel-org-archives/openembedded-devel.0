Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OmBQ9-000521-5p
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 22:09:06 +0200
Received: by qwd7 with SMTP id 7so479292qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 13:08:43 -0700 (PDT)
Received: by 10.229.117.136 with SMTP id r8mr11128qcq.201.1282248523789;
	Thu, 19 Aug 2010 13:08:43 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id l13sm1957068qck.31.2010.08.19.13.08.42
	(version=SSLv3 cipher=RC4-MD5); Thu, 19 Aug 2010 13:08:42 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Aug 2010 15:08:41 -0500
Message-Id: <1282248521-32053-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
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
X-List-Received-Date: Thu, 19 Aug 2010 20:09:06 -0000

If nano is available and EDITOR isn't otherwise set, then use it.
Advanced users who would prefer vi will know how to set EDITOR anyway.
I can clearly see myself being frustrated typing 'export EDITOR=vi'
every time I start a BeagleBoard test ramdisk image, but better me have
that than to try to explain to someone fresh how to use vi.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/base-files/base-files/beagleboard/profile |   41 +++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 recipes/base-files/base-files/beagleboard/profile

diff --git a/recipes/base-files/base-files/beagleboard/profile b/recipes/base-files/base-files/beagleboard/profile
new file mode 100644
index 0000000..7b1cf52
--- /dev/null
+++ b/recipes/base-files/base-files/beagleboard/profile
@@ -0,0 +1,41 @@
+# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
+# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
+
+PATH="/usr/local/bin:/usr/bin:/bin"
+# EDITOR needed for packages like cron
+if [ "$EDITOR" ]; then
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
-- 
1.5.6.4



