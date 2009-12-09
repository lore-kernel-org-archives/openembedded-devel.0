Received: from caiajhbdcbbj.dreamhost.com ([208.97.132.119]
	helo=homiemail-a24.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NIMb8-0008Kh-Bv
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 14:28:57 +0100
Received: from localhost.localdomain (unknown [84.55.206.192])
	by homiemail-a24.g.dreamhost.com (Postfix) with ESMTPA id 199F42C806C; 
	Wed,  9 Dec 2009 05:27:12 -0800 (PST)
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Dec 2009 14:27:01 +0100
Message-Id: <1260365221-11155-1-git-send-email-Sebastian@SSpaeth.de>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 208.97.132.119
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Sebastian Spaeth <Sebastian@SSpaeth.de>
Subject: [PATCH] connman: don't give user 'system' permissions by default. We might not have one. (connman 0.46)
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
X-List-Received-Date: Wed, 09 Dec 2009 13:28:57 -0000

Signed-off-by: Sebastian Spaeth <Sebastian@SSpaeth.de>
---
 recipes/connman/connman_0.46.bb                  |    1 +
 recipes/connman/files/no_system_user_perms.patch |   14 ++++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/connman/files/no_system_user_perms.patch

diff --git a/recipes/connman/connman_0.46.bb b/recipes/connman/connman_0.46.bb
index 26b7b82..b1729c6 100644
--- a/recipes/connman/connman_0.46.bb
+++ b/recipes/connman/connman_0.46.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF += "\
 
 SRC_URI  = "\
   http://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.gz \
+  file://no_system_user_perms.patch;patch=1 \
   file://connman \
 "
 
diff --git a/recipes/connman/files/no_system_user_perms.patch b/recipes/connman/files/no_system_user_perms.patch
new file mode 100644
index 0000000..e02bd30
--- /dev/null
+++ b/recipes/connman/files/no_system_user_perms.patch
@@ -0,0 +1,14 @@
+diff --git a/src/connman-dbus.conf b/src/connman-dbus.conf
+index 2be3764..b4d4acd 100644
+--- a/src/connman-dbus.conf
++++ b/src/connman-dbus.conf
+@@ -6,9 +6,6 @@
+         <allow send_destination="org.moblin.connman"/>
+         <allow send_interface="org.moblin.connman.Agent"/>
+     </policy>
+-    <policy user="system">
+-        <allow send_destination="org.moblin.connman"/>
+-    </policy>
+     <policy at_console="true">
+         <allow send_destination="org.moblin.connman"/>
+     </policy>
-- 
1.6.3.3



