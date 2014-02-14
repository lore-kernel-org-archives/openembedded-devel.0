Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 760556E374
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 21:02:50 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id oy12so10335246veb.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 13:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=93sAYFre91DycWlPoNSc6uGa9mNQQek+OMj51X3oZvw=;
	b=qqrM9lGjrnwc6GS23X0NEIGdA2NCbHqq79py4Hmv5JRSKyQFPIweZLSWy1i1mON8/U
	elZfOAcOqiBJn9xG6s4sD7Dz2VSShw7/qlApf8E8/sXhsCSJzfbomm8gO+oKlaJuuGgJ
	CU01h+JEU+6relLKgwbhwj/L+hXQcg0eBeqYSldcgeHS1dLMuosPQZDaOEbseIlze1Kd
	VvvE6JpcMPjYfpX99t+lehwa25RLiIAamRnjS+7YIDszBQa+nyCMkePeV+nbAHdwv9SQ
	uzPQ8+GwJp8/pAGto9o5wgWsvA0DLRLAkyr0cAl9rXiDGihsgbXBRzhsFMHs7ZoCnqc1
	lEMg==
X-Received: by 10.220.131.210 with SMTP id y18mr6935410vcs.12.1392411771156;
	Fri, 14 Feb 2014 13:02:51 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id ay4sm17507546vdb.4.2014.02.14.13.02.49
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 14 Feb 2014 13:02:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2014 19:02:33 -0200
Message-Id: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 1/2] nativesdk-qtbase: Fix install error in case install task is rerun
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2014 21:02:51 -0000

In case changes are done in do_install and the sstate checksums
change, the task would fail as the qmake binary has already been
replaced. Avoid this error checking for the original filename.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/nativesdk-qtbase.inc |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index c4ef6e8..36bc334 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -178,8 +178,10 @@ do_install() {
     find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
 
     # switch back the proper qmake
-    rm ${B}/bin/qmake
-    mv ${B}/bin/qmake-real ${B}/bin/qmake
+    if [ -e ${B}/bin/qmake-real ]; then
+        rm ${B}/bin/qmake
+        mv ${B}/bin/qmake-real ${B}/bin/qmake
+    fi
 
     oe_runmake install INSTALL_ROOT=${D}
 
-- 
1.7.10.4


