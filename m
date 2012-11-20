Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tar9E-0006ZS-3T
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 17:58:08 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so3440091eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2012 08:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fHBact/g7p4PUlyIZmAO1mzCO3szF0eQKDXRNCflIek=;
	b=c/KTIOl7UHiOuaCrpMXgVaTGljoGfZtLtEClu7a3WODDt9yaKieRTo6XwBT6f5+1hv
	f/wLUbXwIrhFnKOtgcizduJLvkBeJBM1iO2hZ3rcza5l836P7jOoBtfFXlXutA36+zqM
	qptedl8I8qqxq3JSjeLSMO8zWcIBjDlhC6EX+mPswl+ML/BRndfHV+kepN5D3vp3Rm7P
	mGBg0zFkoq6wmbwH4Vw6pK++PywBRrugiOJoOO/SrNerLBhCS9hVoP77iNWcSeSKh1TF
	qVTBSZ/A76HkkazfzPLJQJqkfI7AViJ8pHFQR8QrnXEDD5a1+PCU0iVmqhNA+hH3plxm
	Blog==
Received: by 10.14.223.135 with SMTP id v7mr35362807eep.41.1353429844579;
	Tue, 20 Nov 2012 08:44:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm31498627eem.3.2012.11.20.08.44.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2012 08:44:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2012 17:43:58 +0100
Message-Id: <1353429838-12757-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] qt4-embedded: drop bbappend for 4.8.1
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
X-List-Received-Date: Tue, 20 Nov 2012 16:58:08 -0000

* 4.8.1 was removed in oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend
deleted file mode 100644
index 27cac11..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-DEPENDS += "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
-PRINC := "${@int(PRINC) + 1}"
-- 
1.8.0



