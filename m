Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id BAFED6EFA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 20:41:32 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so7309047ykb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 12:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RJYTjXp/UGQ9wamlRNAEnvj/CI68mqQfANOPaA+1ZFg=;
	b=jH5jNYl9Rja58ZNuGbk11xLtaX6rwIG9g7pMlzElqe6WqRkspQZC4VpJTw2KjcgGd7
	3Kg3h8fLwNls/AM5Y3xSSeeH4hUA6YTu9OZqI/CDGS286sjsDYUqJamyx3Nd/y8+Allu
	jc1IMvlDdQLofMBe0kpEZTr/qr7MtAFtVPVnY6bb8miFhM8Kczt0nLcOZ45uQGvdmr+g
	pQ1FBDFhOrsyaUNeJDYwu1vrAT7hCKPC13DRn1kRCmLVVvYPnvYT/aD4k8MQlB5+OZks
	sOlLEdhNWMB63dVK/3azHJBi3qHOtYPwrX8xPwxr75pa471oWBp6gWL64mP04k4NZ1+J
	ohhg==
X-Received: by 10.236.160.9 with SMTP id t9mr13398409yhk.10.1393015293089;
	Fri, 21 Feb 2014 12:41:33 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id n4sm22057317yhc.13.2014.02.21.12.41.29
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 12:41:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2014 17:41:02 -0300
Message-Id: <1393015264-8343-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
References: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 2/4] mallit-framework-qt5: Don't set OE_QMAKE_PATH_HEADERS
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
X-List-Received-Date: Fri, 21 Feb 2014 20:41:32 -0000

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


