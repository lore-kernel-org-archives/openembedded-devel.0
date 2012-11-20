Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tar2k-0006NV-KY
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 17:51:26 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2401923eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2012 08:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WX+f12sCG4KeigahgeJozp4lZQ4DAnIB539d5ihFO7Y=;
	b=VcjqnAoMGGejWat7cFK9421nhO7l62ddEHkNFzPmKLyfL724MnIbQ683yqi7bE+xY/
	dwPWQHpQ60+uYhTpgp7wBE16rqQ/1PjzcuXB1I+73yBIoNbtorSep6Ox42u+jmC+8g4F
	nlBmHDDpJIBfFnGvvTIz7WuiCrgfS1WWRFEwMPTYH4D5dftyFPZdjygazcqmEmk2hyf4
	/lmmnKsoBxV21UkNN/vJ4v12c9wIwqYuaOnKVLotu34cjSvoB6tPuqOQ92uv8MKiL+Gi
	00181R4U3bwXLLAgRoDFuGyQJpMLYv/sJbaLFAkWUMvmidJLq0OuZ67JugUjSHAes/ne
	kOXw==
Received: by 10.14.200.194 with SMTP id z42mr35473684een.13.1353429442939;
	Tue, 20 Nov 2012 08:37:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm31455982eep.15.2012.11.20.08.37.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2012 08:37:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2012 17:37:16 +0100
Message-Id: <1353429436-10389-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] qt4-x11-free: drop bbappend for 4.8.1
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
X-List-Received-Date: Tue, 20 Nov 2012 16:51:26 -0000

* 4.8.1 was removed from oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend

diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend
deleted file mode 100644
index 27cac11..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend
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



