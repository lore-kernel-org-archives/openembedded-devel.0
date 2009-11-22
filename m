Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bernhard.kaindl@gmx.net>) id 1NCDj7-0005HC-QA
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 15:47:50 +0100
Received: (qmail invoked by alias); 22 Nov 2009 14:46:18 -0000
Received: from 188-23-191-225.adsl.highway.telekom.at (EHLO
	localhost.localdomain) [188.23.191.225]
	by mail.gmx.net (mp069) with SMTP; 22 Nov 2009 15:46:18 +0100
X-Authenticated: #154622
X-Provags-ID: V01U2FsdGVkX1879/ZsYWk7+0QG2peq9ejXcPWq2mO2NUubdOPPOL
	zDl76h4rHLftj6
From: Bernhard Kaindl <bernhard.kaindl@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Nov 2009 15:45:40 +0100
Message-Id: <1258901140-30575-1-git-send-email-bernhard.kaindl@gmx.net>
X-Mailer: git-send-email 1.6.5.2
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.55
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: bernhard.kaindl@gmx.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] external-toolchain: Really accept toolchains built by meta-toolchain.bb
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
X-List-Received-Date: Sun, 22 Nov 2009 14:47:50 -0000

external-toolchain-generic,
external-toolchain:

* The current external-toolchain recipes which are documented to accept
  toolchains built by meta-toolchain actually do not accept such because
  they expect ${prefix}/package-status to exist which is provieded by
  the poky toolchains but not the current OE meta-toolchain package.

  Fix this by also looking for ${prefix}/usr/lib/opkg/status, which is the
  package-status file of the OE meta-toolchain package.

* Also change the error message which is shown when neither file is found
  more explicit.

Cc:            Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>

 external-toolchain-generic.bb |    4 ++--
 external-toolchain.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/meta/external-toolchain-generic.bb b/recipes/meta/external-toolchain-generic.bb
index 73f823f..13c2392 100644
--- a/recipes/meta/external-toolchain-generic.bb
+++ b/recipes/meta/external-toolchain-generic.bb
@@ -22,8 +22,8 @@ PR = "r2"
 inherit sdk
 
 do_stage() {
-	if [ ! -e  ${prefix}/package-status ]; then
-		echo "The external toolchain could not be found in ${prefix}!"
+	if [ ! -e ${prefix}/package-status -a ! -e ${prefix}/usr/lib/opkg/status ]; then
+		echo "The package status file of the external toolchain could not be found in ${prefix}!"
 		exit 1
 	fi
 	
diff --git a/recipes/meta/external-toolchain.bb b/recipes/meta/external-toolchain.bb
index 4c70054..21b5e32 100644
--- a/recipes/meta/external-toolchain.bb
+++ b/recipes/meta/external-toolchain.bb
@@ -21,8 +21,8 @@ PR = "r2"
 inherit sdk
 
 do_stage() {
-	if [ ! -e  ${prefix}/package-status ]; then
-		echo "The external toolchain could not be found in ${prefix}!"
+	if [ ! -e ${prefix}/package-status -a ! -e ${prefix}/usr/lib/opkg/status ]; then
+		echo "The package status file of the external toolchain could not be found in ${prefix}!"
 		exit 1
 	fi
 	


