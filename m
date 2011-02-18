Received: from static.88-198-71-155.clients.your-server.de ([88.198.71.155]
	helo=socrates.bennee.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>) id 1PqQ21-0003DM-7Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 14:05:57 +0100
Received: from localhost ([127.0.0.1] helo=sloy.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>)
	id 1PqPQL-0000KF-Rw; Fri, 18 Feb 2011 13:27:01 +0100
From: kernel-hacker@bennee.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 12:26:33 +0000
Message-Id: <1298031993-9825-1-git-send-email-kernel-hacker@bennee.com>
X-Mailer: git-send-email 1.7.4.1
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kernel-hacker@bennee.com
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
Cc: Alex Bennee <ajb@cbnl.com>
Subject: [PATCH] Add flex to the linux-atm dependencies
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
X-List-Received-Date: Fri, 18 Feb 2011 13:05:57 -0000

From: Alex Bennee <ajb@cbnl.com>

As the linux-atm tools also link against the flex libraries (-lfl) the
runtime is also needed as a dependency.

Signed-off-by: Alex Bennee <ajb@cbnl.com>
---
 recipes/linux-atm/linux-atm_2.5.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/linux-atm/linux-atm_2.5.1.bb b/recipes/linux-atm/linux-atm_2.5.1.bb
index 1ca9ea7..04af91b 100644
--- a/recipes/linux-atm/linux-atm_2.5.1.bb
+++ b/recipes/linux-atm/linux-atm_2.5.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Drivers and tools to support ATM networking under Linux"
 HOMEPAGE = "http://linux-atm.sourceforge.net/"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "virtual/kernel flex-native"
+DEPENDS = "virtual/kernel flex flex-native"
 PR = "r1"
 LICENSE = "GPL LGPL"
 
-- 
1.7.4.1



