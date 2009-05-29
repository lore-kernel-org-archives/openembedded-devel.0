Received: from [195.135.220.15] (helo=mx2.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mhrusecky@suse.cz>) id 1MAAo2-0008Ho-Vc
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 00:44:08 +0200
Received: from relay2.suse.de (mail2.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 944F679727
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 00:35:39 +0200 (CEST)
Date: Sat, 30 May 2009 00:35:31 +0200
From: Michal Hrusecky <mhrusecky@suse.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090529223531.GA951@misibook.miska.isageek.net>
MIME-Version: 1.0
X-Operating-System: WindowsKiller Linux
User-Agent: Mutt - the best e-mail client in the world
Subject: [PATCH] opie-sheet: fixed compilation error
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
X-List-Received-Date: Fri, 29 May 2009 22:44:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Compilation originally fails and complains about two arguments with the
same name.

Signed-off-by: Michal Hrusecky <Michal@Hrusecky.net>
---
 .../opie-sheet/different-arg-names.patch           |   11 +++++++++++
 recipes/opie-sheet/opie-sheet_1.2.4.bb             |    3 ++-
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 recipes/opie-sheet/opie-sheet/different-arg-names.patch

diff --git a/recipes/opie-sheet/opie-sheet/different-arg-names.patch b/recipes/opie-sheet/opie-sheet/different-arg-names.patch
new file mode 100644
index 0000000..f190960
--- /dev/null
+++ b/recipes/opie-sheet/opie-sheet/different-arg-names.patch
@@ -0,0 +1,11 @@
+--- a/opie-sheet/sheet.h	2009-05-25 07:47:12.042719009 +0200
++++ b/opie-sheet/sheet.h	2009-05-25 08:07:19.291516199 +0200
+@@ -209,7 +207,7 @@
+     void insertRows(int no=1, bool allColumns=TRUE);
+     void insertColumns(int no=1, bool allRows=TRUE);
+ 
+-    void dataFindReplace(const QString &find, const QString &replace, bool matchCase=TRUE, bool allCells=TRUE, bool entireCell=FALSE, bool replace=FALSE, bool replaceAll=FALSE);
++    void dataFindReplace(const QString &find, const QString &replacestr, bool matchCase=TRUE, bool allCells=TRUE, bool entireCell=FALSE, bool replace=FALSE, bool replaceAll=FALSE);
+ 
+     // Static functions
+     static int getHeaderColumn(const QString &section);
diff --git a/recipes/opie-sheet/opie-sheet_1.2.4.bb b/recipes/opie-sheet/opie-sheet_1.2.4.bb
index ca0cdaf..c52c166 100644
--- a/recipes/opie-sheet/opie-sheet_1.2.4.bb
+++ b/recipes/opie-sheet/opie-sheet_1.2.4.bb
@@ -3,4 +3,5 @@ require ${PN}.inc
 
 SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/noncore/apps/opie-sheet \
            ${HANDHELDS_CVS};tag=${TAG};module=opie/pics \
-           ${HANDHELDS_CVS};tag=${TAG};module=opie/apps"
+           ${HANDHELDS_CVS};tag=${TAG};module=opie/apps \
+           file://different-arg-names.patch;patch=1 "
-- 
1.6.3.1


