Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id B0B8F732FD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:44:24 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id w8so270503qac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=Tv1IjtPQC3RWAcxouf/ZH4FHjFhhJWL/McI50wlWYY0=;
	b=ETkfycRGZPLBwtnbwg8faVOvyeyU9GB35xvybxXT18oUK5xBRhdf2+XgpjC20ju3tI
	Pnjq+4mLl3HEhVZhHg61CsgsF4SkmqnYXDv6kGiqsNQ5O1k6qv+PM6cThWkV5INPIBqZ
	2d30LhfSoS/VCfwmkwRD7rV5eEtFU1q48Glk30mwMUT2Jyvj5pnzfub2dVJGQEMoabZL
	1B6PW8V3nPKI07blw7gzcE3mggpQ+zV+TBnJ/B5obtWQ9I202tt9/iRUxcBnEtZFxrHw
	3J5yZlXaSOpxZCeMDoMa5W9AHYqTdAiUT6DSSw8rKWtGeWmWxm3Js8xYxQ9Bo0I5AU5l
	fX/A==
X-Received: by 10.224.75.7 with SMTP id w7mr60350015qaj.6.1423619065853;
	Tue, 10 Feb 2015 17:44:25 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	n13sm17222934qaa.25.2015.02.10.17.44.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Feb 2015 17:44:24 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2015 23:43:39 -0200
Message-Id: <1423619019-17403-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
References: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 8/8] qt5.inc: Fix packaging of architecture independent data
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
X-List-Received-Date: Wed, 11 Feb 2015 01:44:24 -0000

The architecture independent data were being added to the '-dev'
package however it shouldn't be. For example the QtWebEngine had the
translation and the resources package were not being installed with
the main package, as it should be.

This commit changes the qttools and qttranslations recipes as well so
those keep its contents in the respective packages:

 qttools: add the phrasebooks in the qttools-tools package
 qttranslations: add a new subpackage for qtquickcontrols

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qt5.inc            | 2 +-
 recipes-qt/qt5/qttools.inc        | 1 +
 recipes-qt/qt5/qttranslations.inc | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index bb0bcdc..af0a906 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -118,7 +118,6 @@ FILES_${PN}-dev += " \
     ${OE_QMAKE_PATH_LIBS}/cmake/* \
     ${OE_QMAKE_PATH_LIBS}/*.prl \
     ${OE_QMAKE_PATH_LIBS}/*.la \
-    ${OE_QMAKE_PATH_DATA}/* \
     ${OE_QMAKE_PATH_HEADERS}/* \
 "
 FILES_${PN}-dbg += " \
@@ -129,6 +128,7 @@ FILES_${PN}-staticdev += " \
     ${OE_QMAKE_PATH_LIBS}/*.a \
 "
 FILES_${PN}-examples = " \
+    ${OE_QMAKE_PATH_EXAMPLES}/README \
     ${OE_QMAKE_PATH_EXAMPLES}/*/* \
 "
 FILES_${PN}-examples-dev = " \
diff --git a/recipes-qt/qt5/qttools.inc b/recipes-qt/qt5/qttools.inc
index 8c97e24..97717ae 100644
--- a/recipes-qt/qt5/qttools.inc
+++ b/recipes-qt/qt5/qttools.inc
@@ -7,6 +7,7 @@ SRC_URI += " \
     file://0003-add-noqtwebkit-configuration.patch \
 "
 
+FILES_${PN}-tools += "${datadir}/${QT_DIR_NAME}/phrasebooks"
 FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
 
 PACKAGECONFIG ??= ""
diff --git a/recipes-qt/qt5/qttranslations.inc b/recipes-qt/qt5/qttranslations.inc
index c04aee6..c522694 100644
--- a/recipes-qt/qt5/qttranslations.inc
+++ b/recipes-qt/qt5/qttranslations.inc
@@ -16,6 +16,7 @@ PACKAGES =. " \
     ${PN}-qtmultimedia \
     ${PN}-qtlocation \
     ${PN}-qtdeclarative \
+    ${PN}-qtquickcontrols \
     ${PN}-qtxmlpatterns \
     ${PN}-qtconfig \
     ${PN}-qtquick1 \
@@ -57,6 +58,10 @@ FILES_${PN}-qtdeclarative = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtdeclarative_*.qm \
 "
 
+FILES_${PN}-qtquickcontrols = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtquickcontrols_*.qm \
+"
+
 FILES_${PN}-qtxmlpatterns = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
 "
-- 
2.1.4


