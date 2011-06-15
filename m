Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@belledonne-communications.com>)
	id 1QWljR-00062s-Dy for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 10:45:51 +0200
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id DDB57E5B1A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:42:23 +0200 (CEST)
Received: from localhost.localdomain (unknown [81.56.113.2])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 5A5DF940192;
	Wed, 15 Jun 2011 10:42:19 +0200 (CEST)
From: Guillaume Beraudo <guillaume.beraudo@belledonne-communications.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2011 10:42:02 +0200
Message-Id: <1308127322-5248-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <guillaume.beraudo@belledonne-communications.com>
References: <guillaume.beraudo@belledonne-communications.com>
Subject: [PATCH v2] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Wed, 15 Jun 2011 08:45:53 -0000

Recipe support linphone built with video support and without GTK.

* included IGEPv2 specific patch to get audio playback at 8KHz rate.
* included infrastructure to create flavoured recipes
	- with(out) video
	- with(out) gtk
* removed dependency on:
	- obsolete disable-gtk-doc.patch;
	- cryptic b64_assert.patch;
	- already upstream preferences-segv.patch;
	- already upstream fix.unused.variable.patch
---
 recipes/linphone/files/igep0020            |    1 +
 recipes/linphone/linphone-common.inc       |    1 +
 recipes/linphone/linphone-common_3.4.3.inc |    1 +
 recipes/linphone/linphone-nogtk_3.4.3.bb   |    1 +
 4 files changed, 4 insertions(+), 0 deletions(-)
 create mode 120000 recipes/linphone/files/igep0020
 create mode 120000 recipes/linphone/linphone-common.inc
 create mode 120000 recipes/linphone/linphone-common_3.4.3.inc
 create mode 120000 recipes/linphone/linphone-nogtk_3.4.3.bb

diff --git a/recipes/linphone/files/igep0020 b/recipes/linphone/files/igep0020
new file mode 120000
index 0000000..97de2a0
--- /dev/null
+++ b/recipes/linphone/files/igep0020
@@ -0,0 +1 @@
+/home/guillaume/dev/linphone-embedded/oe/files/igep0020
\ No newline at end of file
diff --git a/recipes/linphone/linphone-common.inc b/recipes/linphone/linphone-common.inc
new file mode 120000
index 0000000..b5a1a96
--- /dev/null
+++ b/recipes/linphone/linphone-common.inc
@@ -0,0 +1 @@
+/home/guillaume/dev/linphone-embedded/oe/linphone-common.inc
\ No newline at end of file
diff --git a/recipes/linphone/linphone-common_3.4.3.inc b/recipes/linphone/linphone-common_3.4.3.inc
new file mode 120000
index 0000000..b5963a5
--- /dev/null
+++ b/recipes/linphone/linphone-common_3.4.3.inc
@@ -0,0 +1 @@
+/home/guillaume/dev/linphone-embedded/oe/linphone-common_3.4.3.inc
\ No newline at end of file
diff --git a/recipes/linphone/linphone-nogtk_3.4.3.bb b/recipes/linphone/linphone-nogtk_3.4.3.bb
new file mode 120000
index 0000000..7bd9b8b
--- /dev/null
+++ b/recipes/linphone/linphone-nogtk_3.4.3.bb
@@ -0,0 +1 @@
+/home/guillaume/dev/linphone-embedded/oe/linphone-nogtk_3.4.3.bb
\ No newline at end of file
-- 
1.7.2.5



