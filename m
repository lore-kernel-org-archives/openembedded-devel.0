Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5D64F6EFF8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 13:50:35 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id v1so4233458yhn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 05:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RJYTjXp/UGQ9wamlRNAEnvj/CI68mqQfANOPaA+1ZFg=;
	b=W645JaKM2Ctcx/Ql9dQqziOwqNUdRMNibTQ0FaH7eARt+SSUWdsnMQboK/+rRo2ivy
	LE0ns5+g0l36JBnKmqJmje/TJAXcb8tryulx9ZgU+rYYKAF+ot4dnTty+hhH8Tu2bR+l
	vfmp4ymA8WzwurOL4Uf4d3iD9lWzQo+5A8oXgTxVA9HDdoBecT94j+hx+V8R4oZTGaZR
	qiZXzemLXhHNDoUljuiK3NF+3UyYm4Qikgv9h9BEtE14XUIerJNTDw5GI+noVm1SVTyS
	Fj7ULZ/Mve9sTsHVtnfj2X9yZs/omUlETf0ibiIWEcYNCROhYbE5WLelZsFVdxR9n5PD
	NmHQ==
X-Received: by 10.236.62.232 with SMTP id y68mr10791176yhc.12.1393163436023;
	Sun, 23 Feb 2014 05:50:36 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id p63sm4246689yhl.15.2014.02.23.05.50.34
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 05:50:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 10:50:12 -0300
Message-Id: <1393163414-9494-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393163414-9494-1-git-send-email-otavio@ossystems.com.br>
References: <1393163414-9494-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 2/4] mallit-framework-qt5: Don't set OE_QMAKE_PATH_HEADERS
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
X-List-Received-Date: Sun, 23 Feb 2014 13:50:35 -0000

The qmake class now respects the QT_DIR_NAME setting when setting the
headers path, so this change is not needed anymore.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index b6d8cb3..633bf6e 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -6,12 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
 inherit qmake5
 
-# Set path of qt5 headers as qmake5_base.bbclass sets this to just ${includedir}
-# but
-# actually it is ${includedir}/qt5
-OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
-
-
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
     file://maliit-server.desktop \
-- 
1.7.10.4


