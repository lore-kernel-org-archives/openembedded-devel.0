Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6494F6FEA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:04 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id n12so1997471wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S0YYbJJcAg8xwYRNK+ItpIhMVvj2TIb4r6Z5fZ1Efbs=;
	b=0dBq37SqJ25w7iMlIMr5x9ZN6sS/mLeXzZU/dizH5etM2mDRRrDZ9LK//JQN+QSV6l
	RZKKkp3MKERKaV8eS/vWgSyH0+4E8CiPY1m+iYyu4vqT89j2pnfSPKQVzO/k+c3BGdvG
	/HYXtw7Z4dOl85Lvpf+evXv2oQE02OSgXlkfMvQt014i6vbElx7WdLj70lHx7GUAfMUD
	yO5n6JZJYqAk00x5R4u+1iu0Kr6UEEFDzCax/HnyERmgS8bUop0+kVQkATN1RjrmlaiY
	eP0VSsQCNz3rQeH/vMVbdLaqh3pRPKm+mko1Cg1LF3OK0Mx+AdxwcnhQ8ae9ivNxgWB7
	F/+w==
X-Received: by 10.194.87.200 with SMTP id ba8mr3998482wjb.28.1403172004467;
	Thu, 19 Jun 2014 03:00:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej2sm7678726wjd.21.2014.06.19.03.00.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:37 +0200
Message-Id: <1403171993-26208-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 09/25] qconnman, qconnman-e: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qconnman/qconnman-e_git.bb | 2 ++
 meta-oe/recipes-qt/qconnman/qconnman_git.bb   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
index 1033bf2..baf8027 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
+++ b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
@@ -4,6 +4,8 @@ RCONFLICTS_${PN} = "qconnman"
 
 inherit qt4e
 
+PNBLACKLIST[qconnman-e] = "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
+
 EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
 
diff --git a/meta-oe/recipes-qt/qconnman/qconnman_git.bb b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
index d298cb5..e2bd2ed 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman_git.bb
+++ b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
@@ -4,5 +4,7 @@ RCONFLICTS_${PN} = "qconnman-e"
 
 inherit qt4x11
 
+PNBLACKLIST[qconnman] = "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
+
 EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
-- 
2.0.0


