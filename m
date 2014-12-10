Return-Path: <folkus@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3224E72579
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:48:26 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so3351880wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 03:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Aw9Pi+msDQJxuZ29emIrgm0tC6j8QBsnxNoQWBW/2Yc=;
	b=xTZDgcYkKLwnmmUmPSlfp3ibYGjMJkWjInh++En8zWzGtg0sNjL0nHeM/3dmMV5wGv
	1nuCmL+njwRPX5MUfHKYmXFDbArhvLaYBqZi4xVpRZwiOVvPP6pYViTCm4PtQemeGNOS
	I7f+xZbciHzt8xlkrGerbM2x9NzNcsuAkQc3awrUxpQ6aUrM+F3bwZB526msXg2xqqiX
	dS2LvoLTo0DRM2jFmrWWUHi/OjlrTzB6HBISzn3/bDMh7TK9nlf1Kmj/tnXY0xOnDnjf
	slETZDgY+iaRtZkDf7e7atiajbH0c6WZehKEqPaInd3Eu4B83cG98/LVtIw73Dm2GRtb
	kYhg==
X-Received: by 10.180.96.10 with SMTP id do10mr5836440wib.16.1418212106932;
	Wed, 10 Dec 2014 03:48:26 -0800 (PST)
Received: from localhost.localdomain ([87.105.187.254])
	by mx.google.com with ESMTPSA id pl1sm6008200wic.16.2014.12.10.03.48.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Dec 2014 03:48:26 -0800 (PST)
From: =?UTF-8?q?S=C5=82awomir=20Paszko?= <folkus@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Dec 2014 12:48:01 +0100
Message-Id: <1418212081-32563-2-git-send-email-folkus@gmail.com>
X-Mailer: git-send-email 2.2.0
In-Reply-To: <1418212081-32563-1-git-send-email-folkus@gmail.com>
References: <1418212081-32563-1-git-send-email-folkus@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][dizzy][PATCH] qtsystems: Change branch from stable to 5.3
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
X-List-Received-Date: Wed, 10 Dec 2014 11:48:27 -0000

From: Diego Sueiro <diego.sueiro@gmail.com>

Stable branch was removed on mainline and now 5.3
is used.

Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtsystems_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 45f6b0e..ac2fc86 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "stable"
+QT_MODULE_BRANCH = "5.3"
 
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
-- 
2.2.0


