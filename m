Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkc-0001Gc-Om
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:02 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id AFEE6189477; Tue, 31 Mar 2009 22:40:11 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:11 +0200
Message-Id: <1238532011-2930-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] webkit-gtk: fix PV
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:03 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/webkit/webkit-gtk_svn.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/recipes/webkit/webkit-gtk_svn.bb b/recipes/webkit/webkit-gtk_svn.bb
index 49b1590..2e5c014 100644
--- a/recipes/webkit/webkit-gtk_svn.bb
+++ b/recipes/webkit/webkit-gtk_svn.bb
@@ -3,9 +3,7 @@ DEPENDS = "gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn
 
 SRCREV_FORMAT = "webcore-rwebkit"
 
-# Yes, this is wrong...
-PV = "0.1+svnr${SRCREV}"
-PR = "r9"
+PV = "1.1.3+svnr${SRCREV}"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptCore;proto=http \
-- 
1.5.6.5



