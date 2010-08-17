Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlM1T-0008Hm-Ia
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 15:16:35 +0200
Received: by qwi2 with SMTP id 2so966979qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 06:15:52 -0700 (PDT)
Received: by 10.224.64.159 with SMTP id e31mr4291744qai.297.1282050948909;
	Tue, 17 Aug 2010 06:15:48 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id r36sm8764206qcs.3.2010.08.17.06.15.47
	(version=SSLv3 cipher=RC4-MD5); Tue, 17 Aug 2010 06:15:47 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 08:15:46 -0500
Message-Id: <1282050946-32468-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eds-dbus: depends on libsoup-2.4
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
X-List-Received-Date: Tue, 17 Aug 2010 13:16:41 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/eds/eds-dbus_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/eds/eds-dbus_git.bb b/recipes/eds/eds-dbus_git.bb
index 16b3276..9bee1e0 100644
--- a/recipes/eds/eds-dbus_git.bb
+++ b/recipes/eds/eds-dbus_git.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Evolution database backend server"
 HOMEPAGE = "http://labs.o-hand.com/embedded-eds/"
 LICENSE = "LGPL"
-DEPENDS = "libical intltool-native libglade glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib intltool libxml2"
+DEPENDS = "libical intltool-native libglade glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib intltool libxml2 libsoup-2.4"
 
 SRCREV = "91812cd2f797fb8ec8befbb2685037584ce144ee"
 PV = "1.4.0"
-PR = "r4"
+PR = "r5"
 PE = "1"
 PR_append = "+gitr${SRCREV}"
 
-- 
1.5.6.4



