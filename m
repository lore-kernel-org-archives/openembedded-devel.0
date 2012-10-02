Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJ5V1-0006UW-KR
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Oct 2012 18:39:11 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so961543wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2012 09:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SrqDzICkqRhLPePrXI3E0tHEEruwJ0Mq/Gau+oG+Amk=;
	b=z6TPsdTO7ztNOmlK3nQa/afPuvImk73DYIy5gq5dL/wynlQ/HSsWlzxG14MNLikZUt
	p1yn1zNTHdxS9f0DqIAqCzmTIWrH3AVe7LsTh86/b1Gdw23WBmQm59wWJyaEsgFzKfrQ
	aL1EMZTYZO7FDiKZStSDM3OClXmYsOCdnMhIHJw4ySPVA7K0kh8np7wJmXGpLZnx63Xl
	C6IRiQwSrHC2G0BMvSAB+S+SRtB7/dXe+vtYNgB7oa1O/u2jAdiNE53BWgIrhBFJwczc
	pOfETvIoNEcFvZ5z2ID97IZ5i8NNPpHSjEnEUIYq1GedtOMkPy35xDM01wsn7FHx9Nma
	UHDg==
Received: by 10.216.147.4 with SMTP id s4mr10483271wej.9.1349195173282;
	Tue, 02 Oct 2012 09:26:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm22248429wiz.3.2012.10.02.09.26.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 09:26:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2012 18:26:09 +0200
Message-Id: <1349195169-1813-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][PATCH] qt4: add bbappends also for 4.8.3 version
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
X-List-Received-Date: Tue, 02 Oct 2012 16:39:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend | 6 ++++++
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend | 6 ++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
new file mode 100644
index 0000000..27cac11
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
@@ -0,0 +1,6 @@
+DEPENDS += "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
+PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
new file mode 100644
index 0000000..27cac11
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
@@ -0,0 +1,6 @@
+DEPENDS += "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
+PRINC := "${@int(PRINC) + 1}"
-- 
1.7.12



