Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OUhfo-0003wo-19
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 16:57:03 +0200
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id 8F2F853E2;
	Fri,  2 Jul 2010 18:52:09 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jul 2010 18:57:34 +0400
Message-Id: <1278082654-10070-3-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1278082654-10070-2-git-send-email-khimov@altell.ru>
References: <1278082654-10070-1-git-send-email-khimov@altell.ru>
	<1278082654-10070-2-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: 8F2F853E2.45B8C
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
Subject: [PATCH] base-files: profile: don't set TZ if /etc/TZ is present
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
X-List-Received-Date: Fri, 02 Jul 2010 14:57:03 -0000

uClibc-based systems can have system-wide TZ in /etc/TZ, thus we shouldn't
set TZ variable if it is present.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/base-files/base-files/jornada6xx/profile   |    2 +-
 .../base-files/base-files/omap3-pandora/profile    |    2 +-
 .../base-files/base-files/oplinux-uclibc/profile   |    2 +-
 recipes/base-files/base-files/oplinux/profile      |    2 +-
 recipes/base-files/base-files/profile              |    2 +-
 recipes/base-files/base-files/shr/profile          |    2 +-
 recipes/base-files/base-files_3.0.14.bb            |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes/base-files/base-files/jornada6xx/profile b/recipes/base-files/base-files/jornada6xx/profile
index bff0f42..bd9e3e6 100755
--- a/recipes/base-files/base-files/jornada6xx/profile
+++ b/recipes/base-files/base-files/jornada6xx/profile
@@ -9,7 +9,7 @@ if [ "`id -u`" -eq 0 ]; then
    PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"
 fi
 
-if [ ! -e /etc/localtime ]; then
+if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
 	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html
 				# for an explanation of how to set this to your local timezone.
 	export TZ
diff --git a/recipes/base-files/base-files/omap3-pandora/profile b/recipes/base-files/base-files/omap3-pandora/profile
index 5797535..99b6fce 100644
--- a/recipes/base-files/base-files/omap3-pandora/profile
+++ b/recipes/base-files/base-files/omap3-pandora/profile
@@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
 EDITOR="/bin/vi"			# needed for packages like cron
 test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
 
-if [ ! -e /etc/localtime ]; then
+if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
 	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
 				# for an explanation of how to set this to your local timezone.
 	export TZ
diff --git a/recipes/base-files/base-files/oplinux-uclibc/profile b/recipes/base-files/base-files/oplinux-uclibc/profile
index f6ae329..5ad2967 100644
--- a/recipes/base-files/base-files/oplinux-uclibc/profile
+++ b/recipes/base-files/base-files/oplinux-uclibc/profile
@@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
 EDITOR="/usr/bin/nano"	# needed for packages like cron
 TERM="linux"		# Basic terminal capab. For screen etc.
 
-if [ ! -e /etc/localtime ]; then
+if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
 	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
 				# for an explanation of how to set this to your local timezone.
 	export TZ
diff --git a/recipes/base-files/base-files/oplinux/profile b/recipes/base-files/base-files/oplinux/profile
index f6ae329..5ad2967 100644
--- a/recipes/base-files/base-files/oplinux/profile
+++ b/recipes/base-files/base-files/oplinux/profile
@@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
 EDITOR="/usr/bin/nano"	# needed for packages like cron
 TERM="linux"		# Basic terminal capab. For screen etc.
 
-if [ ! -e /etc/localtime ]; then
+if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
 	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
 				# for an explanation of how to set this to your local timezone.
 	export TZ
diff --git a/recipes/base-files/base-files/profile b/recipes/base-files/base-files/profile
index b5ce69d..8f7f6b5 100644
--- a/recipes/base-files/base-files/profile
+++ b/recipes/base-files/base-files/profile
@@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
 EDITOR="/bin/vi"			# needed for packages like cron
 test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
 
-if [ ! -e /etc/localtime ]; then
+if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
 	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
 				# for an explanation of how to set this to your local timezone.
 	export TZ
diff --git a/recipes/base-files/base-files/shr/profile b/recipes/base-files/base-files/shr/profile
index 05e8490..6e11e81 100644
--- a/recipes/base-files/base-files/shr/profile
+++ b/recipes/base-files/base-files/shr/profile
@@ -5,7 +5,7 @@ PATH="/usr/local/bin:/usr/bin:/bin"
 EDITOR="/bin/vi"			# needed for packages like cron
 test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
 
-if [ ! -e /etc/localtime ]; then
+if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
 	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
 				# for an explanation of how to set this to your local timezone.
 	export TZ
diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
index 9801f8a..02bd39b 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Miscellaneous files for the base system."
 SECTION = "base"
 PRIORITY = "required"
-PR = "r94"
+PR = "r95"
 LICENSE = "GPL"
 
 SRC_URI = " \
-- 
1.5.6.5



