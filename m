Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TK4Ug-00084L-Nx
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 11:46:54 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so301722wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=08pjYN6KxBIyNWEuftW7FNYmhyCzKJYzn5mz5SOE8F4=;
	b=Aja5yxTq6eNy3yxWaypagpMh63xCDM7yhR2RfdV2Ahe9/wI177bGiDRTS/SYu7EjXl
	mRIcS10jNqITXYK3UIQkF/zSfxXPD/X0vEoJJVY5Ac3shng1WQt38BXNafJW78NGhELs
	xsSLEoa65DlbEE7z2nq/pn6Y82irAUHQP/LgATqrNpHS7C/X4uFTKazP/bh4cHGovRH5
	PnLJJ0zYWTMfDll8pgjUSfU5QDvAR23QzrJTh7mJP7lgmU2uhYsUuJl5LYW6Lw3il8Io
	GrtFLD4s5nKwNMC5O9iOu9IN7LEmOeIC/CNROfM5Cq8LnjcVE3jYkoFLBnB5XKYiYPbX
	1jGQ==
Received: by 10.180.91.71 with SMTP id cc7mr2107718wib.2.1349429632906;
	Fri, 05 Oct 2012 02:33:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei1sm1304293wid.7.2012.10.05.02.33.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 02:33:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 11:33:37 +0200
Message-Id: <7d138796d21a96574a436506d48c0181f61fadc6.1349429575.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349429575.git.Martin.Jansa@gmail.com>
References: <cover.1349429575.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349429575.git.Martin.Jansa@gmail.com>
References: <cover.1349429575.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] python-pyqt: don't fail when do_configure is executed twice in the same WORKDIR
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
X-List-Received-Date: Fri, 05 Oct 2012 09:46:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
index 9feab4d..5eef4c9 100644
--- a/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
@@ -83,7 +83,7 @@ do_configure_prepend() {
     echo "LIBS+=-L../qpy/QtCore/ -lqpycore" >>QtCore/QtCore.pro
     echo "LIBS+=-L../qpy/QtDeclarative/ -lqpydeclarative" >>QtDeclarative/QtDeclarative.pro
     # hack for broken generated code (duplicated sipCpp declaration).
-    patch -p1 < ${WORKDIR}/pyqt-generated.patch
+    patch -p1 < ${WORKDIR}/pyqt-generated.patch || echo "pyqt-generated.patch failed to apply, probably reexecuting do_configure, ignoring that"
 }
 
 do_install() {
-- 
1.7.12



