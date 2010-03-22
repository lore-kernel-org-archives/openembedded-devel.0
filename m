Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfXi-0002xi-85
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:11:43 +0100
Received: (qmail 14190 invoked by uid 813007); 22 Mar 2010 11:08:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:08:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:06:53 +0100
Message-Id: <1269256016-13155-8-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David-John Willis <John.Willis@Distant-earth.com>,
	Chris Larson <clarson@mvista.com>
Subject: [PATCH][STABLE] shadow: Extend securetty file to include more common ttys (inc. ones used on OMAP3 platforms). Small correction for login pam file.
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
X-List-Received-Date: Mon, 22 Mar 2010 11:11:43 -0000

From: David-John Willis <John.Willis@Distant-earth.com>

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 recipes/shadow/files/pam.d/login |    2 +-
 recipes/shadow/files/securetty   |   31 +++++++++++++++++++++++++++++--
 recipes/shadow/shadow.inc        |    2 +-
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/recipes/shadow/files/pam.d/login b/recipes/shadow/files/pam.d/login
index 65992c6..e41eb04 100644
--- a/recipes/shadow/files/pam.d/login
+++ b/recipes/shadow/files/pam.d/login
@@ -44,7 +44,7 @@ session       required   pam_env.so readenv=1
 session       required   pam_env.so readenv=1 envfile=/etc/default/locale
 
 # Standard Un*x authentication.
-@include common-auth
+auth       include      common-auth
 
 # This allows certain extra groups to be granted to a user
 # based on things like time of day, tty, service, and user.
diff --git a/recipes/shadow/files/securetty b/recipes/shadow/files/securetty
index 2705baa..8fd26e0 100644
--- a/recipes/shadow/files/securetty
+++ b/recipes/shadow/files/securetty
@@ -5,12 +5,20 @@ console
 # Standard serial ports
 ttyS0
 ttyS1
+ttyS2
+ttyS3
 
 # USB dongles
 ttyUSB0
 ttyUSB1
 ttyUSB2
 
+# PowerMac
+ttyPZ0
+ttyPZ1
+ttyPZ2
+ttyPZ3
+
 # Embedded MPC platforms
 ttyPSC0
 ttyPSC1
@@ -94,8 +102,27 @@ tty61
 tty62
 tty63
 
-# devfs consoles
-# Note: On kernels greater than 2.6.12, this is not needed.
+# Local X displays (allows empty passwords with pam_unix's nullok_secure)
+:0
+:0.0
+:0.1
+:1
+:1.0
+:1.1
+:2
+:2.0
+:2.1
+:3
+:3.0
+:3.1
+
+# Embedded Freescale i.MX ports
+ttymxc0
+ttymxc1
+ttymxc2
+ttymxc3
+ttymxc4
+ttymxc5
 
 # Standard serial ports, with devfs
 tts/0
diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 4a40151..68381f0 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -11,7 +11,7 @@ LICENSE = "BSD"
 SECTION = "base"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = " \
-- 
1.7.0.2





