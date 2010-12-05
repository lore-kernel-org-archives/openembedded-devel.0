Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPFiO-0003iW-21
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 15:37:24 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 43C891B40D;
	Sun,  5 Dec 2010 15:37:21 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 15:35:59 +0100
Message-Id: <1291559759-6746-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dasher-gpe_0.0-svn: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 14:37:24 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/dasher/dasher-gpe_0.0-svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/dasher/dasher-gpe_0.0-svn.bb b/recipes/dasher/dasher-gpe_0.0-svn.bb
index 5ca02ca..a63c6e9 100644
--- a/recipes/dasher/dasher-gpe_0.0-svn.bb
+++ b/recipes/dasher/dasher-gpe_0.0-svn.bb
@@ -4,7 +4,7 @@ PR = "r1"
 SRCREV = "1251"
 DEPENDS = "libxsettings-client libglade libxtst gconf gtk+"
 SECTION = "gpe"
-SRC_URI = "svn://svn.gnome.org/svn/dasher;module=trunk \
+SRC_URI = "svn://svn.gnome.org/svn/dasher;module=trunk;proto=http \
 	file://configure-lossage.patch"
 
 S = "${WORKDIR}/trunk"
-- 
1.7.0.4



